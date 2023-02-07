pipeline
{
  agent  any
  
stages{
  stage("build")
  {
    steps{
      script{
        openshift.withCluster() {
          openshift.withProject() {
             echo "Using project: ${openshift.project()}"
             openshift.selector("bc" , "back-git").startBuild("--wait")
          }
        }
      }
    }
  }
  /*stage("Tag image") {
       steps{
    tagImage([
            sourceImagePath: "dhanya-jenkins",
            sourceImageName: "node-server",
            sourceImageTag : "latest",
            toImagePath: "dhanya-jenkins",
            toImageName    : "node-server",
            toImageTag     : "${env.BUILD_NUMBER}"
      ])
       }
  }*/
  stage('deploy') {
        steps {
            script {
                openshift.withCluster() {
                    openshift.withProject("$PROJECT_NAME") {
                        echo "Using project: ${openshift.project()}"
                         sh 'oc project "$PROJECT_NAME" '
                         sh 'oc apply -f backend.yaml'
                    }
                }
            }
        } 
    }
}
}
  
        
