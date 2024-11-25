import { Router } from "express";
import { crearDatos, obtenerDatos } from "../controller/administradorController.js";
const router = Router()

router.get('/administradores', obtenerDatos)
router.post('/administradores', crearDatos)


export default router;