# delivr

## Bootstrap app

`cd config && cp database.yml{.sample,} && cp secrets.yml{.sample,} && cd -`

## Regenerate database

`rake db:drop; rake db:create; rake db:migrate; rake db:populate`
