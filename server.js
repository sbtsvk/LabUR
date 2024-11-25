import { config } from "dotenv";
import express from "express";
import path from "path";

import { __dirname } from "./util/__dirname.js";
import { connectDatabase } from "./config/database.js";
import usuariosistemaRoutes from './routes/usuariosistemaRoutes.js';

config();

// Conexión a la base de datos
connectDatabase()
    .then(() => {
        console.log("Conexión Base de Datos Exitosa");
    })
    .catch((error) => {
        console.error("Error al conectar a la Base de Datos:", error);
        process.exit(1);
    });

// Configuración del servidor
const server = express();
const PORT = process.env.PORT || 3000;

// Middlewares
server.use(express.urlencoded({ extended: true })); // Para manejar datos de formularios
server.use(express.json()); // Para manejar solicitudes JSON
server.use(express.static("public")); // Para servir archivos estáticos

// Configuración del motor de plantillas
server.set("view engine", "ejs");
server.set("views", path.join(__dirname, "views"));

// Rutas
server.use("/usuariosistema", usuariosistemaRoutes);

// Iniciar el servidor
server.listen(PORT, () => console.log(`Server running on port ${PORT}`));
