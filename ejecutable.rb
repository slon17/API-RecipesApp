#SWI_LIB = "~/swipl-devel/build/src/libswipl.so"
class Ejecutable

  SWIPL::truth( "consult('pru.pl')" )
  oods = SWIPL::query( "receta", 1 )
  #c = system("swipl", "-s", "pru.pl", "-g", "receta(A,B,C,D,E)", "-t", "halt")
  #puts $?.class

  #e = %x[swipl -s pru.pl -g "receta(A,B,C,D,E)" -t halt]
  #p e

  #puts exec "swipl", "pru.pl", "receta(A,B,C,D,E)"

  #value = "swipl pru.pl receta(A,B,C,D,E)"
  #value = "#{cmd}"

end
