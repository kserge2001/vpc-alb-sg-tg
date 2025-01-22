resource "aws_lb_target_group" "tg1" {
  name = "alb-target-gp"
  port = 80
  protocol = "HTTP"
  vpc_id = aws_vpc.v1.id  
  health_check {
    enabled = true 
    healthy_threshold = 3 
    interval = 100 
    path = "/"
    matcher = 200
    port = "traffic-port"
    protocol = "HTTP"
    timeout = 6 
    unhealthy_threshold = 3
  }
}
resource "aws_lb_target_group_attachment" "ltg1" {
  target_group_arn = aws_lb_target_group.tg1.arn
  target_id = aws_instance.server1.id 
  port = 80
}
resource "aws_lb_target_group_attachment" "ltg2" {
  target_group_arn = aws_lb_target_group.tg1.arn
  target_id = aws_instance.server2.id 
  port = 80  // integer int
}

resource "aws_lb" "lb1" {
  name = "alb-loadbalancer"
  internal = false 
  load_balancer_type = "application"  # string
  security_groups = [ aws_security_group.alb.id ]
  subnets = [ aws_subnet.pub1.id, aws_subnet.pub2.id ]
  enable_deletion_protection = false // boolean
  tags ={
    Env = "dev"
  }
}
resource "aws_lb_listener" "listenner1" {
  load_balancer_arn = aws_lb.lb1.arn 
  port = 80 
  protocol = "HTTP"
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.tg1.arn
  }
}

# resource "aws_lb_target_group" "tg1" {
#   name     = "alb-target-gp"
#   port     = 80
#   protocol = "HTTP"
#   vpc_id   = aws_vpc.v1.id

#   health_check {
#     enabled             = true
#     healthy_threshold   = 3
#     interval            = 100
#     path                = "/"
#     matcher             = 200
#     port                = "traffic-port"
#     protocol            = "HTTP"
#     timeout             = 6
#     unhealthy_threshold = 3
#   }
# }

# resource "aws_lb_target_group_attachment" "ltg1" {
#   target_group_arn = aws_lb_target_group.tg1.arn
#   target_id        = aws_instance.server1.id
#   port             = 80
# }

# resource "aws_lb_target_group_attachment" "ltg2" {
#   target_group_arn = aws_lb_target_group.tg1.arn
#   target_id        = aws_instance.server2.id
#   port             = 80
# }

# resource "aws_lb" "lb1" {
#   name                        = "alb-loadbalancer"
#   internal                    = false
#   load_balancer_type          = "application"
#   security_groups             = [aws_security_group.alb.id]
#   subnets                     = [aws_subnet.pub1.id, aws_subnet.pub2.id]
#   enable_deletion_protection  = false
#   tags = {
#     Env = "dev"
#   }
# }

# # HTTP Listener (Redirects to HTTPS)
# resource "aws_lb_listener" "http_listener" {
#   load_balancer_arn = aws_lb.lb1.arn
#   port              = 80
#   protocol          = "HTTP"

#   default_action {
#     type = "redirect"
#     redirect {
#       protocol   = "HTTPS"
#       port       = "443"
#       status_code = "HTTP_301"
#     }
#   }
# }


# resource "aws_lb_listener" "https_listener" {
#   load_balancer_arn = aws_lb.lb1.arn
#   port              = 443
#   protocol          = "HTTPS"

#   certificate_arn = aws_acm_certificate.cert.arn  

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.tg1.arn
#   }
#   depends_on = [ aws_acm_certificate.cert ]
# }

# # ACM Certificate for HTTPS
# resource "aws_acm_certificate" "cert" {
#   domain_name       = "awscertif.site"  
#   validation_method = "DNS"

#   subject_alternative_names = [
#     "www.awscertif.site"  
#   ]
# }

