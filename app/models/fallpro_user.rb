class FallproUser < ApplicationRecord
  belongs_to :user


  def full_name 
    return self.firstname + " " + self.lastname
  end
end
