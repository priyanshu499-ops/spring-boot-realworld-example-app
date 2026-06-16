@Library('ci-jenkins-shared-libraries@main') _

def buildArtifact = new opstree.java.build_artifact()
def depScanning   = new opstree.common.dependency_scanning()
def vulnScanning  = new opstree.common.vulnerability_scanning()
def sizeValidator = new opstree.common.image_size_validator()
def unitTest      = new opstree.java.junit()

node {

    stage('Build Artifact') {
        buildArtifact.build_factory([
            perform_code_build         : 'true',
            build_tool                 : 'gradle',
            repo_url                   : 'https://github.com/priyanshu499-ops/spring-boot-realworld-example-app.git',
            source_code_path           : '.',
            gradle_command             : 'build',
            gradle_build_file_location : '.',
            java_version               : '11',
            codeartifact_dependency    : 'false',
            codeartifact_domain        : '',
            codeartifact_owner         : '',
            pom_location               : ''
        ])
    }

    stage('Unit Test') {
        unitTest.unit_testing_factory([
            unit_testing_check              : true,
            fail_job_if_unit_issue_detected : false,
            build_tool                      : 'gradle',
            repo_url                        : 'https://github.com/priyanshu499-ops/spring-boot-realworld-example-app.git',
            source_code_path                : '.'
        ])
    }

    stage('Dependency Scanning') {
        depScanning.dependency_scanning_factory([
            dependency_check                          : true,
            dependency_scan_tool                      : 'owasp',
            owasp_project_name                        : 'spring-boot-gradle',
            owasp_report_publish                      : true,
            owasp_report_format                       : 'html',
            fail_job_if_dependency_returned_exception : false,
            repo_url                                  : 'https://github.com/priyanshu499-ops/spring-boot-realworld-example-app.git'
        ])
    }

    stage('Gitleaks Scan') {
        depScanning.creds_scanning_factory([
            gitleaks_check                  : true,
            fail_job_if_leak_detected       : false,
            gitleaks_report_format          : 'json',
            gitleaks_report_jenkins_publish : true,
            repo_url                        : 'https://github.com/priyanshu499-ops/spring-boot-realworld-example-app.git'
        ])
    }

    stage('Trivy Scan') {
        vulnScanning.creds_scanning_factory([
            trivy_check                      : true,
            fail_job_if_trivy_issue_detected : false,
            image_name                       : 'spring-boot-gradle',
            image_tag                        : 'latest',
            repo_url                         : 'https://github.com/priyanshu499-ops/spring-boot-realworld-example-app.git'
        ])
    }

    stage('Image Size Validator') {
        sizeValidator.size_validator_factory([
            image_size_validator_check  : true,
            max_allowed_image_size      : 500,
            fail_job_if_validation_fail : false,
            image_name                  : 'spring-boot-gradle',
            image_tag                   : 'latest',
            repo_url                    : 'https://github.com/priyanshu499-ops/spring-boot-realworld-example-app.git'
        ])
    }
}
