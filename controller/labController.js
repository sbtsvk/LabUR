import { Laboratorio } from "../model/laboratorioModel.js";

export const obtenerLaboratorios = async (peticion, respuesta) => {
    try {
        let laboratorios = await Laboratorio.find();
        respuesta.status(200).render("index", { laboratorios });
    } catch (error) {
        console.log(error);
    }
};

export const crearLaboratorio = async (peticion, respuesta) => {
    try {
        let data = peticion.body;
        await Laboratorio.create(data);
        let laboratorios = await Laboratorio.find();
        respuesta.status(200).render("index", { laboratorios });
    } catch (error) {
        console.log(error);
    }
};

export const modificarLaboratorio = async (req, res) => {
    try {
        const { idLaboratorio, nombreLaboratorio, capacidad, ubicacion, estadoLaboratorio } = req.body;

        const laboratorio = await Laboratorio.findById(idLaboratorio);

        if (laboratorio) {
            laboratorio.nombreLaboratorio = nombreLaboratorio;
            laboratorio.capacidad = capacidad;
            laboratorio.ubicacion = ubicacion;
            laboratorio.estadoLaboratorio = estadoLaboratorio;

            await laboratorio.save();

            return res.status(200).json({ mensaje: "Laboratorio actualizado con éxito", laboratorio });
        } else {
            return res.status(404).json({ mensaje: "Laboratorio no encontrado" });
        }
    } catch (error) {
        console.log(error);
        return res.status(500).json({ mensaje: "Hubo un error al modificar el laboratorio", error });
    }
};

export const eliminarLaboratorio = async (req, res) => {
    try {
        const { idLaboratorio } = req.body;

        const laboratorio = await Laboratorio.findById(idLaboratorio);

        if (laboratorio) {
            await laboratorio.remove();

            return res.status(200).json({ mensaje: "Laboratorio eliminado con éxito" });
        } else {
            return res.status(404).json({ mensaje: "Laboratorio no encontrado" });
        }
    } catch (error) {
        console.log(error);
        return res.status(500).json({ mensaje: "Hubo un error al eliminar el laboratorio", error });
    }
};
