pipeline{
    agent any

    stages{
        stage('git checkout'){
            steps{
                git https://github.com/ajay521121/MavenHelloWord.git
            }
        }
        stage('Build with Maven'){
            steps{
                sh 'mvn clean package -DskipTests'
            }
        }
        stage('docker Image build'){
            steps{
                sh docker build -t webapp-image .
            }
        }
        stage('Docker Deployment'){
            steps{
                sh '''
                    docker rm -f webapp-container || true
                    docker run -d --name webapp-container -p 9091:8080 webapp-image
                '''
            }
        }
    }
    post{
        success{
            echo 'Build and Deployment Successful!'
        }
        failure{
            echo 'Build and Deployment failed!'
        }

    }    
}
