class UserForm
  include ActiveModel::Model
  email_regexp = /\A[^@\s]+@[^@\s]+\z/

  attr_accessor :first_name, :last_name, :phone_number, :email, :success, :user

  validates :first_name, length: { minimum: 2, maximum: 50 }
  validates :last_name, length: { minimum: 2, maximum: 50 }
  validates :phone_number, length: { minimum: 8, maximum: 17 }
  validates :email, presence: true,
                    format: { with: email_regexp }

  def initialize(attributes = {})
    super
    @first_name ||= user.first_name
    @last_name  ||= user.last_name
    @email      ||= user.email
    @phone_number ||= user.phone_number
  end

  def submit
    if valid?
      persist!
      @success = true
    else
      @success = false
    end
  end

  private

  def persist!
    user.update({
                  first_name: first_name,
                  last_name: last_name,
                  email: email,
                  phone_number: phone_number,
                })
  end
end
