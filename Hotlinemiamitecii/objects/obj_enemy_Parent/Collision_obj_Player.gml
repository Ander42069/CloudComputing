/// Colisión con obj_Player
if (other == obj_Player) {
    // Restar salud al jugador u otras acciones
    other.health -= 0; // Por ejemplo, si el jugador tiene una variable de salud llamada "health"
    
    // Verificar si el jugador ha perdido toda su salud
    if (other.health <= 0) {
        // Si el jugador ha perdido toda su salud, destruir el objeto obj_Player
        instance_destroy(other);
        // Reiniciar la sala
        room_restart();
    }
    
    // Destruir el disparo del obj_enemy
    instance_destroy();
}
