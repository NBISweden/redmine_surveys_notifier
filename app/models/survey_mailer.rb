class SurveyMailer < Mailer

  def survey_email(pi_name, pi_email, survey_html)
    @pi_name=pi_name
    @survey_html=survey_html
    nbis_img = File.join(File.dirname(File.dirname(File.dirname(__FILE__))), "images/NBIS.png")
    attachments.inline['nbis.png'] = File.read(nbis_img)
    ::Rails.logger.info(survey_html)
    mail :to => pi_email, :subject => 'NBIS Survey'
  end

end
