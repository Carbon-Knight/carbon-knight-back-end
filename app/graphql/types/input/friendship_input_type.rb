module Types
  module Input
    class FriendshipInputType < Types::BaseInputObject
      argument :friend_one, String, required: true
      argument :friend_two, String, required: true
      argument :status, String, required: true 
    end
  end
end
