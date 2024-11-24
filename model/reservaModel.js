import mongoose, { Schema } from 'mongoose';


// Esquema de Reserva
const reservaSchema = new Schema({
    fechaReserva: {
        type: Date,
        required: true
    },
    horaInicio: {
        type: String
    },
    horaFin: {
        type: String
    },
    estadoReserva: {
        type: Boolean,
        default: true
    }
});
const Reserva = mongoose.model('Reserva', reservaSchema);

export {Reserva};
