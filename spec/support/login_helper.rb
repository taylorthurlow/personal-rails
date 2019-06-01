def sign_in(login: nil, password: "password")
  login ||= create(:login)

  post sessions_path, params: {
                        username: login.username,
                        password: password,
                      }
end
