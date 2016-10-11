module Sorcery
  module TestHelpers
    module Rails
      def login_user_post(email, password)
        page.driver.post(login_url, { email: email, password: password})
      end

      def logout_user_get
        page.driver.get(logout_url)
      end
    end
  end
end