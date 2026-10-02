export interface PageConfig {
  label: string;
  href: string;
  description: string;
  entities: string[];
  workflows: string[];
}

export interface EntityConfig {
  name: string;
  label: string;
  fields: Array<{ name: string; kind: "string" | "number" | "boolean" | "date" }>;
}

export interface WorkflowConfig {
  slug: string;
  title: string;
  description: string;
  prompt: string;
  fields: string[];
}

export const appConfig = {
  "slug": "ai-underground-storage-tank-compliance",
  "title": "Underground Storage Tank Compliance",
  "tagline": "Maintain tank/component registers, inspection schedules, leak-test records, repair deadlines and evidence exports.",
  "accent": "rose"
};
export const pages: PageConfig[] = [
  {
    "label": "Intake & registers",
    "href": "/registers",
    "description": "Maintain tank/component registers, inspection schedules, leak-test records, repair deadlines and evidence exports.",
    "entities": [
      "TankSite",
      "StorageTank",
      "TankComponent"
    ],
    "workflows": [
      "inspection-report-extraction",
      "leak-test-record-comparison"
    ]
  },
  {
    "label": "Operational records",
    "href": "/workflow",
    "description": "Maintain tank/component registers, inspection schedules, leak-test records, repair deadlines and evidence exports.",
    "entities": [
      "LeakTest",
      "Walkthrough",
      "TankRepair"
    ],
    "workflows": [
      "component-maintenance-brief",
      "inventory-variance-explanation"
    ]
  },
  {
    "label": "Review & delivery",
    "href": "/delivery",
    "description": "Maintain tank/component registers, inspection schedules, leak-test records, repair deadlines and evidence exports.",
    "entities": [
      "InventoryReading",
      "OperatorTraining",
      "IncidentNotice"
    ],
    "workflows": [
      "operator-evidence-checklist",
      "incident-chronology-draft"
    ]
  },
  {
    "label": "Tasks & requirements",
    "href": "/operations",
    "description": "Assignments, versioned rules and document requirements.",
    "entities": [
      "OperationalTask",
      "RuleVersion",
      "DocumentRequirement"
    ],
    "workflows": [
      "evidence-completeness-review",
      "operations-handoff-draft"
    ]
  }
];
export const entities: Record<string, EntityConfig> = {
  "TankSite": {
    "name": "TankSite",
    "label": "Tank Site",
    "fields": [
      {
        "name": "name",
        "kind": "string"
      },
      {
        "name": "facilityNumber",
        "kind": "string"
      },
      {
        "name": "operator",
        "kind": "string"
      },
      {
        "name": "jurisdiction",
        "kind": "string"
      },
      {
        "name": "address",
        "kind": "string"
      },
      {
        "name": "reviewAt",
        "kind": "date"
      },
      {
        "name": "status",
        "kind": "string"
      }
    ]
  },
  "StorageTank": {
    "name": "StorageTank",
    "label": "Storage Tank",
    "fields": [
      {
        "name": "name",
        "kind": "string"
      },
      {
        "name": "tankNumber",
        "kind": "string"
      },
      {
        "name": "product",
        "kind": "string"
      },
      {
        "name": "capacityLiters",
        "kind": "number"
      },
      {
        "name": "installedAt",
        "kind": "date"
      },
      {
        "name": "construction",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "tankSiteId",
        "kind": "string"
      }
    ]
  },
  "TankComponent": {
    "name": "TankComponent",
    "label": "Tank Component",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "storageTankId",
        "kind": "string"
      },
      {
        "name": "componentType",
        "kind": "string"
      },
      {
        "name": "serialNumber",
        "kind": "string"
      },
      {
        "name": "installedAt",
        "kind": "date"
      },
      {
        "name": "serviceAt",
        "kind": "date"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "tankSiteId",
        "kind": "string"
      }
    ]
  },
  "LeakTest": {
    "name": "LeakTest",
    "label": "Leak Test",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "storageTankId",
        "kind": "string"
      },
      {
        "name": "testedAt",
        "kind": "date"
      },
      {
        "name": "method",
        "kind": "string"
      },
      {
        "name": "resultText",
        "kind": "string"
      },
      {
        "name": "technician",
        "kind": "string"
      },
      {
        "name": "evidence",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "tankSiteId",
        "kind": "string"
      }
    ]
  },
  "Walkthrough": {
    "name": "Walkthrough",
    "label": "Walkthrough",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "inspectedAt",
        "kind": "date"
      },
      {
        "name": "inspector",
        "kind": "string"
      },
      {
        "name": "observations",
        "kind": "string"
      },
      {
        "name": "deficiencies",
        "kind": "string"
      },
      {
        "name": "nextDueAt",
        "kind": "date"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "tankSiteId",
        "kind": "string"
      }
    ]
  },
  "TankRepair": {
    "name": "TankRepair",
    "label": "Tank Repair",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "storageTankId",
        "kind": "string"
      },
      {
        "name": "issue",
        "kind": "string"
      },
      {
        "name": "contractor",
        "kind": "string"
      },
      {
        "name": "dueAt",
        "kind": "date"
      },
      {
        "name": "repairedAt",
        "kind": "date"
      },
      {
        "name": "receipt",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "tankSiteId",
        "kind": "string"
      }
    ]
  },
  "InventoryReading": {
    "name": "InventoryReading",
    "label": "Inventory Reading",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "storageTankId",
        "kind": "string"
      },
      {
        "name": "observedAt",
        "kind": "date"
      },
      {
        "name": "openingLiters",
        "kind": "number"
      },
      {
        "name": "deliveryLiters",
        "kind": "number"
      },
      {
        "name": "dispensedLiters",
        "kind": "number"
      },
      {
        "name": "closingLiters",
        "kind": "number"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "tankSiteId",
        "kind": "string"
      }
    ]
  },
  "OperatorTraining": {
    "name": "OperatorTraining",
    "label": "Operator Training",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "operator",
        "kind": "string"
      },
      {
        "name": "course",
        "kind": "string"
      },
      {
        "name": "provider",
        "kind": "string"
      },
      {
        "name": "completedAt",
        "kind": "date"
      },
      {
        "name": "expiresAt",
        "kind": "date"
      },
      {
        "name": "evidence",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "tankSiteId",
        "kind": "string"
      }
    ]
  },
  "IncidentNotice": {
    "name": "IncidentNotice",
    "label": "Incident Notice",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "storageTankId",
        "kind": "string"
      },
      {
        "name": "observedAt",
        "kind": "date"
      },
      {
        "name": "incidentText",
        "kind": "string"
      },
      {
        "name": "response",
        "kind": "string"
      },
      {
        "name": "receipt",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "tankSiteId",
        "kind": "string"
      }
    ]
  },
  "OperationalTask": {
    "name": "OperationalTask",
    "label": "Operational Task",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "owner",
        "kind": "string"
      },
      {
        "name": "priority",
        "kind": "string"
      },
      {
        "name": "startAt",
        "kind": "date"
      },
      {
        "name": "dueAt",
        "kind": "date"
      },
      {
        "name": "done",
        "kind": "boolean"
      },
      {
        "name": "notes",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "tankSiteId",
        "kind": "string"
      }
    ]
  },
  "RuleVersion": {
    "name": "RuleVersion",
    "label": "Rule Version",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "jurisdiction",
        "kind": "string"
      },
      {
        "name": "version",
        "kind": "string"
      },
      {
        "name": "effectiveAt",
        "kind": "date"
      },
      {
        "name": "expiresAt",
        "kind": "date"
      },
      {
        "name": "sourceUrl",
        "kind": "string"
      },
      {
        "name": "requirementText",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "tankSiteId",
        "kind": "string"
      }
    ]
  },
  "DocumentRequirement": {
    "name": "DocumentRequirement",
    "label": "Document Requirement",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "category",
        "kind": "string"
      },
      {
        "name": "requiredBy",
        "kind": "date"
      },
      {
        "name": "sourceReference",
        "kind": "string"
      },
      {
        "name": "evidenceReference",
        "kind": "string"
      },
      {
        "name": "reviewNotes",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "tankSiteId",
        "kind": "string"
      }
    ]
  }
};
export const workflows: WorkflowConfig[] = [
  {
    "slug": "inspection-report-extraction",
    "title": "Inspection report extraction",
    "description": "Inspection report extraction using selected tank site records and supplied evidence.",
    "prompt": "Inspection report extraction for Underground Storage Tank Compliance. Operational scope: Maintain tank/component registers, inspection schedules, leak-test records, repair deadlines and evidence exports. Specific AI scope: Read inspection reports and surface missing or conflicting records. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "leak-test-record-comparison",
    "title": "Leak test record comparison",
    "description": "Leak test record comparison using selected tank site records and supplied evidence.",
    "prompt": "Leak test record comparison for Underground Storage Tank Compliance. Operational scope: Maintain tank/component registers, inspection schedules, leak-test records, repair deadlines and evidence exports. Specific AI scope: Read inspection reports and surface missing or conflicting records. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "component-maintenance-brief",
    "title": "Component maintenance brief",
    "description": "Component maintenance brief using selected tank site records and supplied evidence.",
    "prompt": "Component maintenance brief for Underground Storage Tank Compliance. Operational scope: Maintain tank/component registers, inspection schedules, leak-test records, repair deadlines and evidence exports. Specific AI scope: Read inspection reports and surface missing or conflicting records. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "inventory-variance-explanation",
    "title": "Inventory variance explanation",
    "description": "Inventory variance explanation using selected tank site records and supplied evidence.",
    "prompt": "Inventory variance explanation for Underground Storage Tank Compliance. Operational scope: Maintain tank/component registers, inspection schedules, leak-test records, repair deadlines and evidence exports. Specific AI scope: Read inspection reports and surface missing or conflicting records. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "operator-evidence-checklist",
    "title": "Operator evidence checklist",
    "description": "Operator evidence checklist using selected tank site records and supplied evidence.",
    "prompt": "Operator evidence checklist for Underground Storage Tank Compliance. Operational scope: Maintain tank/component registers, inspection schedules, leak-test records, repair deadlines and evidence exports. Specific AI scope: Read inspection reports and surface missing or conflicting records. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "incident-chronology-draft",
    "title": "Incident chronology draft",
    "description": "Incident chronology draft using selected tank site records and supplied evidence.",
    "prompt": "Incident chronology draft for Underground Storage Tank Compliance. Operational scope: Maintain tank/component registers, inspection schedules, leak-test records, repair deadlines and evidence exports. Specific AI scope: Read inspection reports and surface missing or conflicting records. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "evidence-completeness-review",
    "title": "Evidence completeness review",
    "description": "Evidence completeness review using selected tank site records and supplied evidence.",
    "prompt": "Evidence completeness review for Underground Storage Tank Compliance. Operational scope: Maintain tank/component registers, inspection schedules, leak-test records, repair deadlines and evidence exports. Specific AI scope: Read inspection reports and surface missing or conflicting records. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "operations-handoff-draft",
    "title": "Operations handoff draft",
    "description": "Operations handoff draft using selected tank site records and supplied evidence.",
    "prompt": "Operations handoff draft for Underground Storage Tank Compliance. Operational scope: Maintain tank/component registers, inspection schedules, leak-test records, repair deadlines and evidence exports. Specific AI scope: Read inspection reports and surface missing or conflicting records. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  }
];
export function findPage(href:string){return pages.find(p=>p.href===href);}
