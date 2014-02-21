# NOTE: only doing this in development as some production environments (Heroku)
# NOTE: are sensitive to local FS writes, and besides -- it's just not proper
# NOTE: to have a dev-mode tool do its thing in production.
if(Rails.env.development?)
  # Annotate models
  task :annotate do
    puts 'Annotating models...'
    system 'bundle exec annotate'
  end

  # Run annotate task after db:migrate
  #  and db:rollback tasks
  Rake::Task['db:migrate'].enhance do
    Rake::Task['annotate'].invoke
  end

  Rake::Task['db:rollback'].enhance do
    Rake::Task['annotate'].invoke
  end
end
