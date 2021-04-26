require 'rubygems'
require 'json'

class SurveysNotifier < ActiveRecord::Base

  def self.send_issue_update(user, issueId, journal)
    issue = Issue.find(issueId)

    journal.details.each do |j|
      if j.prop_key == "status_id" and issue.status.is_closed then
        self.manage_survey(issue)
      end
    end
  end


private

  def self.survey_html()
    return Setting.plugin_redmine_surveys_notifier['survey_html']
  end

  def self.manage_survey(issue)
    ::Rails.logger.info("Sending survey... " )

    send = false
    pi_name = ""
    pi_email = ""

    issue.custom_field_values.each do |field|
      ::Rails.logger.info("custom field " + field.custom_field.name + " " + field.value)
      if field.custom_field.name == 'Principal Investigator' then
        pi_name = field.value
      elsif field.custom_field.name == 'PI e-mail' then
        pi_email = field.value
      elsif field.custom_field.name == 'Send survey when closed' then
        send = field.true?
      end
    end

    if send then
      SurveyMailer.survey_email(pi_name, pi_email, self.survey_html).deliver
    end
  end

end
