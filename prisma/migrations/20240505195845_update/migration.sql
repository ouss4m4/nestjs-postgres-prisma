/*
  Warnings:

  - You are about to drop the column `slug` on the `Client` table. All the data in the column will be lost.
  - You are about to drop the column `slug` on the `User` table. All the data in the column will be lost.

*/
-- DropIndex
DROP INDEX "Client_slug_key";

-- DropIndex
DROP INDEX "User_slug_key";

-- AlterTable
ALTER TABLE "Client" DROP COLUMN "slug",
ALTER COLUMN "business_name" DROP NOT NULL,
ALTER COLUMN "company_address" DROP NOT NULL,
ALTER COLUMN "company_email" DROP NOT NULL,
ALTER COLUMN "company_id" DROP NOT NULL,
ALTER COLUMN "tax_id" DROP NOT NULL,
ALTER COLUMN "status" SET DEFAULT 1,
ALTER COLUMN "created_at" SET DEFAULT CURRENT_TIMESTAMP,
ALTER COLUMN "updated_at" SET DEFAULT CURRENT_TIMESTAMP;

-- AlterTable
ALTER TABLE "User" DROP COLUMN "slug";
