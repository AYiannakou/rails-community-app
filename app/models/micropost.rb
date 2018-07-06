class Micropost < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  index_name Rails.application.class.parent_name.underscore
  document_type name.downcase

  belongs_to :user

  has_many :answers, dependent: :destroy

  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }

  settings index: { number_of_shards: 1 } do
  mapping dynamic: false do
    indexes :subject, analyzer: 'english'
    indexes :content, analyzer: 'english'
    indexes :user_id, type: :integer
  end
end

def as_indexed_json(options = nil)
  self.as_json( only: [ :subject, :content ] )
end

def self.search(query)
   __elasticsearch__.search(
   {
     query: {
        multi_match: {
          query: query,
          fields: ['subject^5', 'content']
        }
      },
      highlight: {
        pre_tags: ['<em><b>'],
        post_tags: ['</em></b>'],
      fields: {
        subject: {},
        content: {}
  }
}
}
)
end

  private

  # Validates the size of an uploaded picture.
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, 'should be less than 5MB')
    end
  end
end
