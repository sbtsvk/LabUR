import mongoose, { Schema } from 'mongoose';

const usuariosistemaSchema = new Schema({
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
        type: Boolean,
        default: true
    }
});
const Usuariosistema = mongoose.model('Usuariosistema', usuariosistemaSchema);


export {Usuariosistema};
