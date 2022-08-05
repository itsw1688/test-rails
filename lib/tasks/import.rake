
namespace :import do

  desc "import task"

  task :run => :environment do

    p "start"

    res = <<~EOF
{
  "incident": {
    "id": "",
    "type": "incident",
    "title": "Factbook data Import Failure.",
    "summary": "",
    "self": "",
    "html_url": "",
    "incident_number": 1234,
    "created_at": "2022-08-04T21:38:23Z",
    "status": "triggered",
    "incident_key": "",
    "service": {
      "id": "",
      "type": "",
      "summary": "LSH-FACTBOOK",
      "self": "",
      "html_url": ""
    },
    "priority": {
      "id": "",
      "type": "",
      "summary": "",
      "self": "",
      "html_url": ""
    },
    "assigned_via": "escalation_policy",
    "assignments": [
      {
        "at": "2022-08-04T21:38:23Z",
        "assignee": {
	      "id": "",
	      "type": "",
	      "summary": "",
	      "self": "",
	      "html_url": ""
        }
      }
    ],
    "escalation_policy": {
      "id": "",
      "type": "",
      "summary": "",
      "self": "",
      "html_url": ""
    },
    "teams": [
      {
        "id": "",
        "type": "factbook develop",
        "summary": "Engineering",
        "self": "",
        "html_url": ""
      }
    ],
    "urgency": "high"
  }

}
EOF

    Rails.logger.debug( res )
    #res = '{"err_code":12345678}'
    #logger.debug( res )

    p "end"

  end

end
