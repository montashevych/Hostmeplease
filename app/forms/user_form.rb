class UserRegistrationForm
  include ActiveModel::Model
  email_regexp = /\A[^@\s]+@[^@\s]+\z/

  attr_accessor :last_name, :password, :password_confirmation, :phone_number, :role, :email

  validates :first_name, length: { minimum: 2, maximum: 50 }
  validates :password, length: { minimum: 6, maximum: 256, on: :create }, confirmation: true
  validates_confirmation_of :password
  validates :last_name, length: { minimum: 2, maximum: 50 }
  validates :phone_number, length: { minimum: 8, maximum: 17 }
  validates :role, presence: true
  validates :email, presence: true,
                    format: { with: email_regexp }


  def submit
    return false if invalid?

    # send acknowledgement reply, and admin notification emails, etc
    true
  end
end

# class UserRegistrationForm
# include ActiveModel::Model
#   attr_accessor :person, :terms_of_service  delegate :attributes=, to: :person, prefix: true
#
#   validates :terms_of_service, acceptance: true
#   validate :person_is_valid
#
#   def initialize(params= {})
#     @person = Person.new
#     super(params)
#     @terms_of_service ||= false
#   end
#
#   def submit
#     return false if invalid?
#     person.save
#   end
#
#   private
#
#   def person_is_valid
#     errors.add(:person, 'is invalid') if person.invalid?
#   end
# end
