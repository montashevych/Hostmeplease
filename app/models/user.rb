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
  validates :password, length: { minimum: 6, maximum: 256 }, on: :create

  before_create :set_default_avatar
  has_many :bookings, dependent: :nullify

  accepts_nested_attributes_for :picture

  def self.from_google(email:, params:)
    create_with(**params).find_or_create_by!(email: email)
  end

  def set_default_avatar
    build_picture(image: Rack::Test::UploadedFile.new(
                          File.open(Rails.root.join('app/frontend/images/default_avatar.png')),
                          'image/png',
                        ))
  end
end
