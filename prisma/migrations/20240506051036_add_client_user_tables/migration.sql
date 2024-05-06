-- CreateTable
CREATE TABLE "Client" (
    "id" SERIAL NOT NULL,
    "uuid" TEXT NOT NULL,
    "client_type" INTEGER NOT NULL,
    "client_group" INTEGER,
    "name" TEXT NOT NULL,
    "business_name" TEXT,
    "company_address" TEXT,
    "company_email" TEXT,
    "company_id" TEXT,
    "tax_id" TEXT,
    "billing_type" INTEGER,
    "margin" DOUBLE PRECISION NOT NULL DEFAULT 0.00,
    "scrub" DOUBLE PRECISION NOT NULL DEFAULT 0.00,
    "cost_export_via" INTEGER,
    "is_balance_capped" INTEGER,
    "negative_balance_limit" DOUBLE PRECISION DEFAULT 0.0000,
    "notes" TEXT,
    "timezone" TEXT NOT NULL DEFAULT 'UTC',
    "use_interstitial" INTEGER,
    "status" INTEGER NOT NULL DEFAULT 1,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3),
    "managerId" INTEGER,
    "salesRepId" INTEGER,

    CONSTRAINT "Client_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User" (
    "id" SERIAL NOT NULL,
    "uuid" TEXT NOT NULL,
    "role_id" INTEGER NOT NULL DEFAULT 1,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "email_verified_at" TIMESTAMP(3),
    "password" TEXT NOT NULL,
    "slack_id" TEXT,
    "status" INTEGER NOT NULL DEFAULT 3,
    "img_url" TEXT,
    "remember_token" TEXT,
    "created_at" TIMESTAMP(3),
    "updated_at" TIMESTAMP(3),
    "deleted_at" TIMESTAMP(3),
    "last_login" TIMESTAMP(3),
    "clientId" INTEGER,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Client_uuid_key" ON "Client"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- AddForeignKey
ALTER TABLE "Client" ADD CONSTRAINT "Client_managerId_fkey" FOREIGN KEY ("managerId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Client" ADD CONSTRAINT "Client_salesRepId_fkey" FOREIGN KEY ("salesRepId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_clientId_fkey" FOREIGN KEY ("clientId") REFERENCES "Client"("id") ON DELETE SET NULL ON UPDATE CASCADE;
