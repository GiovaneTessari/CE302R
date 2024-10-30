require(tidyverse)
require(magrittr)

table1
table1 %>% 
  select(country, year, cases) %>%
  pivot_wider(names_from = year,
               values_from = cases,
               names_prefix = 'ano',
               values_fill = 0,
               values_fn = length)

table3
separated = table3 %>%
  separate(rate, into = c("cases","population"))
separated

separated = table3 %>%
  unite(rate, cases, population, sep = "/")

TB <-read.csv("TB(1).csv")
TB

#Strings
require(tidyverse)
require(magrittr)

x <- "Seu nome aqui"
y <- 'Seu nome aqui'

x == y

var_com_aspas <- "Ela disse: 'Eu adoro lasanha.'"
var_com_aspas
str_view(var_com_aspas)
var_com_aspas2 <- 'Ela disse: "Eu adoro lasanha."'
var_com_aspas2
str_view(var_com_aspas2)
var_com_aspas3 <- "Ela disse: \"Eu adoro lasanha.\""
var_com_aspas3
str_view(var_com_aspas3)
var_com_aspas4 <- 'Ela disse: \'Eu adoro lasanha.\''
var_com_aspas4
str_view(var_com_aspas4)
texto <- "Isso é um exemplo de texto com espaços em branco."
str_view(texto)
texto_multilinhas <- "Primeira linha\nSegunda linha\nTerceira linha"
str_view(texto_multilinhas)
texto_tabulado <- "Primeira coluna\tSegunda coluna\tTerceira coluna" 
str_view(texto_tabulado)
texto_com_barras <- "Isso é uma única barra invertida: \\"
str_view(texto_com_barras)
texto_unicode_grau <- "A temperatura é de 25\u00B0C."
str_view(texto_unicode_grau)
simbolo_somatorio <- "O símolo do somatório é: \u2211"
str_view(simbolo_somatorio)
emoji <- "OMG! Também posso usar emoji! \U1F631"
str_view(emoji)

df <- data.frame(nome = c("Ana", "Maria", "João", NA), 
                 sobrenome= c("Santos", "Silva", "Souza", NA))


df %>% 
  mutate(ola = str_c("Boa noite ", nome, " ", sobrenome, "!"))


df %>% 
  mutate(mensagem = str_glue("Boa noite {nome} {sobrenome}!"))

df$nome %>% 
  paste(., collapse = ", ")

df$nome %>% 
  str_flatten(na.rm = TRUE)

df$nome %>% 
  str_flatten(na.rm = TRUE, collapse = ", ", last = " e ")

df %<>% 
  mutate(Nome_Sobrenome = str_c(nome, sobrenome, sep = " "))

df$Nome_Sobrenome %>% 
  str_split(., " ", simplify = TRUE)

texto_exemplo = c("caixa baixa", "CAIXA ALTA", "Texto de sentença", "Texto Em Título")
str_to_lower(texto_exemplo)

str_to_sentence(texto_exemplo)

str_to_title(texto_exemplo)

str_to_upper(texto_exemplo)

texto_com_espaços = "  Olá, esse texto tem    diversos        espaços completamente desnecessários. "

str_trim(texto_com_espaços, side = "left")
str_trim(texto_com_espaços, side = "right")
str_trim(texto_com_espaços, side = "both")
str_squish(texto_com_espaços)

df %>% 
  mutate(comprimento_nome = str_length(nome))

df %>% 
  mutate(qtd_a = str_count(nome, "a"))

df %>% 
  mutate(qtd_vogais = str_count(nome, "[aeiou]")) %>%
  mutate(qtd_consoantes = str_count(nome, "[^aeiou]"))

df %>% 
  mutate(nome = str_replace(nome, "ã", "a"))

df %>% 
  mutate(nome = str_remove(nome, "[aeiouã]"))

df %>% 
  mutate(nome = str_remove_all(nome, "[aeiouã]"))


texto <- "O gato é um animal adorável."
padrao <- "gato"
str_detect(texto, padrao)


texto <- c("O rato correu para o buraco.", 
           "O gato correu para o buraco.",
           "O mato.")
padrao <- "(g|r)ato"
str_detect(texto, padrao)

texto <- c("Banana", "Ana", "Ananas")
padrao <- "^ana"
str_detect(texto, padrao)
## Ignorar case
str_detect(texto, "(?i)ana")
## Ignorar case, terminar com ana
str_detect(texto, "(?i)ana$")
## Ignorar case, começar com ana
str_detect(texto, "(?i)^ana")
## Ignorar case, exatamente  ana
str_detect(texto, "(?i)^ana$")


str_extract(texto, "(na)+")
texto <- "Os números 123 e 456 são importantes."
padrao <- "\\d{3}"
numeros <- str_extract_all(texto, padrao, simplify = TRUE)
numeros
texto <- "Os números 123, 456 e 78 são importantes."
padrao <- "\\d{2}"
numeros <- str_extract_all(texto, padrao, simplify = TRUE)
numeros
