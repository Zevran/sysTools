#! /usr/bin/env python
import sys, os, subprocess, getopt, glob

argv = sys.argv
home_dir = os.getenv("HOME")
git_dir = home_dir + '/' + ".git"
help_requested = False

####
## Print usage
####

def usage(msg=""):
	print("Usage: [-h|--help] [--version] [-n GIT_NAME] [-d GIT_NAME] [--list]")
	if msg:
		print("%s" % msg)
	sys.exit(0)

####
## Initialize git repository
####

def create_repo(repo_name):
	print "Creating git repository : %s.git" % repo_name
	link_file = home_dir + '/' + repo_name + ".git"
	repo_dir = git_dir + '/' + repo_name + ".git"
	if repo_name is None:
		print("Error: You must specify a valid repository name")
	elif os.path.exists(repo_dir) or os.path.exists(link_file):
		print("Error: %s: File exists") % repo_name
	else:
		subprocess.call(["ln", "-s", repo_dir, link_file])
		subprocess.call(["git", "init", "--bare", repo_dir])

####
## Delete git repository
####

def delete_repo(repo_name):
	print "Deleting git repositoy : %s.git" % repo_name
	link_file = home_dir + '/' + repo_name + ".git"
	repo_dir = git_dir + '/' + repo_name + ".git"
	if repo_name is None:
		print("Error: You must specify a valid repository name")
	elif os.path.exists(repo_dir) or os.path.exists(link_file):
		subprocess.call(["rm", "-rf", repo_dir])
		subprocess.call(["rm", "-rf", link_file])
	else:
		print("Error: %s: No such file or directory") % repo_name

####
## Get list of active repositories
####

def get_list():
	count = 0
	for file in glob.glob(git_dir + '*.git'):
		print glob.glob(git_dir + '*.git')
		count += 1
	if count > 0:
		print("Total of git repositories : %d" % count)
	else:
		print("Nothing found")

####
## Print version
####

def get_version():
	print ("Beta :)")

if len(argv) < 2:
	usage()

try:
	optspec = ["help", "version", "new", "delete", "list"]
	global_args, cmd = getopt.getopt(argv[1:], "hvndl", optspec)
except getopt.GetoptError, ex:
	usage("error: %s" % ex.msg)

for opt in global_args:
	if opt[0] in ['-h', '--help']:
		usage()
	elif opt[0] in ['-v', '--version']:
		get_version()
	elif opt[0] in ['-n', '--new']:
		create_repo(opt[1])
	elif opt[0] in ['-d', '--delete']:
		delete_repo(opt[1])
	elif opt[0] in ['-l', '--list']:
		get_list()
	else:
		usage('error: unexpected option "%s"' % opt[0])


