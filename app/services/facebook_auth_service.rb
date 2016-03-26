class FacebookAuthService

  ACCESS_TOKEN_URL = 'https://graph.facebook.com/v2.5/oauth/access_token'
  DATA_URL = 'https://graph.facebook.com/v2.5/me'
  APP_ID = '931878413569445'
  APP_SECRET = '3744d8b6e77b05b44eccac87e8c21b79'
  REDIRECT_URI = 'http://localhost:8100/'

  @client = HTTPClient.new

  attr_accessor :get_access_token, :get_user_data

  def self.get_access_token(code)
    response = @client.get(ACCESS_TOKEN_URL, client_id: APP_ID, client_secret: APP_SECRET, code: code, redirect_uri: REDIRECT_URI)
    response_data = JSON.parse(response.body).with_indifferent_access
    response_data[:access_token]
  end

  def self.get_user_data(access_token)
    response = @client.get(DATA_URL, access_token: access_token, fields: 'first_name, last_name, email, gender, about, link, website, picture')
    @data = JSON.parse(response.body).with_indifferent_access
    @data['image_url'] = @data['picture']['data']['url'] if @data['picture'].present?
    @uid = @data[:id] ||= @data[:sub]
    self.formatted_user_data
  end

  def self.formatted_user_data
    {
        facebook_profile: @data['link'],
        first_name:       @data['first_name'],
        last_name:        @data['last_name'],
        image_url:        @data['image_url'],
        provider:        'facebook',
        gender:           @data['gender'],
        token:            @access_token,
        email:            @data['email'],
        uid:              @data['id']
    }
  end

  def persisted?
    false
  end

end