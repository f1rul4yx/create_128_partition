# Create Partition

Este script te permite crear las particiones que usted quiera en un dispositivo de bloque.

## Funciones

### verificar_root()

- Verifica si el script se está ejecutando con privilegios de superusuario (root). Si no, el script debe salir con un mensaje de error.

### establecer_dispositivo()

- Configura el dispositivo de bloque para usarlo posteriormente.

### verificar_dispositivo()

- Verifica que el dispositivo introducido en `establecer_dispositivo` exista.

### verificar_almacenamiento()

- Verifica que tamaño tiene el dispositivo.

### generar_particiones()

- Genera 128 particiones teniendo en cuenta el almacenamiento devuelto en `verificar_almacenamiento`.
