# Underground Storage Tank Compliance

Maintain tank/component registers, inspection schedules, leak-test records, repair deadlines and evidence exports.

## Implemented records

- **Tank Site**: name, facility Number, operator, jurisdiction, address, review At, status.
- **Storage Tank**: name, tank Number, product, capacity Liters, installed At, construction, status.
- **Tank Component**: title, component Type, serial Number, installed At, service At, status.
- **Leak Test**: title, tested At, method, result Text, technician, evidence, status.
- **Walkthrough**: title, inspected At, inspector, observations, deficiencies, next Due At, status.
- **Tank Repair**: title, issue, contractor, due At, repaired At, receipt, status.
- **Inventory Reading**: title, observed At, opening Liters, delivery Liters, dispensed Liters, closing Liters, status.
- **Operator Training**: title, operator, course, provider, completed At, expires At, evidence, status.
- **Incident Notice**: title, observed At, incident Text, response, receipt, status.
- **Operational Task**: title, owner, priority, start At, due At, done, notes, status.
- **Rule Version**: title, jurisdiction, version, effective At, expires At, source Url, requirement Text, status.
- **Document Requirement**: title, category, required By, source Reference, evidence Reference, review Notes, status.

## AI workflows

- Inspection report extraction: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Leak test record comparison: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Component maintenance brief: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Inventory variance explanation: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Operator evidence checklist: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Incident chronology draft: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Evidence completeness review: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Operations handoff draft: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.

## Calculations

- Tank inventory reconciliation: Reconcile tank deliveries and dispensing against a measured closing reading; a variance is not a leak diagnosis.
- Tank Site evidence checklist: Check source presence against an explicitly supplied document list; reviewer assesses adequacy.
- Operational deadline queue: Compute overdue items from entered dates and completed flags; no external notifications.

## Workspace features

Role-based login and account management; validated create/edit/delete; required parent and sibling relationships; search and pagination; atomic JSON imports; CSV/JSON exports; optimistic concurrency; two independent human reviews; immutable source-text uploads with independent review; dated task calendar; aggregate reports; searchable audit trail; model catalog and administrator AI settings; configured HTTPS connectors with approval, idempotency and receipt checks.

## Integration boundaries

A finite working scope, not every conceivable feature. No production regulator, insurer, carrier, court, university or clinical integration is preconfigured. Source uploads support text/CSV/JSON/Markdown, not OCR/PDF parsing. AI produces drafts and cannot authorize clinical handling, adjudicate rights, select recipients or jurors, establish eligibility, certify regulatory compliance or send submissions. Live external execution requires a configured adapter and independent human approval of the current record. Calculations use supplied rules and units; example rules are fictional.
