class Contact < ActiveRecord::Base
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true, uniqueness: true  

  def name
    [firstname, lastname].join(' ')
  end
end
