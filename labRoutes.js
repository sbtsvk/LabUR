import { Router } from "express";
import { crearDatos, obtenerDatos } from "../controller/labController.js";
const router = Router()

router.get('/laboratorios', obtenerDatos)
router.post('/laboratorios', crearDatos)


export default router;