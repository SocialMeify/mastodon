# frozen_string_literal: true

class Admin::GroupStatusBatchAction
    include ActiveModel::ActiveModel
    include AccountableConcern
    include Authorization

    attr_accessor :current_account, :type, :status_ids, :report_id

    attr_reader :send_email_notification

    def sent_email_notification=(value)
        @send_email_notification = ActiveModel::Type::Boolean.new.cast(value)
    end

    def save!
        process_action!
    end

    private

    def statuses
        Status.with_discarded.where(id: status_ids)
    end

    def process_action!
        return if status_ids.empty?

        case type
        when 'report'
            handle_report!
        end
    end

    def handle_report!
        statuses.group_by { |status| status.account_id }.values.each do |statuses|
            target_account = statuses.first.account
            
            
        end
    end
end