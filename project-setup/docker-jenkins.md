# Jenkins Pipeline for Spring Boot with Docker Setup

## Prerequisites
- **Device-2**: Ubuntu system ready for configuration (with OpenSSH and Git already set up).
- **Spring Boot Project**: A simple Spring Boot backend project in a Git repository.
- **Jenkins**: Jenkins will be used to automate the build process.

---

## Step 1: Install Docker on Device-2

To containerize your Spring Boot project and other services, you'll need Docker.

### 1. Install Docker
- Update your package list, install docker and verify Docker installation:
  ```bash
  sudo apt update
  sudo apt install docker.io
  docker --version
  ```
  
- Add your user to the Docker group to avoid using ``sudo`` with Docker commands:
  ```bash
  sudo usermod -aG docker $USER
  ```

- Log out and log back in to apply the Docker group changes.

## Step 2: Install Docker Compose
- Install Docker Compose:
    ```bash
    sudo apt install docker-compose
    ```
    
- Verify Docker Compose installation:
    ```bash
    docker-compose --version
    ```