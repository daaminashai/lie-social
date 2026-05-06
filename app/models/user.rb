# == Schema Information
#
# Table name: users
# Database name: primary
#
#  id                                      :bigint           not null, primary key
#  display_name                            :string
#  email                                   :string
#  first_name                              :string
#  last_name                               :string
#  created_at                              :datetime         not null
#  updated_at                              :datetime         not null
#
# Indexes
#
#  index_users_on_email               (email)
#
class User < ApplicationRecord
  has_one :user_profile, dependent: :destroy
  has_many :posts, dependent: :destroy


  # validates :verification_status, presence: true
  # after_commit :track_identity_verified, if: :should_track_identity_verified?

  def full_name
    [ first_name, last_name ].compact.join(" ").strip
  end

end