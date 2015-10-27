defmodule Alumno do
  IO.puts "Alumno: loaded."
  def start do
    spawn_link(fn -> loop end)
  end

  def loop do
    receive do
      {pid, consulta, respuesta, :nuevaRespuesta} -> IO.puts "Hay una nueva respuesta: " <> respuesta <> " a: " <> consulta
      {pid, mensaje, :nuevoMensaje} -> IO.puts "Un alumno mando: " <> mensaje
    end
  end
end
