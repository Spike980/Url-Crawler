class UrlContent < ApplicationRecord
  belongs_to :url_index
  validates :url_index_id, presence: true
end
