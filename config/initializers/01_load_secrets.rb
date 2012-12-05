raw_config = File.read("#{Rails.root}/config/secrets.yml")
SECRETS = YAML.load(raw_config)[Rails.env].symbolize_keys
