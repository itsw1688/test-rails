
namespace :import do

  desc "import task"

  task :run => :environment do

    p "start"

    err_code = 0
    err_msg = ""

    sdate = Time.zone.now

    begin

      NG

    rescue => e
      err_code = 901
      err_msg = e
    end

    edate = Time.zone.now

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
    "created_at": "#{sdate.to_s}",
    "status": "triggered",
    "incident_key": "",
    "service": {
      "id": "",
      "type": "",
      "summary": "LSH-FACTBOOK",
      "self": "",
      "html_url": ""
    },
    "reason": "{ err_code: #{err_code}, err_msg: #{err_msg} }",
    "assigned_via": "escalation_policy",
    "assignments": [
      {
        "at": "#{sdate.to_s}",
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

    p "end"

  end

end
