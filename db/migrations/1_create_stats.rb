Sequel.migration do
  change do
    create_table(:stats) do
      primary_key :id
      DateTime :time
      String :uptime
      String :loadavg
      String :free
    end
  end
end