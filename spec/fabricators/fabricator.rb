Fabricator(:user, :class_name => "User") do
  id { sequence }
  password { "secret" }
  password_confirmation { "secret" }
  email { "whatever@whatever.com" }
  salt { "asdasdastr4325234324sdfds" }
  crypted_password { Sorcery::CryptoProviders::BCrypt.encrypt("secret", "asdasdastr4325234324sdfds") }
end
