defmodule Lista do

  IO.puts "Lista: loaded."
  def start do
    spawn_link(fn -> loop(%{}) end)
  end

  def loop(map) do
    receive do
      {pid, :alumnoSeConecta} ->
      IO.puts 'Un alumno se conecto'
      loop(Map.put(map, key, value))
      {pid, :profesorSeConecta} ->
      IO.puts 'Un Profesor se Conecto'
      {pid, mensaje, :nuevoMensaje} ->
      IO.puts "Un alumno mando: " <> mensaje
    end
  end

end
