local app = import "app.jsonnet";

{
  backend: app.backend {
    deployment+: {
      metadata+: {
        labels+: {
          env: 'po',
        },
      },
    },
  },
}
