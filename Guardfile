# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'rspec', :cli => "--fail-fast" do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }

  # Rails example
  watch(%r{^app/(.+)\.rb$})                           { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^app/(.*)(\.erb|\.haml)$})                 { |m| "spec/#{m[1]}#{m[2]}_spec.rb" }
  watch(%r{^spec/factories/.+\.rb$})                  { "spec" }
  watch(%r{^spec/support/.+\.rb$})                    { "spec" }

  # Capybara features specs
  watch('config/routes.rb')                           { "spec/features" }
  watch('app/controllers/application_controller.rb')  { "spec/features" }
  watch(%r{^app/controllers/(.+)_controller\.rb$})    { |m| "spec/features/#{m[1]}_spec.rb" }
  watch(%r{^app/views/(.+)/.*\.(erb|haml)$})          { |m| "spec/features/#{m[1]}_spec.rb" }
end

# Run just the livereload monitor with: `guard -P livereload`
guard 'livereload' do
  watch(%r{app/views/.+\.(erb|haml|slim)$})
  watch(%r{app/helpers/.+\.rb})
  watch(%r{public/.+\.(css|js|html)})
  watch(%r{config/locales/.+\.yml})
  # Rails Assets Pipeline
  watch(%r{(app|lib|vendor)(/assets/\w+/(.+\.(css|js))).*}) { |m| "/assets/#{m[3]}" }
end
