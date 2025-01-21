pipeline {
      agent any
      stages {
            stage('Init') {
                  steps {
                        echo 'Hi, this is Aisalkyn Aidarova from jump to tech'
                        echo 'We are Starting the Training'
                  }
            }
            stage('Test') {
                  steps {
                        echo 'Testing the code'
                  }
            }
            stage('Build') {
                  steps {
                        echo 'Building Sample Maven Project'
                  }
            }
            stage('Deploy') {
                  steps {
                        echo "Deploying in Staging Area"
                  }
            }
            stage('Deploy Production') {
                  steps {
                        echo "Deploying in Production Area"
                  }
            }
            stage('Notify') {
                  steps {
                        echo "Sending emails to concern teams"
                  }
            }
      }
}
