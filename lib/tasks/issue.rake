require 'json'
require 'octokit'

namespace :issue do

  desc "create github issue task"

  task :run => :environment do

    p "start"

    access_token = ENV['GITHUB_TOKEN']
    repo = ENV['GITHUB_REPOSITORY']
    format_file = "lib/format/issue_format.txt"
    data_file = "log/development.log"

    client = Octokit::Client.new(:access_token => access_token)

    # read format
    file = File.open(format_file)
    format_data = File.read(file)

    # read json file
    file = File.open(data_file)
    json_data = JSON.load(file)

    # create title, body, label
    title = 'Data Import Failure'
    body = format( format_data,
      title: json_data['incident']['title'],
      created_at: json_data['incident']['created_at'],
      service: json_data['incident']['service']['summary'],
      urgency: json_data['urgency']
    )
    #${GITHUB_SERVER_URL}/${GITHUB_REPOSITORY}/actions/runs/${GITHUB_RUN_ID}
    body = body + ENV['GITHUB_SERVER_URL'] + "/" + ENV['GITHUB_REPOSITORY'] + "/actions/runs/" + ENV['GITHUB_RUN_ID']
    #body = format_file
    labels = "Alert Messsage"

    # create github issue
    client.create_issue(repo, title, body, {labels: labels})

    p "end"

  end

end
