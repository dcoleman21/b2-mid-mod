class AddSurgeryToDoctors < ActiveRecord::Migration[5.2]
  def change
    add_reference :doctors, :surgery, foreign_key: true
  end
end
