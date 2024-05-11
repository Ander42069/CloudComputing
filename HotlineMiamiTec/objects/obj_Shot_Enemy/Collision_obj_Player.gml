// Colocar este código donde sea relevante en tu objeto

// Crear instancia de obj_Effect_Hit
instance_create_layer(x, y, "Instances", obj_Effect_Hit);

// Destruir el enemigo
instance_destroy(other.id);

// Destruir el disparo
instance_destroy();

// Reiniciar la sala
room_restart();
