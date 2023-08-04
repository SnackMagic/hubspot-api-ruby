=begin
#CRM Pipelines

#Pipelines represent distinct stages in a workflow, like closing a deal or servicing a support ticket. These endpoints provide access to read and modify pipelines in HubSpot. Pipelines support `deals` and `tickets` object types.  ## Pipeline ID validation  When calling endpoints that take pipelineId as a parameter, that ID must correspond to an existing, un-archived pipeline. Otherwise the request will fail with a `404 Not Found` response.

The version of the OpenAPI document: v3

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.2.1

=end

require 'cgi'

module Hubspot
  module Crm
    module Pipelines
      class PipelinesApi
        attr_accessor :api_client

        def initialize(api_client = ApiClient.default)
          @api_client = api_client
        end
        # Delete a pipeline
        # Delete the pipeline identified by `{pipelineId}`.
        # @param object_type [String] 
        # @param pipeline_id [String] 
        # @param [Hash] opts the optional parameters
        # @option opts [Boolean] :validate_references_before_delete  (default to false)
        # @return [nil]
        def archive(object_type, pipeline_id, opts = {})
          archive_with_http_info(object_type, pipeline_id, opts)
          nil
        end

        # Delete a pipeline
        # Delete the pipeline identified by &#x60;{pipelineId}&#x60;.
        # @param object_type [String] 
        # @param pipeline_id [String] 
        # @param [Hash] opts the optional parameters
        # @option opts [Boolean] :validate_references_before_delete  (default to false)
        # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
        def archive_with_http_info(object_type, pipeline_id, opts = {})
          if @api_client.config.debugging
            @api_client.config.logger.debug 'Calling API: PipelinesApi.archive ...'
          end
          # verify the required parameter 'object_type' is set
          if @api_client.config.client_side_validation && object_type.nil?
            fail ArgumentError, "Missing the required parameter 'object_type' when calling PipelinesApi.archive"
          end
          # verify the required parameter 'pipeline_id' is set
          if @api_client.config.client_side_validation && pipeline_id.nil?
            fail ArgumentError, "Missing the required parameter 'pipeline_id' when calling PipelinesApi.archive"
          end
          # resource path
          local_var_path = '/crm/v3/pipelines/{objectType}/{pipelineId}'.sub('{' + 'objectType' + '}', CGI.escape(object_type.to_s)).sub('{' + 'pipelineId' + '}', CGI.escape(pipeline_id.to_s))

          # query parameters
          query_params = opts[:query_params] || {}
          query_params[:'validateReferencesBeforeDelete'] = opts[:'validate_references_before_delete'] if !opts[:'validate_references_before_delete'].nil?

          # header parameters
          header_params = opts[:header_params] || {}
          # HTTP header 'Accept' (if needed)
          header_params['Accept'] = @api_client.select_header_accept(['*/*'])

          # form parameters
          form_params = opts[:form_params] || {}

          # http body (model)
          post_body = opts[:debug_body]

          # return_type
          return_type = opts[:debug_return_type]

          # auth_names
          auth_names = opts[:debug_auth_names] || ['oauth2']

          new_options = opts.merge(
            :operation => :"PipelinesApi.archive",
            :header_params => header_params,
            :query_params => query_params,
            :form_params => form_params,
            :body => post_body,
            :auth_names => auth_names,
            :return_type => return_type
          )

          data, status_code, headers = @api_client.call_api(:DELETE, local_var_path, new_options)
          if @api_client.config.debugging
            @api_client.config.logger.debug "API called: PipelinesApi#archive\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
          end
          return data, status_code, headers
        end

        # Create a pipeline
        # Create a new pipeline with the provided property values. The entire pipeline object, including its unique ID, will be returned in the response.
        # @param object_type [String] 
        # @param pipeline_input [PipelineInput] 
        # @param [Hash] opts the optional parameters
        # @return [Pipeline]
        def create(object_type, pipeline_input, opts = {})
          data, _status_code, _headers = create_with_http_info(object_type, pipeline_input, opts)
          data
        end

        # Create a pipeline
        # Create a new pipeline with the provided property values. The entire pipeline object, including its unique ID, will be returned in the response.
        # @param object_type [String] 
        # @param pipeline_input [PipelineInput] 
        # @param [Hash] opts the optional parameters
        # @return [Array<(Pipeline, Integer, Hash)>] Pipeline data, response status code and response headers
        def create_with_http_info(object_type, pipeline_input, opts = {})
          if @api_client.config.debugging
            @api_client.config.logger.debug 'Calling API: PipelinesApi.create ...'
          end
          # verify the required parameter 'object_type' is set
          if @api_client.config.client_side_validation && object_type.nil?
            fail ArgumentError, "Missing the required parameter 'object_type' when calling PipelinesApi.create"
          end
          # verify the required parameter 'pipeline_input' is set
          if @api_client.config.client_side_validation && pipeline_input.nil?
            fail ArgumentError, "Missing the required parameter 'pipeline_input' when calling PipelinesApi.create"
          end
          # resource path
          local_var_path = '/crm/v3/pipelines/{objectType}'.sub('{' + 'objectType' + '}', CGI.escape(object_type.to_s))

          # query parameters
          query_params = opts[:query_params] || {}

          # header parameters
          header_params = opts[:header_params] || {}
          # HTTP header 'Accept' (if needed)
          header_params['Accept'] = @api_client.select_header_accept(['application/json', '*/*'])
          # HTTP header 'Content-Type'
          content_type = @api_client.select_header_content_type(['application/json'])
          if !content_type.nil?
              header_params['Content-Type'] = content_type
          end

          # form parameters
          form_params = opts[:form_params] || {}

          # http body (model)
          post_body = opts[:debug_body] || @api_client.object_to_http_body(pipeline_input)

          # return_type
          return_type = opts[:debug_return_type] || 'Pipeline'

          # auth_names
          auth_names = opts[:debug_auth_names] || ['oauth2']

          new_options = opts.merge(
            :operation => :"PipelinesApi.create",
            :header_params => header_params,
            :query_params => query_params,
            :form_params => form_params,
            :body => post_body,
            :auth_names => auth_names,
            :return_type => return_type
          )

          data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
          if @api_client.config.debugging
            @api_client.config.logger.debug "API called: PipelinesApi#create\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
          end
          return data, status_code, headers
        end

        # Retrieve all pipelines
        # Return all pipelines for the object type specified by `{objectType}`.
        # @param object_type [String] 
        # @param [Hash] opts the optional parameters
        # @return [CollectionResponsePipelineNoPaging]
        def get_all(object_type, opts = {})
          data, _status_code, _headers = get_all_with_http_info(object_type, opts)
          data
        end

        # Retrieve all pipelines
        # Return all pipelines for the object type specified by &#x60;{objectType}&#x60;.
        # @param object_type [String] 
        # @param [Hash] opts the optional parameters
        # @return [Array<(CollectionResponsePipelineNoPaging, Integer, Hash)>] CollectionResponsePipelineNoPaging data, response status code and response headers
        def get_all_with_http_info(object_type, opts = {})
          if @api_client.config.debugging
            @api_client.config.logger.debug 'Calling API: PipelinesApi.get_all ...'
          end
          # verify the required parameter 'object_type' is set
          if @api_client.config.client_side_validation && object_type.nil?
            fail ArgumentError, "Missing the required parameter 'object_type' when calling PipelinesApi.get_all"
          end
          # resource path
          local_var_path = '/crm/v3/pipelines/{objectType}'.sub('{' + 'objectType' + '}', CGI.escape(object_type.to_s))

          # query parameters
          query_params = opts[:query_params] || {}

          # header parameters
          header_params = opts[:header_params] || {}
          # HTTP header 'Accept' (if needed)
          header_params['Accept'] = @api_client.select_header_accept(['application/json', '*/*'])

          # form parameters
          form_params = opts[:form_params] || {}

          # http body (model)
          post_body = opts[:debug_body]

          # return_type
          return_type = opts[:debug_return_type] || 'CollectionResponsePipelineNoPaging'

          # auth_names
          auth_names = opts[:debug_auth_names] || ['oauth2']

          new_options = opts.merge(
            :operation => :"PipelinesApi.get_all",
            :header_params => header_params,
            :query_params => query_params,
            :form_params => form_params,
            :body => post_body,
            :auth_names => auth_names,
            :return_type => return_type
          )

          data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
          if @api_client.config.debugging
            @api_client.config.logger.debug "API called: PipelinesApi#get_all\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
          end
          return data, status_code, headers
        end

        # Return a pipeline by ID
        # Return a single pipeline object identified by its unique `{pipelineId}`.
        # @param object_type [String] 
        # @param pipeline_id [String] 
        # @param [Hash] opts the optional parameters
        # @return [Pipeline]
        def get_by_id(object_type, pipeline_id, opts = {})
          data, _status_code, _headers = get_by_id_with_http_info(object_type, pipeline_id, opts)
          data
        end

        # Return a pipeline by ID
        # Return a single pipeline object identified by its unique &#x60;{pipelineId}&#x60;.
        # @param object_type [String] 
        # @param pipeline_id [String] 
        # @param [Hash] opts the optional parameters
        # @return [Array<(Pipeline, Integer, Hash)>] Pipeline data, response status code and response headers
        def get_by_id_with_http_info(object_type, pipeline_id, opts = {})
          if @api_client.config.debugging
            @api_client.config.logger.debug 'Calling API: PipelinesApi.get_by_id ...'
          end
          # verify the required parameter 'object_type' is set
          if @api_client.config.client_side_validation && object_type.nil?
            fail ArgumentError, "Missing the required parameter 'object_type' when calling PipelinesApi.get_by_id"
          end
          # verify the required parameter 'pipeline_id' is set
          if @api_client.config.client_side_validation && pipeline_id.nil?
            fail ArgumentError, "Missing the required parameter 'pipeline_id' when calling PipelinesApi.get_by_id"
          end
          # resource path
          local_var_path = '/crm/v3/pipelines/{objectType}/{pipelineId}'.sub('{' + 'objectType' + '}', CGI.escape(object_type.to_s)).sub('{' + 'pipelineId' + '}', CGI.escape(pipeline_id.to_s))

          # query parameters
          query_params = opts[:query_params] || {}

          # header parameters
          header_params = opts[:header_params] || {}
          # HTTP header 'Accept' (if needed)
          header_params['Accept'] = @api_client.select_header_accept(['application/json', '*/*'])

          # form parameters
          form_params = opts[:form_params] || {}

          # http body (model)
          post_body = opts[:debug_body]

          # return_type
          return_type = opts[:debug_return_type] || 'Pipeline'

          # auth_names
          auth_names = opts[:debug_auth_names] || ['oauth2']

          new_options = opts.merge(
            :operation => :"PipelinesApi.get_by_id",
            :header_params => header_params,
            :query_params => query_params,
            :form_params => form_params,
            :body => post_body,
            :auth_names => auth_names,
            :return_type => return_type
          )

          data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
          if @api_client.config.debugging
            @api_client.config.logger.debug "API called: PipelinesApi#get_by_id\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
          end
          return data, status_code, headers
        end

        # Replace a pipeline
        # Replace all the properties of an existing pipeline with the values provided. This will overwrite any existing pipeline stages. The updated pipeline will be returned in the response.
        # @param object_type [String] 
        # @param pipeline_id [String] 
        # @param pipeline_input [PipelineInput] 
        # @param [Hash] opts the optional parameters
        # @option opts [Boolean] :validate_references_before_delete  (default to false)
        # @return [Pipeline]
        def replace(object_type, pipeline_id, pipeline_input, opts = {})
          data, _status_code, _headers = replace_with_http_info(object_type, pipeline_id, pipeline_input, opts)
          data
        end

        # Replace a pipeline
        # Replace all the properties of an existing pipeline with the values provided. This will overwrite any existing pipeline stages. The updated pipeline will be returned in the response.
        # @param object_type [String] 
        # @param pipeline_id [String] 
        # @param pipeline_input [PipelineInput] 
        # @param [Hash] opts the optional parameters
        # @option opts [Boolean] :validate_references_before_delete  (default to false)
        # @return [Array<(Pipeline, Integer, Hash)>] Pipeline data, response status code and response headers
        def replace_with_http_info(object_type, pipeline_id, pipeline_input, opts = {})
          if @api_client.config.debugging
            @api_client.config.logger.debug 'Calling API: PipelinesApi.replace ...'
          end
          # verify the required parameter 'object_type' is set
          if @api_client.config.client_side_validation && object_type.nil?
            fail ArgumentError, "Missing the required parameter 'object_type' when calling PipelinesApi.replace"
          end
          # verify the required parameter 'pipeline_id' is set
          if @api_client.config.client_side_validation && pipeline_id.nil?
            fail ArgumentError, "Missing the required parameter 'pipeline_id' when calling PipelinesApi.replace"
          end
          # verify the required parameter 'pipeline_input' is set
          if @api_client.config.client_side_validation && pipeline_input.nil?
            fail ArgumentError, "Missing the required parameter 'pipeline_input' when calling PipelinesApi.replace"
          end
          # resource path
          local_var_path = '/crm/v3/pipelines/{objectType}/{pipelineId}'.sub('{' + 'objectType' + '}', CGI.escape(object_type.to_s)).sub('{' + 'pipelineId' + '}', CGI.escape(pipeline_id.to_s))

          # query parameters
          query_params = opts[:query_params] || {}
          query_params[:'validateReferencesBeforeDelete'] = opts[:'validate_references_before_delete'] if !opts[:'validate_references_before_delete'].nil?

          # header parameters
          header_params = opts[:header_params] || {}
          # HTTP header 'Accept' (if needed)
          header_params['Accept'] = @api_client.select_header_accept(['application/json', '*/*'])
          # HTTP header 'Content-Type'
          content_type = @api_client.select_header_content_type(['application/json'])
          if !content_type.nil?
              header_params['Content-Type'] = content_type
          end

          # form parameters
          form_params = opts[:form_params] || {}

          # http body (model)
          post_body = opts[:debug_body] || @api_client.object_to_http_body(pipeline_input)

          # return_type
          return_type = opts[:debug_return_type] || 'Pipeline'

          # auth_names
          auth_names = opts[:debug_auth_names] || ['oauth2']

          new_options = opts.merge(
            :operation => :"PipelinesApi.replace",
            :header_params => header_params,
            :query_params => query_params,
            :form_params => form_params,
            :body => post_body,
            :auth_names => auth_names,
            :return_type => return_type
          )

          data, status_code, headers = @api_client.call_api(:PUT, local_var_path, new_options)
          if @api_client.config.debugging
            @api_client.config.logger.debug "API called: PipelinesApi#replace\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
          end
          return data, status_code, headers
        end

        # Update a pipeline
        # Perform a partial update of the pipeline identified by `{pipelineId}`. The updated pipeline will be returned in the response.
        # @param object_type [String] 
        # @param pipeline_id [String] 
        # @param pipeline_patch_input [PipelinePatchInput] 
        # @param [Hash] opts the optional parameters
        # @option opts [Boolean] :validate_references_before_delete  (default to false)
        # @return [Pipeline]
        def update(object_type, pipeline_id, pipeline_patch_input, opts = {})
          data, _status_code, _headers = update_with_http_info(object_type, pipeline_id, pipeline_patch_input, opts)
          data
        end

        # Update a pipeline
        # Perform a partial update of the pipeline identified by &#x60;{pipelineId}&#x60;. The updated pipeline will be returned in the response.
        # @param object_type [String] 
        # @param pipeline_id [String] 
        # @param pipeline_patch_input [PipelinePatchInput] 
        # @param [Hash] opts the optional parameters
        # @option opts [Boolean] :validate_references_before_delete  (default to false)
        # @return [Array<(Pipeline, Integer, Hash)>] Pipeline data, response status code and response headers
        def update_with_http_info(object_type, pipeline_id, pipeline_patch_input, opts = {})
          if @api_client.config.debugging
            @api_client.config.logger.debug 'Calling API: PipelinesApi.update ...'
          end
          # verify the required parameter 'object_type' is set
          if @api_client.config.client_side_validation && object_type.nil?
            fail ArgumentError, "Missing the required parameter 'object_type' when calling PipelinesApi.update"
          end
          # verify the required parameter 'pipeline_id' is set
          if @api_client.config.client_side_validation && pipeline_id.nil?
            fail ArgumentError, "Missing the required parameter 'pipeline_id' when calling PipelinesApi.update"
          end
          # verify the required parameter 'pipeline_patch_input' is set
          if @api_client.config.client_side_validation && pipeline_patch_input.nil?
            fail ArgumentError, "Missing the required parameter 'pipeline_patch_input' when calling PipelinesApi.update"
          end
          # resource path
          local_var_path = '/crm/v3/pipelines/{objectType}/{pipelineId}'.sub('{' + 'objectType' + '}', CGI.escape(object_type.to_s)).sub('{' + 'pipelineId' + '}', CGI.escape(pipeline_id.to_s))

          # query parameters
          query_params = opts[:query_params] || {}
          query_params[:'validateReferencesBeforeDelete'] = opts[:'validate_references_before_delete'] if !opts[:'validate_references_before_delete'].nil?

          # header parameters
          header_params = opts[:header_params] || {}
          # HTTP header 'Accept' (if needed)
          header_params['Accept'] = @api_client.select_header_accept(['application/json', '*/*'])
          # HTTP header 'Content-Type'
          content_type = @api_client.select_header_content_type(['application/json'])
          if !content_type.nil?
              header_params['Content-Type'] = content_type
          end

          # form parameters
          form_params = opts[:form_params] || {}

          # http body (model)
          post_body = opts[:debug_body] || @api_client.object_to_http_body(pipeline_patch_input)

          # return_type
          return_type = opts[:debug_return_type] || 'Pipeline'

          # auth_names
          auth_names = opts[:debug_auth_names] || ['oauth2']

          new_options = opts.merge(
            :operation => :"PipelinesApi.update",
            :header_params => header_params,
            :query_params => query_params,
            :form_params => form_params,
            :body => post_body,
            :auth_names => auth_names,
            :return_type => return_type
          )

          data, status_code, headers = @api_client.call_api(:PATCH, local_var_path, new_options)
          if @api_client.config.debugging
            @api_client.config.logger.debug "API called: PipelinesApi#update\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
          end
          return data, status_code, headers
        end
      end
    end
  end
end
