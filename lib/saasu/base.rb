module Saasu
  
  class Base
    
    ENDPOINT = "https://secure.saasu.com/webservices/rest/r1"
    
    def initialize(xml)

      node = xml

      # [CHRISK] in Saasu API only types derived from Entity 
      # have attributes, everything else does not
      if is_a? Saasu::Entity
        node.attributes.each do |attr|
          send("#{attr[1].name.underscore}=", 
                            attr[1].text)

        end
      end

      if defined? root
        node = node.child
      end

      node.children.each do |child|
        if !child.text?
          if child.children.size == 1 && child.child.text?
            send("#{child.name.underscore}=", child.child.text) unless child.child.nil?
          else
            send("#{child.name.underscore}=", child) unless child.child.nil?
          end
        else
          puts "unexpected text node #{child.name} with content #{child.content}!"
        end
      end
    end

    def initialize()
    end

    def to_xml()
      doc = Nokogiri::XML::Document.new()
      if defined? @@root
        doc.add_child(wrap_xml( @@root.camelize(:lower) )) 
      else
        doc.add_child(wrap_xml(self.class.name.split("::")[1].downcase.camelize(:lower)))
      end
 
      node = doc.root

      if is_a? Entity
        Saasu::Entity.class_attributes.each do |k, v| 
          node["#{k}"] = send(k.underscore).to_s
        end
      end

      self.class.class_elements.each do |k, v| 
        node.add_child( wrap_xml(k, send(k.underscore).to_s) )
      end
      doc
    end

    def wrap_xml(node_name, node_inner_text = nil) 
      (node_inner_text.eql? nil) ? "<#{node_name} />" : "<#{node_name}>#{node_inner_text}</#{node_name}>"
    end
    
    class << self
    
      attr_accessor :class_attributes
      attr_accessor :class_elements

      # @param [String] the API key
      #
      def api_key=(key)
        @@api_key = key
      end
      
      # Return the API key
      #
      def api_key
        @@api_key
      end
      
      # @param [Integer] the file_uid
      #
      def file_uid=(uid)
        @@file_uid = uid
      end
      
      # Returns the file_uid
      #
      def file_uid
        @@file_uid
      end
      
      # Returns all resources matching the supplied conditions
      # @param [Hash] conditions for the request
      #
      def all(options = {})
        response = get(options)
        xml      = Nokogiri::XML(response)

        xsl = 
          "<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">
            <xsl:output method=\"html\" />
            <xsl:template match=\"*\">
              <xsl:copy>
                <xsl:copy-of select=\"@*\" />
                <xsl:apply-templates />
              </xsl:copy>
            </xsl:template>
            <xsl:template match=\"/#{klass_name}ListResponse\">
                <xsl:copy>
                <xsl:copy-of select=\"@*\" />
                <xsl:apply-templates />
                </xsl:copy>
            </xsl:template>
            <xsl:template match=\"#{klass_name}List\">
                <xsl:copy>
                <xsl:copy-of select=\"@*\" />
                <xsl:apply-templates />
                </xsl:copy>
            </xsl:template>
            <xsl:template match=\"#{klass_name}ListItem\">
                <contact>
                <xsl:copy-of select=\"@*\" />
                <xsl:apply-templates />
                </contact>
            </xsl:template>
            <xsl:template match=\"#{klass_name}Uid\">
              <uid><xsl:value-of select=\".\" /></uid>
            </xsl:template>
          </xsl:stylesheet>"

        xslt = Nokogiri::XSLT.parse(xsl)
        xml = xslt.transform(xml)
        nodes = xml.css(klass_name)

        collection = nodes.inject([]) do |result, item|
          result << new(item)
          result
        end
        collection
      end
      
      # Finds a specific resource by its uid
      # @param [Integer] the uid
      #
      def find(uid)
        response = get({:uid => uid}, false)
        xml = Nokogiri::XML(response)

        xsl =
        "<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">
            <xsl:output method=\"html\" />
            <xsl:template match=\"/#{klass_name}Response\">
                <xsl:apply-templates />
            </xsl:template>
            <xsl:template match=\"*\">
              <xsl:copy>
                <xsl:copy-of select=\"@*\" />
                <xsl:apply-templates />
              </xsl:copy>
            </xsl:template>
         </xsl:stylesheet>"

        xslt = Nokogiri::XSLT.parse(xsl)
        xml = xslt.transform(xml)

        new(xml.root)
      end

      def insert(entity)
        post({ :entity => entity, :task => :insert })
      end

      def update(entity)
        post({ :entity => entity, :task => :update })
      end

      def delete(uid)
        _delete(uid)
      end
      
      # Allows defaults for the object to be set.
      # Generally the class name will be suitable and options will not need to be provided
      # @param [Hash] options to override the default settings
      #
      def defaults(options = nil)
        @defaults ||= default_options
        if options
          @defaults = default_options.merge!(options)
        else
          @defaults
        end
      end
       
      protected
        
        # Default options for the class
        #
        def default_options
          options                   = {}
          options[:query_options]   ||= {}
          options[:resource_name]   = name.split("::").last.downcase
          options[:collection_name] = name.split("::").last.downcase + "ListItem"
          options
        end
       
        def root(name)
          @root = name
        end

        def attributes(attributes = {})
          attributes.each do |k,v|
            define_accessor(k.underscore, v)
          end
          @class_attributes = attributes
        end

        # Defines the fields for a resource and any transformations
        # @param [Hash] key/value pair of field name and object type
        #
        def elements(elements = {})
          elements.each do |k,v|
            define_accessor(k.underscore, v)
          end
          @class_elements = elements
        end

        def define_accessor(element, type)
          m = element
          case type
          when :string 
            class_eval <<-END
              def #{m}=(v)
                @#{m} = v
              end
            END
          when :decimal
            class_eval <<-END
              def #{m}=(v)
                @#{m} = v.to_f
              end
            END
          when :date
            class_eval <<-END
              def #{m}=(v)
                unless v.nil? || v.empty?
                  @#{m} = Date.parse(v)
                end
              end
            END
          when :integer
            class_eval <<-END
              def #{m}=(v)
                @#{m} = v.to_i
              end
            END
          when :boolean
            class_eval <<-END
              def #{m}=(v)
                @#{m} = (v.match(/true/i) ? true : false)
              end
            END
          when :array
            class_eval <<-END
              def #{m}=(v)
                @#{m} = v.children.to_a().map {|node| 
                  Saasu.const_get(node.node_name().camelize).new(node)
                }
              end
            END
          else
            class_eval <<-END
              def #{m}=(v)
                @#{m} = Saasu.const_get(:#{type}).new(v)
              end
            END
          end
         
          # creates read accessor
          class_eval <<-END
            def #{m}
              @#{m}
            end
          END
        end
        
        # Makes the request to saasu
        # @param [Hash] options for the request
        # @param [Boolean] toggles searching between collection and a singular resource
        #
        def get(options = {}, all = true)
          uri              = URI.parse(request_path(options, all))
          http             = Net::HTTP.new(uri.host, uri.port)
          http.use_ssl     = true
          http.verify_mode = OpenSSL::SSL::VERIFY_NONE

          puts "Request URL (GET) is #{uri.request_uri}" 

          response = http.request(Net::HTTP::Get.new(uri.request_uri))
          response.body
        end

        def post(options)
          uri = URI.parse(task_path())
          http = Net::HTTP.new(uri.host, uri.port)
          http.use_ssl = true;
          http.verify_mode = OpenSSL::SSL::VERIFY_NONE

          puts "Request URL (POST) is #{uri.request_uri}"

          post = Net::HTTP::Post.new(uri.request_uri)

          doc = Nokogiri::XML::Document.new
          doc.add_child("<task>")
          node = doc.root
          node.add_child("<#{options[:task].to_s + klass_name.camelize} />")
          node.child.add_child(options[:entity].to_xml.root)

          post.body = doc.to_xml(:encoding => "utf-8")
          response  = http.request(post)
          response.body
        end

        def _delete(uid) 
          uri = URI.parse(request_path({:uid => uid}, false))
          http = Net::HTTP.new(uri.host, uri.port)
          http.use_ssl = true;
          http.verify_mode = OpenSSL::SSL::VERIFY_NONE

          puts "Request URL (DELETE) is #{uri.request_uri}"

          del = Net::HTTP::Delete.new(uri.request_uri)
          response = http.request(del)
          response.body
        end
        
        def query_string(options = {})
          options = defaults[:query_options].merge(options)
          options = auth_params().merge(options)
          url_encode_hash(options)
        end

        def auth_params()
          { :wsaccesskey => api_key, :fileuid => file_uid }
        end

        def url_encode_hash(hash = {})
          hash.map { |k, v| "#{k.to_s.gsub(/_/, "")}=#{v}"}.join("&")
        end
        
        def request_path(options = {}, all = true)
          path = (all == true ? defaults[:collection_name].sub(/Item/, "") : defaults[:resource_name])
          ENDPOINT + "/#{path}?#{query_string(options)}"
        end

        def task_path()
          ENDPOINT + "/Tasks?#{url_encode_hash(auth_params())}"
        end

        def klass_name()
          self.name.split("::")[1].downcase
        end

    end
    
  end

end
