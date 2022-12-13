# Discord.Tools

Discord tools is a Ruby on Rails and DiscordRB API made by Kyle Meyer. 

The front-end React project by Kaiqi Liao can be found [here](https://github.com/Jimmyboei/discord-panel-frontend)


I decided to take the Ruby on Rails side of the application as I have a good amount of experience with it and enjoy using it out of class, and I enjoy discord bots so I thought of an original idea for a project. Instead of the bot using commands in discord this application executes commands and views data from a web panel.

## Requirements
- Ruby 2.7.5
- Rails 6.0.3+


## Installation

Use [bundler](https://bundler.io) to install the app reqs.

```bash
bundle install
```

Set-up the Postgres database (this will just drop, create and migrate a new DB)

```bash
rake db:reset
```

Reset the schema, deleted migrations db:reset may not work

```bash
db:migrate:reset
```

## Usage

```
client.http file will show all the routes available for the application.
```

## License

[MIT](https://choosealicense.com/licenses/mit/)
