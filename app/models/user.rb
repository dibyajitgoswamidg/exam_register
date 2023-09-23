class User < ApplicationRecord
  has_many :registrations

  validates :first_name, :last_name, :phone_number, presence: true
  validates :phone_number, uniqueness: true, numericality: true
  validate :valid_phone_number?

  private

  def valid_phone_number?
    # Considered only 10 digit mobile number starts with 6-9
    errors.add(:phone_number, 'is not valid') unless
    Constants::VALID_PHONE_REGEX.match?(phone_number&.to_s)
  end
end
