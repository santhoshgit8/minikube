# Minikube Setup After Terraform Apply

This document explains how to verify and start **Minikube** after running Terraform.

Step 1: Check Minikube Status

After Terraform completes, verify whether Minikube is running:

minikube status

Step 2: Start Minikube (If Not Running)

If Minikube is not started, run the following command to start it:

minikube start

Expected Result

If Minikube is already running, the status command will confirm it.

If Minikube is stopped, it will start successfully using minikube start.

