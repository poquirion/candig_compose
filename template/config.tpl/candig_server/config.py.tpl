DATA_SOURCE='/data/candig-example-data/registry.db'
REQUEST_VALIDATION=True
SESSION_COOKIE_SECURE=${SESSION_COOKIE_SECURE}
SECRET_KEY='${SECRET_KEY}'
ACCESS_LIST='/data/access_list.tsv'

# Tyk settings 
TYK_ENABLED=True
TYK_SERVER="${CANDIG_PUBLIC_URL}${CD_PUB_PORT}"
# write path in the "/path" form. Leave empty "" for empty path 
TYK_LISTEN_PATH="${TY_LISTEN_PATH}"

# Keycloak settings with redirection through tyk
KC_REALM='${KC_REALM}'
KC_SERVER="${KC_PUBLIC_URL}${KC_PUB_PORT}"
KC_SCOPE='openid+email'
KC_RTYPE='code'
KC_CLIENT_ID='${KC_CLIENT_ID}'
KC_RMODE='form_post'
KC_LOGIN_REDIRECT_PATH='/login_oidc'
KC_REDIRECT=TYK_SERVER+TYK_LISTEN_PATH+KC_LOGIN_REDIRECT_PATH
KC_LOGIN_REDIRECT='/auth/realms/{0}/protocol/openid-connect/auth?scope={1}&response_type={2}&client_id={3}&response_mode={4}&redirect_uri={5}'.format(
    KC_REALM, KC_SCOPE, KC_RTYPE, KC_CLIENT_ID, KC_RMODE, KC_REDIRECT
)
