defmodule Alumno do
  IO.puts "Alumno: loaded."
  def start(list) do
    spawn_link(fn -> init(list) end)
  end

  def init(list) do
    conectarseALaLista list
    loop
  end

  def loop do
    receive do
      {pid, consulta, respuesta, :nuevaRespuesta} -> IO.puts "Hay una nueva respuesta: " <> respuesta <> " a: " <> consulta
      {pid, mensaje, :nuevoMensaje} -> IO.puts "Un alumno mando: " <> mensaje
    end
    loop
  end

  def conectarseALaLista list do
    send list, {self, :alumnoSeConecta}
  end
end
