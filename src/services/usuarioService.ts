import prisma from "../models/prismaClient";
import { userData } from "../types/users";

class UserService {
  async getAllUsers() {
    return prisma.usuario.findMany({
      include: {
        rol: true,
      },
    });
  }

  async getUser(id: number) {
    return prisma.usuario.findUnique({
      where: {
        id,
      },
    });
  }

  async createUserAndCar(data: userData) {
    return prisma.$transaction(async (prisma) => {
      const user = await prisma.usuario.create({
        data,
      });

      const cart = await prisma.carrito.create({
        data: {
          total: 0,
          usuario_id: user.id,
        },
      });

      return {
        user,
        cart,
      };
    });
  }

  async updateUser(updateData: userData) {
    const { id, nombre, direccion, email, pais, password, rol_id, url_imagen } = updateData;

    return prisma.usuario.update({
      where: {
        id,
      },
      data: {
        nombre,
        direccion,
        email,
        pais,
        password,
        rol_id,
        url_imagen,
      },
    });
  }

  async deleteUser(id: number) {
    return prisma.usuario.delete({
      where: {
        id,
      }
    });
  }
}

export default new UserService();
