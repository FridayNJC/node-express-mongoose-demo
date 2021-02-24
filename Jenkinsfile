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
                sh 'docker build docker/node/ -t nileshchudasama/node:v1'
            }
        }
        stage('Deploy image'){
            steps{
                sh 'docker push nileshchudasama/node:v1'
            }
        }
        stage('Test'){
            steps{
                sh 'npm i'
                sh 'cp .env.example .env'
                sh 'docker-compose up -d'
                sh 'docker-compose exec node npm i'
                sh 'docker-compose exec -e MONGODB_URL=mongodb://mongo:27017/noobjs_test node npm test'
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
