import {Usuariosistema} from "../model/usuariosistemaModel.js";

export const obtenerUsuario = async (peticion, respuesta) => {
    try {
        let usuarios = await Usuariosistema.find()
        respuesta.status(200).render("index", { usuarios })
    } catch (error) {
        console.log(error);
    }
}
export const crearUsuario = async (peticion, respuesta) => {
    try {
        let data = peticion.body
        await Usuariosistema.create(data)
        let usuarios = await Usuariosistema.find()
        respuesta.status(200).render("index", {usuarios})
    } catch (error) {
        console.log(error);
    }
}

export const modificarUsuario = async (req, res) => {
    try {
        const { idUsuario, nombreUsuario, tipoUsuario, correo, estadoUsuario } = req.body;

        const usuario = await Usuariosistema.findById(idUsuario);

        if (usuario) {
            usuario.nombreUsuario = nombreUsuario;
            usuario.tipoUsuario = tipoUsuario;
            usuario.correo = correo;
            usuario.estadoUsuario = estadoUsuario;

            await usuario.save();

            return res.status(200).json({ mensaje: "Usuario actualizado con éxito", usuario });
        } else {
            return res.status(404).json({ mensaje: "Usuario no encontrado" });
        }
    } catch (error) {
        console.log(error);
        return res.status(500).json({ mensaje: "Hubo un error al modificar el usuario", error });
    }
};

export const eliminarUsuario = async (req, res) => {
    try {
        const { idUsuario } = req.body;

        const usuario = await Usuariosistema.findById(idUsuario);

        if (usuario) {
            await usuario.remove();
            return res.status(200).json({ mensaje: "Usuario eliminado con éxito" });
        } else {
            return res.status(404).json({ mensaje: "Usuario no encontrado" });
        }
    } catch (error) {
        console.log(error);
        return res.status(500).json({ mensaje: "Hubo un error al eliminar el usuario", error });
    }
};
