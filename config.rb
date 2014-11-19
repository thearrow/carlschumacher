require "uglifier"

configure :development do
  activate :livereload
end

activate :bower
set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'
set :slim, pretty: true
set :relative_links, true
sprockets.append_path '/vendor'

configure :build do
  activate :relative_assets
  activate :minify_html
  activate :minify_css
  activate :minify_javascript, :compressor => Uglifier.new({
    :output => {
      :comments => :none
    }
  })
  activate :gzip
  activate :imageoptim do |image_optim|
    image_optim.pngout_options = false
  end
end

activate :deploy do |deploy|
  deploy.build_before = true
  deploy.method = :git
end
