class Comment < ActiveRecord::Base
  validates :body, presence: true
  validates :post_id, presence: true
  belongs_to :user
  belongs_to :post

  def as_json(options = {})
    super(options.merge(include: :user))
  end
end
