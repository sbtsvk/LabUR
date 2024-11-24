import mongoose, { Schema } from 'mongoose';

// Esquema de Administrador
const administradorSchema = new Schema({
    nombreAdministrador: {
        type: String,
        required: true
    },
    correo: {
        type: String,
        required: true
    }
});
const Administrador = mongoose.model('Administrador', administradorSchema);

export {Administrador};
