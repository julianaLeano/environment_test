class Book < ApplicationRecord
   has_many :users, through: :user_books
   has_many :user_books
   validates :title, :author, :price, :published_date, presence: true
end

class UserBook < ApplicationRecord
   belongs_to :user
   belongs_to :book
end

class User < ApplicationRecord
   has_many :books, through: :user_books
   has_many :user_books
end