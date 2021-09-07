# DATA FRAMES, ARCHIVOS Y MATRICES

#DATAFRAMES
# Podemos construir un dataframe con data.frame(), por ejemplo, con dos vectores
data.frame(x = c(1, 2, 3) , y = c(1.5, 5.5, 7.5))

# ARCHIVOS
# Para CREAR UN DIRECTORIO utilizamos dir.create()
# Si lo utilizamos sin más lo crea en el raíz del working directory
dir.create("destination_folder")

# Si lo que queremos es crearlo en un subdirectorio primero guardamos la ruta actual
# para poder volver más tarde
old.dir <- getwd()
# Entonces fijamos como working directory el subdirectorio
setwd("Week_2")
# y ya creamos el nuevo directorio
dir.create("destination_folder")
# Para volver a fijar el working directory en el inicial
setwd(old.dir)
# Comprovamos
getwd()

# Podemos CREAR ARCHIVOS con file.create
# Recordar que para crearlos en Week_2 primero lo tenemos que fijar como working directory
setwd("Week_2")
# Los archivos que creemos estarán en Week_2
# Podemos crear un txt
file.create ("new_text_file.txt") 
# Un doc
file.create ("new_word_file.docx") 
# Un CSV
file.create ("new_csv_file.csv") 

# Para COPIAR ARCHIVOS usaremos file.copy() indicando el archivo a copiar y destino
# Para copiar en Destination_Folder
file.copy ("new_text_file.txt" , "destination_folder")
# Si lo que queremos es borrarlo usamos unlink()
unlink("new_text_file.txt") # aquí borramos el que hay en Week_2
# Si queremos borrar el que hay en destination_folder debemos fijar primero WD

# MATRICES
# Para crear una matriz utilizamos matrix()
# En dos filas
matrix(c(3:8), nrow = 2)
# en dos columnas
matrix(c(3:8), ncol = 2)
