require(magrittr)
require(tidyverse)

# Estruturas de repetição: 

# While - For - Applay

# while (condicao) {
  # Código a ser repetido enquanto a condição for verdadeira }

#EXEMPLO: Imprima na tela i, enquanto i for menor do que 6.

i <- 1 # sempre definimos o critério de parada fora do loop

while (i < 6) {
  print(i)
  i <- i + 1 # Sempre alteramos o critério 
  # de parada, senão caímos em um loop infinito
}


# Break (PARA O CODIGO)

#EX1
i <- 1
while (i < 6) {
  print(i)
  i <- i + 1
  if (i == 4) {
    break
  }
}

#EX2

contador = 0
i = 0

while(i<10){
  i = sample(1:100, size = 1)
  contador = contador + 1 
  
  print(contador)
  print(i)
  if( contador == 4){
    break
  }
}


# Next (PULA UMA PARTE DO CODIGO)
 
i <- 0
while (i < 6) {
  i <- i + 1
  if (i == 3) {
    next
  }
  print(i)
}

##EXERCÍCIO
 
set.seed(1234)

dado <- seq(1:6)
n_lancamento = 0
sorteio = 0
df = list()

while (sorteio != 5) {
  sorteio =  sample(dado, 1)
  n_lancamento = n_lancamento + 1
  df = data.frame(n_sorteado = sorteio,
                  n_lancamento = n_lancamento)
  cat(paste0("\n\nLançamento: ", n_lancamento, "\nValor Sorteado: ", sorteio))
}
n_lancamento
df %<>% dplyr::bind_rows()

###

n_lancamento = 0
while (sorteio != 7) {
  sorteio =  sample(dado, 1)
  n_lancamento = n_lancamento + 1
  
  cat(paste0("\n\nLançamento: ", n_lancamento, "\nValor Sorteado: ", sorteio))
  
  if(n_lancamento == 100){
    break
  }
}
n_lancamento

#for (variavel in sequencia) {
# Código a ser executado para cada valor da sequência }

dado = c(1:6)
soma_dois_dados = function(dado1, dado2){
  soma = dado1 + dado2
  
}
quadrado_soma = function(soma){
  soma2 = soma^2
  return(soma2)
}

resultado = list()
k = 0 
for(i in dado){
  for(j in dado){
    k = k + 1
    soma = soma_dois_dados(dado[i], dado[j])
    somaqd = quadrado_soma(soma)
    
    resultado[[k]] = data.frame(dado1 = dado[i], 
                                dado2 = dado[j], 
                                soma = soma, 
                                soma2 = somaqd)
  }
}

resultado
