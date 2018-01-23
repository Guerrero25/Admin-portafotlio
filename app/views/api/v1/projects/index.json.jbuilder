json.projects @projects do |project|
    json.id project.id
    json.name project.name
    json.repository project.repository
    json.information project, :created_at, :updated_at
    json.cover do
        json.file_name project.cover_file_name
        json.url url_for(project.cover.url)
    end
end