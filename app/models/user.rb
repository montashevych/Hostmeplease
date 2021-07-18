class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :places, dependent: :destroy
  has_one :picture, as: :imageable, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :omniauthable,
         omniauth_providers: [:google_oauth2]

  enum role: { consumer: 'consumer', owner: 'owner' }

  validates :first_name, length: { minimum: 2, maximum: 50 }
  validates :role, presence: true
  validates :email, presence: true,
                    format: { with: email_regexp },
                    uniqueness: { case_sensitive: false }

  def self.from_google(email:, params:)
    create_with(**params).find_or_create_by!(email: email)
  end
end
