
def filter(hash, valor)
  valor = valor.to_i
  filtered_hash = {}
  hash.each do |k , v|
    if v > valor
      filtered_hash[k] = v
    end
  end
  puts filtered_hash
end

valores = {Enero:15000,
  Febrero:22000,
  Marzo:12000,
  Abril:17000,
  Mayo:81000,
  Junio:13000,
  Julio:21000,
  Agosto:41200,
  Septiembre:25000,
  Octubre:21500,
  Noviembre:91000,
  Diciembre:21000
}

filter(valores, ARGV[0])
