if Rails.env.development?
  require 'heroku_san'

  class MyStrategy < HerokuSan::Deploy::Base
    def deploy
      super
    end
  end

  HerokuSan.project = HerokuSan::Project.new(Rails.root.join("config","heroku.yml"), :deploy => MyStrategy)
end

STAGES = %w(staging production)
def create_and_push(stage)
  auto_tag = AutoTagger::Base.new(stages: STAGES, stage: stage, verbose: true, push_refs: false, refs_to_keep: 100)
  tag = auto_tag.create_ref(auto_tag.last_ref_from_previous_stage.try(:sha))
  sh "git push origin #{tag.name}"
  auto_tag.delete_locally
  auto_tag.delete_on_remote
end

task :before_deploy do
  sh "git fetch --tags"
end

task :after_deploy do
  each_heroku_app do |stage|
    create_and_push(stage.name)
    stage.migrate
  end
end

namespace :autotag do
  desc "Create an autotag for stage, default: #{STAGES.first}"
  task :create, :stage do |t, args|
    create_and_push(args[:stage] || STAGES.first)
  end
end
