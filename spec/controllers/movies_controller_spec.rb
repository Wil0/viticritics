require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  let(:movie1) { create(:movie, title: 'MI:4') }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    context 'when a movie is saved' do
      it 'renders a list of saved movies' do
        movie1
        movie2 = create(:movie)
        get :index
        expect(Movie.all).to match_array([movie1, movie2])
      end
    end

    context 'when a movie is not saved' do
      it 'only renders a list of saved movies' do
        movie1
        movie2 = build(:movie)
        get :index
        expect(Movie.all).to match_array([movie1])
        expect(Movie.all).not_to include(movie2)
      end
    end
  end

end
