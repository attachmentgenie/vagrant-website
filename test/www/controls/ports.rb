title 'Check the ports in use'

control 'ports-1.0' do
  impact 1.0
  title 'Port 80 should not be in use'
  describe port(80) do
    it { should_not be_listening }
  end
end

control 'ports-2.0' do
  impact 1.0
  title 'Port 443 should not be in use'
  describe port(443) do
    it { should_not be_listening }
  end
end

control 'ports-3.0' do
  impact 1.0
  title 'Port 8000 should be in use by httpd'
  describe port(8000) do
    it { should be_listening }
    its('processes') {should include 'httpd'}
  end
end

control 'ports-4.0' do
  impact 1.0
  title 'Port 8020 should be in use by nginx'
  describe port(8020) do
    it { should be_listening }
    its('processes') {should include 'nginx'}
  end
end
