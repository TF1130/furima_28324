class Address < ApplicationRecord
  extend ActiveHash::Associations::ApplicationRecordExtensions
  belongs_to_active_hash :address

  validates :title, :text, :address, presece: true

  with_options numericality: { other_than: 1 } do
    validates :address_id
  end
end
