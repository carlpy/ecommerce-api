import { Router } from "express";
import usuarioController from "../controllers/usuarioController";

const router = Router();

router.get("/users", usuarioController.getAllUsers);
router.get("/users/:id", usuarioController.getUser);
router.post("/users", usuarioController.createUser);
router.put("/users/:id", usuarioController.updateUser);
router.delete("/users/:id", usuarioController.deleteUser);

export default router;
