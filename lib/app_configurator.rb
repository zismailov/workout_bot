require 'yaml'

class AppConfigurator
  def token
    @token ||= YAML.safe_load(IO.read('config/secrets.yml'))['telegram_bot_token']
  end
end
