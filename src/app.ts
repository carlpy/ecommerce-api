import express from "express";
import morgan from "morgan";
import cors from "cors";

/* Routes */
import userRoutes from './routes/usuarioRoutes'
import productoRoutes from './routes/productoRoutes'

const app = express();

/* Middlewares */
app.use(morgan("dev"));
app.use(cors({ origin: "*" }));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

/* Routes */
app.use("/api", userRoutes);
app.use("/api", productoRoutes);


export { app };
