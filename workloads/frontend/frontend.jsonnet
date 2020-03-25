local kube = import "../../jsonnet/lib/kube.libsonnet";

{
  frontend_deployment: kube.Deployment("frontend") {
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
                '--backend-url=http://backend:9898/echo',
              ],
  }}}}}},

  frontend_service: kube.Service("frontend") {
    target_pod: $.frontend_deployment.spec.template,
  },
}
