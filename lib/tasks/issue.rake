require 'json'
require 'octokit'

namespace :issue do

  desc "import task"

  task :run => :environment do

    p "start"

    access_token = ENV['GITHUB_TOKEN']
    client = Octokit::Client.new(:access_token => access_token)
    repo = 'itsw1688/test-rails'

    # read json file
    #json_file_name = 'sample.json'
    #file = File.open(json_file_name)
    #json_data = JSON.load(file)

    # create title, body, label
    title = 'DATA IMPORT ERROR'
    #body = <<~EOF
    #  **#{json_data['message']}**
    #  - status code is #{json_data['status']}
    #EOF
    body = 'test'
    labels = "Alert Messsage"

    # create github issue
    client.create_issue(repo, title, body, {labels: labels})

    p "end

  end

end
