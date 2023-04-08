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
#'
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
