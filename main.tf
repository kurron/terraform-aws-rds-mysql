terraform {
    required_version = ">= 0.11.1"
    backend "s3" {}
}

provider "aws" {
    region     = "${var.region}"
}

resource "aws_db_instance" "mysql" {
    allocated_storage                   = "${var.storage_size}"
    allow_major_version_upgrade         = "${var.allow_major_version_upgrade}"
    apply_immediately                   = "${var.apply_immediately}"
    auto_minor_version_upgrade          = "${var.auto_minor_version_upgrade}"
    availability_zone                   = "${var.availability_zone}"
    backup_retention_period             = "${var.backup_retention_period}"
    backup_window                       = "${var.backup_window}"
    copy_tags_to_snapshot               = true
    db_subnet_group_name                = "${var.db_subnet_group_name}"
    engine                              = "mysql"
    engine_version                      = "${var.engine_version}"
    final_snapshot_identifier           = "${var.final_snapshot_identifier}"
    iam_database_authentication_enabled = "${var.iam_database_authentication_enabled}"
    identifier                          = "${var.name}"
    instance_class                      = "${var.instance_class}"
    license_model                       = "general-public-license"
    maintenance_window                  = "${var.maintenance_window}"
    monitoring_interval                 = "${var.monitoring_interval}"
    monitoring_role_arn                 = "${var.monitoring_role_arn}"
    multi_az                            = "${var.multi_az}"
    option_group_name                   = "${var.option_group_name}"
    parameter_group_name                = "${var.parameter_group_name}"
    password                            = "${var.password}"
    publicly_accessible                 = "${var.publicly_accessible}"
    skip_final_snapshot                 = "${var.skip_final_snapshot}"
    storage_encrypted                   = false
    storage_type                        = "${var.storage_type}"
    username                            = "${var.username}"
    vpc_security_group_ids = "foo"

    lifecycle {
        create_before_destroy = true
    }
    tag {
        key                 = "Name"
        value               = "${var.name}"
    }
    tag {
        key                 = "Project"
        value               = "${var.project}"
    }
    tag {
        key                 = "Purpose"
        value               = "${var.project}"
    }
    tag {
        key                 = "Creator"
        value               = "${var.creator}"
    }
    tag {
        key                 = "Environment"
        value               = "${var.environment}"
    }
    tag {
        key                 = "Freetext"
        value               = "${var.freetext}"
    }
}
