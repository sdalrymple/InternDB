Before('@omniauth_test') do
  OmniAuth.config.test_mode = true

  OmniAuth.config.mock_auth[:google_oauth2] = {
      "provider" => "google_oauth2",
      "uid" => "http://localhost:3000/",
      "user_info" => {"email" => "test@colgate.edu", :name => "Alvin Test"}
  }
end

After('@omniauth_test') do
  OmniAuth.config.test_mode = false
end
