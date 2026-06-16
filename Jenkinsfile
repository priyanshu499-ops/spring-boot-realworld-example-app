@Library('ci-jenkins-shared-libraries') _

pipeline {
    agent any

    stages {
        stage('Build Artifact') {
            steps {
                script {
                    def buildParams = [
                        perform_code_build          : 'true',
                        build_tool                  : 'gradle',
                        source_code_path            : '.',
                        gradle_command              : 'build',
                        gradle_build_file_location  : 'build.gradle',
                        java_version                : '11'
                    ]
                    build_factory(buildParams)
                }
            }
        }
    }
}
