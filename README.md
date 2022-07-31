# KIP_task
this is flutter web project that implement simple crud operation showing layers of the code 
I used here 
- [laravel backend i created](https://github.com/mahmood2224/KIB_task_backend)
- [postman collection](https://documenter.getpostman.com/view/5133371/UzdzTk2E)

## Getting Started

this project is completing flutter task to show up my coding skills

## Docker config 
to run this project and avoiding to install flutter sdk and init it i made docker file and image to do that instead
you should just download docker of the platform you working on (window, mac , links)
- [docker download for windows](https://docs.docker.com/desktop/install/windows-install/)
- [docker download for mac](https://docs.docker.com/desktop/install/mac-install/)
- [docker download for linux](https://docs.docker.com/desktop/install/linux-install/)

note that if you run docker on windows you should allow linux sub system by running this command in windows power shell (you should run power shill as administrator)
- dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart

After that you should install wsl from the link below 
- [wsl install and update](https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi)

## Run the project
the only thing you have to do is to navigate to the project directory after cloning it then run the command 
- docker compose up 

this command will take care of every thing and making the image form scratch then running the server allowing you to access the running application throw
- http://localhost:8080/ 