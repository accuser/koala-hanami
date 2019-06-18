class UserRepository < Hanami::Repository
  associations do
    has_one :profile
  end

  def user_with_email(email)
    users
      .where(email: email)
      .one
  end

  def user_with_token(token)
    users
      .where(token: token)
      .one
  end

  def find_with_profile(id)
    aggregate(:profile)
      .where(id: id)
      .map_to(User)
      .one
  end

  def create(attributes)
    assoc(:profile)
      .create(attributes)
  end
end
