# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :google_oauth2, ENV["GOOGLE_KEY"], ENV["GOOGLE_SECRET"], {access_type: 'online', approval_prompt: ''}
# end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, :GOOGLE_KEY, :GOOGLE_SECRET, 
    # ENV['GOOGLE_KEY'],
    # ENV['GOOGLE_SECRET'],
    {name: "google_login", access_type: 'online', approval_prompt: '', client_id: '908672816924.apps.googleusercontent.com'}
end
