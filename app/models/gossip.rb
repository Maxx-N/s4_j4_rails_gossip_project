class Gossip < ApplicationRecord
  belongs_to :user
  has_many : join_table_gossip_tags
end
