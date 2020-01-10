#!/bin/bash

event=play
branch=37_release

post_run() {

  #gh_dispatch_url=https://api.github.com/repos/munderseth/play/dispatches
  gh_dispatch_url=https://api.github.com/repos/munderseth/play/dispatches


  curl -X POST $gh_dispatch_url \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/vnd.github.everest-preview+json' \
  -H "Authorization: token $GH_S2_TESTSPACE_TOKEN" \
  -d "{
    \"event_type\": \"$event\",
    \"client_payload\": {
      \"gh-org\"      : \"$GH_ORG\",
      \"gh-token\"    : \"$GH_TOKEN\",
      \"gh-repo\"     : \"testRepo\",
      \"ts-org\"      : \"$TS_ORG\",
      \"ts-user\"     : \"$TS_USER\",
      \"ts-password\" : \"$TS_PASSWORD\"
    }
  }"

}

post_run