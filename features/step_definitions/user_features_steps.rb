Given(/^I visit index page$/) do
  visit '/'
end

Given(/^there is the "([^"]*)" movie with a rating of (\d+)$/) do |title, rating|
  FactoryGirl.create(:movie)
  expect(Movie.count).to eq 1
end

Given(/^I click on "([^"]*)" button$/) do |button|
  click_on button
end

When(/^I fill the form for "([^"]*)" with a rating of (\d+)$/) do |title, rate|
  fill_in 'movie[title]', with: title
  fill_in 'movie[rating]', with: rate
  click_on 'Create Movie'
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
