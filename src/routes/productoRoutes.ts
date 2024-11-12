import { Router } from "express";
import productoController from "../controllers/productoController";

const router = Router();

router.get("/products", productoController.getAllProducts);
router.get("/products/:id", productoController.getProduct);
router.post("/products", productoController.createProduct);
router.put("/products", productoController.updateProduct);
router.delete("/products/:id", productoController.deleteProduct);

export default router;
