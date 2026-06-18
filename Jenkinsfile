@Library('ci-jenkins-shared-libraries@feature/gradle-junit-support') _
def cipipeline = new opstree.ci.templates.java_ci.java_ci()
node {
  cipipeline.call([
    // WORKSPACE MANAGEMENT
    clean_workspace                  : true,
    ignore_clean_workspace_failure   : false,
    delete_dirs                      : false,
    clean_when_build_aborted         : true,
    clean_when_build_failed          : true,
    clean_when_not_built             : true,
    clean_when_build_succeed         : true,
    clean_when_build_unstable        : true,
    // VCS MANAGEMENT
    repo_https_url                   : "https://github.com/priyanshu499-ops/spring-boot-realworld-example-app.git",
    repo_ssh_url                     : "https://github.com/priyanshu499-ops/spring-boot-realworld-example-app.git",
    repo_branch                      : env.CHANGE_BRANCH ?: env.BRANCH_NAME ?: "dev",
    repo_url_type                    : "http",
    jenkins_git_creds_id             : "github-token",
    source_code_path                 : "/spring-boot-realworld-example-app",
    // DEPENDENCY SCANNING
    dependency_check                          : true,
    dependency_scan_tool                      : "owasp",
    owasp_project_name                        : "spring-boot-gradle",
    owasp_report_publish                      : true,
    owasp_report_format                       : "html",
    fail_job_if_dependency_returned_exception : false,
    // CREDS SCANNING (GITLEAKS)
    gitleaks_check                   : true,
    fail_job_if_leak_detected        : false,
    gitleaks_report_format           : "json",
    gitleaks_report_jenkins_publish  : true,
    // BUILD ARTIFACT
    perform_code_build               : true,
    build_tool                       : 'gradle',
    gradle_command                   : 'build',
    gradle_build_file_location       : '.',
    java_version                     : '11',
    codeartifact_dependency          : false,
    codeartifact_domain              : '',
    codeartifact_owner               : '',
    pom_location                     : '',
    // UNIT TESTING
    unit_testing_check               : 'true',
    fail_job_if_unit_issue_detected  : 'false',
    unit_test_reports_path           : '**/build/test-results/test/*.xml',
    // STATIC CODE ANALYSIS
    static_code_analysis_check       : false,
    // BUILD DOCKERFILE
    perform_build_dockerfile         : true,
    dockerfile_location              : '/Dockerfile',
    dockerfile_context               : '',
    image_name                       : 'spring-boot-realworld-app',
    image_tag                        : 'latest',
    // IMAGE SCANNING (TRIVY)
    image_scanning_check             : true,
    scan_severity                    : 'HIGH,CRITICAL',
    image_scanning_report_publish    : 'true',
    // IMAGE SIZE VALIDATOR
    image_size_validator_check       : true,
    max_allowed_image_size           : '500',
    fail_job_if_validation_fail      : 'false',
    // PUBLISH ARTIFACT
    artifact_publish_check           : false,
    // NOTIFICATION
    notification_enabled             : false
  ])
}
