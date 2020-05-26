class Skill < ApplicationRecord
include Placeholder

after_initialize :set_defaults

def set_defaults
  self.badge ||= Placeholder.image_generator(height: "100", width: "100")
end



end
