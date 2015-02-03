require 'test_helper'

class CreateUserTest < ActionDispatch::IntegrationTest
	test 'create users' do
		post '/api/users',
			{ user:
				{user_id: 'dsdffg', password: 'dsfsdf'}
			}.to_json,
			{ 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }

		assert_equal 201, response.status
		assert_equal Mime::JSON, response.content_type

		user = json(response.body)
		assert_equal user_url(user[:id]), response.location
	end
end
