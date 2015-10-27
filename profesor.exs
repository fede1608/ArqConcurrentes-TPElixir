defmodule Profesor do
  IO.puts "Profesor: loaded."
  def start do
    spawn_link(fn -> loop end)
  end

  def loop do
    receive do
      {pid, :nuevaConsulta} -> IO.puts 'Hay una nueva consulta'
      {pid, :profesorResponde} -> IO.puts 'Un profesor responde'
      {pid, _ } -> send :pid, {:error, 'Accion Invalida de #{inspect pid}'}
    end
  end

end
