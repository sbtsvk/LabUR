import { Usuariosistema } from "../model/usuariosistemaModel.js";

export const obtenerUsuario = async (peticion, respuesta) => {
    try {
        let usuarios = await Usuariosistema.find();

        // Convertir estadoUsuario a booleano
        usuarios = usuarios.map(usuario => {
            usuario.estadoUsuario = usuario.estadoUsuario === 1 ? true : false;
            return usuario;
        });

        respuesta.status(200).render("index", { usuarios });
    } catch (error) {
        console.error(error);
        respuesta.status(500).json({ mensaje: "Error al obtener los usuarios", error });
    }
};


export const modificarUsuario = async (req, res) => {
    try {
        // Aquí usamos req.params para obtener el id del usuario desde la URL
        const { id } = req.params;
        const { nombreUsuario, tipoUsuario, correo, estadoUsuario } = req.body;

        const usuario = await Usuariosistema.findById(id);

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
        return res.status(500).json({ mensaje: "Error al modificar el usuario", error });
    }
};

export const crearUsuario = async (peticion, respuesta) => {
    try {
        let data = peticion.body;

        // Convertir estadoUsuario a 0 o 1
        if (data.estadoUsuario === true) {
            data.estadoUsuario = 1;
        } else if (data.estadoUsuario === false) {
            data.estadoUsuario = 0;
        }

        // Crear el usuario en la base de datos
        await Usuariosistema.create(data);
        let usuarios = await Usuariosistema.find();
        respuesta.status(200).render("index", { usuarios });
    } catch (error) {
        console.log(error);
        respuesta.status(500).json({ mensaje: "Error al crear el usuario", error });
    }
};


export const eliminarUsuario = async (req, res) => {
    try {
        // Usamos req.params para obtener el id desde la URL
        const { id } = req.params;

        const usuario = await Usuariosistema.findById(id);

        if (usuario) {
            await usuario.remove();
            return res.status(200).json({ mensaje: "Usuario eliminado con éxito" });
        } else {
            return res.status(404).json({ mensaje: "Usuario no encontrado" });
        }
    } catch (error) {
        console.log(error);
        return res.status(500).json({ mensaje: "Error al eliminar el usuario", error });
    }
};

