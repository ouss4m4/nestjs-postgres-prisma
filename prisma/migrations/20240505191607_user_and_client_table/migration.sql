-- CreateTable
CREATE TABLE "Client" (
    "id" SERIAL NOT NULL,
    "uuid" TEXT NOT NULL,
    "client_type" INTEGER NOT NULL,
    "client_group" INTEGER,
    "name" TEXT NOT NULL,
    "business_name" TEXT NOT NULL,
    "company_address" TEXT NOT NULL,
    "company_email" TEXT NOT NULL,
    "company_id" TEXT NOT NULL,
    "tax_id" TEXT NOT NULL,
    "slug" TEXT NOT NULL,
    "billing_type" INTEGER,
    "margin" DOUBLE PRECISION NOT NULL DEFAULT 0.00,
    "scrub" DOUBLE PRECISION NOT NULL DEFAULT 0.00,
    "cost_export_via" INTEGER,
    "is_balance_capped" INTEGER,
    "negative_balance_limit" DOUBLE PRECISION DEFAULT 0.0000,
    "notes" TEXT,
    "timezone" TEXT NOT NULL DEFAULT 'UTC',
    "use_interstitial" INTEGER,
    "status" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3),
    "updated_at" TIMESTAMP(3),
    "deleted_at" TIMESTAMP(3),

    CONSTRAINT "Client_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User" (
    "id" INTEGER NOT NULL,
    "uuid" TEXT NOT NULL,
    "role_id" INTEGER NOT NULL DEFAULT 1,
    "client_id" INTEGER,
    "name" TEXT NOT NULL,
    "slug" TEXT NOT NULL,
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

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Client_uuid_key" ON "Client"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "Client_slug_key" ON "Client"("slug");

-- CreateIndex
CREATE UNIQUE INDEX "User_id_key" ON "User"("id");

-- CreateIndex
CREATE UNIQUE INDEX "User_slug_key" ON "User"("slug");

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_client_id_fkey" FOREIGN KEY ("client_id") REFERENCES "Client"("id") ON DELETE SET NULL ON UPDATE CASCADE;
