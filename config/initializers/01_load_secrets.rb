yml_file = "#{Rails.root}/config/secrets.yml"

yml_secrets = if File.exist?(yml_file)
  YAML.load_file(yml_file)[Rails.env].with_indifferent_access
else
  {}
end

SECRETS = yml_secrets.merge(ENV)
