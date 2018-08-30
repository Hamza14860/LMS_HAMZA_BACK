# == Schema Information
#
# Table name: books
#
#  id          :bigint(8)        not null, primary key
#  name        :string
#  isbn        :bigint(8)
#  edition     :string
#  author      :string
#  publisher   :string
#  copies      :integer
#  price       :integer
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Book < ApplicationRecord
#self.inheritance_column = nil

# Constants

    # Associations
      has_many :issues#,dependent: :destroy
      has_many :members, through: :issues
    #  has_one :issue




 # Validations
 validates :isbn, presence: true, uniqueness: true, length: { is: 13 }
 validates :name, presence: true, length: { maximum: 20 }
 validates :author, presence: true, length: { maximum: 20 }
 validates :publisher, presence: true, length: { maximum: 20 }
 validates :copies, presence: true
 validates_numericality_of :copies, greater_than_or_equal_to: 1, less_than_or_equal_to: 100

 validates :price, presence: true, uniqueness: true
 validates_numericality_of :price, greater_than_or_equal_to: 0

 #Callbacks

 #Methods

end
