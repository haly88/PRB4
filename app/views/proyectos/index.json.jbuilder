json.array!(@proyectos) do |proyecto|
  json.extract! proyecto, :id, :nombre, :cuota_inicial, :cuota_mensual, :usuario_id
  json.url proyecto_url(proyecto, format: :json)
end
