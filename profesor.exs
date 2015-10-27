defmodule Profesor do
  IO.puts "Profesor: loaded."
  def start(lista) do
    send lista,{self, :profesorSeConecta}
    spawn_link(fn -> loop(lista) end)
  end

  def loop(lista) do
    receive do
      {pid, lista, :nuevaConsulta ,consulta} -> 
        IO.puts "Hay una nueva consulta" <> consulta
        send lista,{self,:nuevaRespuesta}
      {pid, :profesorResponde} -> IO.puts 'Un profesor responde'
      {pid, _ } -> send :pid, {:error, 'Accion Invalida de #{inspect pid}'}
    end
  end

end
