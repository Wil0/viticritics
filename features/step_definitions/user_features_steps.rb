Given(/^I visit index page$/) do
  visit '/'
end

Given(/^there is the "([^"]*)" movie with a rating of (\d+)$/) do |title, rating|
  movie = FactoryGirl.create(:movie)
  expect(page).to have_content movie.title
end

Given(/^I click on "([^"]*)" button$/) do |button|
  click_on button
end

When(/^I fill the form for "([^"]*)" with a rating of (\d+)$/) do |title, rate|
  fill_in 'movie[title]', with: title
  fill_in 'movie[rating]', with: rate
  click_on 'Crear película'
end

Then(/^I see "([^"]*)" has been added to the list of movies$/) do |title|
  visit '/'
  expect(page).to have_content title
end

Then(/^I see a "([^"]*)" message$/) do |message|
expect(page).to have_content message
end

Then(/^I see a movie which title is "([^"]*)"$/) do |titles|
  skip_this_scenario
  movie = Movie.find_by(title: titles)
  expect(page).to have_content(movie.title)
end

Then(/^I see "([^"]*)" as a review for "([^"]*)"$/) do |review, title|
  movie = Movie.find_by(title: title)
  visit movies_path(movie)
end
