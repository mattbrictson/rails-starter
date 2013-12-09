Rails.application.config.version = `git describe --always --tag`.chomp
Rails.application.config.version_date = \
  Date.parse(`git log -1 --format="%ad" --date=short`)\
  rescue Time.now.to_date
