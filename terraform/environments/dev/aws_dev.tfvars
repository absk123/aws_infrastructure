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
    }
}