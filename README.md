# ITWC

## B2B Distribution & Procurement Platform

ITWC is a B2B distribution platform designed to connect cafés and other businesses with distributors while streamlining the ordering, procurement, and fulfilment process.

The platform aims to digitize a traditionally unstructured distribution workflow where orders are often placed through phone calls or informal messaging.

The project will be developed in **three phases**, with each phase building on the previous one.

---

# Phase 1 — MVP

The first version will focus on building the **core application and distribution workflow**.

The MVP will have two primary dashboards:

### 1. Café / User Dashboard

The café will be able to:

* Register and log in
* Browse available products
* View product availability/stock
* Place orders
* View current order status
* View expected delivery status/date
* View past orders
* Reorder previous orders

### 2. Distributor / Admin Dashboard

The distributor will be able to:

* Log in
* View orders placed by cafés
* View individual order details
* Manage products and inventory
* Process café orders
* Forward/convert café demand into supplier procurement orders
* Update order and fulfilment status

### Core V1 Workflow

```text
Café
  ↓
Browse Products
  ↓
Place Order
  ↓
Distributor
  ↓
Process Order
  ↓
Supplier Procurement
  ↓
Order Fulfilment
  ↓
Delivery
  ↓
Café receives order
```

The café and supplier will not need to communicate directly. The distributor will act as the intermediary between both parties.

### V1 Goal

The MVP will be considered complete when the complete ordering workflow works end-to-end:

**Café → Distributor → Supplier Procurement → Delivery → Café**

---

# Phase 2 — AI Integration

The second version will introduce intelligent features on top of the existing ordering and distribution system.

The system will use historical café activity and order data to provide useful recommendations and automation.

### Intelligent Reordering

The platform can analyze:

* Previous orders
* Ordering frequency
* Product-specific purchase patterns
* Quantity trends

and provide recommendations such as:

> "You usually reorder Peach Iced Tea every 12–14 days. You may be due for a reorder."

The café can then directly reorder from the recommendation.

### AI Assistant

An LLM-powered assistant will be integrated into the website.

The assistant could answer product and ordering-related questions such as:

> "What peach-based products do you have?"

> "What did I order last time?"

> "Show me the products I usually order."

> "Reorder the same products as my previous order."

The assistant may eventually be capable of initiating an order through natural-language interaction.

The LLM will not directly control the database. AI-generated requests will be passed through the application's backend and business rules before any action is performed.

Additional AI features may be introduced based on the requirements discovered during development and real-world usage.

---

# Phase 3 — WhatsApp Integration

The final phase will extend the platform beyond the website and integrate the ordering system with WhatsApp.

The objective is to allow cafés to interact with the distribution platform without needing to open the website.

### WhatsApp Features

The system could:

* Send automated reorder reminders
* Notify cafés about order status
* Allow cafés to view relevant order information
* Accept natural-language orders
* Confirm orders through WhatsApp
* Allow cafés to reorder previous orders directly through WhatsApp

### Example Workflow

```text
WhatsApp Reminder
      ↓
"Would you like to reorder your usual products?"
      ↓
Café responds
      ↓
Order interpreted
      ↓
Backend validates stock & pricing
      ↓
Order confirmation
      ↓
Order created
      ↓
Distributor processes order
```

The WhatsApp interface will use the same backend and business logic as the website rather than maintaining a separate ordering system.

---

# Long-Term Vision

The long-term objective of ITWC is to develop from a simple digital ordering platform into a **B2B distribution operating system**.

The platform could eventually incorporate:

* Intelligent inventory recommendations
* Demand forecasting
* Automated procurement
* Customer-specific pricing
* Delivery optimization
* Advanced analytics
* Supplier management
* Payment and invoice management
* Additional AI-powered workflows

These features are intentionally outside the scope of the initial MVP.

---

# Development Philosophy

The project will follow an incremental development approach.

### Phase 1

**Build the core system.**

### Phase 2

**Make the system intelligent.**

### Phase 3

**Make the system accessible through existing communication channels.**

The MVP will prioritize functionality and reliability over visual complexity.

New features will be added only after the previous version is functional and tested.

---


