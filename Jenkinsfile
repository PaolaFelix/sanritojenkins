pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Este paso clona el repositorio de GitHub en el workspace de Jenkins
                git 'https://github.com/PaolaFelix/sanritojenkins.git'
                script {
                    sh 'cat main.html'
                }
            }
        }
        stage('Build') {
            steps {
                sh 'docker build -t mi-pagina-web .'
            }
        }
        
        stage('Push to Docker Hub') {
            steps {
                script {
                    // Etiquetar la imagen localmente
                    sh 'docker tag mi-pagina-web pfeli/mi-pagina-web:latest'
        
                    // Iniciar sesión y empujar la imagen a Docker Hub
                    withCredentials([usernamePassword(credentialsId: '', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh 'docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD'
                        sh 'docker push pfeli/mi-pagina-web:latest' 
                    }
                }
            }
        }

    }
}
