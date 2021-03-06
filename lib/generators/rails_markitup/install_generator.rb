require 'rake'
require 'rails/generators'

# ==================================
# = rails g rails_markitup:install =
# ==================================

module RailsMarkitup
  module Generators

    class InstallGenerator < Rails::Generators::Base
      
      source_root File.expand_path('../media', __FILE__)
      desc "Copies media files to main project"
      def copy_media_files
        path = File.expand_path('../media', __FILE__)
        @images = FileList["#{path}/images/*"]
        @images.each do |image|
          copy_file "#{image}", "public/stylesheets/markitup/image/#{image.split('/').last}"
        end
        copy_file "../media/javascripts/jquery.markitup.js",          "public/javascripts/markitup/jquery.markitup.js"
        copy_file "../media/javascripts/sets/markdown/set.js",        "public/javascripts/markitup/sets/markdown/set.js"
        copy_file "../media/stylesheets/sets/markdown/style.css",     "public/stylesheets/markitup/sets/markdown/style.css"
        copy_file "../media/stylesheets/skins/markitup/style.css",    "public/stylesheets/markitup/skins/markdown/style.css"
        copy_file "../media/stylesheets/skins/markitup/bright.css",   "public/stylesheets/markitup/skins/markdown/bright.css"
        copy_file "../media/stylesheets/skins/markitup/pygments.css", "public/stylesheets/markitup/skins/markdown/pygments.css"
        copy_file "../media/stylesheets/skins/markitup/shiny.css",    "public/stylesheets/markitup/skins/markdown/shiny.css"
      end
    end

  end
end