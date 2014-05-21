class Contact < ActiveRecord::Base
  validates :name, presence: true, length: {minimum: 1}
  validates :number, presence: true, length: {minimum: 1}
end
