class SurveyMailer < Mailer

  def survey_email(pi_name, pi_email, survey_html)
    @pi_name=pi_name
    @survey_html=survey_html

    ::Rails.logger.info(survey_html)
    mail :to => pi_email,
      :subject => 'NBIS Survey'

  end
end
