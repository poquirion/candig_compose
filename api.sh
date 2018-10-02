export API_NAME="Candig Api"
ret_val=$(curl -H "Authorization: $USER_AUTH" \
  -s \
  -H "Content-Type: application/json" \
  -X POST \
  -d '{
      "api_definition": {
        "name": "Candig Api",
        "slug": "candig",
        "use_keyless": false,
        "use_oauth2": false,
        "use_openid": true,
        "openid_options": {
          "providers": [],
          "segregate_by_client": false
        },
        "oauth_meta": {
          "allowed_access_types": [],
          "allowed_authorize_types": [],
          "auth_login_redirect": ""
        },
        "auth": {
          "use_param": false,
          "param_name": "",
          "use_cookie": false,
          "cookie_name": "",
          "auth_header_name": "",
          "use_certificate": false
        },
        "use_basic_auth": false,
        "basic_auth": {
          "disable_caching": false,
          "cache_ttl": 0
        },
        "use_mutual_tls_auth": false,
        "client_certificates": [],
        "upstream_certificates": {},
        "pinned_public_keys": {},
        "enable_jwt": false,
        "use_standard_auth": false,
        "enable_coprocess_auth": false,
        "jwt_signing_method": "",
        "jwt_source": "",
        "jwt_identity_base_field": "",
        "jwt_client_base_field": "",
        "jwt_policy_field_name": "",
        "jwt_disable_issued_at_validation": false,
        "jwt_disable_expires_at_validation": false,
        "jwt_disable_not_before_validation": false,
        "jwt_skip_kid": false,
        "notifications": {
          "shared_secret": "",
          "oauth_on_keychange_url": ""
        },
        "enable_signature_checking": false,
        "hmac_allowed_clock_skew": -1,
        "base_identity_provided_by": "",
        "definition": {
          "location": "header",
          "key": "x-api-version",
          "strip_path": false
        },
        "version_data": {
          "not_versioned": true,
          "default_version": "",
          "versions": {
            "Default": {
              "name": "Default",
              "expires": "",
              "paths": {
                "ignored": [],
                "white_list": [],
                "black_list": []
              },
              "use_extended_paths": true,
              "extended_paths": {},
              "global_headers": {},
              "global_headers_remove": [],
              "global_size_limit": 0,
              "override_target": ""
            }
          }
        },
        "uptime_tests": {
          "check_list": [],
          "config": {
            "expire_utime_after": 0,
            "service_discovery": {
              "use_discovery_service": false,
              "query_endpoint": "",
              "use_nested_query": false,
              "parent_data_path": "",
              "data_path": "",
              "port_data_path": "",
              "target_path": "",
              "use_target_list": false,
              "cache_timeout": 360,
              "endpoint_returns_list": false
            },
            "recheck_wait": 0
          }
        },
        "proxy": {
          "preserve_host_header": false,
          "listen_path": "/",
          "target_url": "http://server",
          "strip_listen_path": true,
          "enable_load_balancing": false,
          "target_list": [],
          "check_host_against_uptime_tests": false,
          "service_discovery": {
            "use_discovery_service": false,
            "query_endpoint": "",
            "use_nested_query": false,
            "parent_data_path": "",
            "data_path": "",
            "port_data_path": "",
            "target_path": "",
            "use_target_list": false,
            "cache_timeout": 0,
            "endpoint_returns_list": false
          },
          "transport": {
            "ssl_ciphers": [],
            "ssl_min_version": 0,
            "proxy_url": ""
          }
        },
        "disable_rate_limit": false,
        "disable_quota": false,
        "custom_middleware": {
          "pre": [],
          "post": [],
          "post_key_auth": [],
          "auth_check": {
            "name": "",
            "path": "",
            "require_session": false
          },
          "response": [],
          "driver": "",
          "id_extractor": {
            "extract_from": "",
            "extract_with": "",
            "extractor_config": {}
          }
        },
        "custom_middleware_bundle": "",
        "cache_options": {
          "cache_timeout": 0,
          "enable_cache": false,
          "cache_all_safe_requests": false,
          "cache_response_codes": [],
          "enable_upstream_cache_control": false,
          "cache_control_ttl_header": ""
        },
        "session_lifetime": 0,
        "active": true,
        "auth_provider": {
          "name": "",
          "storage_engine": "",
          "meta": {}
        },
        "session_provider": {
          "name": "",
          "storage_engine": "",
          "meta": {}
        },
        "event_handlers": {
          "events": {}
        },
        "enable_batch_request_support": false,
        "enable_ip_whitelisting": false,
        "allowed_ips": [],
        "enable_ip_blacklisting": false,
        "blacklisted_ips": [],
        "dont_set_quota_on_create": false,
        "expire_analytics_after": 0,
        "response_processors": [],
        "CORS": {
          "enable": false,
          "allowed_origins": [],
          "allowed_methods": [],
          "allowed_headers": [],
          "exposed_headers": [],
          "allow_credentials": false,
          "max_age": 0,
          "options_passthrough": false,
          "debug": false
        },
        "domain": "",
        "do_not_track": false,
        "tags": [],
        "enable_context_vars": false,
        "config_data": {},
        "tag_headers": [],
        "global_rate_limit": {
          "rate": 0,
          "per": 0
        },
        "strip_auth_data": false
      }
    }' http://$DOCKER_IP:3000/api/apis/ 2>&1)

ID=$(echo $ret_val | python -c 'import json,sys;obj=json.load(sys.stdin);print obj["Meta"]')
export API_ID=$(curl --silent --header "authorization: $USER_AUTH" http://$DOCKER_IP:3000/api/apis/$ID |  python -c 'import json,sys;obj=json.load(sys.stdin);print obj["api_definition"]["api_id"]')





