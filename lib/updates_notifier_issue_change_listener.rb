require 'rubygems'

class UpdatesNotifierIssueChangeListener < Redmine::Hook::Listener
  def controller_issues_bulk_edit_after_save(context={})
    controller_issues_edit_after_save(context)
  end
  def controller_issues_edit_after_save(context={})

      if context[:issue] and context[:journal]
        SurveysNotifier.send_issue_update(User.current, context[:issue].id, context[:journal])
      end

  end
end
