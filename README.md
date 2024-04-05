# Cadavre Exquis project Technical Documentation

Project contributors: De Martino Giada Flora, Llinares Isalyne, Tchilinguiran Théo.
**2023-2024 - DO3**

---

## Summary
I. Deploying the app

II. How it works

III. Why we made these technical choices

IV. How we designed and developped the project

V. Security concerns

V. Next step

---

The goal of the project is to deploy a web app. To do so, we chose to use Terraform and Ansible.
Security concerns : public IPs, unsafe deployment, no reliability (no orchestration), OVH so possible downtime / data loss (but cheap), sensitive information may appear in terraform deployment info dump. PBs faced during development (excluding utterly disastrous project and team management) : terraform state sharing difficulties, and ansible having to be manually remade because terraform doesnot take ansible info in its state
By structuring our project in this manner, we ensured a collaborative learning environment where each member could deepen their expertise while contributing to the collective success of the project. This approach not only facilitated skill development but also our teamwork and trust.
/
Here's a rough summary of how it works:
You need to have Terraform and Ansible installed ;
You then clone the repo, enter its directory, follow the documentation to authenticate to OVH, and execute the `launch_project.sh` script.
This script provisions the infrastructure (three virtual machines hosted by OVH) and remotely configures the instances (installs Docker, pulls images, makes containers, etc).
This is how the application is deployed.

## I. Deploying the app
To deploy the app you only need to clone this project and run this in your command line :
```bash
./launch_project.sh
```

## III. Project progression
### What we learned :
Throughout this project, our team gained valuable insights and skills, including:

- Terraform Proficiency: We learned to effectively utilize Terraform for infrastructure provisioning, gaining the ability to define and manage infrastructure as code.

- Playbook Management with Ansible: Through hands-on experience with Ansible, we mastered the creation and management of playbooks, enabling efficient configuration management across various environments.

- Task Automation for Deployment Efficiency: We explored automation techniques to streamline deployment processes, automating repetitive tasks and ensuring smoother and more reliable deployments.

These skills not only enhanced our capabilities but also contributed to the overall success and efficiency of our project.
### The difficulties we faced : 
During the project, we ran into a few bumps along the road.

First off, managing our time was tougher than we thought. Even though we're all in the same class, everyone had their own mountain of work and other projects to juggle.

Plus, diving into the unknown was a bit daunting. None of us really knew how to tackle the project, so we had to dive deep into research and trial and error.

## IV. Next Step
To further develop this project, we can enhance our workflow by implementing a robust Continuous Integration/Continuous Deployment (CI/CD) infrastructure. By integrating CI/CD practices, we aim to streamline our development process, improve code quality, and accelerate the delivery of updates to our web application.

Key components of our proposed CI/CD infrastructure include:

- Version Control Integration: Integration with a version control system such as Git to automate the triggering of CI/CD pipelines upon code commits, ensuring that changes are automatically built, tested, and deployed.

- Automated Testing Suites: Expansion of our automated testing suites to encompass various levels of testing, including unit tests, integration tests, and end-to-end tests. These tests will run automatically as part of the CI process, providing rapid feedback on code changes.

- Pipeline Orchestration: Creation of CI/CD pipelines using tools like Jenkins, GitLab CI/CD, or GitHub Actions to automate the build, test, and deployment processes. These pipelines will define the sequence of steps required to deliver changes from code commit to production deployment.

- Artifact Management: Implementation of artifact management solutions to store and manage build artifacts generated during the CI/CD process. This ensures traceability and reproducibility of builds and simplifies the deployment process.

- Deployment Strategies: Adoption of deployment strategies such as blue-green deployment or canary deployment to minimize downtime and mitigate risks associated with deploying new releases. These strategies enable seamless transitions between different versions of the application while ensuring availability and reliability.

- Infrastructure Automation: Integration of infrastructure automation tools such as Terraform or AWS CloudFormation to provision and manage infrastructure resources as code. This ensures consistency and reproducibility of infrastructure configurations across different environments.

- Monitoring and Observability: Incorporation of monitoring and observability tools to monitor the health and performance of the deployed application. Metrics such as response time, error rates, and resource utilization will be monitored in real-time, with alerts triggered for any anomalies.

By implementing a CI/CD infrastructure, we aim to foster a culture of continuous improvement and innovation, enabling rapid and reliable delivery of updates to our web application. This infrastructure will empower our team to iterate quickly, respond to feedback faster, and deliver value to our users with confidence and efficiency.

## V. Conclusion
In conclusion, the "Cadavre Exquis" project has been incredibly instructive for our team. Despite encountering various challenges along the way, we have embraced each obstacle as an opportunity for growth and learning. The collaborative nature of our endeavor, coupled with our commitment to adopting new skills and overcoming hurdles together, has fostered a sense of camaraderie and accomplishment.

Through this project, we have not only automated the build and deployment processes of our web application but also expanded our knowledge and capabilities. Each challenge we faced has only served to strengthen our resolve and push us to reach new heights. As we reflect on our journey, we are proud of what we have achieved and excited about the possibilities that lie ahead.
