namespace :import do

  desc "import task"

  task :run => :environment do

    logger.info  'LOGGER TEST >>> info'

    #p "start"

    #p "end"

    puts '{"err_code":100}'

  end

end
