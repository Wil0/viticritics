Given(/^I visit index page$/) do
  visit '/'
end

Then(/^I see a "([^"]*)" message$/) do |message|
expect(page).to have_content message
end
