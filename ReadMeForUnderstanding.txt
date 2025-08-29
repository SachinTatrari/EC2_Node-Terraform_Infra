We are trying to bootup our node js application from EC2 instance using terraform to create the infrastructure.

For this we are defining all the variables and resources and output in terraform script which are required to setup
and provision the infra of EC2.

We are using userdata.sh script to bootup our node application whenever the instance reboots.

Userdata script was new to me, so while doing this whatever I learnt new in it, I am sharing it below:

Why am I using this command (curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -) in script. I could
have directly installed the node js?

Answer: Ubuntu’s default apt repositories, the Node.js version is often old (sometimes years behind LTS).
Therefore we specifically call the nodesource to download the convenient version

And After the Pipe we are doing "sudo -E bash -", this is done so that the system can take the input from the 
left side of pipe operator and run it in bash and the "-" signifies that: read the commmand from the stdin(input)
line instead of searching for a file. If we remove -, the bash would try to search for the file to run the commands.


nohup node index.js > app.log 2>&1 &
Run your Node.js app in the background on a server so:

It keeps running even after you log out or close the terminal.

All logs (both normal output and errors) go into a file.

nohup (no hang up) → process survives SSH logout.

node index.js → run app.

> app.log → save output to file.

2>&1 → merge errors into the same file.

& → run in background.


Coming to Main.tf: 
There is a lot going here.
We are starting from defining the provider to resource and then specifically in the resources we are defining the 
security groups and the inbound and outbound protocols required to setup the infrastructure.

--> user_data = file("${path.module}/userdata.sh")

file is the function in terraform, it checks for the file in the same path where the main.tf file is present. It
checks for userdata.sh so that it can run run the file while booting the instance

--> vpc_security_groups_ids = [aws_security_group.node_sg.id]

Terraform expects the list of security group ids there for we are using array to represent list of ids
