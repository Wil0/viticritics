require 'rails_helper'

feature "User can sign in and out" do
  
  before do
    visit '/'
  end

  context "user not signed in and on the homepage" do
    it "should see a 'Registrarse' link and a 'Iniciar sesión' link" do
      expect(page).to have_link'Registrarse'
      expect(page).to have_link 'Iniciar sesión'
    end

    it "should not see 'Cerrar sesión' link" do
      expect(page).not_to have_link 'Cerrar sesión'
    end
  end

  context "user signed in on the homepage" do
    before do
      click_link 'Iniciar sesión'
      fill_in 'Email', with: 'test@example.com'
      fill_in 'Password', with: 'testtest'
      fill_in 'Password confirmation', with: 'testtest'
      click_button 'Sign up'
    end

    it "should see 'Cerrar sesión' link" do
      expect(page).to have_link 'Cerrar sesión'
    end

    it "should not see a 'Registrarse' link and a 'Iniciar sesión' link" do
      expect(page).not_to have_link 'Registrarse'
      expect(page).not_to have_link 'Iniciar sesión'
    end
  end
end
