json.array!(@plays) do |play|
  json.extract! play, :id, :title, :summary, :promotional_video, :duration, :end_date
  json.url play_url(play, format: :json)
end
