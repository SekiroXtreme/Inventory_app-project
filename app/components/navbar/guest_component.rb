class Navbar::GuestComponent < ViewComponent::Base
  def initialize(user: nil)
    @user = user
  end
end