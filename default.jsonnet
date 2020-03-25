{
  "app": "",
  "namespace": "team1",
  labels: {
    "appgroup": "team1",
  },
  "command": [],
  "args": [],
  "env": {},
  kubeconfig: {
    "replicas": 1,
    "mem_limit": "250Mi",
    "mem_request": "100Mi",
    "cpu_limit": "0.01",
    "cpu_request": "0.1",
  },
  "volumeMounts": {},
  "volumes": {},
  "ports": {
    "http": {
      "containerPort": 9898,
      "protocol": "TCP",
    },
  },
}
