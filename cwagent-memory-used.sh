#masuk menggunakan user
cat >> /opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json << EOF
{
   "metrics":{
      "metrics_collected":{
         "mem":{
            "measurement":[
               "mem_total",
               "mem_cached",
               "mem_available_percent",
               "mem_used_percent",
               "mem_used",
               "mem_buffered"
            ],
            "metrics_collection_interval":30
         }
      }
   }
}
EOF
/opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a append-config -m ec2 -s -c file:/tmp/app.json
