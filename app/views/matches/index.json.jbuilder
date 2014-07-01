json.array!(@matches) do |match|
  json.extract! match, :id, :host, :host_score, :guest, :guest_score, :day, :voted, :rating
  json.url match_url(match, format: :json)
end
