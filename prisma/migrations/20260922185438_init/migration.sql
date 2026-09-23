-- CreateEnum
CREATE TYPE "UserRole" AS ENUM ('CAFE', 'DISTRIBUTOR', 'SUPPLIER');

-- CreateEnum
CREATE TYPE "OrderStatus" AS ENUM ('PENDING', 'ACCEPTED', 'PROCESSING', 'DISPATCHED', 'DELIVERED', 'CANCELLED');

-- CreateTable
CREATE TABLE "User" (
    "username" TEXT NOT NULL,
    "uid" SERIAL NOT NULL,
    "email" TEXT NOT NULL,
    "passwordHash" TEXT NOT NULL,
    "role" "UserRole" NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("uid")
);

-- CreateTable
CREATE TABLE "Cafe" (
    "cid" SERIAL NOT NULL,
    "dateOfReg" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "uid" INTEGER NOT NULL,

    CONSTRAINT "Cafe_pkey" PRIMARY KEY ("cid")
);

-- CreateTable
CREATE TABLE "Distributor" (
    "did" SERIAL NOT NULL,
    "dateOfReg" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "uid" INTEGER NOT NULL,

    CONSTRAINT "Distributor_pkey" PRIMARY KEY ("did")
);

-- CreateTable
CREATE TABLE "Supplier" (
    "sid" SERIAL NOT NULL,
    "dateOfReg" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "uid" INTEGER NOT NULL,

    CONSTRAINT "Supplier_pkey" PRIMARY KEY ("sid")
);

-- CreateTable
CREATE TABLE "Product" (
    "pid" SERIAL NOT NULL,
    "pname" TEXT NOT NULL,
    "price" DECIMAL(65,30) NOT NULL,

    CONSTRAINT "Product_pkey" PRIMARY KEY ("pid")
);

-- CreateTable
CREATE TABLE "Order" (
    "oid" SERIAL NOT NULL,
    "cid" INTEGER NOT NULL,
    "did" INTEGER NOT NULL,
    "status" "OrderStatus" NOT NULL DEFAULT 'PENDING',

    CONSTRAINT "Order_pkey" PRIMARY KEY ("oid")
);

-- CreateTable
CREATE TABLE "Inventory" (
    "pid" INTEGER NOT NULL,
    "stock" INTEGER NOT NULL,

    CONSTRAINT "Inventory_pkey" PRIMARY KEY ("pid")
);

-- CreateTable
CREATE TABLE "OrderProduct" (
    "oid" INTEGER NOT NULL,
    "pid" INTEGER NOT NULL,
    "quantity" INTEGER NOT NULL,
    "priceAtOrderPlaced" DECIMAL(65,30) NOT NULL,

    CONSTRAINT "OrderProduct_pkey" PRIMARY KEY ("oid","pid")
);

-- CreateTable
CREATE TABLE "ProductSupplier" (
    "pid" INTEGER NOT NULL,
    "sid" INTEGER NOT NULL,
    "moq" INTEGER NOT NULL,
    "purchasePrice" DECIMAL(65,30) NOT NULL,

    CONSTRAINT "ProductSupplier_pkey" PRIMARY KEY ("sid","pid")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Cafe_uid_key" ON "Cafe"("uid");

-- CreateIndex
CREATE UNIQUE INDEX "Distributor_uid_key" ON "Distributor"("uid");

-- CreateIndex
CREATE UNIQUE INDEX "Supplier_uid_key" ON "Supplier"("uid");

-- AddForeignKey
ALTER TABLE "Cafe" ADD CONSTRAINT "Cafe_uid_fkey" FOREIGN KEY ("uid") REFERENCES "User"("uid") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Distributor" ADD CONSTRAINT "Distributor_uid_fkey" FOREIGN KEY ("uid") REFERENCES "User"("uid") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Supplier" ADD CONSTRAINT "Supplier_uid_fkey" FOREIGN KEY ("uid") REFERENCES "User"("uid") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Order" ADD CONSTRAINT "Order_cid_fkey" FOREIGN KEY ("cid") REFERENCES "Cafe"("cid") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Order" ADD CONSTRAINT "Order_did_fkey" FOREIGN KEY ("did") REFERENCES "Distributor"("did") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Inventory" ADD CONSTRAINT "Inventory_pid_fkey" FOREIGN KEY ("pid") REFERENCES "Product"("pid") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OrderProduct" ADD CONSTRAINT "OrderProduct_oid_fkey" FOREIGN KEY ("oid") REFERENCES "Order"("oid") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OrderProduct" ADD CONSTRAINT "OrderProduct_pid_fkey" FOREIGN KEY ("pid") REFERENCES "Product"("pid") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProductSupplier" ADD CONSTRAINT "ProductSupplier_pid_fkey" FOREIGN KEY ("pid") REFERENCES "Product"("pid") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProductSupplier" ADD CONSTRAINT "ProductSupplier_sid_fkey" FOREIGN KEY ("sid") REFERENCES "Supplier"("sid") ON DELETE RESTRICT ON UPDATE CASCADE;
