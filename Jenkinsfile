pipeline {
    
    agent any

    stages {
        stage('Cloaning our git') {
            steps {
                git 'https://github.com/FridayNJC/node-express-mongoose-demo.git'
            }
        }
        stage('Building image'){
            steps{
                sh 'docker build -t nileshchudasama/node:v1 .'
            }
        }
        stage('Test'){
            steps{
                sh 'npm i'
                sh 'cp .env.example .env'
                sh 'docker-compose up -d'
                sh 'docker-compose exec -T node npm i'
                sh 'docker-compose exec -T node npm install bcrypt'
                sh 'docker-compose exec -T node npm install --save-dev npm-check-updates@11.1.9'
                sh 'docker-compose exec -T node npm audit fix'
                sh 'docker-compose exec -T -e MONGODB_URL=mongodb://mongo:27017/noobjs_test node npm test'
            }
        }
        stage('Deploy image'){
            steps{
                sh 'docker push nileshchudasama/node:v1'
            }
        }
        // stage('Deploy'){
        //     steps{
        //         script{
        //             try{
        //                 sh 'kubectl apply -f app-deployment.yaml'
        //             }
        //             catch(error){
        //                 sh 'kubectl create -f app-deployment.yaml'
        //             }
        //         }
        //     }
        // }
    }
}
