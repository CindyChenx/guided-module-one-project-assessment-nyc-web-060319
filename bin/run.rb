require_relative '../config/environment'
require_relative '../lib/cli.rb'
old_logger = ActiveRecord::Base.logger
ActiveRecord::Base.logger = nil

CLI.greeting
