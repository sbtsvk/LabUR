import { Router } from "express";
import { crearUsuario, obtenerUsuario, modificarUsuario, eliminarUsuario } from "../controller/usuariosistemaController.js";

const router = Router();

// Aquí no es necesario repetir "usuariosistema" en la ruta
router.get("/", obtenerUsuario);  // Esta será la ruta /usuariosistema
router.post("/", crearUsuario);  // Esta será la ruta /usuariosistema
router.put("/:id", modificarUsuario);  // Esta será la ruta /usuariosistema/:id
router.delete("/:id", eliminarUsuario);  // Esta será la ruta /usuariosistema/:id

export default router;
