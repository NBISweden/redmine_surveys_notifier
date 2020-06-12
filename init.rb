
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

  survey_html = " <h1>To whom it may concern</h1><br>
    <p>
      Thank you for using NBIS support recently. To help us improve we kindly ask that you fill out a short,
      ~10 minute, anonymous survey.<br>
      Survey link: <a>https://nbis.typeform.com/to/dBChMV</a><br>
    </p>

    <p>Thanks in advance and have a nice day!</p>
  "
  settings :default => {'survey_html' => survey_html, 'surveys_sent' => "0" },
            :partial => 'settings/plugin_redmine_surveys_notifier_settings'

end
