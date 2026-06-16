@Library('ci-jenkins-shared-libraries@main') _

def buildArtifact = new opstree.java.build_artifact()

node {
    buildArtifact.build_factory([
        perform_code_build          : 'true',
        build_tool                  : 'gradle',
        source_code_path            : '.',
        gradle_command              : 'build',
        gradle_build_file_location  : 'build.gradle',
        java_version                : '11',
        repo_url                    : 'https://github.com/priyanshu499-ops/spring-boot-realworld-example-app.git'
    ])
}
