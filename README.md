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
<br>
<h3>Terraform</h3>
<br>
Terraform is an Infrastructure Management technology, it allows for what is known as 'Infrastructure as Code'. Simply put, this means that Terraform can  
create infrastructure through a command line interface by making use of Terraform (.tf) files. It follows a JSON-like notation of key and value pairs,  
and can be split into modules to easily isolate your ec2 code from say your RDS code. Each module contains a Main.tf, Variables.tf and Outputs.tf file,  
a main.tf file is where the instance is created and outlined all the configuration for it (the same as if you were using the AWS Console). As the name suggests,  
a variables.tf file stores variables that are used multiple times within the main.tf file, and outputs.tf displays any id's of the infrastructure set up.  
This is very useful as most times an employee will not have access to the AWS Console, and therefore cannot check via a GUI for these id's. A video has been  
produced to demonstrate Terraform in action, this will be supplied seperately as the file is large.
<br>
<h3>Ansible</h3>
<br>
Ansible is a Configuration Management tool that allows tasks to be executed on 'hosts' (ec2 instances etc) in a structured way. Say you needed to put  
multiple installations on multiple VM instances right upon creation, a lot of the installations would be repetitive and require manually ssh'ing into  
each instance to run cli commands one by one, waiting for each to finish before applying the next. This equates to a lot of wasted time for developers,  
and that is where Ansible comes in to simplify that aspect for dev's. As long as Ansible has ssh keys to allow it to communicate with the VM's it needs,  
then a playbook can be created to neatly organise tasks with names to track the progress easily. Simply specify the hosts within an inventory.yaml file  
and a playbook of tasks, and Ansible will go away and run all those tasks for you automatically and alert you when it is done. This requires no strict  
monitoring from a developer and frees them up to work on other things while that playbook is running. As was mentioned in the above section, a video  
demonstration has been produced for this and will be supplied seperately.
<br>
<h3>Jenkins/Pipelines</h3>
<br>
<h3>Docker</h3>
<br>
<h3>Kubernetes</h3>
<br>
<h3>Front-end & Back-end test results</h3>
<br>
As this project was focused around CI/CD rather than coding proficiency on the application programming side, the QA instructors provided a basic  
Python Flask application pre-built for us to integrate into our project. This application came with premade tests that the instructors also made.  
The results of these are shown below:  
<br>
<br>
Front-end:
<img src="https://user-images.githubusercontent.com/78487781/114134902-647e9880-9900-11eb-8188-09854b5038ad.JPG">
<br>
Back-end:
<img src="https://user-images.githubusercontent.com/78487781/114134908-66485c00-9900-11eb-80ea-f7c7ea1c9b9d.JPG">
<br>
<br>
As seen in the test results, the test coverage was nearly 100%. This almost guarantees that reliable code is being pushed out to the user,  
until a new bug is discovered and added to the list of tests.
<br>
<h3>Future Improvements</h3>
<br>
If this project were to be expanded upon at a future date, some of the improvements to include would be as follows:
<br>
<li>Create more variables to account for commonly used values. This is refactoring of code which is good practice in the workplace.</li>
<li>Make use of more environment variables and secret key methods to better secure login credentials and sensitive information. Some  
files cannot be git ignored and you do not want sensitive information being published on a public repository.</li>
<li>Automate in more areas of the project rather than manually intervening at certain points. Some points of this project were beyond MVP  
to automate, however, that does not mean that they are impossible to do so. With less time constraint it would be useful to include.</li>
