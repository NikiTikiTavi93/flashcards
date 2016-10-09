def login(email,password)
  visit login_path
  puts page.body
  fill_in :email, with: email
  fill_in :password, with: password
  click_button "Log in"
end