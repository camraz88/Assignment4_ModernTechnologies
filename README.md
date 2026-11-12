# Assignment #4: Application Containerization

This is a simple Node.js web application designed for learning Docker containerization concepts.

## Application Overview

This application is a basic Express.js web server that:
- Serves a static HTML page at the root (`/`)
- Provides an API status endpoint at `/api/status`
- Includes a health check endpoint at `/health`
- Runs on port 3000 by default (configurable via PORT environment variable)

## What's Included

- **app.js**: Main application server file
- **package.json**: Node.js dependencies and project configuration
- **public/index.html**: Static HTML page that confirms successful containerization
- **public/style.css**: Styling for the web page

## Running Without Docker (for reference only)

If you wanted to run this application directly (not required for assignment):
```bash
npm install
npm start
```

## Your Docker Assignment

**DO NOT MODIFY THE APPLICATION CODE**

Your task is to containerize this existing application using Docker. You need to:

1. Create a `Dockerfile` that properly containerizes this Node.js application
2. Build a Docker image from your Dockerfile
3. Run a container from your image
4. Verify the application works by accessing it in your browser

## Starting the Application

- To build the docker image run the command:

```bash
docker build -t node-docker-app .

```

- To run your docker container in port 3000 run the command:

```bash
docker run -d -p 3000:3000 --name node-app node-docker-app.
```
- Then open `http://localhost:3000` in your browser.

## Reflection Question
**Answer the following question in the space below**: How does containerization with Docker differ from using virtual machines, and why might a development team choose Docker containers over VMs for deploying applications like the one you just containerized?

A virtual machine runs a complete operating sysyem on top of virtualized hardware. So every VM carries the weight of itts own OS. That makes VMs rely more of memory and storage and they can also take minutes to boot up. Docker containers work very differently. They share the host machine's operating system kernal and only package what the application actually needs. Which is the runtime, the dependencies and the code. Containers tend to be lightweight, start in seconds, and still keep each application seperated from everything else running on the machine.

For an app like the one I characterized I think Docker is the better choice. The biggest thing that I noticed is that I ran Node.js app without ever installing Node on my computer. The image brought its own runtime with it so the app ran the exact way it was built. For a development team consistency is huge. Everyone works in the same environment which takes care of the "it works on my machine" issue. The same image can then move from a laptop to a test server to the cloud without any changes. It also makes onboarding go so much quicker. As a team lead at HeyDude I know how much smoother things go when a new person can get up to speed quickly instead of spending their first few dats figuring out what to do. Docker does the same for developers since a new teammate can run the whole app with a couple of commands. Managing containers was simple too. With "Docker Stop" and "Docker Start" I could shut down the app and bring it back without reconfiguring anything.

## Application Requirements for Docker

Your Dockerfile should ensure:
- The application has Node.js runtime available
- All application files are copied into the container
- Dependencies are installed (`npm install`)
- Port 3000 is exposed
- The application starts with `npm start`
- The container can be accessed from your host machine

## Verification

When your Docker container is running correctly:
- Navigate to `http://localhost:3000` (or whatever port you mapped)
- You should see a success page confirming containerization worked
- The `/api/status` endpoint should return JSON status information

## Troubleshooting Tips

- Make sure your port mapping is correct in the `docker run` command
- Check that all files are copied into the container
- Verify Node.js dependencies are installed in the container
- Use `docker logs <container-name>` to see application output

## File Structure Expected
```
docker-assignment/
├── Dockerfile          # You create this
├── app.js              # Provided
├── package.json        # Provided
├── public/             # Provided
│   ├── index.html      # Provided
│   └── style.css       # Provided
└── README.md           # This file
```

Good luck with your Docker containerization!