tags    =   {
    env =   "dev"
}

s3  =   {
    dev-s3  =   {
        bucket  =   "dev-storage-bucket"
    }
}

net =   {
    vpc =   {
        dev-vpc =   {
            cidr_block  =   "10.1.0.0/16"
        }
    }
    sbnet   =   {
        dev-subnet  =   {
            cidr_block  =   "10.0.1.0/24"
        }
        lb-subnet  =   {
            cidr_block  =   "10.0.2.0/24"
        }
    }
}

web = {
    ami-0c55b159cbfafe1f0 = {
        instance_type = "t2.micro"
    }
}


cl-lb = {
    dev-clb = {
        availability_zones = ["us-east-1a", "us-east-1b"]
        instance_port       = 80
        instance_protocol   = "HTTP"
        lb_port             = 80
        lb_protocol         = "HTTP"
        target              = "HTTP:80/"
        interval            = 30
        timeout             = 5
        healthy_threshold   = 2
        unhealthy_threshold = 2
        webkey = ["ami-0c55b159cbfafe1f0"]
    }
}

nlb = {
    lb = {
        dev-ntwrk-lb = {
            internal           = false
            load_balancer_type = "network"
            s-key = "lb-subnet"
        }
    }
    grp = {
        target-group = {
            name     = "network-tg"
            port     = 80
            protocol = "TCP"
            v-key = "dev-vpc"
            interval            = 30
            timeout             = 10
            healthy_threshold   = 3
            unhealthy_threshold = 3
        }
    }
    lsnr = {
        listner = {
            lb-key = "dev-ntwrk-lb"
            port     = 80
            protocol = "TCP"
            type             = "forward"
            grp-key = "target-group"
        }
    }
    trg = {
        target = {
            grp-key = "target-group"
            port             = 80
            web-key = ["ami-0c55b159cbfafe1f0"]
        }
    }
}