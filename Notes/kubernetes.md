Setup K8s using kubeadm 


Prerequisites
	• Two AWS EC2 instances running Ubuntu 20.04 LTS
	• One instance designated as the master node (e.g., t2.medium)
	• One instance designated as the worker node (e.g., t2.micro)
	• Open ports 6443, 2379-2380, 10250-10252 in the security group for Kubernetes communication
	• Install AWS CLI on your local machine to interact with the instances


Setup Containerd Runtime on all Nodes
1. Update the package lists:
sudo apt update

2. Install required packages:
sudo apt install -y curl gnupg2 software-properties-common apt-transport-https ca-certificates

3. Add the Containerd GPG key:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

4. Add the Containerd repository:
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

5. Install Containerd:
sudo apt install -y containerd.io

6. Configure Containerd:
sudo mkdir -p /etc/containerd
containerd config default | sudo tee /etc/containerd/config.toml

7. Restart Containerd:
sudo systemctl restart containerd
sudo systemctl enable containerd


Setup Kubeadm, Kubelet and Kubectl on all Nodes
8. Install required packages:
sudo apt install -y apt-transport-https ca-certificates curl


9. Add the correct Kubernetes package repository:

First, download the GPG key for the Kubernetes repository:
sudo curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.30/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/k8s.gpg
Then, add the Kubernetes apt repository:
echo "deb [signed-by=/etc/apt/keyrings/k8s.gpg] https://pkgs.k8s.io/core:/stable:/v1.30/deb/ /" | sudo tee /etc/apt/sources.list.d/k8s.list


Step 2: Clean Up Duplicate Docker Entries
You have multiple entries for the Docker repository. You need to remove the duplicate entries to avoid warnings.
10. List the sources for Docker:
ls /etc/apt/sources.list.d/
11. Remove the duplicate Docker source list:
Identify the duplicate file (likely named something like archive_uri-https_download_docker_com_linux_ubuntu-noble.list) and remove it:
sudo rm /etc/apt/sources.list.d/archive_uri-https_download_docker_com_linux_ubuntu-noble.list

Step 3: Update Package Lists
Now that you've fixed the repository issues, update your package lists:
sudo apt update
Step 4: Install Kubernetes Components
Once the update completes successfully, you can install the Kubernetes components:
sudo apt install -y kubelet kubeadm kubectl


12. Hold the installed versions:
sudo apt-mark hold kubelet kubeadm kubectl


Initialize the Kubernetes Master Node
13. SSH into the master node.
14. Initialize the Kubernetes cluster:
sudo kubeadm init --pod-network-cidr=192.168.0.0/16 --cri-socket unix:///var/run/containerd/containerd.sock

15. Copy the join command output for later use.
16. Deploy the Calico network plugin:
kubectl --kubeconfig=/etc/kubernetes/admin.conf create -f https://docs.projectcalico.org/manifests/calico.yaml


Join Worker Nodes to the Cluster
17. SSH into the worker node.
18. Join the worker node to the cluster using the join command from the master node initialization:
sudo kubeadm join <master-node-ip>:6443 --token <token> --discovery-token-ca-cert-hash sha256:<hash> --cri-socket unix:///var/run/containerd/containerd.sock

19. Verify the worker node has joined the cluster on the master node:
kubectl get nodes


Setting Up Weave Net as the CNI

Step 1: Install Weave Net
20. SSH into the master node if you haven't already.
21. Apply the Weave Net YAML manifest to install the Weave Net CNI plugin:
kubectl apply -f https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version -o json | jq -r '.serverVersion.gitVersion')
This command fetches the Weave Net configuration and applies it to your Kubernetes cluster.


Step 2: Verify Weave Net Installation
22. Check the status of the Weave Net pods to ensure they are running:
kubectl get pods -n kube-system
You should see pods with names starting with weave-net in a Running state.

23. Check the nodes to ensure they are ready:
kubectl get nodes
All nodes should show a Ready status.


Step 3: Testing the Network
To verify that the network is functioning correctly, you can deploy a simple application and test connectivity between pods.
24. Deploy a sample application:
kubectl run nginx --image=nginx --replicas=2 --port=80

25. Expose the application:
kubectl expose deployment nginx --type=NodePort

26. Get the service details:
kubectl get svc

27. Test connectivity between the pods:
• Get the pod names:
kubectl get pods

• Use kubectl exec to run a command in one of the pods and ping another pod:
kubectl exec -it <nginx-pod-name-1> -- ping <nginx-pod-name-2>

