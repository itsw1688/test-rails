export RAILS_ENV=development
env
err=$(cat log/${RAILS_ENV}.log | jq .incident)
if [ "$err" != "null" ]; then
  rails issue:run
fi

