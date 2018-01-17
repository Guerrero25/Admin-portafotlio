class User < ApplicationRecord
    has_many :projects
    has_many :contacts
    has_secure_password
    has_attached_file :profile, styles: { medium: "300x300>" }, default_url: "/images/:style/missing.png"
    do_not_validate_attachment_file_type :profile
end
