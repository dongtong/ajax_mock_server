json.array!(@namespaces) do |namespace|
  json.extract! namespace, :id, :url_key, :url_address, :status
  json.url namespace_url(namespace, format: :json)
end
