local status_ok, metals = pcall(require, "metals")
if not status_ok then
  return
end

metals.initialize_or_attach(ScalaMetals)
