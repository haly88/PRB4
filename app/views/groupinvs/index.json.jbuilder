json.array!(@groupinvs) do |groupinv|
  json.extract! groupinv, :id, :nombre, :personasMin, :personasMax, :montoIngreso, :montoMensual, :esAdministrador
  json.url groupinv_url(groupinv, format: :json)
end
