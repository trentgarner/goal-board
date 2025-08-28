class List < ApplicationRecord
  validates :description, presence: true

  def serialized
    {
      id:,
      description:
    }
  end
end
