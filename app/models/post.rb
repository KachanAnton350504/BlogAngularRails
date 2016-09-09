class Post < ActiveRecord::Base
  validates :title, presence: true , uniqueness: { case_sensitive: false }
  validates :body, presence: true
  
  belongs_to :user
  has_many :comments
  has_and_belongs_to_many :rubrics

  def as_json(options = {})
    super(options.merge(include: [:user, comments: {include: :user}]))
  end
end
