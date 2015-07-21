require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'


Cucumber::Rake::Task.new(:submit_incomplete_survey) do |t|
	t.cucumber_opts = "--tags=@submit_incomplete_survey"
end

Cucumber::Rake::Task.new(:save_survey) do |t|
	t.cucumber_opts = "--tags=@save_survey"
end

Cucumber::Rake::Task.new(:submit_survey) do |t|
	t.cucumber_opts = "--tags=@submit_survey"
end

Cucumber::Rake::Task.new(:cancel_survey) do |t|
	t.cucumber_opts = "--tags=@cancel_survey"
end

Cucumber::Rake::Task.new(:submit_cancel_survey) do |t|
	t.cucumber_opts = "--tags=@submit_cancel_survey"
end

Cucumber::Rake::Task.new(:invalid_token_survey) do |t|
	t.cucumber_opts = "--tags=@invalid_token_survey"
end




