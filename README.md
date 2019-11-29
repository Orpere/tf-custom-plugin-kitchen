# [kitchen-ec2-example](https://newcontext-oss.github.io/kitchen-terraform/tutorials/amazon_provider_ec2.html)

This project is to show the kitchen-ci Terraform Amazon Provider base on the [tutorial](https://newcontext-oss.github.io/kitchen-terraform/tutorials/amazon_provider_ec2.html)

## Clone this project

- In a directory of your choice, clone the github repository :
  
    ```bash
    git clone git@github.com:orlando-pereira/kitchen-ec2-example.git
    ```

- Change into the directory :
  
    ```bash
    cd kitchen-ec2-example
    ```

## How to setup KitchenCI and RBENV (MacOS Mojave 10.14.5) :

- Run `brew install ruby`
- After previous command finish, run `gem install rbenv`, this would give you ability to choose particular version of Ruby. This is a prerequisite.
- Run the following two commands, to setup Ruby environment for the local directory.

    ```bash
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
    echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
    ```

- Reload your BASH interpreter or apply the changes to the profile :
  
    ```shell
    source ~/.bash_profile 
    ```

- Verify rbenv is installed properly with :
  
    ```shell
    type rbenv   # → "rbenv is a function"
    ```

- To install the particular version that we need, run the following command in the project directory:
  
    ```shell
    rbenv install 2.3.1
    ```

- Set local version to be used with command :
  
    ```shell
    rbenv local 2.3.1
    ```

- Previous step is going to create a file named .ruby-version, with the following content `2.3.1`

- Next, [Bundler](https://bundler.io) needs to be installed, run `gem install bundler`, this would provide the dependencies that KitchenCI needs. It is going to install the Gems defined in the `Gemfile`

## Setup aws access

- update with your credentials
  
```bash
  export AWS_ACCESS_KEY_ID="xxxxxxxxxxxxx"
  export AWS_SECRET_ACCESS_KEY="xxxxxxxxxxxxx"
```

## Setup KitchenCI:

- update your ssh keys on .kitchen.yaml and your values in testing.tfvars with your key path

.kitchen.yaml

```yaml
transport:
  name: ssh
  ssh_key: "~/.ssh/<your_key.pem>"
```

testing.tfvars note: please leave access_key and secret_key as it is.

```terraform
access_key    = ""
secret_key    = ""
key_name      = "your_key.pem"
region        = "us-east-1"
ami           = "ami-fce3c696"
instance_type = "m3.medium"
```

- Install the needed Gems for KitchenCI using Bundle with command :
  
    ```shell
    bundle install
    ```

- Then converge:
  
    ```bash
    bundle exec kitchen test
    ```
