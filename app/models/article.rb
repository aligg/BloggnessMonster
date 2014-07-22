class Article < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	belongs_to :user

	validates :title, presence: true,
				length: { minimum: 2 }
	validates :text, presence: true,
				length: {minimum: 10 }
end
