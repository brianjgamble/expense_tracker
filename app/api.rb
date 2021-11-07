require 'roda'

module ExpenseTracker
  class API < Roda
    plugin :json

    def self.ledger=(ledger)
      @@ledger = ledger
    end

    route do |r|
      r.on 'expenses' do
        r.post do
          expense = JSON.parse(request.body.read)
          result = @@ledger.record(expense)
          {expense_id: result.expense_id}
        end

        r.get String do |date|
          []
        end
      end
    end
  end
end
