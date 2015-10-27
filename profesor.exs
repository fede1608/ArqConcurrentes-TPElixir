defmodule Profesor do
  IO.puts "Profesor: loaded."
  def start(lista) do
    send lista,{self, :profesorSeConecta}
    spawn_link(fn -> loop end)
  end

  def loop do
    receive do
      {lista,:nuevaConsulta ,consulta} -> 
        IO.puts "Hay una nueva consulta" <> consulta
        send lista,{self,:nuevaRespuesta}
      {lista, :profesorResponde} -> IO.puts 'Un profesor responde'
      {lista, _ } -> send :pid, {:error, 'Accion Invalida de #{inspect pid}'}
    end
  end

end
