class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable,
         :omniauthable,
         omniauth_providers: [:google_oauth2]
  enum role: { consumer: 'consumer', owner: 'owner' }
  validates :first_name, presence: true, length: { minimum: 2, maximum: 50 }
  validates :role, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6, maximum: 256 }

  def self.from_google(email:, avatar_url:, first_name:, last_name:, password:)
    create_with(avatar_url: avatar_url, first_name: first_name, last_name: last_name, password: password).find_or_create_by!(email: email)
  end
end
