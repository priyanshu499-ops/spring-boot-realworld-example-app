@Library('ci-jenkins-shared-libraries@main') _
def cipipeline = new opstree.ci.templates.java_ci.java_ci()

node {
  cipipeline.call([

    clean_workspace                  : true,
    ignore_clean_workspace_failure   : false,
    delete_dirs                      : false,
    clean_when_build_aborted         : true,
    clean_when_build_failed          : true,
    clean_when_not_built             : true,
    clean_when_build_succeed         : true,
    clean_when_build_unstable        : true,

    repo_https_url                   : "https://github.com/priyanshu499-ops/spring-boot-realworld-example-app.git",
    repo_ssh_url                     : "https://github.com/priyanshu499-ops/spring-boot-realworld-example-app.git",
    repo_branch                      : "master",
    repo_url_type                    : "http",
    jenkins_git_creds_id             : "github-token",
    source_code_path                 : "/spring-boot-realworld-example-app",

    gitleaks_check                   : true,
    fail_job_if_leak_detected        : false,
    gitleaks_report_format           : "json",
    gitleaks_report_jenkins_publish  : true,

    dependency_check                 : false,

    perform_code_build               : true,
    build_tool                       : "gradle",
    gradle_command                   : "build",
    gradle_build_file_location       : ".",
    java_version                     : "11",
    codeartifact_dependency          : false,
    codeartifact_domain              : "",
    codeartifact_owner               : "",
    pom_location                     : "",

    unit_testing_check               : false,
    static_code_analysis_check       : false,

    perform_build_dockerfile         : true,
    image_name                       : "spring-boot-realworld",
    dockerfile_location              : "Dockerfile",
    dockerfile_context               : ".",

    image_scanning_check             : false,
    image_size_validator_check       : false,

    artifact_publish_check           : true,
    artifact_destination_type        : "harbor",
    docker_image_name                : "spring-boot-realworld",
    harbor_url                       : "registry.hub.docker.com",
    harbor_project                   : "priyanshu498",
    harbor_credentials_id            : "docker-hub-creds",

    notification_enabled             : false
  ])
}
