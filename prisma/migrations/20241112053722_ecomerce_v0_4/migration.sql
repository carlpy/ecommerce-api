-- DropForeignKey
ALTER TABLE `carrito` DROP FOREIGN KEY `carrito_usuario_id_fkey`;

-- AddForeignKey
ALTER TABLE `carrito` ADD CONSTRAINT `carrito_usuario_id_fkey` FOREIGN KEY (`usuario_id`) REFERENCES `usuario`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
