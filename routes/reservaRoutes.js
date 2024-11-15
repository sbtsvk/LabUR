import { Router } from "express";
import { crearReserva, obtenerReservas } from "../controller/reservaController.js";
const router = Router()

router.get('/reservas', obtenerReservas)
router.post('/reservas', crearReserva)


export default router;
