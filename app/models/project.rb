class Project < ApplicationRecord
  belongs_to :user
  has_attached_file :cover, styles: { medium: "300x300>" }, default_url: "/images/:style/missing.png"
  do_not_validate_attachment_file_type :cover
end
