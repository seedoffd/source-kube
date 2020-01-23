import groovy.text.*
import java.io.*
import groovy.io.FileType
import javaposse.jobdsl.dsl.*
    def k8slabel = "jenkins-pipeline-${UUID.randomUUID().toString()}"

    def slavePodTemplate = """
    metadata:
      labels:
        k8s-label: ${k8slabel}
      annotations:
        jenkinsjoblabel: ${env.JOB_NAME}-${env.BUILD_NUMBER}
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
        resources:
          requests:
            cpu: 100m
            memory: 128Mi
        command:
        - cat
        tty: true
        volumeMounts:
          - mountPath: /var/run/docker.sock
            name: docker-sock
      - name: vetbuildtools
        image: fuchicorp/buildtools
        imagePullPolicy: Always
        resources:
          requests:
            cpu: 100m
            memory: 128Mi
        command:
        - cat
        tty: true
      securityContext:
        runAsUser: 0
        fsGroup: 0
      volumes:
        - name: docker-sock
          hostPath:
            path: /var/run/docker.sock
  """

  podTemplate(name: k8slabel, label: k8slabel, yaml: slavePodTemplate) {
      node(k8slabel) {
          stage('Pulling the code') {
              checkout smc
          }
      }
    }