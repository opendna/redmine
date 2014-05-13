rakecmd = 'rake'
if !File.exist?("/usr/bin/rake") then
  rakecmd = 'rake19'
end

if !File.exist?("#{sharedpath}/config/secrettoken.rb") then
  run "bundle install"
  run "#{rakecmd} generatesecrettoken"
  run "mv #{releasepath}/config/initializers/secrettoken.rb #{sharedpath}/config/secrettoken.rb"
end

run "ln -s #{sharedpath}/config/secrettoken.rb #{releasepath}/config/initializers/secrettoken.rb"
