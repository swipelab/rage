import * as pulumi from "@pulumi/pulumi";
import * as gcp from "@pulumi/gcp";
import * as k8s from "@pulumi/kubernetes";

import {k8sConfig, k8sProvider} from "./cluster";

const name = `${pulumi.getProject()}-${pulumi.getStack()}`;
const canaryLabels = { app: `canary-${name}` };

const canary = new k8s.apps.v1.Deployment("canary", {
  spec: {
    selector: { matchLabels: canaryLabels },
    replicas: 1,
    template: {
      metadata: { labels: canaryLabels },
      spec: { containers: [{ name, image: "nginx" }] }
    }
  }
}, {provider: k8sProvider});

export let kubeConfig = k8sConfig;
