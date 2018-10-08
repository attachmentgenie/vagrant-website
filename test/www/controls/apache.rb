title 'Check apache setup'

control 'apache-2.0' do
  impact 1.0
  title 'Port 8000 should be in use by httpd'
  describe port(8000) do
    it { should be_listening }
    its('processes') {should include 'httpd'}
  end
end

control 'apache-3.0' do
  impact 1.0
  title 'Port 8001 should be in use by httpd'
  describe port(8001) do
    it { should be_listening }
    its('processes') {should include 'httpd'}
  end
end

include_controls 'apache-baseline'
