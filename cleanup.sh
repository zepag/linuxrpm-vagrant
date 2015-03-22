#!/bin/bash
vagrant halt
vagrant destroy -f
rm -fR .vagrant/
rm -fR dockerbox*
