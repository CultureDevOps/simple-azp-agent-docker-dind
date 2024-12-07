# Simple Azure Devops Pipelines Agent Docker-in-Docker Image

The most simple Docker-in-Docker Azure Devops Pipelines Agent image for self-hosted agents. It is based on [Docker:dind Official Image](https://hub.docker.com/_/docker). This image can run on either Linux or Windows (Docker Desktop), you just have to use the related docker-compose file.

Image @DockerHub: [culturedevops/simple-azp-agent-docker-dind](https://hub.docker.com/r/culturedevops/simple-azp-agent-docker-dind).

## Usage

### Running the Image for Linux

```sh
docker-compose -f "docker-compose-linux.yml" up -d
```
### Running the Image for Windows

```sh
docker-compose -f "docker-compose-windows.yml" up -d
```
In docker-compose-windows.yml you can note 2 things : 
* To bind the volume /var/run/docker.sock we use a leading double slash "//" as it is required to address the Docker socket on the host. 
* To run the container as a non-root user and avoid permission issue we add the group 0 to the user.

### Environment Variables

**AZP_URL**: The URL of the Azure DevOps or Azure DevOps Server instance.

**AZP_TOKEN** : Personal Access Token (PAT) with Agent Pools (read, manage) scope, created by a user who has permission to configure agents, at AZP_URL.

**AZP_AGENT_NAME** : Agent name (default value: the container hostname).

**AZP_POOL** : Agent pool name (default value: Default).

**AZP_WORK** : Work directory (default value: _work).

See https://learn.microsoft.com/en-us/azure/devops/pipelines/agents/docker?view=azure-devops
