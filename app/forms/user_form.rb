class UserForm
  include ActiveModel::Model

  attr_accessor :last_name, :password, :password_confirmation, :phone_number, :role, :email

  validates :password, length: { minimum: 6, maximum: 256, on: :create}, :confirmation =>true
  validates_confirmation_of :password
  validates :last_name, length: { minimum: 2, maximum: 50 }
  validates :phone_number, length: { minimum: 8, maximum: 17 }
  validates :role, presence: true
  validates :email, presence: true,
                    format: { with: email_regexp },
                    uniqueness: { case_sensitive: false }

  def submit
    return false if invalid?
    # send acknowledgement reply, and admin notification emails, etc
    true
  end

end
