require '../lib/cloud_monitor_agent'

API_URL = "http://localhost:9292/api/v1/push_info"
CLOUD_TOKEN = "1234345"
DELAY = 60

cloud_agent = CloudMonitorAgent.new(API_URL, CLOUD_TOKEN, DELAY)

cloud_agent.send_report