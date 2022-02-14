json.set! :data do
  json.array! @annocements do |annocement|
    json.partial! 'annocements/annocement', annocement: annocement
    json.url  "
              #{link_to 'Show', annocement }
              #{link_to 'Edit', edit_annocement_path(annocement)}
              #{link_to 'Destroy', annocement, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end