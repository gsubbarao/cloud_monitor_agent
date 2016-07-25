require 'usagewatch_ext'
require 'net/http'
require 'json'

class CloudMonitorAgent
  
  def initialize(url, token, intervel)  
    @url = url
    @token = token
    @intervel = intervel  
  end 

  def api_url 
    @url
  end

  def token 
    @token
  end

  def delay 
    @intervel
  end
  
  def getPayload  
    usw =  Usagewatch
    payload = {:token => self.token, :cpu_used => usw.uw_cpuused, :disk_used => usw.uw_diskused_perc, :mem_used => usw.uw_memused, :bandwidth_up => usw.uw_bandtx,
                :bandwidth_down => usw.uw_bandrx, :top_process_cpu => usw.uw_cputop, :top_process_memory => usw.uw_memtop};
  end  
  
  def send_report 
    while true
      payload = self.getPayload 
      uri = URI('http://localhost:9292/api/v1/push_info')
      req = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')
      req.body = payload.to_json
      res = Net::HTTP.start(uri.hostname, uri.port) do |http|
        http.request(req)
      end
      sleep @intervel
    end
  end  

end
