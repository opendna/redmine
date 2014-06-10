rakecmd = 'rake'
if !File.exist?("/usr/bin/rake") then
  rakecmd = 'rake19'
end

if !File.exist?("#{shared_path}/config/secrettoken.rb") then
  run "bundle install"
  run "#{rakecmd} generatesecrettoken"
  run "mv #{releasepath}/config/initializers/secrettoken.rb #{shared_path}/config/secrettoken.rb"
end

run "ln -s #{shared_path}/config/secrettoken.rb #{releasepath}/config/initializers/secrettoken.rb"
