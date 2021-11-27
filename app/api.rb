require 'roda'
require_relative 'ledger'

module ExpenseTracker
  class API < Roda
    plugin :json

    def ledger
      opts[:ledger]
    end

    route do |r|
      r.on 'expenses' do
        r.post do
          expense = JSON.parse(request.body.read)
          result = ledger.record(expense)

          if result.success?
            {expense_id: result.expense_id}
          else
            response.status = 422
            {'error' => result.error_message}
          end
        end

        r.get String do |date|
          []
        end
      end
    end
  end
end
