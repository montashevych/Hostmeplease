class Place < ApplicationRecord
  belongs_to :user
  has_one :address, dependent: :destroy
  has_many :pictures, as: :imageable, dependent: :destroy, inverse_of: :imageable

  enum status: { created: 0, updated: 1, approved: 2 }

  validates :title, presence: true, length: { minimum: 8, maximum: 23 }
  validates :description, presence: true, length: { minimum: 100, maximum: 900 }
  validates :price, presence: true
  validates :address, presence: true
  validates :pictures, presence: true

  scope :workspaces, -> { where(type: 'Workspace') }
  scope :accommodations, -> { where(type: 'Accommodation') }

  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :pictures

  after_commit :change_user_role

  private

  def change_user_role
    if !user.places.exists? && user.owner?
      user.update!(role: :consumer)
    elsif user.consumer?
      user.update!(role: :owner)
    end
  end
end
