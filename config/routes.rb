Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :integrations
    resources :tags
  end
	
  resources :integrations

  root 'integrations#index'
end



# Unofficial List of Intercom Integrations
# Official Intercom integrations / guides from their integration list / integration docs
# Got an integration to add? File an issue or make a pull request
# Tag
#   Official      3rd party/Community      iOS      Android      Cordova      API      Bulk      CSV      Clearbit      Conversation      Data      Github      Google Analytics     How To      Import      Jira      Library      Mobile      Notification      OAuth      Phone      Python      SDK      SMS/Text      Statistics/Reporting      Test App     Transcript      Twilio      UTM      Unsubscribe      Web      Webhooks    
# Search
# Search results : 6
