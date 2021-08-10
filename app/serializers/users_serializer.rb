class UsersSerializer < ActiveModel::Serializer
  attributes :email, :api_key

  def self.details(user)
    {
      data:
      {
        type: 'users',
        id: user.id,
        attributes:
        {
          email: user.email,
          api_key: user.api_key
        }
      }
    }.to_json
  end
end
