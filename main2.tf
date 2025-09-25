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
     build {
       context = "./"
       dockerfile = "Dockerfile
     }
   }
   resource "docker_container" "node_container"{ 
      name ="node_container"
      image = docker_image.node_app.latest
      ports {
      internal = 4000
      external = 4000
      }
   }


   
