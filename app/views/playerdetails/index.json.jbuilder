json.set! :data do
  json.array! @playerdetails do |playerdetail|
    json.partial! 'playerdetails/playerdetail', playerdetail: playerdetail
    json.url  "
              #{link_to 'Show', playerdetail }
              #{link_to 'Edit', edit_playerdetail_path(playerdetail)}
              #{link_to 'Destroy', playerdetail, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end