class Gossip < ApplicationRecord
  belongs_to :user, optional: true
  has_many :join_table_gossip_tags
end
