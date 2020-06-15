# redmine_surveys_notifier
This plugin allows to send a survey when a support issue from the National Bioinformatics Support project is closed. All submissions from the forms on the NBIS home page become support issues in this project. Surveys
are sent to the Principal Investigator if the user decides it.
In order to install this plugin please

1. Add the custom field: "Send survey when closed" to  the redmine issues. The custom field should be a checkbox with
default value "Yes". It should be used as a filter and visible to the users from the Manager role. For the project please select
National Bioinformatics support and add it to the Support Tracker. See ![here](images/custom-field-survey.png")

1. Deploy the plugin in redmine as described at www.redmine.org/wiki/redmine/Plugins :

1. Copy the plugin directory into #{RAILS_ROOT}/plugins. If you are downloading the plugin directly from GitHub, you can do so by changing into your plugin directory and running the command git clone https://github.com/NBISweden/redmine_surveys_notifier.git

3. Restart Redmine

You should now be able to see the plugin list in Administration -> Plugins and configure the template for the survey mail, if you want it!
