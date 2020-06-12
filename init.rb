
require 'redmine'

::Rails.logger.info 'Starting Surveys Notifier plugin...'

require_dependency 'updates_notifier_issue_change_listener'


Redmine::Plugin.register :redmine_surveys_notifier do
  name 'Redmine Surveys Notifier plugin'
  author 'Airen Zaldivar'
  description 'This plugin allows to send a survey when a support issue is closed.'
  version '0.0.1'
  url 'https://github.com/airenzp/redmine_surveys_notifier'
  author_url 'https://nbis.se/about/staff/airen-zaldivar/'

  survey_html = " <p>
     Thank you for using NBIS support recently. To help us improve we kindly ask that you fill out a short,
     ~10 minute, anonymous survey.
     Survey link: <a><%= @survey_url %></a><br><br>
    If someone else was the main contact with NBIS for your project, please feel free to get their input on any question where applicable.
   </p>

   <p>Thanks in advance and have a nice day!</p>
  "
  default_settings = {'survey_html' => survey_html}


  settings :default => default_settings, :partial => 'settings/plugin_redmine_surveys_notifier_settings'

end
