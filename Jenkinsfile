def slavePodTemplate = """
      metadata:
        labels:
          k8s-label: 'this is example'
        annotations:
          jenkinsjoblabel: awdawdagsfawd
      spec:
        affinity:
          podAntiAffinity:
            requiredDuringSchedulingIgnoredDuringExecution:
            - labelSelector:
                matchExpressions:
                - key: component
                  operator: In
                  values:
                  - jenkins-jenkins-master
              topologyKey: "kubernetes.io/hostname"
        containers:
        - name: docker
          image: docker:latest
          imagePullPolicy: Always
          command:
          - cat
          tty: true
          volumeMounts:
            - mountPath: /var/run/docker.sock
              name: docker-sock
            - mountPath: /etc/secrets/service-account/
              name: google-service-account
        - name: fuchicorptools
          image: fuchicorp/buildtools
          imagePullPolicy: Always
          command:
          - cat
          tty: true
          volumeMounts:
            - mountPath: /var/run/docker.sock
              name: docker-sock
            - mountPath: /etc/secrets/service-account/
              name: google-service-account
        serviceAccountName: common-service-account
        securityContext:
          runAsUser: 0
          fsGroup: 0
        volumes:
          - name: google-service-account
            secret:
              secretName: fuchicorp-service-account
          - name: docker-sock
            hostPath:
              path: /var/run/docker.sock
    """

podTemplate(name: k8slabel, label: k8slabel, yaml: slavePodTemplate) {
    node(k8slabel) {
        stage("Pull Source Code") {
            checkout scm
        }
    }
}