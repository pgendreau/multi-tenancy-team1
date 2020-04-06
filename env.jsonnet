local env = 'team1';
local type = 'njha';
local zone = 'bo';

#local namespace = std.join('-', [env, type, zone]);
local namespace = env;


local backend = import "workloads/backend/app.jsonnet";
local frontend = import "workloads/frontend/app.jsonnet";



{
  backend: backend.backend {
    deployment+: {
      metadata+: {
        namespace: namespace,
        labels+: {
          env: env,
          type: type,
          zone: zone,
        },
      },
    },
    service+: {
      metadata+: {
        namespace: namespace,
        labels+: {
          env: env,
          type: type,
          zone: zone,
        },
      },
    },
  },
  frontend: frontend.frontend {
    deployment+: {
      metadata+: {
        namespace: namespace,
        labels+: {
          env: env,
          type: type,
          zone: zone,
        },
      },
    },
    service+: {
      metadata+: {
        namespace: namespace,
        labels+: {
          env: env,
          type: type,
          zone: zone,
        },
      },
    },
  },
}
