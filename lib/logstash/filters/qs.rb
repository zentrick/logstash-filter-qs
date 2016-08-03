# encoding: utf-8
require "logstash/filters/base"
require "logstash/namespace"
require "cgi"

class LogStash::Filters::Qs < LogStash::Filters::Base
  config_name "qs"

  config :source, :validate => :string, :required => true

  config :destination, :validate => :string, :default => "query"

  config :multi, :validate => :boolean, :default => false

  config :match, :validate => :string

  public
  def register
    unless @match.nil?
      @re_match = Regexp.new @match
    end
  end

  public
  def filter(event)
    value = event[@source]

    begin
      query = CGI::parse(value)
    rescue Exception => msg
      query = { }
    end

    unless @multi
      query.each { |key, value| query[key] = value[0] }
    end

    unless @re_match.nil?
      query.keep_if { |key, value| @re_match.match(key) }
    end

    event[@destination] = query

    filter_matched(event)
  end
end
