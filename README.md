# Cloud Native - Practical Project Specification  
<br>
This project was a CI/CD Jenkins pipeline built on a Terraform/Ansible deployed VPC. The project was due in by  
9th April 2021.  
<br>
<br>
Links to all resources can be found below:
<br>
<a href="https://github.com/LuKeF-2021/2ndProjectQA_LF/">GitHub</a>
<br>
<a href="https://lukef.atlassian.net/secure/RapidBoard.jspa?rapidView=3&view=planning.nodetail&epics=visible&issueLimit=100">Jira Board</a>
<br>
<a href="Risk Assessment Luke Foster 2ndQAProject.docx">Risk Assessment</a>
<br>
<br>
<h3>Project Requirements</h3>
<br>
The MVP for this project was as follows:
<br>
<li>Application deployed using containerisation and orchestration tools</li>
<li>Application tested through CI pipeline</li>
<li>2 Managed RDS servers: 1 for Testing and 1 for Production.</li>
<li>Webhooks set up to automatically build when a new commit has been made.</li>
<li>Deploy infrastructure through Terraform, and configure them with Ansible.</li>
<li>Jira Board Developed alongside project.</li>
<li>Risk Assessment relevant to the project.</li>
<br>
<br>
<h3>Using Jira to visualise tasks</h3>
<br>
To visualise the progress of the application, and have a reference for completed, in progress, and outstanding tasks a Jira Kanban board was used to store epics,  
user stories and tasks. Epics are Large Parts of the code base that provide a lot of functionality that is broken down into User Stories and Tasks associated with  
the Epic. Below is a screenshot of the Jira Board for the project (also the Board is linked at the top of this document):
<br>
<img src="https://user-images.githubusercontent.com/78487781/114131757-187d2500-98fb-11eb-8d37-2f44fba50b28.JPG">
<br>
<br>
As shown there are various Epics, Stories and tasks displayed on the board. Jira also allows developers to further manage their tasks by splitting  
them into 'Sprints', these sprints are all the tasks you or your team are going to complete in the time scale specified upon creating the Sprint.  
This project was mainly seperated out into sprints based off what layer was being worked on, Terraform and Ansible grouped together, Jenkins Pipeline etc. Below  
is a screenshot demonstrating a Sprint being used in this project:
<br>
<br>
<img src="https://user-images.githubusercontent.com/78487781/114132039-89bcd800-98fb-11eb-8b1f-e9b68b8c0595.JPG">
<br>
<br>
<h3>Workflow of Project</h3>
<br>
Each tool used will be discussed in more depth in their own sections further down this document. However, a brief overview of the project  
structure will be discussed now.
<br>
Firstly, a VPC (Virtual Private Cloud) needs to be configured, then infrastructure such as ec2 VM's or RDS databases can be added within the VPC  
address ranges, making use of subnets and security groups to control traffic in and out. Terraform is leveraged to build out this infrastructure.  
Next, Ansible uses files called 'Playbooks' to run 'Plays' on host VM instances. These 'Plays' are command line commands that do things such as  
installing the aws cli onto hosts or installing Jenkins.  
<br>
After Ansible has installed Jenkins on an ec2 instance within the VPC, a Jenkins Pipeline can be built to stage various build tasks that Jenkins  
goes and executes for you with high level priviledges.  
<br>
The end goal of this Pipeline is for docker images to be built and tested on a test environment, and then pushed up to a DockerHub Repository.  
Upon completion of these build steps, Jenkins then pulls these docker images down and puts them onto Kubernetes pods in the production environment.  
This ensures that a tested and working application is running for the end users continuously, as tests are carried out after commits and only successful  
builds will end up on the production environment.
