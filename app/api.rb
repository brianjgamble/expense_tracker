require 'roda'

module ExpenseTracker
  class API < Roda
    plugin :json

    route do |r|
      r.on 'expenses' do
        r.post do
          {expense_id: 42}
        end

        r.get String do |date|
          []
        end
      end
    end
  end
end
