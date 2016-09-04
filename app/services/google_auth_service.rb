class GoogleAuthService

  ACCESS_TOKEN_URL = 'https://www.googleapis.com/oauth2/v4/token'
  DATA_URL = 'https://www.googleapis.com/plus/v1/people/me'
  APP_ID = '844104594388-e63rsp4mqnlvedourmdjf95j3d32vier.apps.googleusercontent.com'
  APP_SECRET = 'xW39icz-VTLzJf1M4HsOYS_M'
  REDIRECT_URI = 'http://localhost:8100'

  @client = HTTPClient.new

  attr_accessor :get_access_token, :get_user_data

  def self.get_access_token(code)
    response = @client.post(ACCESS_TOKEN_URL, client_id: APP_ID, client_secret: APP_SECRET, code: code, redirect_uri: REDIRECT_URI, grant_type: 'authorization_code')
    response_data = JSON.parse(response.body).with_indifferent_access
    response_data[:access_token]
  end

  def self.get_user_data(access_token)
    response = @client.get(DATA_URL, access_token: access_token)
    @data = JSON.parse(response.body).with_indifferent_access
    @data['image_url'] = @data['image']['url'] if @data['image'].present?
    @uid = @data[:id] ||= @data[:sub]
    self.formatted_user_data
  end

  def self.formatted_user_data
    {
        google_profile: @data['url'],
        first_name:       @data['name']['givenName'],
        last_name:        @data['name']['familyName'],
        image_url:        @data['image_url'],
        provider:        'google',
        gender:           @data['gender'],
        token:            @access_token,
        email:            @data['emails'][0]['value'],
        uid:              @data['id']
    }
  end

  def persisted?
    false
  end

end