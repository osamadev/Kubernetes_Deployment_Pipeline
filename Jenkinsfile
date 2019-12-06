pipeline {
  environment {
    registry = 'omosaad/devops2020'
    registryCredential = 'dockerhubCredentials'
    dockerImage = ''
  }
    agent any
    stages {
    stage('Hashing images') {
      steps {
        script {
          env.GIT_HASH = sh(
            script: "git show --oneline | head -1 | cut -d' ' -f1",
            returnStdout: true
          ).trim()
        }

      }
    }
    stage('Lint Dockerfile') {
      steps {
        script {
          docker.image('hadolint/hadolint:latest-debian').inside() {
            sh 'hadolint ./Dockerfile | tee -a hadolint_lint.txt'
            sh '''
lintErrors=$(stat --printf="%s"  hadolint_lint.txt)
if [ "$lintErrors" -gt "0" ]; then
echo "Errors have been found, please see below"
cat hadolint_lint.txt
exit 1
else
echo "There are no erros found on Dockerfile!!"
fi
'''
          }
        }

      }
    }
      stage('Lint Python') {
        steps {
        script {
          docker.image('eeacms/pylint:latest').inside() {
            sh 'pylint ./app.py | tee -a python_lint.txt'
            sh '''
lintErrors=$(stat --printf="%s"  hadolint_lint.txt)
if [ "$lintErrors" -gt "0" ]; then
echo "Errors have been found, please see below"
cat python_lint.txt
exit 1
else
echo "There are no erros found on python app!!"
fi
'''
          }
        }
      }
      }
    stage('Build & Push to dockerhub') {
      steps {
        script {
          dockerImage = docker.build("omosaad/flask-app:${env.GIT_HASH}")
          docker.withRegistry('', registryCredential) {
            dockerImage.push()
          }
        }

      }
    }
    stage('Build Docker Container') {
      steps {
        script {
          dockerImage = docker.build("omosaad/flask-app:${env.GIT_HASH}")
          sh 'docker run --name flask-app -d -p 80:80 ${dockerImage}'
        }
      }
    }
  }
}
