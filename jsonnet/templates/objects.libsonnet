local kube = import "../lib/kube.libsonnet";

{
  app(name): {
    local my_app = self,
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
                ],
                args_+: {
                  'port': '9898',
                  'level': 'info',
                  'random-delay': 'false',
                  'random-error': 'false',
                },
              },
            },
          },
        },
      },
    },
  
    service: kube.Service(name) {
      target_pod: my_app.deployment.spec.template,
    },
  },
}
