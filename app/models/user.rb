class User < ApplicationRecord
  has_many :places, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :omniauthable,
         omniauth_providers: [:google_oauth2]
  enum role: { consumer: 'consumer', owner: 'owner' }

  validates :first_name, :last_name, length: { minimum: 2, maximum: 50 }
  validates :role, presence: true
  validates :email, presence: true,
                    format: { with: email_regexp },
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6, maximum: 256, on: :create }
  validates :password, confirmation: { case_sensitive: true }

  def self.from_google(email:, params:)
    create_with(**params).find_or_create_by!(email: email)
  end
end
