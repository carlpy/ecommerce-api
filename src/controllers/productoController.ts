import { Request, Response } from "express";
import productoService from "../services/productoService";

class ProductController {
  async getAllProducts(req: Request, res: Response): Promise<void> {
    try {
      const products = await productoService.getAllProducts();
      res.status(200).json(products);
    } catch (e) {
      res.status(500).json({ error: "Error fetching the products" });
    }
  }

  async getProduct(req: Request, res: Response): Promise<void> {
    try {
			const id = parseInt(req.params.id)
      const products = await productoService.getProduct(id);
      res.status(200).json(products);
    } catch (e) {
      res.status(500).json({ error: "Error fetching the product" });
    }
  }

  async createProduct(req: Request, res: Response): Promise<void> {
    try {
			const data = req.body;
      const products = await productoService.createProduct(data);
      res.status(200).json(products);
    } catch (e) {
      res.status(500).json({ error: "Error creating the product" });
    }
  }

	async updateProduct(req: Request, res: Response): Promise<void> {
		try {
			const data = req.body; 
			const updatedProduct = await productoService.updateProduct(data)
			res.status(201).json(updatedProduct)
		} catch (e) {
			res.status(500).json({error: "Error updating the product"})
		}
	}

	async deleteProduct(req: Request, res: Response): Promise<void> {
		try {
			const id = parseInt(req.params.id)
			const deletedProduct = await productoService.deleteProduct(id)
			res.status(200).json(deletedProduct)
		} catch(e) {
			res.status(500).json({error: "Error deleting the product"})
		}
	}
}

export default new ProductController();