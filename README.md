++Case Study: Automated Azure Hybrid Networking (Hub-and-Spoke VPN)
++Project Overview

This project demonstrates the automated deployment of a Hub-and-Spoke network topology in Microsoft Azure using the Azure CLI. It simulates a "Hybrid Cloud" environment by connecting a simulated on-premises network to an Azure Hub VNet via a Site-to-Site VPN tunnel with BGP (Border Gateway Protocol) enabled for dynamic routing.
++Tech Stack

    Cloud Provider: Microsoft Azure

    Infrastructure as Code (IaC): Azure CLI (Bash) / PowerShell Core

    Networking: Virtual Networks (VNet), VPN Gateways, Local Network Gateways, BGP

    Compute: Ubuntu 22.04 LTS (Standard_B2s)

++Architecture

The deployment consists of two distinct environments:

    Hub VNet (10.0.0.0/16): Represents the central transit point in Azure.

    On-Premises VNet (10.128.0.0/16): Simulates a local data center environment.

    Encrypted Tunnel: A Route-Based VPN using BGP to automatically exchange routes between the two environments.

++Key Features & Implementation

    Automated Resource Provisioning: Scripted the creation of VNets, Subnets, and Public IPs to ensure repeatable deployments.

    High-Availability VPN: Utilized VpnGw1AZ (Availability Zone-aware) SKUs for the VPN Gateways.

    Policy-Compliant Compute: Configured VM deployments to use Standard_B2s sizes, ensuring compatibility with restrictive enterprise/lab subscription policies.

    Dynamic Routing: Configured Autonomous System Numbers (ASN 65001 & 65002) to verify BGP peering and traffic flow.

++Lessons Learned & Troubleshooting

    Policy Constraints: Initial deployment attempts failed due to Azure Policy restrictions on VM SKUs. I pivoted from Standard_DS1_v2 to Standard_B2s, demonstrating the importance of understanding environment-specific governance.

    Gateway Latency: Azure VPN Gateway provisioning typically takes 25–45 minutes. I learned to structure scripts with asynchronous checks or clear progress indicators to improve the developer experience.Business Case: Pilot & PoC Readiness

++While the Standard_B2s SKU is used here for cost-efficiency, it serves a strategic purpose for Proof of Concept (PoC) and Pilot Projects:

    Low-Risk Validation: Enables stakeholders to validate connectivity and application logic without committing to high-cost premium tiers during the initial testing phase.

    Scalability Path: Using B-Series for a pilot allows the team to establish the networking foundation (VNets/Gateways) which can then be seamlessly scaled to Production-grade instances (e.g., D-Series or F-Series) once the architectural "Proof of Value" is confirmed.

    Performance Baseline: Provides a baseline for burstable performance, allowing engineers to monitor CPU credits and determine if the workload requires dedicated compute resources before the full-scale rollout.
