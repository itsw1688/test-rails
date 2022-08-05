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

    # get workflow url
    workflow_url = ENV['GITHUB_SERVER_URL'] + "/" + ENV['GITHUB_REPOSITORY'] + "/actions/runs/" + ENV['GITHUB_RUN_ID']

    # create title, body, label
    title = 'Data Import Failure'
    body = format( format_data,
      title: json_data['incident']['title'],
      urgency: json_data['incident']['urgency'],
      service: json_data['incident']['service']['summary'],
      created_at: json_data['incident']['created_at'],
      reason: json_data['incident']['reason'],
      workflow_url: workflow_url
    )
    #body = format_file
    labels = "Alert Messsage"

    # create github issue
    client.create_issue(repo, title, body, {labels: labels})

    p "end"

  end

end
