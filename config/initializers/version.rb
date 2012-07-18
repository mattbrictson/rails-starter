module RailsStarter
  VERSION = `git describe --always --tag`.chomp
  VERSION_DATE = Date.parse(*`git log -1 --format="%ad" --date=short`) rescue nil
end
