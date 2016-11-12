
  def register_as_a_user
    click_on 'Registrarse'
    fill_in 'user[email]', with: 'test@test.com'
    fill_in 'Password', with: 123456
    fill_in 'Password confirmation', with: 123456
    click_on 'Sign up'
  end
