# location: spec/feature/integration_spec.rb
# works with the UX and what actually shows up on the page
require 'rails_helper'


RSpec.describe 'Creating a new book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'Title', with: 'Island of the Aunts'
    fill_in 'Author', with: 'Eva Ibbotson'
    fill_in 'Price', with: 5.99
    fill_in 'Published date', with: '1999-09-10'
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('Island of the Aunts')
    expect(page).to have_content('Eva Ibbotson')
    expect(page).to have_content(5.99)
    expect(page).to have_content('1999-09-10')
  end
end

# author (String), price (Number), and published date (Date)

RSpec.describe 'Inputting an author', type: :feature do
  scenario 'valid inputs' do
    book1 = Book.create!(title: 'Tower of Treasure', author: 'aaa', price: 0.00, published_date: '2000-02-02')
    visit edit_book_path(id:book1.id)
    fill_in 'Author', with: 'Franklin W. Dixon'
    click_on 'Update Book'
    visit books_path
    expect(page).to have_content('Franklin W. Dixon')
  end
end

RSpec.describe 'Inputting a price', type: :feature do
  scenario 'valid inputs' do
    book1 = Book.create!(title: 'Tower of Treasure', author: 'aaa', price: 0.00, published_date: '2001-02-02')
    visit edit_book_path(id:book1.id)
    fill_in 'Price', with: 1.99
    click_on 'Update Book'
    visit books_path
    expect(page).to have_content(1.99)
  end
end

RSpec.describe 'Inputting a date', type: :feature do
  scenario 'valid inputs' do
    book1 = Book.create!(title: 'Tower of Treasure', author: 'aaa', price: 0.00, published_date: '2002-02-02')
    visit edit_book_path(id:book1.id)
    fill_in 'Published date', with: '1927-06-01'
    click_on 'Update Book'
    visit books_path
    expect(page).to have_content('1927-06-01')
  end
end
