module CurrentUserConcern
  extend ActiveSupport::Concern

  def current_user
    super || guest_user
  end

  def guest_user
    OpenStruct.new(name: "Tim Jones",
                  first_name: "Tim",
                   last_name: "Jones",
                    email: "tim@jones.me"
                    )
  end

end
