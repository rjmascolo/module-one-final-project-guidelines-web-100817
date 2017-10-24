require 'bundler'

Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'
require_all 'apps'
require_all 'db'

Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}
