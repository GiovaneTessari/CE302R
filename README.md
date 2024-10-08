# CE302R
vetor_a = c(1,2,3,4)
vetor_b = c(5,6,7,8)

matriz_linha = rbind(vetor_a, 
                     vetor_b)
matriz_linha
class(matriz_linha)
class(matriz_linha)
matriz_coluna= cbind(vetor_a, 
                     vetor_b)
matriz_coluna
class(matriz_coluna)
is.matrix(matriz_coluna)
A <- matrix(c(1:9), 
            ncol = 3,
            byrow = TRUE)
A
B <- matrix(c(1:9), 
            ncol = 3, 
            byrow = FALSE)
B


A <- matrix(c(2, -1, 3, 
              1, 4, 1, 
              5, -2, 7), 
            ncol = 3, 
            byrow = TRUE)
elemento_1_2 <- A[1, 2]  # Seleciona o elemento na primeira linha e segunda coluna 
elemento_1_2
elemento_3_3 <- A[3, 3]  # Seleciona o elemento na terceira linha e terceira coluna 
elemento_3_3
coluna_2 <- A[, 2]  # Seleciona a segunda coluna inteira 
coluna_2
linha_1 <- A[1, ]   # Seleciona a primeira linha inteira 
linha_1
## Exemplo 1: Seleção de Elementos Maiores que um Valor
B
A <- matrix(c(2, -1, 3, 
              1, 4, 1, 
              5, -2, 7), 
            ncol = 3, 
            byrow = TRUE)
solve(A)

##CRIANDO DATA FRAMES

# Exemplo de criação de Data Frame
meu_data_frame <- data.frame(
  nome = c("Alice", "Bob", "Carol", "Ana", "João", "Carlos", "Patrícia", "Leonardo"),
  idade = c(25, 30, 28, 20, 27, 50, 60, 45),
  salario = c(5000, 6000, 5500, 8000, 2000, 3500, 10000, 3800 ), 
  meio_de_transporte = c('onibus', 'bicicleta', 'onibus', 'carro', 'carro', 'onibus', 'onibus', 'bicicleta')
)

## Nomes de colunas do nosso data.frame não possuem espaço, podem ser separadas por "." ou "_".

meu_data_frame
head(meu_data_frame)
tail(meu_data_frame)
str(meu_data_frame)
# Acessar coluna usando o operador $

meu_data_frame$nome
# Acessar coluna usando colchetes []

meu_data_frame[, "idade"]
meu_data_frame$genero <- c("F", "M", "F", "F", "M", "M", "F", "M")
meu_data_frame
subconjunto_df <- meu_data_frame[meu_data_frame$idade > 28, ]  # Seleciona pessoas com idade maior que 28
subconjunto_df
# Usando a função subset()
subconjunto_df <- subset(meu_data_frame, idade > 28)
subconjunto_df
subconjunto_combinado <- meu_data_frame[meu_data_frame$idade > 25 & meu_data_frame$idade < 30, ]
subconjunto_combinado
class(meu_data_frame$nome)
class(meu_data_frame$idade)
str(meu_data_frame)
dim(meu_data_frame)
nrow(meu_data_frame)
ncol(meu_data_frame)
summary(meu_data_frame)

## FATORES

# Exemplo de criação de fator
genero <- factor(c("Masculino", "Feminino", "Masculino", "Feminino"))

# Exenplo com diferentes níveis
estadiamento_doenca <- factor(c("Estágio I", "Estágio II", "Estágio I", "Estágio III", "Estágio IV"), 
                              levels = c("Estágio I", "Estágio II", "Estágio III", "Estágio IV"))
meu_data_frame$genero                              
meu_data_frame$genero = as.factor(meu_data_frame$genero)

meu_data_frame$genero
# Definindo fator com níveis específicos
cores <- factor(c("Vermelho", "Verde", "Azul"), levels = c("Vermelho", "Verde", "Azul", "Amarelo"))
cores
# Acessar níveis de um fator
niveis_cores <- levels(cores)
niveis_cores
# Acessar o número de níveis de um fator
n_niveis_cores <- nlevels(cores)
n_niveis_cores
# Acessar valores do fator
valores_cores <- cores
valores_cores

##TABELAS DE DUPLA ENTRADA

# Exemplo de criação de tabela de dupla entrada
sexo <- c("Masculino", "Feminino", "Masculino", "Masculino", "Feminino")
cidade <- c("A", "B", "A", "B", "A")
tabela_contingencia <- table(sexo, cidade)
tabela_contingencia
tabela_contingencia2 <- table(meu_data_frame$meio_de_transporte, meu_data_frame$genero)
tabela_contingencia2
# Visualizar tabela de dupla entrada
print(tabela_contingencia)
# Exibição formatada da tabela
tabela_formatada <- ftable(tabela_contingencia)
print(tabela_formatada)

marginais_linhas <- margin.table(tabela_contingencia, 1)  # Somas das linhas
marginais_colunas <- margin.table(tabela_contingencia, 2)  # Somas das colunas
marginais_linhas
marginais_colunas
qui_quadrado <- chisq.test(tabela_contingencia)
print(qui_quadrado)
proporcoes_relativas_linha <- prop.table(tabela_contingencia, margin = 1)  # Proporções por linha
proporcoes_relativas_linha
proporcoes_relativas_coluna <- prop.table(tabela_contingencia, margin = 2)  # Proporções por linha
proporcoes_relativas_coluna

#EXERCICIOS

## Lendo os dados de queimadas
Queimadas_Q1 <- read.csv("FireWatch/Dataset_FireWatch_Brazil_Q1_2024.csv")
head(Queimadas_Q1)
str(Queimadas_Q1)
Queimadas_Q2 <- read.csv("FireWatch/Dataset_FireWatch_Brazil_Q2_2024.csv")
head(Queimadas_Q2)
str(Queimadas_Q2)
Queimadas_Q3 <- read.csv("FireWatch/Dataset_FireWatch_Brazil_Q3_2024.csv")
head(Queimadas_Q3)
str(Queimadas_Q3)
## Unindo os três bancos de dados
Queimadas <- rbind(Queimadas_Q1, Queimadas_Q2, Queimadas_Q3)
head(Queimadas)
str(Queimadas)
dim(Queimadas)

write.csv(Queimadas, file = "data/FireWatch/Dataset_FireWatch_Brazil_2024.csv", row.names = FALSE)

#EXERCIOS_PRATICA

##1)Imprima na tela as 9 primeiras observações.
head(Queimadas, n=9)
##2)Imprima as últimas 3 observações.
tail(Queimadas, n=3)
##3)Quantas observações temos?
nrow(Queimadas)
##4)Quantas variáveis temos?
ncol(Queimadas)
##5)Apresente o sumário dos dados.
summary(Queimadas)
##6)Apresente a estrutura dos dados.
str(Queimadas)
##7)Quantos biomas estão sendo afetados?
nrow(table(Queimadas$bioma))-1
##8)Qual a média de avg_numero_dias_sem_chuva para os estados da região sul e da região norte?
estados_do_sul = subset(Queimadas, estado == "PARANÁ" | estado == "SANTA CATARINA" | estado == "RIO GRANDE DO SUL" | estado == "RONDÔNIA" |
estado == "RORAIMA" | estado == "AMAPÁ" | estado == "TOCANTINS" | estado == "ACRE" | estado == "AMAZONAS" | estado == "PARÁ")

mean(estados_do_sul$avg_numero_dias_sem_chuva)

#Estruturas alternativas ao Data Frame

library(data.table)

## Criar um data.table
meu_data_table <- data.table(
  nome = c("Alice", "Bob", "Carol", "Ana", "João", "Carlos", "Patrícia", "Leonardo"),
  idade = c(25, 30, 28, 20, 27, 50, 60, 45),
  salario = c(5000, 6000, 5500, 8000, 2000, 3500, 10000, 3800 ), 
  meio_de_transporte = c('onibus', 'bicicleta', 'onibus', 'carro', 'carro', 'onibus', 'onibus', 'bicicleta'))
meu_data_table
class(meu_data_table)
## Importar um data.table e comparando o tempo de importação com o read.csv

system.time(Queimadas <- fread("data/FireWatch/Dataset_FireWatch_Brazil_2024.csv"))
system.time(Queimadas <- read.csv("data/FireWatch/Dataset_FireWatch_Brazil_2024.csv"))
## Agregar dados 
agregado <- meu_data_table[, .(media_salario = mean(salario)),]
agregado
## Agregar dados por idade
agregado_idade <- meu_data_table[, .(media_salario = mean(salario)), by = idade]
agregado_idade
## Agregar dados por meio_de_transporte
agregado_mt <- meu_data_table[, .(media_salario = mean(salario)), by = meio_de_transporte]
agregado_mt
 
#Tibble

require(tibble)
require(magrittr)
require(dplyr)

meu_tibble <- tibble(
  nome = c("Alice", "Bob", "Carol", "Ana", "João", "Carlos", "Patrícia", "Leonardo"),
  idade = c(25, 30, 28, 20, 27, 50, 60, 45),
  salario = c(5000, 6000, 5500, 8000, 2000, 3500, 10000, 3800 ), 
  meio_de_transporte = c('onibus', 'bicicleta', 'onibus', 'carro', 'carro', 'onibus', 'onibus', 'bicicleta'))
meu_tibble

glimpse(meu_tibble)

meu_tibble$nova_coluna <- c(1, 2, 3, 4, 5, 6, 7, 8)
meu_tibble

meu_tibble <- mutate(meu_tibble, `minha coluna` = 1:8)
meu_tibble <-  rename(meu_tibble, idade_anos = idade)
meu_tibble

meu_tibble_sem_salario <- select(meu_tibble, -salario)
meu_tibble_sem_salario

## Filtrar e ordenar
resultado <- filter(meu_tibble, idade_anos > 25) 
arrange(resultado, desc(salario))

## Agregar por idade e calcular média de salários
agregado_por_idade <-  group_by(meu_tibble, idade_anos) 

summarize(agregado_por_idade, media_salario = mean(salario))
### TEM UM ERRO AI 

###LISTAS

# Exemplo de criação de lista

minha_lista <- list(
  vetor = c(1, 2, 3, 4, 5),
  matriz = matrix(1:9, nrow = 3),
  data_frame = data.frame(
    nome = c("Alice", "Bob", "Carol"),
    idade = c(25, 30, 28)
  ),
  lista_aninhada = list(
    vetor_aninhado = c(10, 20, 30),
    matriz_aninhada = matrix(1:4, nrow = 2)
  )
)
minha_lista

# Acessar elementos da lista

elemento1 <- minha_lista[[1]]  # Acessar o primeiro elemento

elemento2 <- minha_lista$data_frame  # Acessar o data frame

elemento3 <- minha_lista$lista_aninhada$vetor_aninhado  # Acessar o vetor aninhado

elemento1
elemento2
elemento3

#################



