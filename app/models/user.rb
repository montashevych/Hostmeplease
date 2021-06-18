class User < ApplicationRecord
  has_many :places, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  enum role: { consumer: 'consumer', owner: 'owner' }

  validates :first_name, length: { minimum: 2, maximum: 50 }
  validates :role, presence: true
  VALID_EMAIL_REGEX = /\A[^@\s]+@[^@\s]+\z/
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6, maximum: 256 }
end
