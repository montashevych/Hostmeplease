class UserForm < User
  include ActiveModel::Model
  email_regexp = /\A[^@\s]+@[^@\s]+\z/

  attr_accessor :first_name, :last_name, :phone_number, :email

  validates :first_name, length: { minimum: 2, maximum: 50 }
  validates :last_name, length: { minimum: 2, maximum: 50 }
  validates :phone_number, length: { minimum: 8, maximum: 17 }
  validates :email, presence: true,
                    format: { with: email_regexp }


  def submit
    return false if invalid?
    # send acknowledgement reply, and admin notification emails, etc
    true
  end
end
