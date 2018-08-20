class Tagging < ApplicationRecord
  belongs_to :integration
  belongs_to :tag
end
