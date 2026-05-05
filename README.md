Case Study: Azure Hybrid Hub-and-Spoke VPN

Overview
Automated deployment of an Azure Hub-and-Spoke topology simulating a Hybrid Cloud via Site-to-Site VPN with BGP dynamic routing.

Tech Stack

    Provider: Microsoft Azure

    IaC: Azure CLI (Bash/PowerShell)

    Networking: VNets, VPN Gateways, BGP (ASN 65001/65002)

    Compute: Ubuntu 22.04 (Standard_B2s)

Architecture

    Hub VNet (10.0.0.0/16): Central transit point in Azure.

    On-Prem VNet (10.128.0.0/16): Simulated local data center.

    Tunnel: Route-based encrypted VPN with automatic route exchange.

Key Features

    High-Availability: Used VpnGw1AZ SKUs for zone-aware reliability.

    Governance: Deployed Standard_B2s to meet lab/enterprise policy restrictions.

    Automation: Scripted VNet, Subnet, and Gateway provisioning for repeatability.

Lessons and Business Case

    Policy Awareness: Resolved RequestDisallowedByPolicy errors by pivoting to B-series SKUs, demonstrating environment-specific governance skills.

    PoC Strategy: Used B-series for low-risk, cost-efficient validation. This establishes a Scalability Path—confirming architectural Proof of Value before scaling to production tiers.

    Efficiency: Managed the 45-minute gateway provisioning latency by implementing asynchronous CLI logic.
