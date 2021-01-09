module Types
  class FriendshipType < Types::BaseObject
    field :id, ID, null: false
    field :friend_one, String, null: false
    field :friend_two, String, null: false
    field :status, String, null: false
  end
end
