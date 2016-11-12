# OmniAuth Todoist

This is not official OmniAuth strategy for authenticating to Todoist. To
use it, you'll need to sign up for an OAuth2 Application ID and Secret
on the [Todoist App Management Console](https://todoist.com/app_console).

## Basic Usage

    use OmniAuth::Builder do
      provider :todoist, ENV['TODOIST_CLIENT_ID'], ENV['TODOIST_CLIENT_SECRET']
    end

## Scopes

Todoist API lets you set scopes to provide granular access to different types of data:

    use OmniAuth::Builder do
      provider :todoist, ENV['TODOIST_CLIENT_ID'], ENV['TODOIST_CLIENT_SECRET'], scope: "data:read,data:delete"
    end

By default, this strategy uses `data:read` scope. More info on [Scopes](https://developer.todoist.com/?shell#oauth).
