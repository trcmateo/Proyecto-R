# 📊 Análisis de Ventas - Quantum Gadgets

## 👥 Integrantes  
**J Castro, M Rojas, S Gómez, M Ramírez, S Álvarez**

## 📋 Introducción  
Análisis de datos de ventas de "Quantum Gadgets" para identificar tendencias, evaluar vendedores, optimizar inventario y medir efectividad de promociones usando R.

## 🚀 Ejecución Rápida

```r
# 1. Colocar DataSet.csv en la carpeta data/
# 2. Ejecutar en R:
source("scripts/analisis_ventas.R")
# 3. Resultados se mostrarán automáticamente
```

## 📁 Estructura de Archivos
```
quantum-gadgets-analysis/
├── data/
│   └── DataSet.csv                 # Base de datos original
├── scripts/
│   └── analisis_ventas.R           # Código completo de análisis
├── results/                        # (Se genera al ejecutar)
│   ├── tablas/                     # Tablas formateadas
│   └── graficos/                   # Gráficos generados
└── README.md
```

## ⚙️ Requisitos Previos
```r
# Instalar paquete necesario (una vez):
install.packages("gridExtra")
```

## 📊 Variables Analizadas
- **Producto**: Laptops, Tabletas, Teléfonos  
- **Cantidad**: Unidades por transacción (1-9)
- **Precio_Unitario** y **Total**
- **Descuento**: 0%, 5%, 10% o "Sin Descuento"
- **Vendedor**: Carlos, Maria, Juan
- **Ubicación**: Local vs En línea
- **Forma_Pago**: Efectivo, Tarjeta
- **Estado**: Completo, Pendiente, Cancelado
- **Fecha**: Serie temporal de 1 año

## 🔍 Análisis Incluidos
- ✅ Tablas de frecuencia profesionales
- ✅ Gráficos por tipo de variable
- ✅ Ventas completadas vs otras
- ✅ Performance por vendedor
- ✅ Métodos de pago preferidos
- ✅ Medidas de tendencia central
- ✅ Análisis de dispersión de datos

## 🎯 Resultados Esperados
Optimización de operaciones, estrategias de reposición, reconocimiento de vendedores destacados y decisiones estratégicas para el crecimiento de Quantum Gadgets.

---

**Desarrollado con R y gridExtra**  
*Para fines académicos y de análisis estadístico*