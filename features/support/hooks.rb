Before do |scenario|
  @page = PageHelper.new
  @page.load
  puts "Cenário em execução: " + scenario.name
end

After do |scenario|
  sufix = ("FALHOU !" if scenario.failed?) || "executado com Sucesso !"
  puts "Cenário: #{scenario.name} #{sufix}"
end

After do |scenario|
  #tira uma print
  file_name = scenario.name.tr(" ", "_").upcase
  sufix = ("FALHOU" if scenario.failed?) || "PASSOU"
  shot = "logs/shots/#{file_name}_#{sufix}.png"
  page.switch_to_window(windows.last)
  puts "Tirando print da tela"
  page.save_screenshot(shot)
  embed(shot, "image/png", "Clique aqui para ver o print da tela")
  Capybara.reset_sessions!
end
