require 'grit'

module Jekyll
  class LastEditTag < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
    end

    def render(context)
      # First, load the repo
      repo_root = File.join(Dir.getwd)
      repo = Grit::Repo.new(repo_root)

      # Figure out what file we're looking at here
      page_path = context.environments.first["page"]["path"]

      if (page_path)
        # Get the date for the last commit on the file
        last_edit_date = repo.log('master', page_path, max_count: 1)[0].date

        if (last_edit_date)
          # Get the ISO formatted date
          datetime = last_edit_date.iso8601()
          # Get the human-readable date in this format: January 4, 2014
          nice_date = last_edit_date.strftime('%B %e, %Y')
          return "<time class='date' datetime='#{datetime}'>#{nice_date}</time>"
        end
      end

      # Failover: couldn't get the date
      return ""
    end
  end
end

Liquid::Template.register_tag('last_edit_datetime', Jekyll::LastEditTag)
