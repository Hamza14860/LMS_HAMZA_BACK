# == Schema Information
#
# Table name: members
#
#  id         :bigint(8)        not null, primary key
#  roll_no    :string
#  first_name :string
#  last_name  :string
#  program    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  email      :string
#  password   :string
#

class Member < ApplicationRecord



  # Constants
  TYPES = ['BS-CS', 'BS-EE', 'BBA', 'A&F']
  EMAIL_REGEX = /\A(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$\z/

    # Associations
  has_many :issues #, dependent: :destroy
  has_many :books, through: :issues

  #has_one :issue

  #accepts_nested_attributes_for :issues

#Validations
validates :roll_no, presence: true, uniqueness: true, length: { is: 7 }
validates :first_name, presence: true, length: { maximum: 20 }
validates :last_name, presence: true, length: { maximum: 20 }
validates :program, presence: true, inclusion: { :in => TYPES, :message => 'eg BS-CS'} , allow_blank: false

  validates :email, format: { :with => EMAIL_REGEX, :message => 'invalid email' }, allow_blank: false
  validates :email, uniqueness: true
  validates :password, presence: true
#validates :comments, length: { maximum: 120 }


end
