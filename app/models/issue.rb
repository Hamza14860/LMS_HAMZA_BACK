# == Schema Information
#
# Table name: issues
#
#  id          :bigint(8)        not null, primary key
#  book_id     :integer
#  member_id   :integer
#  issue_date  :date
#  due_date    :date
#  fine        :integer
#  return_date :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Issue < ApplicationRecord

  #Associations
   belongs_to :book
   belongs_to :member

   #Validations
   validates :book, presence: true
   validates :member, presence: true
validates :issue_date, presence: false


#after_destroy :log_destroy_action
#  def log_destroy_action
#    puts 'Issue Destroy'
#  end


before_validation :calculate_date


def calculate_date
    self.issue_date ||= Date.today
    self.due_date ||= Date.today+30.day

  end

  after_commit :set_fine, if: :nowdate_equal_duedate?
  after_initialize :set_fine, if: :nowdate_equal_duedate?


  def set_fine
      self.fine ||= 500
    end

    def nowdate_equal_duedate?
       Date.today == self.due_date
      end

end
