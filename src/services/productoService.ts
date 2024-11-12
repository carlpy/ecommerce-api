import prisma from "../models/prismaClient";
import { productData } from "../types/products";

class ProductService {
  async getAllProducts() {
    return prisma.producto.findMany({});
  }

  async getProduct(id: number) {
    return prisma.producto.findUnique({
      where: {
        id,
      },
    });
  }

  async createProduct(data: productData) {
    return prisma.producto.create({
      data,
    });
  }

  async updateProduct(data: productData) {
    const { id, nombre, descripcion, precio, categoria_id, valoracion, url_imagen } = data;

    return prisma.producto.update({
      where: {
        id,
      },
      data: {
				nombre, descripcion, precio, categoria_id, valoracion, url_imagen 
			},
    });
  }

	async deleteProduct(id: number) {
		return prisma.producto.delete({
			where: {
				id
			}
		})
	}
}

export default new ProductService();
