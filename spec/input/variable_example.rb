application "web-example" do

  all do
    labels do
      label "com.example.overwrite":  "global"
      label "com.example.description":  "common description"
     end
  end

  service "web" do
    image "my-web-example:latest"
    command "bundle exec rails s"
    labels do
      label "com.example.web":  "web label"
      label "com.example.overwrite":  "web"
     end
  end

  service "db" do
    image "postgres:latest"
    command -> { "ruby #{ context.service.name }" }
    labels do
      label "com.example.db":  -> { "#{ service.image } label" }
     end
  end

end