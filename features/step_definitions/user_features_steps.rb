Given(/^I visit index page$/) do
  visit '/'
end

Given(/^there is the "([^"]*)" movie with a rating of (\d+)$/) do |title, rating|
  FactoryGirl.create(:movie)
  expect(Movie.count).to eq 1
end

Then(/^I see a "([^"]*)" message$/) do |message|
expect(page).to have_content message
end

Then(/^I see a movie which title is "([^"]*)"$/) do |titles|
  skip_this_scenario
  movie = Movie.find_by(title: titles)
  expect(page).to have_content(movie.title)
end
