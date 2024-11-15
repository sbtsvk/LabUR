import { Router } from "express";
import { crearUsuario, obtenerUsuario, modificarUsuario, eliminarUsuario } from "../controller/usuariosistemaController.js";
const router = Router()

router.get('/usuariosistema', obtenerUsuario)
router.post('/usuariosistema', crearUsuario)
router.put('/usuariosistema/:id', modificarUsuario)
router.delete('/usuariosistema/:id',eliminarUsuario)


export default router;