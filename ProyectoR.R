#--Descxribir los tipos de variable
##-Fecha(Cauntitativa de intervalo)
##-Producto(Cualitativa nominal)
##-Cantidad(cuantitativa discreta de razon)
##-Precio_Unitario(Cuantitativa discreta de razon)
##-Descuento(Cauntitativa continua de razon)
##-Total(Cuantitativa discreta de razon)
##-Vendedor(Cualitativa nominal)
##-Ubicacion(Cualitativa nominal)
##-Forma_Pago(Cualitativa nominal)
##-Estado(Cualitativa ordinal)
# Carga automática del archivo CSV
DataSet <- read.csv("Proyecto-R/DataSet.csv")
##Tabla de frecuencias para los productos
Fracuencia_absoluta_producto<-table(DataSet$Producto)

tabla_frecuencia_producto <- as.data.frame(Fracuencia_absoluta_producto)
colnames(tabla_frecuencia_producto) <- c("Producto", "ni")

tabla_frecuencia_producto$fi <- tabla_frecuencia_producto$ni/sum(tabla_frecuencia_producto$ni)
tabla_frecuencia_producto$Ni <- cumsum(tabla_frecuencia_producto$ni)
tabla_frecuencia_producto$Fi <- cumsum(tabla_frecuencia_producto$fi)

tabla_frecuencia_producto
#Aca se ve la grafica de los productos independientemente si se completo o no la compra
barplot(table(DataSet$Producto),
        col = "skyblue",
        main = "Frecuencia de Productos",
        xlab = "Producto", ylab = "Cantidad Vendida")

##Tabla de frecuencias para las cantidades

Fracuencia_absoluta_cantidad <- table(DataSet$Cantidad)

tabla_frecuencia_cantidad <- as.data.frame(Fracuencia_absoluta_cantidad)
colnames(tabla_frecuencia_cantidad) <- c("Cantidad", "ni")

tabla_frecuencia_cantidad$fi <- tabla_frecuencia_cantidad$ni/sum(tabla_frecuencia_cantidad$ni)
tabla_frecuencia_cantidad$Ni <- cumsum(tabla_frecuencia_cantidad$ni)
tabla_frecuencia_cantidad$Fi <- cumsum(tabla_frecuencia_cantidad$fi)
tabla_frecuencia_cantidad
#Aca tenemos la grafica general de las cantidades que compraban, si compraron solo 1 o 9, se muestra
barplot(table(DataSet$Cantidad),
        col = "skyblue",
        main = "Frecuencia de Cantidad",
        xlab = "Producto", ylab = "Cantidad Vendida")

##Teniendo en cuenta que la tabla de cantidades solo nos dice la cantidad que se compro y nos
##la divide teniendo en cuenta el producto que se compro, para analizar mejor cada producto 
##se va a hacer una tabla de cantidad por cada producto 

tabla_CantidadxProducto <- table(DataSet$Producto, DataSet$Cantidad)
tabla_CantidadxProducto
##Promt para modificar la tabla y que queda organizado por colores
###(necesito que te conviertas en un analista de datos profesional y que puedas crear tablas especificas en el software R. Tenemos esta tabla"barplot(tabla_CantidadxProducto)" la cual tiene en cuenta dos variables del dataset, que son la cantidad de productos comprados y el producto, necesito que la tabla la organices por colores para poder identificar cada producto y que le añadas un legend con la relación del producto con el color)
## Gráfico de barras apilado (para ver composición porcentual)
colores_productos <- c("Laptop" = "#003B36",    # Azul profesional
                       "Tableta" = "#59114D",   # Magenta elegante
                       "Teléfono" = "#E98A15")  # Naranja vibrante

barplot(tabla_CantidadxProducto, 
        main = "Cantidades Registradas por Producto",
        xlab = "Cantidad", 
        ylab = "Frecuencia",
        col = colores_productos,
        ylim = c(0, max(colSums(tabla_CantidadxProducto)) * 1.2))

legend("top", 
       legend = rownames(tabla_CantidadxProducto),
       fill = colores_productos,
       title = "Productos",
       title.font = 2,    # 2 = negrilla (bold)
       horiz = TRUE,
       cex = 0.8,
       bty = "n")

##Para mejorar la vista de las tablas se va a utilizar la ayuda de inteligencia artificial para presentarlas como una imagen
#este fue el promt enviado "necesito que te conviertas en un analista de datos profesional y que puedas crear tablas especificas en el software R. Tenemos esta tabla"barplot(tabla_CantidadxProducto)" la cual tiene en cuenta dos variables del dataset, que son la cantidad de productos comprados y el producto, necesito que la tabla la organices por colores para poder identificar cada producto y que le añadas un legend con la relación del producto con el color"
# Instalar el paquete install.packages("gridExtra")
grid.newpage()
library(gridExtra)

# Crear tabla formateada
# Para la primera tabla (tabla_frecuencia_producto)

tabla_producto <- tabla_frecuencia_producto
tabla_producto$fi <- round(tabla_producto$fi, 4)
tabla_producto$Fi <- round(tabla_producto$Fi, 4)

grid.newpage()
grid.draw(tableGrob(tabla_producto, 
                    theme = ttheme_minimal(
                      base_size = 11,
                      core = list(bg_params = list(fill = c("#F2F2F2", "#FFFFFF"), col = "black"),
                                  fg_params = list(hjust = 0, x = 0.05)),
                      colhead = list(fg_params = list(col = "white"),
                                     bg_params = list(fill = "#2E86AB"))
                    )))


# Primero creamos la tabla de frecuencia para Cantidad
Frecuencia_absoluta_cantidad <- table(DataSet$Cantidad)
tabla_frecuencia_cantidad <- as.data.frame(Frecuencia_absoluta_cantidad)
colnames(tabla_frecuencia_cantidad) <- c("Cantidad", "ni")

tabla_frecuencia_cantidad$fi <- tabla_frecuencia_cantidad$ni/sum(tabla_frecuencia_cantidad$ni)
tabla_frecuencia_cantidad$Ni <- cumsum(tabla_frecuencia_cantidad$ni)
tabla_frecuencia_cantidad$Fi <- cumsum(tabla_frecuencia_cantidad$fi)

# Redondeamos y mostramos como imagen
tabla_cantidad_formateada <- tabla_frecuencia_cantidad
tabla_cantidad_formateada$fi <- round(tabla_cantidad_formateada$fi, 4)
tabla_cantidad_formateada$Fi <- round(tabla_cantidad_formateada$Fi, 4)

grid.newpage()
grid.draw(tableGrob(tabla_cantidad_formateada, 
                    theme = ttheme_minimal(
                      base_size = 11,
                      core = list(bg_params = list(fill = c("#F2F2F2", "#FFFFFF"), col = "black"),
                                  fg_params = list(hjust = 0, x = 0.05)),
                      colhead = list(fg_params = list(col = "white"),
                                     bg_params = list(fill = "#2E86AB"))
                    )))

# tabla_CantidadxProducto)
# Convertir la tabla de contingencia a dataframe para formateo
tabla_cantidad_df <- as.data.frame.matrix(tabla_CantidadxProducto)
tabla_cantidad_df$Producto <- rownames(tabla_cantidad_df)
tabla_cantidad_df <- tabla_cantidad_df[, c("Producto", names(tabla_cantidad_df)[-ncol(tabla_cantidad_df)])]

# Crear encabezado personalizado con "Cantidad comprada"
colnames(tabla_cantidad_df) <- c("Producto", paste("Cantidad", colnames(tabla_cantidad_df)[-1]))

grid.newpage()
grid.draw(tableGrob(tabla_cantidad_df, 
                    theme = ttheme_minimal(
                      base_size = 10,
                      core = list(bg_params = list(fill = c("#F2F2F2", "#FFFFFF"), col = "black"),
                                  fg_params = list(hjust = 0, x = 0.05)),
                      colhead = list(fg_params = list(col = "white"),
                                     bg_params = list(fill = "#2E86AB"))
                    )))

##ahora para cada variable tenemos que hacer una grafica que la represente mejor
#Para producto 
pie(table(DataSet$Producto), main = "Distribución de Productos", col = c("#2E86AB", "#A23B72", "#F18F01"))
#Para vendedor
barplot(sort(table(DataSet$Vendedor)), las = 1, main = "Ventas por Vendedor", col = "#2E86AB")
#ubicacion
barplot(sort(table(DataSet$Ubicación)), las = 1, main = "Lugar de venta", col = "#2E86AB")
#forma de pago
barplot(table(DataSet$Forma_Pago), main = "Métodos de Pago", col = "#2E86AB")
#Estado
barplot(table(DataSet$Estado), main = "Estado de Transacciones", col = c("red2", "green3", "orange")) 
#Cantidad
barplot(table(DataSet$Cantidad), main = "Distribución de Cantidades", xlab = "Cantidad", col = "#2E86AB")
#Precio unitario
hist(DataSet$Precio_Unitario, main = "Distribución de Precios Unitarios", xlab = "Precio Unitario", ylab = "Frecuencia", col = "#2E86AB", breaks = 20)
#total
hist(DataSet$Total, main = "Distribución de Totales de Venta", xlab = "Total", ylab = "Frecuencia", col = "#2E86AB", breaks = 20)

#Descuento
DataSet$Descuento <- ifelse(is.na(DataSet$Descuento) | DataSet$Descuento == 0, "Sin Descuento", as.character(DataSet$Descuento))
barplot(sort(table(DataSet$Descuento)), las = 1, main = "Distribución de Descuentos Aplicados", xlab="Descuento",col = "#2E86AB")

#fecha 
hist(sort(table(DataSet$Fecha)), las = 1, main = "Distribución de Fecha", xlab="frecuencia", ylab="dia",col = "#2E86AB")

##Ahora tenemos que mostrar los artículos vendidos(completo) y saber cuál fue el que más se vendió y el que menos se vendió
#Para eso vamos a necesitar las variables de producto y cantidad pero que esten filtradas con la variable estado 
#ya que si en estado no esta como completado es porque no se ha vendido el producto todavia

ventas_completadas <- DataSet[DataSet$Estado == "Completo", ]

ventas_por_producto <- aggregate(Cantidad ~ Producto, data = ventas_completadas, sum)

barplot(ventas_por_producto$Cantidad, names.arg = ventas_por_producto$Producto,
        main = "Unidades Vendidas por Producto",
        ylab = "Unidades Vendidas",
        col = c("#2E86AB", "#A23B72", "#F18F01"))

tabla_max_min <- rbind(
  ventas_por_producto[which.max(ventas_por_producto$Cantidad), ],
  ventas_por_producto[which.min(ventas_por_producto$Cantidad), ]
)

# Agregar columna de Tipo
tabla_max_min$Tipo <- c("Más Vendido", "Menos Vendido")

# Reordenar columnas
tabla_max_min <- tabla_max_min[, c("Tipo", "Producto", "Cantidad")]

# Mostrar tabla bonita
grid.newpage()
grid.draw(tableGrob(tabla_max_min, 
                    theme = ttheme_minimal(
                      base_size = 11,
                      core = list(bg_params = list(fill = c("#F2F2F2", "#FFFFFF"), col = "black"),
                                  fg_params = list(hjust = 0, x = 0.05)),
                      colhead = list(fg_params = list(col = "white"),
                                     bg_params = list(fill = "#2E86AB"))
                    )))

##AHora tenemos que agrupar las ventas por forma de pago, calcular la cantidad total y el monto promedio para cada forma de pago
# Todo en un solo aggregate (CORREGIDO)
ventas_por_pago <- aggregate(cbind(Cantidad, Total) ~ Forma_Pago, data = ventas_completadas, FUN = sum)

# Calcular el promedio del total (ASÍ SÍ FUNCIONA)
ventas_por_pago$Monto_Promedio <- ventas_por_pago$Total / ventas_por_pago$Cantidad

# Redondear y mostrar
ventas_por_pago$Monto_Promedio <- round(ventas_por_pago$Monto_Promedio, 2)

grid.newpage()
grid.draw(tableGrob(ventas_por_pago, 
                    theme = ttheme_minimal(
                      base_size = 11,
                      core = list(bg_params = list(fill = c("#F2F2F2", "#FFFFFF"), col = "black"),
                                  fg_params = list(hjust = 0, x = 0.05)),
                      colhead = list(fg_params = list(col = "white"),
                                     bg_params = list(fill = "#2E86AB"))
                    )))

#Ahora enemos que calcular el vendedor que tuvo mayor cantidad de ventas(completado) y el que generó mayor cantidad de dinero en ventas. Y además calcular el promedio de productos vendidos por vendedor 

vendedor_cantidad <- aggregate(Cantidad ~ Vendedor, data = ventas_completadas, FUN = sum)
vendedor_monto <- aggregate(Total ~ Vendedor, data = ventas_completadas, FUN = sum)

resultado_vendedores <- merge(vendedor_cantidad, vendedor_monto, by = "Vendedor")
colnames(resultado_vendedores) <- c("Vendedor", "Cantidad_Total", "Monto_Total")

promedio_por_vendedor <- aggregate(Cantidad ~ Vendedor, data = ventas_completadas, FUN = mean)
resultado_vendedores$Promedio_x_Venta <- round(promedio_por_vendedor$Cantidad, 2)

grid.newpage()
grid.draw(tableGrob(resultado_vendedores, 
                    theme = ttheme_minimal(
                      base_size = 11,
                      core = list(bg_params = list(fill = c("#F2F2F2", "#FFFFFF"), col = "black"),
                                  fg_params = list(hjust = 0, x = 0.05)),
                      colhead = list(fg_params = list(col = "white"),
                                     bg_params = list(fill = "#2E86AB"))
                    )))

# Medidas de tendencia central para Total
media_total <- mean(DataSet$Total)
mediana_total <- median(DataSet$Total)
moda_total <- as.numeric(names(sort(-table(DataSet$Total))[1]))

# Medidas de variabilidad para Total
rango_total <- range(DataSet$Total)
rango_diferencia <- max(DataSet$Total) - min(DataSet$Total)
desviacion_estandar_total <- sd(DataSet$Total)
varianza_total <- var(DataSet$Total)

# Crear tabla de resultados
resultados_total <- data.frame(
  Medida = c("Media", "Mediana", "Moda", "Rango (diferencia)", "Desviación Estándar", "Varianza"),
  Valor = c(media_total, mediana_total, moda_total, rango_diferencia, desviacion_estandar_total, varianza_total)
)

resultados_total$Valor <- round(resultados_total$Valor, 2)

# Mostrar tabla
resultados_total

# Tabla formateada bonita
grid.newpage()
grid.draw(tableGrob(resultados_total, 
                    theme = ttheme_minimal(
                      base_size = 11,
                      core = list(bg_params = list(fill = c("#F2F2F2", "#FFFFFF"), col = "black"),
                                  fg_params = list(hjust = 0, x = 0.05)),
                      colhead = list(fg_params = list(col = "white"),
                                     bg_params = list(fill = "#2E86AB"))
                    )))
