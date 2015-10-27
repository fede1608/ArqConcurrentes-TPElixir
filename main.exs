Code.require_file "alumno.exs", __DIR__
Code.require_file "profesor.exs", __DIR__
Code.require_file "lista.exs", __DIR__

defmodule Main do
  IO.puts "------ Main running -------"
#levanta lista
  lista = Lista.start
  IO.puts "Lista: " <> inspect(lista)
#levanta alumno
  alumno = Alumno.start
  IO.puts "Alumno: " <> inspect(alumno)
#levanta profesor
  profesor = Profesor.start
  IO.puts "Profesor: " <> inspect(profesor)
#conecta alumno con lista
#conecta profesor con lista
end
