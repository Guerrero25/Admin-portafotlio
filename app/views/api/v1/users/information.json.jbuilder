json.(@current_user, :created_at, :updated_at)

json.user do
    json.fullname @current_user.fullname
    json.bio @current_user.bio
    
    json.profile do
        json.(@current_user, :profile_file_name, :profile_file_size)
        json.url image_url(@current_user.profile.url)
    end

    json.contacts @contacts do |contact|
        json.icon contact.icon
        json.title contact.title
        json.link contact.link
    end
end