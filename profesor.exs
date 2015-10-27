defmodule Profesor do
  IO.puts "Profesor: loaded."
  def start(list) do
    conectarseALaLista list
    spawn_link(fn -> loop end)
  end

  def loop do
    receive do
      {lista,:nuevaConsulta ,consulta} ->
        IO.puts "Hay una nueva consulta" <> consulta
        send lista,{self,consulta,"respuesta",:profesorResponde}
      {lista, :nuevaRespuesta} -> IO.puts 'Un profesor responde'
      {lista, _ } -> IO.puts 'Mensaje invalido'
    end
    loop
  end

  def conectarseALaLista list do
    send list, {self, :profesorSeConecta}
  end
end
