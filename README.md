# drone-build
Trigger build for other repos.

Use build instead of restart, so that env variables can be updated.

## Trigger

```yaml
name: trigger
image: anandzhang/drone-build
pull: if-not-exists
settings:
  server: https://drone.example.com
  token:
    from_secret: drone_token
  repo: namespace/name
  branch: master
  param: DEMO=testtest
```

## Build

If this build is triggered multiple times,  `REPO`、`MESSAGE` will also be updated.

Env variables that will be passed automatically:

`UPSTREAM_REPO` `UPSTREAM_COMMIT_MESSAGE` `UPSTREAM_COMMIT_AUTHOR`

```yaml
name: telegram message
image: appleboy/drone-telegram
pull: if-not-exists
settings:
  token:
    from_secret: tg_bot
  to: -0000000
  message_file: template/telegram_message.tpl
  template_vars:
    repo: "${REPO=${DRONE_REPO}}"
    message: "${MESSAGE=${UPSTREAM_COMMIT_MESSAGE}}"
when:
  status:
    - success
    - failure
```

