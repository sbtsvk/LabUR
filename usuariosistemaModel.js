import mongoose, { Schema } from 'mongoose';

const usuariosistemaSchema = new mongoose.Schema({
    nombreUsuario: {
        type: String,
        required: true
    },
    tipoUsuario: {
        type: String,
        required: true
    },
    correo: {
        type: String,
        required: true
    },
    estadoUsuario: {
        type: Number,  // Acepta 0 y 1
        default: 1  // Puedes poner 1 como valor por defecto (activo)
    }
});


const Usuariosistema = mongoose.model('Usuariosistema', usuariosistemaSchema);


export {Usuariosistema};
