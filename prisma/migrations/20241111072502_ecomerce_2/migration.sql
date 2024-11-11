/*
  Warnings:

  - You are about to drop the column `costo_total` on the `carrito` table. All the data in the column will be lost.
  - You are about to drop the column `id_usuario` on the `carrito` table. All the data in the column will be lost.
  - The primary key for the `carrito_producto` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `idCarrito` on the `carrito_producto` table. All the data in the column will be lost.
  - You are about to drop the column `idProducto` on the `carrito_producto` table. All the data in the column will be lost.
  - You are about to alter the column `nombre` on the `categorias` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `VarChar(50)`.
  - You are about to drop the column `id_categoria` on the `producto` table. All the data in the column will be lost.
  - You are about to drop the column `precion` on the `producto` table. All the data in the column will be lost.
  - You are about to alter the column `nombre` on the `producto` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `VarChar(50)`.
  - You are about to alter the column `nombre` on the `roles` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `VarChar(50)`.
  - You are about to drop the column `carritoId` on the `usuario` table. All the data in the column will be lost.
  - You are about to alter the column `nombre` on the `usuario` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `VarChar(50)`.
  - You are about to alter the column `email` on the `usuario` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `VarChar(150)`.
  - You are about to alter the column `pais` on the `usuario` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `VarChar(30)`.
  - You are about to alter the column `direccion` on the `usuario` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `VarChar(50)`.
  - Added the required column `total` to the `carrito` table without a default value. This is not possible if the table is not empty.
  - Added the required column `usuario_id` to the `carrito` table without a default value. This is not possible if the table is not empty.
  - Added the required column `carrito_id` to the `carrito_producto` table without a default value. This is not possible if the table is not empty.
  - Added the required column `producto_id` to the `carrito_producto` table without a default value. This is not possible if the table is not empty.
  - Added the required column `categoria_id` to the `producto` table without a default value. This is not possible if the table is not empty.
  - Added the required column `precio` to the `producto` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `carrito_producto` DROP FOREIGN KEY `carrito_producto_idCarrito_fkey`;

-- DropForeignKey
ALTER TABLE `carrito_producto` DROP FOREIGN KEY `carrito_producto_idProducto_fkey`;

-- DropForeignKey
ALTER TABLE `producto` DROP FOREIGN KEY `producto_id_categoria_fkey`;

-- DropForeignKey
ALTER TABLE `usuario` DROP FOREIGN KEY `usuario_carritoId_fkey`;

-- DropForeignKey
ALTER TABLE `usuario` DROP FOREIGN KEY `usuario_rol_id_fkey`;

-- AlterTable
ALTER TABLE `carrito` DROP COLUMN `costo_total`,
    DROP COLUMN `id_usuario`,
    ADD COLUMN `total` INTEGER NOT NULL,
    ADD COLUMN `usuario_id` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `carrito_producto` DROP PRIMARY KEY,
    DROP COLUMN `idCarrito`,
    DROP COLUMN `idProducto`,
    ADD COLUMN `carrito_id` INTEGER NOT NULL,
    ADD COLUMN `producto_id` INTEGER NOT NULL,
    ADD PRIMARY KEY (`producto_id`, `carrito_id`);

-- AlterTable
ALTER TABLE `categorias` MODIFY `nombre` VARCHAR(50) NOT NULL;

-- AlterTable
ALTER TABLE `producto` DROP COLUMN `id_categoria`,
    DROP COLUMN `precion`,
    ADD COLUMN `categoria_id` INTEGER NOT NULL,
    ADD COLUMN `precio` INTEGER NOT NULL,
    MODIFY `nombre` VARCHAR(50) NOT NULL;

-- AlterTable
ALTER TABLE `roles` MODIFY `nombre` VARCHAR(50) NOT NULL;

-- AlterTable
ALTER TABLE `usuario` DROP COLUMN `carritoId`,
    ADD COLUMN `carrito_id` INTEGER NULL,
    MODIFY `nombre` VARCHAR(50) NOT NULL,
    MODIFY `email` VARCHAR(150) NOT NULL,
    MODIFY `password` VARCHAR(200) NOT NULL,
    MODIFY `pais` VARCHAR(30) NOT NULL,
    MODIFY `direccion` VARCHAR(50) NOT NULL,
    MODIFY `rol_id` INTEGER NULL;

-- AddForeignKey
ALTER TABLE `usuario` ADD CONSTRAINT `usuario_rol_id_fkey` FOREIGN KEY (`rol_id`) REFERENCES `roles`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `usuario` ADD CONSTRAINT `usuario_carrito_id_fkey` FOREIGN KEY (`carrito_id`) REFERENCES `carrito`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `carrito_producto` ADD CONSTRAINT `carrito_producto_producto_id_fkey` FOREIGN KEY (`producto_id`) REFERENCES `producto`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `carrito_producto` ADD CONSTRAINT `carrito_producto_carrito_id_fkey` FOREIGN KEY (`carrito_id`) REFERENCES `carrito`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `producto` ADD CONSTRAINT `producto_categoria_id_fkey` FOREIGN KEY (`categoria_id`) REFERENCES `categorias`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
