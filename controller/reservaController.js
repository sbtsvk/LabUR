import { Reserva } from "../model/reservaModel.js";

export const obtenerReservas = async (peticion, respuesta) => {
    try {
        let reservas = await Reserva.find();
        respuesta.status(200).render("index", { reservas });
    } catch (error) {
        console.log(error);
    }
};

export const crearReserva = async (peticion, respuesta) => {
    try {
        let data = peticion.body;
        await Reserva.create(data);
        let reservas = await Reserva.find();
        respuesta.status(200).render("index", { reservas });
    } catch (error) {
        console.log(error);
    }
};

export const cancelarReserva = async (peticion, respuesta) => {
    try {
        const { id } = peticion.params; 
        await Reserva.findByIdAndDelete(id);
        let reservas = await Reserva.find();
        respuesta.status(200).render("index", { reservas });
    } catch (error) {
        console.log(error);
        respuesta.status(500).json({ mensaje: "Error al cancelar la reserva" });
    }
};

export const modificarReserva = async (req, res) => {
    try {
        const { idReserva, nuevaReserva } = req.body;

        const reserva = await Reserva.findById(idReserva);

        if (reserva) {
            reserva.fechaReserva = nuevaReserva.fechaReserva;
            reserva.horaInicio = nuevaReserva.horaInicio;
            reserva.horaFin = nuevaReserva.horaFin;
            reserva.estadoReserva = nuevaReserva.estadoReserva;

            await reserva.save();

            return res.status(200).json({ mensaje: "Reserva actualizada con éxito", reserva });
        } else {
            return res.status(404).json({ mensaje: "Reserva no encontrada" });
        }
    } catch (error) {
        console.log(error);
        return res.status(500).json({ mensaje: "Hubo un error al modificar la reserva", error });
    }
};
