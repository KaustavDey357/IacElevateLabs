terraform {
   required_providers{
       docker ={
         source='kreuzwerker/docker'
         version ='~> 3.0'
       }
    }}
   provider "docker" {}
   
   resource "docker_image" "node_app"{
     name ="node:18"
   }
   resource "docker_container" "node_container" {
      name ="node_container"
      image = docker_image.node_app.latest
      
      command = ["tail", "-f","/dev/null"]#to keep the container running 

      mounts {
        target ="/usr/src/app/app.js"
        source ="./app.js"
        type ="bind"
      }

      mounts {
        target ="/usr/src/app/public"
        source ="./public"
        type ="bind"
      }
      working_dir  = "/usr/src/app"

      ports {
      internal = 4000
      external = 4000
      }
   }

   
