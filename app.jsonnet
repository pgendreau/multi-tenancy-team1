local kube = import "jsonnet/lib/kube.libsonnet";

local pod(name) = {
  deployment: kube.Deployment(name) {
    spec+: {
      template+: {
        spec+: {
          containers_+: {
            podinfo: kube.Container("podinfo") {
              image: "quay.io/stefanprodan/podinfo:1.4.0",
              env_+: {
                PODINFO_UI_COLOR: "blue",
              },
              ports_+: {
                http: { 
                  containerPort: 9898
                },
              },
              command: [
                './podinfo',
                '--port=9898',
                '--level=info',
                '--random-delay=false',
                '--random-error=false',
              ],
            },
          },
        },
      },
    },
  },

  service: kube.Service(name) {
    target_pod: $.deployment.spec.template,
  },
};

local apps = [
    "backend",
    "frontend",
  ];
 
{ [a]: pod(a) for a in apps }