class Relationshp < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :user_id, presence: true
  validates :libraryebook_id, presence: true
  validates :status, presence: true
  validates :loanstart, presence: true
  validates :loanend, presence: true
end
