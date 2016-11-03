require 'rake/clean'
require 'rubygems'
require 'rubygems/package_task'
require 'rdoc/task'
require 'cucumber'
require 'cucumber/rake/task'

########################################
task :consulter_compte_test do
     sh "rake test TEST=test/consulter_compte_test.rb"     
end

task :creer_compte_test do
     sh "rake test TEST=test/creer_compte_test.rb"     
end

task :modifier_compte_test do
     sh "rake test TEST=test/modifier_compte_test.rb"     
end

task :supprimer_compte_test do
     sh "rake test TEST=test/supprimer_compte_test.rb"     
end

task :retirer_argent_test do
     sh "rake test TEST=test/retirer_argent_test.rb"     
end

task :deposer_argent_test do
     sh "rake test TEST=test/deposer_argent_test.rb"     
end

task :acceptation_consulter do
     sh "rake test_acceptation TEST=test_acceptation/consulter_test.rb"
end

task :acceptation_creer do
     sh "rake test_acceptation TEST=test_acceptation/creer_compte_test.rb"
end

task :acceptation_modifier do
     sh "rake test_acceptation TEST=test_acceptation/modifier_compte_test.rb"
end

task :acceptation_supprimer do
     sh "rake test_acceptation TEST=test_acceptation/supprimer_compte_test.rb"
end

task :acceptation_deposer do
     sh "rake test_acceptation TEST=test_acceptation/deposer_argent_test.rb"
end

task :acceptation_retirer do
     sh "rake test_acceptation TEST=test_acceptation/retirer_argent_test.rb"
end

#############################################

Rake::RDocTask.new do |rd|
  rd.main = "README.rdoc"
  rd.rdoc_files.include("README.rdoc","lib/**/*.rb","bin/**/*")
  rd.title = 'Your application title'
end

spec = eval(File.read('GAB.gemspec'))

Gem::PackageTask.new(spec) do |pkg|
end
CUKE_RESULTS = 'results.html'
CLEAN << CUKE_RESULTS
desc 'Run features'
Cucumber::Rake::Task.new(:features) do |t|
  opts = "features --format html -o #{CUKE_RESULTS} --format progress -x"
  opts += " --tags #{ENV['TAGS']}" if ENV['TAGS']
  t.cucumber_opts =  opts
  t.fork = false
end

desc 'Run features tagged as work-in-progress (@wip)'
Cucumber::Rake::Task.new('features:wip') do |t|
  tag_opts = ' --tags ~@pending'
  tag_opts = ' --tags @wip'
  t.cucumber_opts = "features --format html -o #{CUKE_RESULTS} --format pretty -x -s#{tag_opts}"
  t.fork = false
end

task :cucumber => :features
task 'cucumber:wip' => 'features:wip'
task :wip => 'features:wip'
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/*_test.rb']
end

Rake::TestTask.new(:test_acceptation) do |t|
  t.libs << "test_acceptation"
  t.test_files = FileList['test_acceptation/*_test.rb']
end

task :default => [:test,:features]
