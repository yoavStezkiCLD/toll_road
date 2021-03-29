# frozen_string_literal: true

class EventService
  class << self
    def events_by_date(from, to, joins = [])
      Event
        .where('events.account_id = :account_id
                AND events.created_at >= :from
                AND events.created_at <= :to',
               {
                 account_id: Current.account.id,
                 from: from,
                 to: to
               })
        .joins(joins)
    end
  end
end
