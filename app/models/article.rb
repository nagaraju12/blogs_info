class Article < ActiveRecord::Base
	 has_many :comments, dependent: :destroy
  validates :name, presence: true
end
