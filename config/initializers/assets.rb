# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.precompile += %w( glyphicons-halflings.png )
Rails.application.config.assets.precompile += %w( glyphicons-halflings-white.png )
Rails.application.config.autoload_paths += %w(#{config.root}/app/models/ckeditor)
Rails.application.config.assets.precompile += Ckeditor.assets
Rails.application.config.assets.precompile += %w( ckeditor/* )

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
