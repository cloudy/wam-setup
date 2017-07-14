#!/usr/bin/env bash

echo "Install ROS"

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://pool.sks-keyservers.net --recv-key 0xB01FA116
sudo apt-get update && sudo apt-get install ros-indigo-desktop-full

echo "Install System Dependencies"

sudo apt-get install git python-pip python-catkin-tools python-wstool
sudo pip install -U pip # upgrade outdated pip in Ubuntu packages


echo "Add CMU Personal Robotics Repository"

sudo sh -c 'echo "deb http://packages.personalrobotics.ri.cmu.edu/public trusty main" > /etc/apt/sources.list.d/personalrobotics.list'
curl https://www.personalrobotics.ri.cmu.edu/files/personalrobotics.gpg | sudo apt-key add -
sudo apt-get update

echo "Initialize rosdep"

sudo rosdep init
sudo wget -P /etc/ros/rosdep/sources.list.d https://raw.githubusercontent.com/personalrobotics/pr-rosinstalls/master/rosdep/10-pr.list


sudo rosdep update

