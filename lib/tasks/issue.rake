require 'json'
require 'octokit'

namespace :issue do

  desc "import task"

  task :run => :environment do

    p "start"

    p "end"

    access_token = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
    client = Octokit::Client.new(:access_token => access_token)
    repo = 'toripiyo/xxxxx'

    # read json file
    json_file_name = 'sample.json'
    file = File.open(json_file_name)
    json_data = JSON.load(file)

    # create title, body, label
    title = 'Hello, Ruby'
    body = <<~EOF
      **#{json_data['message']}**
      - status code is #{json_data['status']}
    EOF

    labels = "Greeting Messsage"

    # create github issue
    client.create_issue(repo, title, body, {labels: labels})

  end

end
