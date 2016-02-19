json.array!(@measures) do |measure|
  json.extract! measure, :id, :value, :metric
  json.url measure_url(measure, format: :json)
end
