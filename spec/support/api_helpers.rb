module ApiHelpers
  def json
    JSON.parse(response.body).deep_symbolize_keys
  end

  def login(user = FactoryGirl.create(:user))
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in user
      user
  end

end
