require '../lib/cloud_monitor_agent'

API_URL = "http://localhost:4000/api/v1/push_info"
CLOUD_TOKEN = "a2b272a1d20657568c5b6eef9eb124cd"
DELAY = 10

cloud_agent = CloudMonitorAgent.new(API_URL, CLOUD_TOKEN, DELAY)

cloud_agent.send_report