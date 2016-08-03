Gem::Specification.new do |s|
  s.name = 'logstash-filter-qs'
  s.version = '0.1.0'
  s.licenses = ['MIT']
  s.summary = "Parses a query string into a hash."
  s.description = "This gem is a logstash plugin required to be installed on top of the Logstash core pipeline using $LS_HOME/bin/plugin install gemname. This gem is not a stand-alone program"
  s.authors = ["Zentrick nv"]
  s.email = 'hello@zentrick.com'
  s.homepage = "https://www.zentrick.com/"
  s.require_paths = ["lib"]

  # Files
  s.files = Dir['lib/**/*','spec/**/*','vendor/**/*','*.gemspec','*.md','Gemfile','LICENSE']
   # Tests
  s.test_files = s.files.grep(%r{^(test|spec|features)/})

  # Special flag to let us know this is actually a logstash plugin
  s.metadata = { "logstash_plugin" => "true", "logstash_group" => "filter" }

  # Gem dependencies
  s.add_runtime_dependency "logstash-core", ">= 2.0.0.beta2", "< 3.0.0"
  s.add_development_dependency 'logstash-devutils'
end
