title 'Check nginx setup'

control 'nginx-1.0' do
  impact 1.0
  title 'Port 8020 should be in use by nginx'
  describe port(8020) do
    it { should be_listening }
    its('processes') {should include 'nginx'}
  end
end

control 'nginx-2.0' do
  impact 1.0
  title 'Port 8021 should be in use by nginx'
  describe port(8021) do
    it { should be_listening }
    its('processes') {should include 'nginx'}
  end
end

include_controls 'nginx-baseline'
