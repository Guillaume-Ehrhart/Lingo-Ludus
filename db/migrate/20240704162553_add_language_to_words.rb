class AddLanguageToWords < ActiveRecord::Migration[7.1]
  def change
    add_reference :words, :language, null: true, foreign_key: true
  end
end
