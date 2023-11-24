datos <- iris
irissize <- ifelse(Sepal.Length < median(Sepal.Length),
                   "small", "big")
table(irissize)
datos$size <- irissize
attach(datos)

#Graficas 2023-11-03 ####


# install.packages("ggplot2")
library(ggplot2)

ggplot(iris) +
  geom_bar(aes(x = size, fill = size),
           show.legend = F) +
  labs(
    x = "Tamaño",
    y = "Frecuencia",
    title = "Grafico de Barras",
    subtitle = "Usando colores",
    caption = "Quitando etiquetas"
  ) +
  theme(
    title = element_text(size = 20, face = "bold.italic"),
    axis.text = element_text(size = 18, angle = 50)
  )

# install.packages("showtext")
# install.packages("curl")
# library(curl)
# library(showtext)
# font_add_google("Gochi Hand", "gochi")


ggplot(iris) +
  geom_bar(aes(x = size, fill = size),
           show.legend = F) +
  labs(
    x = "Tamaño",
    y = "Frecuencia",
    title = "Grafico de Barras",
    subtitle = "Usando colores",
    caption = "Quitando etiquetas"
  ) +
  theme(
    title = element_text(size = 12,
                         face = "bold.italic"),
    axis.text = element_text(size = 10, angle = 50)
  )

#theme_dark()   tema predeterminado
hist(iris$Sepal.Length,
     main = "Histograma del largo del sepalo",
     xlab = "Largo del sepalo",
     ylab = "Frecuencia")


ggplot(iris) +
  geom_histogram(aes(x = Sepal.Length, fill = Sepal.Length),
                 show.legend = F) +
  labs(x = "Tamaño del Sepalo",
       y = "Frecuencia",
       title = "Histograma del largo del Sepalo") +
  theme(title = element_text(size = 12, face = "bold.italic"),
        axis.text = element_text((size = 12)))

ggplot(iris) +
  geom_histogram(aes(x = Sepal.Length,
                     fill = Species),
                 alpha = 0.5,
                 bins = 12) +
  labs(x = "Tamaño del Sepalo",
       y = "Frecuencia",
       title = "Histograma del largo del Sepalo")

boxplot(Sepal.Length)





boxplot(Sepal.Length ~ Species)

ggplot(iris) +
  aes(x = Species, y = Sepal.Length) +
  geom_boxplot(aes(color = Species),
               show.legend = F) +
  geom_jitter(aes(color = Species))


ggplot(iris) +
  aes(x = Species, y = Sepal.Length) +
  geom_boxplot(aes(fill = Species),
               show.legend = F)

ggplot(iris, aes(x = Species, y = Sepal.Length)) +
  geom_jitter(aes(color = Species))

plot(Sepal.Length, Petal.Length)

ggplot(iris) + aes(x = Sepal.Length, y = Petal.Length) +
  geom_point(shape = Species)


ggplot(iris) +
  geom_point(
    aes(
      x = Sepal.Length,
      y = Petal.Length,
      colour = Species,
      shape = Species
    ),
    alpha = 0.5,
    size = 5,
    stroke = 1
  )

ggplot(iris) +
  geom_point(
    aes(x = Sepal.Length,
        y = Petal.Length,
        colour = Species),
    shape = 21,
    alpha = 0.5,
    size = 5,
    stroke = 3
  )

ggplot(iris, aes(x = Sepal.Length, y = Petal.Length)) +
  geom_point(aes(color = Species)) +
  geom_smooth(method = "lm")

ggplot(iris, aes(x = Sepal.Length, y = Petal.Length, color = Species)) +
  geom_point() +
  geom_smooth(method = "lm")

grafico <-
  ggplot(iris, aes(x = Sepal.Length, y = Petal.Length)) + geom_point()
grafico + geom_smooth(method = "lm")

grafico2 <- ggplot(iris, aes(x = Sepal.Length))
grafico2 + aes(fill = Species) + geom_histogram(bins = 12, alpha = 0.5)
grafico2 + geom_histogram(bins = 12, alpha = 0.5) +
  labs(y = "Frecuencia") + facet_grid(. ~ Species) # Vertical

grafico2 <- ggplot(iris, aes(x = Sepal.Length))
grafico2 + aes(fill = Species) + geom_histogram(bins = 12, alpha = 0.5)
grafico2 + geom_histogram(bins = 12, alpha = 0.5) +
  labs(y = "Frecuencia") + facet_grid(Species ~ .) # Horizantal

ggplot(iris) +
  geom_histogram(aes(x = Sepal.Length, fill = Sepal.Length),
                 show.legend = F) +
  labs(x = "Tamaño del Sepalo",
       y = "Frecuencia",
       title = "Histograma del largo del Sepalo") +
  theme(text = element_text(size = 16,  family = "Comic Sans MS"))

data("ChickWeight")
ggplot(ChickWeight, aes(x = Time, y = weight)) +
  geom_point(aes(color = Diet)) +
  geom_line(aes(color = Diet, group = Chick)) +
  facet_grid(. ~ Diet)

ggplot(ChickWeight, aes(x = Time, y = weight)) +
  geom_point(aes(color = Diet)) +
  geom_line(aes(color = Diet, group = Chick)) +
  facet_wrap(~ Diet, ncol = 2)


pie(table(Species))

ggplot(iris, mapping = aes(x = Sepal.Length, y = Petal.Length)) +
  geom_point(aes(color = Sepal.Width)) +
  geom_smooth(method = "lm") +
  scale_color_continuous(name = "Leyenda") +
  scale_x_continuous(breaks = 1:8) +
  labs(
    title = "Titulo 01",
    subtitle = "Subtitulo 01",
    x = "Largo del Sepalo",
    y = "Largo del Petalo",
    caption = "Descripcion"
  ) +
  facet_wrap( ~ Species) +
  theme_bw()+
  theme(axis.title = element_text(family="Comic Sans MS", color="darkblue"),
        title = element_text(family="Comic Sans MS", color="red"), 
        legend.title = element_text(color="orange"),
        plot.title = element_text(color="green"),
        panel.grid = element_blank())+
  coord_flip()



data <- data.frame(
  group=LETTERS[1:5],
  value=c(13,7,9,21,2)
)

ggplot(data, aes(x="", y=value, fill=group)) +
  geom_bar(stat="identity", width=1) +
  coord_polar("y", start=0)


ggplot(iris, aes(x="", y=Sepal.Length, fill=Species))+
  geom_bar(stat="identity", width=1) +
  coord_polar("y", start=0) 

# install.packages("summarytools")
# install.packages("X11")
library(summarytools)
freq(Species)
# ctable(x=Species, y=size)

plot(density(Sepal.Length))
ggplot(iris) + aes(x = Sepal.Length) +
  geom_density()
