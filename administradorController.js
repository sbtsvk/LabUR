import { Administrador } from "../model/administradorModel.js";

export const obtenerAdministradores = async (peticion, respuesta) => {
    try {
        let administradores = await Administrador.find();
        respuesta.status(200).render("index", { administradores });
    } catch (error) {
        console.log(error);
    }
};

export const crearAdministrador = async (peticion, respuesta) => {
    try {weticion.body;
        await Administrador.create(data);
        let administradores = await Administrador.find();
        respuesta.status(200).render("index", { administradores });
    } catch (error) {
        console.log(error);
    }
};

export const modificarAdministrador = async (req, res) => {
    try {
        const { idAdministrador, nombreAdministrador, correo } = req.body;

        const administrador = await Administrador.findById(idAdministrador);

        if (administrador) {
            administrador.nombreAdministrador = nombreAdministrador;
            administrador.correo = correo;

            await administrador.save();

            return res.status(200).json({ mensaje: "Administrador actualizado con éxito", administrador });
        } else {
            return res.status(404).json({ mensaje: "Administrador no encontrado" });
        }
    } catch (error) {
        console.log(error);
        return res.status(500).json({ mensaje: "Hubo un error al modificar el administrador", error });
    }
};

export const eliminarAdministrador = async (req, res) => {
    try {
        const { idAdministrador } = req.body;

        const administrador = await Administrador.findById(idAdministrador);

        if (administrador) {
            await administrador.remove();

            return res.status(200).json({ mensaje: "Administrador eliminado con éxito" });
        } else {
            return res.status(404).json({ mensaje: "Administrador no encontrado" });
        }
    } catch (error) {
        console.log(error);
        return res.status(500).json({ mensaje: "Hubo un error al eliminar el administrador", error });
    }
};