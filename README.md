## Intro
This Jekyll plugin adds a Liquid tag, `last_edit_datetime`, which will be replaced by an HTML5 `<time>` tag containing the last date/time that the file was committed to git. This is probably more useful for regular pages, rather than posts, since posts are typically date stamped anyway.

## Requirements
This plugin uses the [Grit](https://github.com/mojombo/grit) gem to access the git repo. To install Grit:

    gem install grit

## Usage
* If you don't already have a `_plugins` directory at the root of your Jekyll site, create one.
* Place `lastedit.rb` in the `_plugins` directory.
* In your layout file, use the `{% last_edit_datetime %}` tag. For example:

> This page was last updated {% last_edit_datetime %}.

The date is displayed in a long format, eg: January 4, 2014

## Note
This plugin will **not** work with Jekyll sites hosted on Github Pages, unless you are building it locally and committing the `_site` directory. Github Pages has a predetermined list of Jekyll plugins that they will process. Plugins in the `_plugins` directory are ignored when Github processes Jekyll on a repo.
