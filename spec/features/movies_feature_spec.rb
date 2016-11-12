require 'rails_helper'

feature 'movies' do
  let(:movie)  { create(:example_movie) }
  let(:movie2) { create(:another_movie) }

  context 'on index page' do
    scenario 'can be added' do
      movie2
      visit '/'
      register_as_a_user
      click_on 'Añadir película'
      attach_file 'movie[avatar]', "#{Rails.root}" + '/spec/ruby.png'
      fill_in 'movie[title]', with: movie.title
      fill_in 'movie[rating]', with: movie.rating
      click_on 'Crear película'
      expect(page).not_to have_content 'Todavía no hay películas'
      expect(page).to have_link movie.title
    end
  end

  context 'no movies have been added' do
    scenario 'should display a prompt to add a movie' do
      visit '/'
      expect(page).to have_content 'Todavía no hay películas'
      expect(page).to have_link 'Añadir película'
    end
  end

  context 'movies have been added' do
    scenario 'display movies' do
      movie
      visit '/'
      expect(page).to have_content movie.title
      expect(page).not_to have_content 'Todavía no hay películas'
    end
  end

  context 'viewing movies' do
    scenario 'let a user view a movie review' do
      movie
      visit '/'
      click_link movie.title
      expect(current_path).to eq movie_path(movie)
      expect(page).to have_content movie.title
      expect(page).to have_content movie.review
    end
  end

  context 'editing movies' do
    scenario 'let a user edit a movie' do
      movie
      visit '/'
      register_as_a_user
      click_link "Editar #{movie.title}"
      fill_in 'movie[title]', with: movie.title
      fill_in 'movie[review]', with: 'I have changed my opinion'
      click_button "Actualizar #{movie.title}"
      expect(page).to have_content 'I have changed my opinion'
      expect(page).to have_content movie.title
      expect(current_path).to eq '/'
    end
  end

  context 'deleting movies' do
    scenario 'removes a movie when a user clicks a delete link' do
      movie
      visit '/'
      register_as_a_user
      click_link "Eliminar #{movie.title}"
      expect(page).not_to have_content movie.title
      expect(page).to have_content 'Película eliminada correctamente'
    end
  end
end
