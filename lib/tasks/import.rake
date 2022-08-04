require "custom_logger"

namespace :import do

  desc "import task"

  task :run => :environment do

    p "start"

    p "end"

    res = '{"err_code":12345678}'

    Rails.logger.debug( res )

    #Rails.application.config.result_logger.debug('{"err_code":123}')
    #puts '{"err_code":100}'

  end

end
