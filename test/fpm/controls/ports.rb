title 'Check the ports pools'

control 'ports-1.0' do
  impact 1.0
  title 'Port 9000 should have a fpm pool listening'
  describe port(9000) do
    it { should be_listening }
    its('processes') {should include 'php-fpm'}
  end
end
