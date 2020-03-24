local kube = import "../../jsonnet/lib/kube.libsonnet";

{
  backend_deployment: kube.Deployment("backend") {
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
  }}}}}},

  backend_service: kube.Service("backend") {
    target_pod: $.backend_deployment.spec.template,
  },
}
