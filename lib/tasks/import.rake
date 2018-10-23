require 'json'
 
namespace :import do
  desc "Import data from JSON file"
  task datajson: :environment do
	integrations = JSON.parse(File.read('./lib/tasks/data.json'))
	integrations.each{|integration_json|
		tag_ids = []
		integration_json["tags"].each{|name|
			tag = Tag.find_by(name: name)
			tag = Tag.create({name: name}) if tag.nil?
			tag_ids << tag.id
		}
		integration = Integration.new
		integration.name = integration_json["name"];
		integration.description = integration_json["description"];
		integration.links = integration_json["links"].join("\n");
		integration.tag_ids = tag_ids
		integration.save
	}

  end
end
