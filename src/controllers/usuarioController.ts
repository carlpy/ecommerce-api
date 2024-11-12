import { Request, Response } from "express";
import usuarioService from "../services/usuarioService";

class UsuarioController {
  async getAllUsers(req: Request, res: Response): Promise<void> {
    try {
      const users = await usuarioService.getAllUsers();
      res.json(users);
    } catch (error) {
      res.status(500).json({ error: "Error fetching users" });
    }
  }

  async getUser(req: Request, res: Response): Promise<void> {
    try {
      const id = parseInt(req.params.id);
      const user = await usuarioService.getUser(id);
      res.json(user);
    } catch (error) {
      res.status(500).json({ error: "Error fetching user" });
    }
  }

  async createUser(req: Request, res: Response): Promise<void> {
    try {
      const userData = req.body;
      const newUser = await usuarioService.createUserAndCar(userData);
      res.status(201).json(newUser);
    } catch (error) {
      res.status(500).json({ error: "Error Creating user" });
    }
  }

  async updateUser(req: Request, res: Response): Promise<void> {
    try {
      const updateData = req.body;
      const updatedUser = await usuarioService.updateUser(updateData);
      res.status(200).json(updatedUser);
    } catch (error) {
      res.status(500).json({ error: "Error Updating user" });
    }
  }

  async deleteUser(req: Request, res: Response): Promise<void> {
    try {
      const id = parseInt(req.params.id);
      const deletedUser = await usuarioService.deleteUser(id);
      res.status(200).json(deletedUser);
    } catch (e) {
      res.status(500).json({ error: "Error Deleting user" });
    }
  }
}

export default new UsuarioController();
