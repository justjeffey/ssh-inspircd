# ssh-inspircd

ssh-inspircd is an irc server that uses ssh access with weechat.

A username and password must be specified as environment variables, this is the admin account.

You will be prompted to change the password on first login.

By defaults it connects to the #general channel.

## Usage

docker
```bash
$ docker run --name ircd -p 6667:6667 inspircd/inspircd-docker
```

docker-compose
```yaml
version: '3'
services:
  irc:
    build: justjeffey/ssh-inspircd
    ports:
      - "22:22"
    environment:
      - TZ=Pacific/Auckland
      - USERNAME=user
      - PASSWORD=pass
```

## Managing Users

Users can be created and deleted from within weechat by the admin user.

Add User
```bash
/add username password
```

Delete User
```bash
/del username
```