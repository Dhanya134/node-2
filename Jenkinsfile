pipeline
{
  agent {
    node{
      label: "nodejs"
    }
  }
}
stages{
  stage("build")
  {
    steps{
      script{
        openshift.withCluster() {
          openshift.withProject() {
            
        
