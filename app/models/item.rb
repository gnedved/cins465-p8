class UrlValidator < ActiveModel::EachValidator

    def validate_each(record, attribute, value)
        valid = begin
        URI.parse(value).kind_of?(URI::HTTP)
        rescue URI::InvalidURIError
        false
        end
        unless valid
        record.errors[attribute] << (options[:message] || "is an invalid URL")
        end
    end

end


class Item < ActiveRecord::Base
  require 'uri'

  belongs_to :wish_list
  mount_uploader :image, ImageUploader
  attr_accessor :item

  validates :name, presence: true
  # validates :image, presence: true
  validates :url, :url => true

end
