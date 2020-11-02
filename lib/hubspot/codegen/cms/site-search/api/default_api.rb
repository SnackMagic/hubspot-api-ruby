=begin
#CMS Site Search

#Use these endpoints for searching content on your HubSpot hosted CMS website(s).

The version of the OpenAPI document: v3

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 4.3.1

=end

require 'cgi'

module Hubspot
  module Cms
    module SiteSearch
      class DefaultApi
        attr_accessor :api_client

        def initialize(api_client = ApiClient.default)
          @api_client = api_client
        end
        # Get indexed properties.
        # For a given account and document ID (page ID, blog post ID, HubDB row ID, etc.), return all indexed data for that document. This is useful when debugging why a particular document is not returned from a custom search.
        # @param content_id [String] ID of the target document when searching for indexed properties.
        # @param [Hash] opts the optional parameters
        # @option opts [String] :type The type of document. Can be one of &#x60;SITE_PAGE&#x60;, &#x60;BLOG_POST&#x60;, or &#x60;KNOWLEDGE_ARTICLE&#x60;.
        # @return [IndexedData]
        def get_by_id(content_id, opts = {})
          data, _status_code, _headers = get_by_id_with_http_info(content_id, opts)
          data
        end

        # Get indexed properties.
        # For a given account and document ID (page ID, blog post ID, HubDB row ID, etc.), return all indexed data for that document. This is useful when debugging why a particular document is not returned from a custom search.
        # @param content_id [String] ID of the target document when searching for indexed properties.
        # @param [Hash] opts the optional parameters
        # @option opts [String] :type The type of document. Can be one of &#x60;SITE_PAGE&#x60;, &#x60;BLOG_POST&#x60;, or &#x60;KNOWLEDGE_ARTICLE&#x60;.
        # @return [Array<(IndexedData, Integer, Hash)>] IndexedData data, response status code and response headers
        def get_by_id_with_http_info(content_id, opts = {})
          if @api_client.config.debugging
            @api_client.config.logger.debug 'Calling API: DefaultApi.get_by_id ...'
          end
          # verify the required parameter 'content_id' is set
          if @api_client.config.client_side_validation && content_id.nil?
            fail ArgumentError, "Missing the required parameter 'content_id' when calling DefaultApi.get_by_id"
          end
          pattern = Regexp.new(/.*/)
          if @api_client.config.client_side_validation && content_id !~ pattern
            fail ArgumentError, "invalid value for 'content_id' when calling DefaultApi.get_by_id, must conform to the pattern #{pattern}."
          end

          allowable_values = ["LANDING_PAGE", "BLOG_POST", "SITE_PAGE", "DOCUMENT", "KNOWLEDGE_ARTICLE", "LISTING_PAGE"]
          if @api_client.config.client_side_validation && opts[:'type'] && !allowable_values.include?(opts[:'type'])
            fail ArgumentError, "invalid value for \"type\", must be one of #{allowable_values}"
          end
          # resource path
          local_var_path = '/cms/v3/site-search/indexed-data/{contentId}'.sub('{' + 'contentId' + '}', CGI.escape(content_id.to_s))

          # query parameters
          query_params = opts[:query_params] || {}
          query_params[:'type'] = opts[:'type'] if !opts[:'type'].nil?

          # header parameters
          header_params = opts[:header_params] || {}
          # HTTP header 'Accept' (if needed)
          header_params['Accept'] = @api_client.select_header_accept(['application/json', '*/*'])

          # form parameters
          form_params = opts[:form_params] || {}

          # http body (model)
          post_body = opts[:body] 

          # return_type
          return_type = opts[:return_type] || 'IndexedData' 

          # auth_names
          auth_names = opts[:auth_names] || ['hapikey', 'oauth2']

          new_options = opts.merge(
            :header_params => header_params,
            :query_params => query_params,
            :form_params => form_params,
            :body => post_body,
            :auth_names => auth_names,
            :return_type => return_type
          )

          data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
          if @api_client.config.debugging
            @api_client.config.logger.debug "API called: DefaultApi#get_by_id\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
          end
          return data, status_code, headers
        end

        # Search your site.
        # Returns any website content matching the given search criteria for a given HubSpot account. Searches can be filtered by content type, domain, or URL path.
        # @param [Hash] opts the optional parameters
        # @option opts [String] :q The term to search for.
        # @option opts [Integer] :limit Specifies the number of results to be returned in a single response. Defaults to &#x60;10&#x60;. Maximum value is &#x60;100&#x60;.
        # @option opts [Integer] :offset Used to page through the results. If there are more results than specified by the &#x60;limit&#x60; parameter, you will need to use the value of offset returned in the previous request to get the next set of results.
        # @option opts [String] :language Specifies the language of content to be searched. This value must be a valid [ISO 639-1 language code](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) (e.g. &#x60;es&#x60; for Spanish)
        # @option opts [Boolean] :match_prefix Inverts the behavior of the pathPrefix filter when set to &#x60;false&#x60;. Defaults to &#x60;true&#x60;.
        # @option opts [Boolean] :autocomplete Specifies whether or not you are showing autocomplete results. Defaults to false.
        # @option opts [Float] :popularity_boost Specifies how strongly a result is boosted based on its view count. Defaults to 1.0.
        # @option opts [Float] :boost_limit Specifies the maximum amount a result will be boosted based on its view count. Defaults to 5.0. Read more about elasticsearch boosting [here](https://www.elastic.co/guide/en/elasticsearch/reference/current/mapping-boost.html).
        # @option opts [Float] :min_score Specifies the minimum search score threshold for returned results. This value is intentionally set low by default in order to return many results. Increase this for higher precision, but less recall.
        # @option opts [String] :boost_recent Specifies a relative time window where scores of documents published outside this time window decay. This can only be used for blog posts. For example, boostRecent&#x3D;10d will boost documents published within the last 10 days. Supported timeunits are ms (milliseconds), s (seconds), m (minutes), h (hours), d (days).
        # @option opts [Integer] :table_id Specifies a specific HubDB table to search. Only returns results from the specified table. Can be used in tandem with the &#x60;hubdbQuery&#x60; parameter to further filter results.
        # @option opts [String] :hubdb_query Specify a HubDB query to further filter the search results.
        # @option opts [String] :key_string 
        # @option opts [Array<String>] :domain A domain to match search results for. Multiple domains can be provided with &amp;.
        # @option opts [Array<String>] :type Specifies the type of content to search. Can be one or more of SITE_PAGE, LANDING_PAGE, BLOG_POST, LISTING_PAGE, and KNOWLEDGE_ARTICLE. Defaults to all content types except LANDING_PAGE and KNOWLEDGE_ARTICLE
        # @option opts [Array<String>] :path_prefix Specifies a path prefix to filter search results. Will only return results with URL paths that start with the specified parameter. Can be used multiple times.
        # @option opts [Array<String>] :property Specifies which properties to include in the search. Options include &#x60;title&#x60;, &#x60;description&#x60;, and &#x60;html&#x60;. All properties will be searched by default.
        # @option opts [String] :length Specifies the length of the search results. Can be set to &#x60;LONG&#x60; or &#x60;SHORT&#x60;. &#x60;SHORT&#x60; will return the first 128 characters of the content&#39;s meta description. &#x60;LONG&#x60; will build a more detailed content snippet based on the html/content of the page.
        # @option opts [Array<Integer>] :group_id Specifies which blog(s) to be searched by blog ID. Can be used multiple times to search more than one blog.
        # @return [PublicSearchResults]
        def search(opts = {})
          data, _status_code, _headers = search_with_http_info(opts)
          data
        end

        # Search your site.
        # Returns any website content matching the given search criteria for a given HubSpot account. Searches can be filtered by content type, domain, or URL path.
        # @param [Hash] opts the optional parameters
        # @option opts [String] :q The term to search for.
        # @option opts [Integer] :limit Specifies the number of results to be returned in a single response. Defaults to &#x60;10&#x60;. Maximum value is &#x60;100&#x60;.
        # @option opts [Integer] :offset Used to page through the results. If there are more results than specified by the &#x60;limit&#x60; parameter, you will need to use the value of offset returned in the previous request to get the next set of results.
        # @option opts [String] :language Specifies the language of content to be searched. This value must be a valid [ISO 639-1 language code](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) (e.g. &#x60;es&#x60; for Spanish)
        # @option opts [Boolean] :match_prefix Inverts the behavior of the pathPrefix filter when set to &#x60;false&#x60;. Defaults to &#x60;true&#x60;.
        # @option opts [Boolean] :autocomplete Specifies whether or not you are showing autocomplete results. Defaults to false.
        # @option opts [Float] :popularity_boost Specifies how strongly a result is boosted based on its view count. Defaults to 1.0.
        # @option opts [Float] :boost_limit Specifies the maximum amount a result will be boosted based on its view count. Defaults to 5.0. Read more about elasticsearch boosting [here](https://www.elastic.co/guide/en/elasticsearch/reference/current/mapping-boost.html).
        # @option opts [Float] :min_score Specifies the minimum search score threshold for returned results. This value is intentionally set low by default in order to return many results. Increase this for higher precision, but less recall.
        # @option opts [String] :boost_recent Specifies a relative time window where scores of documents published outside this time window decay. This can only be used for blog posts. For example, boostRecent&#x3D;10d will boost documents published within the last 10 days. Supported timeunits are ms (milliseconds), s (seconds), m (minutes), h (hours), d (days).
        # @option opts [Integer] :table_id Specifies a specific HubDB table to search. Only returns results from the specified table. Can be used in tandem with the &#x60;hubdbQuery&#x60; parameter to further filter results.
        # @option opts [String] :hubdb_query Specify a HubDB query to further filter the search results.
        # @option opts [String] :key_string 
        # @option opts [Array<String>] :domain A domain to match search results for. Multiple domains can be provided with &amp;.
        # @option opts [Array<String>] :type Specifies the type of content to search. Can be one or more of SITE_PAGE, LANDING_PAGE, BLOG_POST, LISTING_PAGE, and KNOWLEDGE_ARTICLE. Defaults to all content types except LANDING_PAGE and KNOWLEDGE_ARTICLE
        # @option opts [Array<String>] :path_prefix Specifies a path prefix to filter search results. Will only return results with URL paths that start with the specified parameter. Can be used multiple times.
        # @option opts [Array<String>] :property Specifies which properties to include in the search. Options include &#x60;title&#x60;, &#x60;description&#x60;, and &#x60;html&#x60;. All properties will be searched by default.
        # @option opts [String] :length Specifies the length of the search results. Can be set to &#x60;LONG&#x60; or &#x60;SHORT&#x60;. &#x60;SHORT&#x60; will return the first 128 characters of the content&#39;s meta description. &#x60;LONG&#x60; will build a more detailed content snippet based on the html/content of the page.
        # @option opts [Array<Integer>] :group_id Specifies which blog(s) to be searched by blog ID. Can be used multiple times to search more than one blog.
        # @return [Array<(PublicSearchResults, Integer, Hash)>] PublicSearchResults data, response status code and response headers
        def search_with_http_info(opts = {})
          if @api_client.config.debugging
            @api_client.config.logger.debug 'Calling API: DefaultApi.search ...'
          end
          allowable_values = ["af", "af-na", "af-za", "agq", "agq-cm", "ak", "ak-gh", "am", "am-et", "ar", "ar-001", "ar-ae", "ar-bh", "ar-dj", "ar-dz", "ar-eg", "ar-eh", "ar-er", "ar-il", "ar-iq", "ar-jo", "ar-km", "ar-kw", "ar-lb", "ar-ly", "ar-ma", "ar-mr", "ar-om", "ar-ps", "ar-qa", "ar-sa", "ar-sd", "ar-so", "ar-ss", "ar-sy", "ar-td", "ar-tn", "ar-ye", "as", "as-in", "asa", "asa-tz", "ast", "ast-es", "az", "az-az", "bas", "bas-cm", "be", "be-by", "bem", "bem-zm", "bez", "bez-tz", "bg", "bg-bg", "bm", "bm-ml", "bn", "bn-bd", "bn-in", "bo", "bo-cn", "bo-in", "br", "br-fr", "brx", "brx-in", "bs", "bs-ba", "ca", "ca-ad", "ca-es", "ca-fr", "ca-it", "ccp", "ccp-bd", "ccp-in", "ce", "ce-ru", "cgg", "cgg-ug", "chr", "chr-us", "ckb", "ckb-iq", "ckb-ir", "cs", "cs-cz", "cu", "cu-ru", "cy", "cy-gb", "da", "da-dk", "da-gl", "dav", "dav-ke", "de", "de-at", "de-be", "de-ch", "de-de", "de-gr", "de-it", "de-li", "de-lu", "dje", "dje-ne", "dsb", "dsb-de", "dua", "dua-cm", "dyo", "dyo-sn", "dz", "dz-bt", "ebu", "ebu-ke", "ee", "ee-gh", "ee-tg", "el", "el-cy", "el-gr", "en", "en-001", "en-150", "en-ag", "en-ai", "en-as", "en-at", "en-au", "en-bb", "en-be", "en-bi", "en-bm", "en-bs", "en-bw", "en-bz", "en-ca", "en-cc", "en-ch", "en-ck", "en-cm", "en-cx", "en-cy", "en-de", "en-dg", "en-dk", "en-dm", "en-er", "en-fi", "en-fj", "en-fk", "en-fm", "en-gb", "en-gd", "en-gg", "en-gh", "en-gi", "en-gm", "en-gu", "en-gy", "en-hk", "en-ie", "en-il", "en-im", "en-in", "en-io", "en-je", "en-jm", "en-ke", "en-ki", "en-kn", "en-ky", "en-lc", "en-lr", "en-ls", "en-mg", "en-mh", "en-mo", "en-mp", "en-ms", "en-mt", "en-mu", "en-mw", "en-my", "en-na", "en-nf", "en-ng", "en-nl", "en-nr", "en-nu", "en-nz", "en-pg", "en-ph", "en-pk", "en-pn", "en-pr", "en-pw", "en-rw", "en-sb", "en-sc", "en-sd", "en-se", "en-sg", "en-sh", "en-si", "en-sl", "en-ss", "en-sx", "en-sz", "en-tc", "en-tk", "en-to", "en-tt", "en-tv", "en-tz", "en-ug", "en-um", "en-us", "en-vc", "en-vg", "en-vi", "en-vu", "en-ws", "en-za", "en-zm", "en-zw", "eo", "eo-001", "es", "es-419", "es-ar", "es-bo", "es-br", "es-bz", "es-cl", "es-co", "es-cr", "es-cu", "es-do", "es-ea", "es-ec", "es-es", "es-gq", "es-gt", "es-hn", "es-ic", "es-mx", "es-ni", "es-pa", "es-pe", "es-ph", "es-pr", "es-py", "es-sv", "es-us", "es-uy", "es-ve", "et", "et-ee", "eu", "eu-es", "ewo", "ewo-cm", "fa", "fa-af", "fa-ir", "ff", "ff-cm", "ff-gn", "ff-mr", "ff-sn", "fi", "fi-fi", "fil", "fil-ph", "fo", "fo-dk", "fo-fo", "fr", "fr-be", "fr-bf", "fr-bi", "fr-bj", "fr-bl", "fr-ca", "fr-cd", "fr-cf", "fr-cg", "fr-ch", "fr-ci", "fr-cm", "fr-dj", "fr-dz", "fr-fr", "fr-ga", "fr-gf", "fr-gn", "fr-gp", "fr-gq", "fr-ht", "fr-km", "fr-lu", "fr-ma", "fr-mc", "fr-mf", "fr-mg", "fr-ml", "fr-mq", "fr-mr", "fr-mu", "fr-nc", "fr-ne", "fr-pf", "fr-pm", "fr-re", "fr-rw", "fr-sc", "fr-sn", "fr-sy", "fr-td", "fr-tg", "fr-tn", "fr-vu", "fr-wf", "fr-yt", "fur", "fur-it", "fy", "fy-nl", "ga", "ga-ie", "gd", "gd-gb", "gl", "gl-es", "gsw", "gsw-ch", "gsw-fr", "gsw-li", "gu", "gu-in", "guz", "guz-ke", "gv", "gv-im", "ha", "ha-gh", "ha-ne", "ha-ng", "haw", "haw-us", "he", "hi", "hi-in", "hr", "hr-ba", "hr-hr", "hsb", "hsb-de", "hu", "hu-hu", "hy", "hy-am", "id", "ig", "ig-ng", "ii", "ii-cn", "id-id", "is", "is-is", "it", "it-ch", "it-it", "it-sm", "it-va", "he-il", "ja", "ja-jp", "jgo", "jgo-cm", "yi", "yi-001", "jmc", "jmc-tz", "ka", "ka-ge", "kab", "kab-dz", "kam", "kam-ke", "kde", "kde-tz", "kea", "kea-cv", "khq", "khq-ml", "ki", "ki-ke", "kk", "kk-kz", "kkj", "kkj-cm", "kl", "kl-gl", "kln", "kln-ke", "km", "km-kh", "kn", "kn-in", "ko", "ko-kp", "ko-kr", "kok", "kok-in", "ks", "ks-in", "ksb", "ksb-tz", "ksf", "ksf-cm", "ksh", "ksh-de", "kw", "kw-gb", "ky", "ky-kg", "lag", "lag-tz", "lb", "lb-lu", "lg", "lg-ug", "lkt", "lkt-us", "ln", "ln-ao", "ln-cd", "ln-cf", "ln-cg", "lo", "lo-la", "lrc", "lrc-iq", "lrc-ir", "lt", "lt-lt", "lu", "lu-cd", "luo", "luo-ke", "luy", "luy-ke", "lv", "lv-lv", "mas", "mas-ke", "mas-tz", "mer", "mer-ke", "mfe", "mfe-mu", "mg", "mg-mg", "mgh", "mgh-mz", "mgo", "mgo-cm", "mk", "mk-mk", "ml", "ml-in", "mn", "mn-mn", "mr", "mr-in", "ms", "ms-bn", "ms-my", "ms-sg", "mt", "mt-mt", "mua", "mua-cm", "my", "my-mm", "mzn", "mzn-ir", "naq", "naq-na", "nb", "nb-no", "nb-sj", "nd", "nd-zw", "nds", "nds-de", "nds-nl", "ne", "ne-in", "ne-np", "nl", "nl-aw", "nl-be", "nl-bq", "nl-cw", "nl-nl", "nl-sr", "nl-sx", "nmg", "nmg-cm", "nn", "nn-no", "nnh", "nnh-cm", "no", "no-no", "nus", "nus-ss", "nyn", "nyn-ug", "om", "om-et", "om-ke", "or", "or-in", "os", "os-ge", "os-ru", "pa", "pa-in", "pa-pk", "pl", "pl-pl", "prg", "prg-001", "ps", "ps-af", "pt", "pt-ao", "pt-br", "pt-ch", "pt-cv", "pt-gq", "pt-gw", "pt-lu", "pt-mo", "pt-mz", "pt-pt", "pt-st", "pt-tl", "qu", "qu-bo", "qu-ec", "qu-pe", "rm", "rm-ch", "rn", "rn-bi", "ro", "ro-md", "ro-ro", "rof", "rof-tz", "ru", "ru-by", "ru-kg", "ru-kz", "ru-md", "ru-ru", "ru-ua", "rw", "rw-rw", "rwk", "rwk-tz", "sa", "sah", "sah-ru", "saq", "saq-ke", "sbp", "sbp-tz", "sd", "sd-pk", "se", "se-fi", "se-no", "se-se", "seh", "seh-mz", "ses", "ses-ml", "sg", "sg-cf", "shi", "shi-ma", "si", "si-lk", "sk", "sk-sk", "sl", "sl-si", "smn", "smn-fi", "sn", "sn-zw", "so", "so-dj", "so-et", "so-ke", "so-so", "sq", "sq-al", "sq-mk", "sq-xk", "sr", "sr-ba", "sr-cs", "sr-me", "sr-rs", "sr-xk", "sv", "sv-ax", "sv-fi", "sv-se", "sw", "sw-cd", "sw-ke", "sw-tz", "sw-ug", "sy", "ta", "ta-in", "ta-lk", "ta-my", "ta-sg", "te", "te-in", "teo", "teo-ke", "teo-ug", "tg", "tg-tj", "th", "th-th", "ti", "ti-er", "ti-et", "tk", "tk-tm", "to", "to-to", "tr", "tr-cy", "tr-tr", "tt", "tt-ru", "twq", "twq-ne", "tzm", "tzm-ma", "ug", "ug-cn", "uk", "uk-ua", "ur", "ur-in", "ur-pk", "uz", "uz-af", "uz-uz", "vai", "vai-lr", "vi", "vi-vn", "vo", "vo-001", "vun", "vun-tz", "wae", "wae-ch", "wo", "wo-sn", "xog", "xog-ug", "yav", "yav-cm", "yo", "yo-bj", "yo-ng", "yue", "yue-cn", "yue-hk", "zgh", "zgh-ma", "zh", "zh-cn", "zh-hk", "zh-mo", "zh-sg", "zh-tw", "zh-hans", "zh-hant", "zu", "zu-za"]
          if @api_client.config.client_side_validation && opts[:'language'] && !allowable_values.include?(opts[:'language'])
            fail ArgumentError, "invalid value for \"language\", must be one of #{allowable_values}"
          end
          allowable_values = ["LANDING_PAGE", "BLOG_POST", "SITE_PAGE", "DOCUMENT", "KNOWLEDGE_ARTICLE", "LISTING_PAGE"]
          if @api_client.config.client_side_validation && opts[:'type'] && !opts[:'type'].all? { |item| allowable_values.include?(item) }
            fail ArgumentError, "invalid value for \"type\", must include one of #{allowable_values}"
          end
          allowable_values = ["SHORT", "LONG"]
          if @api_client.config.client_side_validation && opts[:'length'] && !allowable_values.include?(opts[:'length'])
            fail ArgumentError, "invalid value for \"length\", must be one of #{allowable_values}"
          end
          # resource path
          local_var_path = '/cms/v3/site-search/search'

          # query parameters
          query_params = opts[:query_params] || {}
          query_params[:'q'] = opts[:'q'] if !opts[:'q'].nil?
          query_params[:'limit'] = opts[:'limit'] if !opts[:'limit'].nil?
          query_params[:'offset'] = opts[:'offset'] if !opts[:'offset'].nil?
          query_params[:'language'] = opts[:'language'] if !opts[:'language'].nil?
          query_params[:'matchPrefix'] = opts[:'match_prefix'] if !opts[:'match_prefix'].nil?
          query_params[:'autocomplete'] = opts[:'autocomplete'] if !opts[:'autocomplete'].nil?
          query_params[:'popularityBoost'] = opts[:'popularity_boost'] if !opts[:'popularity_boost'].nil?
          query_params[:'boostLimit'] = opts[:'boost_limit'] if !opts[:'boost_limit'].nil?
          query_params[:'minScore'] = opts[:'min_score'] if !opts[:'min_score'].nil?
          query_params[:'boostRecent'] = opts[:'boost_recent'] if !opts[:'boost_recent'].nil?
          query_params[:'tableId'] = opts[:'table_id'] if !opts[:'table_id'].nil?
          query_params[:'hubdbQuery'] = opts[:'hubdb_query'] if !opts[:'hubdb_query'].nil?
          query_params[:'keyString'] = opts[:'key_string'] if !opts[:'key_string'].nil?
          query_params[:'domain'] = @api_client.build_collection_param(opts[:'domain'], :multi) if !opts[:'domain'].nil?
          query_params[:'type'] = @api_client.build_collection_param(opts[:'type'], :multi) if !opts[:'type'].nil?
          query_params[:'pathPrefix'] = @api_client.build_collection_param(opts[:'path_prefix'], :multi) if !opts[:'path_prefix'].nil?
          query_params[:'property'] = @api_client.build_collection_param(opts[:'property'], :multi) if !opts[:'property'].nil?
          query_params[:'length'] = opts[:'length'] if !opts[:'length'].nil?
          query_params[:'groupId'] = @api_client.build_collection_param(opts[:'group_id'], :multi) if !opts[:'group_id'].nil?

          # header parameters
          header_params = opts[:header_params] || {}
          # HTTP header 'Accept' (if needed)
          header_params['Accept'] = @api_client.select_header_accept(['application/json', '*/*'])

          # form parameters
          form_params = opts[:form_params] || {}

          # http body (model)
          post_body = opts[:body] 

          # return_type
          return_type = opts[:return_type] || 'PublicSearchResults' 

          # auth_names
          auth_names = opts[:auth_names] || ['hapikey', 'oauth2']

          new_options = opts.merge(
            :header_params => header_params,
            :query_params => query_params,
            :form_params => form_params,
            :body => post_body,
            :auth_names => auth_names,
            :return_type => return_type
          )

          data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
          if @api_client.config.debugging
            @api_client.config.logger.debug "API called: DefaultApi#search\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
          end
          return data, status_code, headers
        end
      end
    end
  end
end
