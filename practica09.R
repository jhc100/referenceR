# Ajuste de distribuciones ####
# install.packages("tidyverse")
# install("univariateML")
library(tidyverse)
library(ggplot2)
library(univariateML)
diamantes <- diamonds %>% filter(cut == "Fair")

ggplot(diamantes, aes(x = price)) +
  geom_histogram(fill = "darkblue") +
  labs(title = "Distribucion del precio de los diamantes",
       x = "Precio") +
  theme_bw() + theme(plot.title = element_text(face = "bold"))

# Criterio de comparacion Akaike ####
# El criterio de información de Akaike (AIC) es una medida de la calidad
# relativa de un modelo estadístico, para un conjunto dado de datos. Como tal,
# el AIC proporciona un medio para la selección del modelo.
# AIC maneja un trade-off entre la bondad de ajuste del modelo y la complejidad
# del modelo.

comparacion_AIC <- AIC(
  mlbetapr(diamantes$price),
  mlexp(diamantes$price),
  mlinvgamma(diamantes$price),
  mlgamma(diamantes$price),
  mllnorm(diamantes$price),
  mlrayleigh(diamantes$price),
  mlinvgauss(diamantes$price),
  mlinvweibull(diamantes$price),
  mllgamma(diamantes$price)
)
# Ctrl + Shift + M   %>%
comparacion_AIC %>% rownames_to_column(var = "distribucion") %>% arrange(AIC)

# Criterio de comparacion Bayesiano
# Criterio de Información Bayesiano (BIC) o criterio Schwarz (SIC) es una medida
# de bondad de ajuste de un modelo estadístico, y es a muenudo utilizado como un
# criterio para para la selección de modelos entre un conjunto finito de modelos

comparacion_BIC <- BIC(
  mlbetapr(diamantes$price),
  mlexp(diamantes$price),
  mlinvgamma(diamantes$price),
  mlgamma(diamantes$price),
  mllnorm(diamantes$price),
  mlrayleigh(diamantes$price),
  mlinvgauss(diamantes$price),
  mlinvweibull(diamantes$price),
  mllgamma(diamantes$price)
)

comparacion_BIC %>% rownames_to_column(var = "distribucion") %>% arrange(BIC)

# after_stat
# curva densidad que se ajuste al histograma

#Ajuste de distribucion ####
ggplot(diamantes) +
  geom_histogram(
    aes(x = diamantes$price, y = after_stat(density)),
    bins = 40,
    alpha = 0.3,
    color = "gray"
  ) +
  geom_rug(aes(x = diamantes$price)) +
  stat_function(
    fun = function(.x) {
      dml(x = .x, obj = mllnorm(diamantes$price))
    },
    aes(color = "log-normal"),
    size = 1
  ) +
  
  stat_function(
    fun = function(.x) {
      dml(x = .x, obj = mlinvgauss(diamantes$price))
    },
    aes(color = "inv-normal"),
    size = 1
  ) +
  scale_color_manual(
    breaks = c("log_normal", "inv_normal"),
    values = c("log-normal" = "red", "inv-normal" = "blue")
  ) +
  theme(legend.position = "bottom")
