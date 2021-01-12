Rake::Task["assets:precompile"].clear
   namespace :assets do
     task 'precompile' do
     puts "Not pre-compiling assets; rake task has been re-defined in lib/task/assets.rake"
   end
end
