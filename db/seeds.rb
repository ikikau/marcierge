
require 'csv'


ActiveRecord::Base.connection.execute 'TRUNCATE master_prefectures'
CSV.foreach('db/csv/master_prefectures.csv') do |row|
  MasterPrefecture.create(
    id:   row[0],
    name: row[1],
    sort: row[2]
  )
end

ActiveRecord::Base.connection.execute 'TRUNCATE master_areas'
CSV.foreach('db/csv/master_areas.csv') do |row|
  MasterArea.create(
    id:   row[0],
    name: row[1],
    sort: row[2]
  )
end

