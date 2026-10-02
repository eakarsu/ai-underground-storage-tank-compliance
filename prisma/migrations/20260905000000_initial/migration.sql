-- CreateEnum
CREATE TYPE "Role" AS ENUM ('ADMIN', 'MANAGER', 'ANALYST');

-- CreateTable
CREATE TABLE "User" (
    "active" BOOLEAN NOT NULL DEFAULT true,
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "passwordHash" TEXT NOT NULL,
    "role" "Role" NOT NULL DEFAULT 'ANALYST',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AuditLog" (
    "id" TEXT NOT NULL,
    "actorId" TEXT,
    "actorName" TEXT,
    "action" TEXT NOT NULL,
    "entity" TEXT NOT NULL,
    "entityId" TEXT,
    "detail" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "AuditLog_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WorkflowAnalysis" (
    "id" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "workflow" TEXT NOT NULL,
    "subjectEntity" TEXT NOT NULL,
    "subjectId" TEXT NOT NULL,
    "input" JSONB NOT NULL,
    "evidence" JSONB NOT NULL,
    "evidenceHash" TEXT NOT NULL,
    "result" JSONB NOT NULL,
    "model" TEXT NOT NULL,
    "receipt" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "WorkflowAnalysis_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RecordReview" (
    "id" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "entity" TEXT NOT NULL,
    "entityId" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "reason" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "RecordReview_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UsageBucket" (
    "id" TEXT NOT NULL,
    "calls" INTEGER NOT NULL,

    CONSTRAINT "UsageBucket_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "IssuedCredential" (
    "token" TEXT NOT NULL,
    "entity" TEXT NOT NULL,
    "entityId" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "assertion" JSONB NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "revokedAt" TIMESTAMP(3),

    CONSTRAINT "IssuedCredential_pkey" PRIMARY KEY ("token")
);

-- CreateTable
CREATE TABLE "DomainArtifact" (
    "id" TEXT NOT NULL,
    "subjectEntity" TEXT NOT NULL,
    "subjectId" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "contentHash" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "approvedBy" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "DomainArtifact_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RecordApproval" (
    "id" TEXT NOT NULL,
    "version" TEXT NOT NULL,

    CONSTRAINT "RecordApproval_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DomainExecution" (
    "id" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "connectorId" TEXT NOT NULL,
    "action" TEXT NOT NULL,
    "subjectEntity" TEXT NOT NULL,
    "subjectId" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "result" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "DomainExecution_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WorkSession" (
    "id" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "respondentId" TEXT NOT NULL,
    "subjectEntity" TEXT NOT NULL,
    "subjectId" TEXT NOT NULL,
    "questions" JSONB NOT NULL,
    "answers" JSONB NOT NULL,
    "currentQuestion" TEXT,
    "status" TEXT NOT NULL,
    "deadline" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "WorkSession_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SessionMedia" (
    "id" TEXT NOT NULL,
    "sessionId" TEXT NOT NULL,
    "questionId" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "contentType" TEXT NOT NULL,
    "bytes" BYTEA NOT NULL,
    "contentHash" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "SessionMedia_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AppSetting" (
    "id" TEXT NOT NULL,
    "value" JSONB NOT NULL,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "AppSetting_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TankSite" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "facilityNumber" TEXT NOT NULL,
    "operator" TEXT NOT NULL,
    "jurisdiction" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "reviewAt" TIMESTAMP(3) NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TankSite_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "StorageTank" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "tankNumber" TEXT NOT NULL,
    "product" TEXT NOT NULL,
    "capacityLiters" DOUBLE PRECISION NOT NULL,
    "installedAt" TIMESTAMP(3) NOT NULL,
    "construction" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "tankSiteId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "StorageTank_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TankComponent" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "storageTankId" TEXT NOT NULL,
    "componentType" TEXT NOT NULL,
    "serialNumber" TEXT NOT NULL,
    "installedAt" TIMESTAMP(3) NOT NULL,
    "serviceAt" TIMESTAMP(3) NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "tankSiteId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TankComponent_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LeakTest" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "storageTankId" TEXT NOT NULL,
    "testedAt" TIMESTAMP(3) NOT NULL,
    "method" TEXT NOT NULL,
    "resultText" TEXT NOT NULL,
    "technician" TEXT NOT NULL,
    "evidence" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "tankSiteId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "LeakTest_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Walkthrough" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "inspectedAt" TIMESTAMP(3) NOT NULL,
    "inspector" TEXT NOT NULL,
    "observations" TEXT NOT NULL,
    "deficiencies" TEXT NOT NULL,
    "nextDueAt" TIMESTAMP(3) NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "tankSiteId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Walkthrough_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TankRepair" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "storageTankId" TEXT NOT NULL,
    "issue" TEXT NOT NULL,
    "contractor" TEXT NOT NULL,
    "dueAt" TIMESTAMP(3) NOT NULL,
    "repairedAt" TIMESTAMP(3),
    "receipt" TEXT,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "tankSiteId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TankRepair_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "InventoryReading" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "storageTankId" TEXT NOT NULL,
    "observedAt" TIMESTAMP(3) NOT NULL,
    "openingLiters" DOUBLE PRECISION NOT NULL,
    "deliveryLiters" DOUBLE PRECISION NOT NULL,
    "dispensedLiters" DOUBLE PRECISION NOT NULL,
    "closingLiters" DOUBLE PRECISION NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "tankSiteId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "InventoryReading_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "OperatorTraining" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "operator" TEXT NOT NULL,
    "course" TEXT NOT NULL,
    "provider" TEXT NOT NULL,
    "completedAt" TIMESTAMP(3) NOT NULL,
    "expiresAt" TIMESTAMP(3) NOT NULL,
    "evidence" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "tankSiteId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "OperatorTraining_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "IncidentNotice" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "storageTankId" TEXT NOT NULL,
    "observedAt" TIMESTAMP(3) NOT NULL,
    "incidentText" TEXT NOT NULL,
    "response" TEXT NOT NULL,
    "receipt" TEXT,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "tankSiteId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "IncidentNotice_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "OperationalTask" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "owner" TEXT NOT NULL,
    "priority" TEXT NOT NULL,
    "startAt" TIMESTAMP(3) NOT NULL,
    "dueAt" TIMESTAMP(3) NOT NULL,
    "done" BOOLEAN NOT NULL,
    "notes" TEXT,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "tankSiteId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "OperationalTask_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RuleVersion" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "jurisdiction" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "effectiveAt" TIMESTAMP(3) NOT NULL,
    "expiresAt" TIMESTAMP(3),
    "sourceUrl" TEXT NOT NULL,
    "requirementText" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "tankSiteId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "RuleVersion_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DocumentRequirement" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "requiredBy" TIMESTAMP(3) NOT NULL,
    "sourceReference" TEXT NOT NULL,
    "evidenceReference" TEXT,
    "reviewNotes" TEXT,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "tankSiteId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "DocumentRequirement_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE INDEX "WorkflowAnalysis_workflow_createdAt_idx" ON "WorkflowAnalysis"("workflow", "createdAt");

-- CreateIndex
CREATE UNIQUE INDEX "RecordReview_entity_entityId_version_actorId_key" ON "RecordReview"("entity", "entityId", "version", "actorId");

-- CreateIndex
CREATE INDEX "IssuedCredential_entity_entityId_createdAt_idx" ON "IssuedCredential"("entity", "entityId", "createdAt");

-- CreateIndex
CREATE INDEX "DomainArtifact_subjectEntity_subjectId_idx" ON "DomainArtifact"("subjectEntity", "subjectId");

-- CreateIndex
CREATE INDEX "WorkSession_respondentId_createdAt_idx" ON "WorkSession"("respondentId", "createdAt");

-- CreateIndex
CREATE INDEX "SessionMedia_sessionId_idx" ON "SessionMedia"("sessionId");

-- CreateIndex
CREATE INDEX "TankSite_createdAt_idx" ON "TankSite"("createdAt");

-- CreateIndex
CREATE INDEX "StorageTank_createdAt_idx" ON "StorageTank"("createdAt");

-- CreateIndex
CREATE INDEX "StorageTank_tankSiteId_idx" ON "StorageTank"("tankSiteId");

-- CreateIndex
CREATE INDEX "TankComponent_createdAt_idx" ON "TankComponent"("createdAt");

-- CreateIndex
CREATE INDEX "TankComponent_tankSiteId_idx" ON "TankComponent"("tankSiteId");

-- CreateIndex
CREATE INDEX "LeakTest_createdAt_idx" ON "LeakTest"("createdAt");

-- CreateIndex
CREATE INDEX "LeakTest_tankSiteId_idx" ON "LeakTest"("tankSiteId");

-- CreateIndex
CREATE INDEX "Walkthrough_createdAt_idx" ON "Walkthrough"("createdAt");

-- CreateIndex
CREATE INDEX "Walkthrough_tankSiteId_idx" ON "Walkthrough"("tankSiteId");

-- CreateIndex
CREATE INDEX "TankRepair_createdAt_idx" ON "TankRepair"("createdAt");

-- CreateIndex
CREATE INDEX "TankRepair_tankSiteId_idx" ON "TankRepair"("tankSiteId");

-- CreateIndex
CREATE INDEX "InventoryReading_createdAt_idx" ON "InventoryReading"("createdAt");

-- CreateIndex
CREATE INDEX "InventoryReading_tankSiteId_idx" ON "InventoryReading"("tankSiteId");

-- CreateIndex
CREATE INDEX "OperatorTraining_createdAt_idx" ON "OperatorTraining"("createdAt");

-- CreateIndex
CREATE INDEX "OperatorTraining_tankSiteId_idx" ON "OperatorTraining"("tankSiteId");

-- CreateIndex
CREATE INDEX "IncidentNotice_createdAt_idx" ON "IncidentNotice"("createdAt");

-- CreateIndex
CREATE INDEX "IncidentNotice_tankSiteId_idx" ON "IncidentNotice"("tankSiteId");

-- CreateIndex
CREATE INDEX "OperationalTask_createdAt_idx" ON "OperationalTask"("createdAt");

-- CreateIndex
CREATE INDEX "OperationalTask_tankSiteId_idx" ON "OperationalTask"("tankSiteId");

-- CreateIndex
CREATE INDEX "RuleVersion_createdAt_idx" ON "RuleVersion"("createdAt");

-- CreateIndex
CREATE INDEX "RuleVersion_tankSiteId_idx" ON "RuleVersion"("tankSiteId");

-- CreateIndex
CREATE INDEX "DocumentRequirement_createdAt_idx" ON "DocumentRequirement"("createdAt");

-- CreateIndex
CREATE INDEX "DocumentRequirement_tankSiteId_idx" ON "DocumentRequirement"("tankSiteId");

-- AddForeignKey
ALTER TABLE "StorageTank" ADD CONSTRAINT "StorageTank_tankSiteId_fkey" FOREIGN KEY ("tankSiteId") REFERENCES "TankSite"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TankComponent" ADD CONSTRAINT "TankComponent_storageTankId_fkey" FOREIGN KEY ("storageTankId") REFERENCES "StorageTank"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TankComponent" ADD CONSTRAINT "TankComponent_tankSiteId_fkey" FOREIGN KEY ("tankSiteId") REFERENCES "TankSite"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LeakTest" ADD CONSTRAINT "LeakTest_storageTankId_fkey" FOREIGN KEY ("storageTankId") REFERENCES "StorageTank"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LeakTest" ADD CONSTRAINT "LeakTest_tankSiteId_fkey" FOREIGN KEY ("tankSiteId") REFERENCES "TankSite"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Walkthrough" ADD CONSTRAINT "Walkthrough_tankSiteId_fkey" FOREIGN KEY ("tankSiteId") REFERENCES "TankSite"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TankRepair" ADD CONSTRAINT "TankRepair_storageTankId_fkey" FOREIGN KEY ("storageTankId") REFERENCES "StorageTank"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TankRepair" ADD CONSTRAINT "TankRepair_tankSiteId_fkey" FOREIGN KEY ("tankSiteId") REFERENCES "TankSite"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "InventoryReading" ADD CONSTRAINT "InventoryReading_storageTankId_fkey" FOREIGN KEY ("storageTankId") REFERENCES "StorageTank"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "InventoryReading" ADD CONSTRAINT "InventoryReading_tankSiteId_fkey" FOREIGN KEY ("tankSiteId") REFERENCES "TankSite"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OperatorTraining" ADD CONSTRAINT "OperatorTraining_tankSiteId_fkey" FOREIGN KEY ("tankSiteId") REFERENCES "TankSite"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "IncidentNotice" ADD CONSTRAINT "IncidentNotice_storageTankId_fkey" FOREIGN KEY ("storageTankId") REFERENCES "StorageTank"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "IncidentNotice" ADD CONSTRAINT "IncidentNotice_tankSiteId_fkey" FOREIGN KEY ("tankSiteId") REFERENCES "TankSite"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OperationalTask" ADD CONSTRAINT "OperationalTask_tankSiteId_fkey" FOREIGN KEY ("tankSiteId") REFERENCES "TankSite"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RuleVersion" ADD CONSTRAINT "RuleVersion_tankSiteId_fkey" FOREIGN KEY ("tankSiteId") REFERENCES "TankSite"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DocumentRequirement" ADD CONSTRAINT "DocumentRequirement_tankSiteId_fkey" FOREIGN KEY ("tankSiteId") REFERENCES "TankSite"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

