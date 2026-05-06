# == Schema Information
#
# Table name: posts
# Database name: primary
#
#  id                                      :bigint           not null, primary key
#  user_id                                 :bigint           not null
#  title                                   :string
#  body                                    :text
#  created_at                              :datetime         not null
#  updated_at                              :datetime         not null
#
# Indexes
#
#  index_posts_on_user_id                  (user_id)
#
# Foreign Keys
#
#  fk_rails_...                            (user_id => users.id)
#
class Post < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true

  scope :recent, -> { order(created_at: :desc) }
end
