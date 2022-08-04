namespace :import do

  desc "import task"

  task :run => :environment do

    puts "start"

    puts "end"

    return '{"err_code":100}'

  end

end
