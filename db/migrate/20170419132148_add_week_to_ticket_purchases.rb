class AddWeekToTicketPurchases < ActiveRecord::Migration
  def change
    add_column :ticket_purchases, :week, :integer

    TicketPurchase.reset_column_information
    TicketPurchase.find_each do |purchase|
      purchase.week = purchase.created_at.strftime('%W')
      purchase.save!
    end
  end
end
