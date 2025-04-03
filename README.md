# Create Partition

Este script te permite crear las particiones que usted quiera en un dispositivo de bloque.

## Funciones

### verificar_root()

- Verifica si el script se está ejecutando con privilegios de superusuario (root). Si no, el script debe salir con un mensaje de error.

### establecer_dispositivo()

- Pide al usuario el dispositivo de bloque y mira en el sistema si esta disponible

### generar_particiones()

- Genera 128 particiones teniendo en cuenta el almacenamiento devuelto en `verificar_almacenamiento`.

### eliminar_particiones()

- Elimina las particiones creadas previamente en el dispositivo asignado por el usuario.

### menu()

- Establece un menu y a través de una estructura condicional case, se ejecutan funciones diferentes.

### main()

- Esta es la llamada al programa completo.
