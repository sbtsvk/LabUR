import mongoose, { Schema } from 'mongoose';

// Esquema de Laboratorio
const laboratorioSchema = new Schema({
    nombreLaboratorio: {
        type: String,
        required: true
    },
    capacidad: {
        type: Number,
        required: true
    },
    ubicacion: {
        type: String,
        required: true
    },
    estadoLaboratorio: {
        type: Boolean,
        default: true
    }
});
const Laboratorio = mongoose.model('Laboratorio', laboratorioSchema);

export {Laboratorio};
