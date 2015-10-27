defmodule Lista do

  IO.puts "Lista: loaded."
  def start do
    map=%{}
    Map.put(map,:alumnos,[])
    Map.put(map,:profesores,[])
    Map.put(map,:mensajes,[])
    spawn_link(fn -> loop(%{}) end)
  end

  def loop(map) do
    alumnos=Map.get(map,:alumnos)
    profesores=Map.get(map,:profesores)
    mensajes=Map.get(map,:mensajes)
    receive do
      {pid, :alumnoSeConecta} ->
      IO.puts 'Un alumno se conecto'
      Map.put(map,:alumnos,alumnos ++ [pid])
      {pid, :profesorSeConecta} ->
      IO.puts 'Un profesor se conecto'
      Map.put(map,:profesores,profesores ++ [pid])
      {pid, mensaje, :nuevoMensaje} ->
      IO.puts "Un alumno mando: " <> mensaje
    end
    loop(map)
  end

end
