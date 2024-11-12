/*
  Warnings:

  - You are about to drop the column `carrito_id` on the `usuario` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[usuario_id]` on the table `carrito` will be added. If there are existing duplicate values, this will fail.

*/
-- DropForeignKey
ALTER TABLE `usuario` DROP FOREIGN KEY `usuario_carrito_id_fkey`;

-- AlterTable
ALTER TABLE `usuario` DROP COLUMN `carrito_id`;

-- CreateIndex
CREATE UNIQUE INDEX `carrito_usuario_id_key` ON `carrito`(`usuario_id`);

-- AddForeignKey
ALTER TABLE `carrito` ADD CONSTRAINT `carrito_usuario_id_fkey` FOREIGN KEY (`usuario_id`) REFERENCES `usuario`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
