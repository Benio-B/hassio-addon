# Home Assistant Add-on: Jellystat

Jellystat is a free and open source Statistics App for Jellyfin!

## Configuration

You need to install PostgreSQL, I suggest you the best add-on from [AxelBelgium](https://github.com/alexbelgium/hassio-addons/tree/master/postgres).

### Options

- `POSTGRES_USER`: The username for the user to connect to your PostgreSQL server. By default, it's `postgres``.

- `POSTGRES_PASSWORD`: The password to connect to your PostgreSQL server.

- `POSTGRES_PORT`: The port your PostgreSQL server is listening on. By default, it's `5432`.

- `POSTGRES_IP`: The hostname of your PostgreSQL server. It can be an IP or URL, by default it's `homeassistant.local``.

- `JWT_SECRET`: JWT Key to be used to encrypt JWT tokens for authentication

Remember to restart the add-on when the configuration is changed.

## Additional Information

[Docker](https://hub.docker.com/r/cyfershepard/jellystat)
[Jellystat](https://github.com/CyferShepard/Jellystat)
[Releases](https://github.com/CyferShepard/Jellystat/releases)
[Add-on](https://github.com/Benio-B/hassio-addon/tree/main/jellystat)