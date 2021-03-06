#These step definitions use Regular Expression matching to perform particular actions when called from a step in the .feature file

Given(/^I am on the Google Home Page$/) do
  $app = Google.new
  $app.home.load
end

When(/^I search for Kittens$/) do
  $app.home.set_search_field('Kittens')
  $app.home.click_search_button
end

Then(/^I see the Google Search Results Page$/) do
  expect($app.search_results.displayed?).to be_truthy
end

Then(/^the (.*) Page has Kittens$/) do |page_name|
  expect($app.send(page_name).text).to include('Kittens')
end

When(/^I click the first result on the Google Search Results page$/) do
  $app.search_results.click_first_search_result
end

Then(/^I am redirected to the corresponding website from the search result$/) do
  expect(current_url).to include($app.search_results.first_search_result_url)
end
#
When(/^I click the News Tab on the Google Search Results Page$/) do
  $app.search_results.click_news_tab
end

Then(/^I see the Google News Results Page$/) do
  expect($app.news_results.displayed?).to be_truthy
end

When(/^I click the first result on the Google News Results page$/) do
  $app.news_results.click_first_news_result
end

Then(/^I am redirected to the corresponding website from the news results$/) do
  expect(current_url).to include($app.news_results.first_news_result_url)
end