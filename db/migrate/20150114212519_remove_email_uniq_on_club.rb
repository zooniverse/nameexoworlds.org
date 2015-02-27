# class RemoveEmailUniqOnClub < ActiveRecord::Migration
#   def up
#     sql = 'DROP INDEX index_clubs_on_email'
#     sql << ' ON clubs' if Rails.env == 'production' # Heroku pg
#     ActiveRecord::Base.connection.execute(sql)
#   end
#
# end
