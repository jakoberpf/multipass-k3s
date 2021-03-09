# Ansible workflow for bootstrapping a local (multipass) k3s cluster

## Prerequisite
- Check that the node setup and inventory export was successful
```
ansible leaders:workers -m ping --user=ubuntu
```

## Bootstrap
ansible-playbook bootstrap.yaml
ansible-playbook -i hosts plays/init.yaml --ask-pass --ask-become-pass

# Prepare
ansible-playbook -i hosts plays/prepare.yaml

# HA ETCD
https://thenewstack.io/tutorial-set-up-a-secure-and-highly-available-etcd-cluster/

https://rancher.com/docs/k3s/latest/en/installation/ha-embedded/

# HA K3s Server Nodes
https://thenewstack.io/tutorial-install-a-highly-available-k3s-cluster-at-the-edge/

# Agent Nodes

export KUBECONFIG=/Users/jakoberpf/Projekte/MyServers/BerryCluster/.kube/config