#' Lei de benford
#'
#' Esta função lê um vetor de números inteiros e testa se
#' vale a lei de benford para esses números.
#'
#' Histórico sobre a Lei de Benford.
#'
#'@param x Vetor de inteiros
#'
#'@return uma lista com estatística, valor-p,
#'frequências observadas e esperadas.
#'@export
benford <-function(x) {
 freq_obs <- table(substr(as.character(x),1,1))
 N <- sum(freq_obs)
 dig_obs <- as.numeric(names(freq_obs))
 Num_dig <- length(dig_obs)
 prop_esp <- log10(1 + 1 / dig_obs)
 freq_esp <- prop_esp * N
 estatistica <- sum((freq_esp - freq_obs) ^ 2 / freq_esp)
 p_val <- 1 - pchisq(estatistica, Num_dig -1)
 res <- list(estatistica = estatistica,
             p_val = p_val,
             freq_obs = as.numeric(freq_obs),
             prop_esp = prop_esp,
             prop_obs = freq_obs / N
        )
 class(res) <- 'benford'
 res
}


#'Plota o gráfico para a Lei de Benford
#'
#'Gráfico de barras
#'
#'Utiliza o pacote ggplot2
#'
#'@param x resultado da função \code{\link{benford}}
#'@param ... outros parametros opcionais
#'
#'@import ggplot2
#'@export
plot.benford <- function(x,...){
 d <- dplyr::as_tibble(x[-c(1:2)])
 d <- dplyr::add_rownames(d)
 d <- dplyr::mutate(d, rowname= as.numeric(rowname))
 d <- dplyr::select(d, -freq_obs)
 d <- tidyr::gather(d,tipo_prop,prop,-rowname)
 ggplot(d, aes(x=rowname, y=prop, fill=tipo_prop)) +
  geom_bar(stat = 'identity',position = 'dodge')
}
