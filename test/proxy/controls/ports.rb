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
  title 'Port 8000 should be in use by httpd'
  describe port(8000) do
    it { should be_listening }
    its('processes') {should include 'httpd'}
  end
end

control 'ports-3.0' do
  impact 1.0
  title 'Port 8001 should be in use by httpd'
  describe port(8001) do
    it { should be_listening }
    its('processes') {should include 'httpd'}
  end
end

control 'ports-4.0' do
  impact 1.0
  title 'Port 8010 should be in use by haproxy'
  describe port(8010) do
    it { should be_listening }
    its('processes') {should include 'haproxy'}
  end
end

control 'ports-5.0' do
  impact 1.0
  title 'Port 8011 should be in use by haproxy'
  describe port(8011) do
    it { should be_listening }
    its('processes') {should include 'haproxy'}
  end
end

control 'ports-6.0' do
  impact 1.0
  title 'Port 8020 should be in use by nginx'
  describe port(8020) do
    it { should be_listening }
    its('processes') {should include 'nginx'}
  end
end

control 'ports-7.0' do
  impact 1.0
  title 'Port 8021 should be in use by nginx'
  describe port(8021) do
    it { should be_listening }
    its('processes') {should include 'nginx'}
  end
end

control 'ports-8.0' do
  impact 1.0
  title 'Port 8030 should be in use by Traefik'
  describe port(8030) do
    it { should be_listening }
    its('processes') {should include 'traefik'}
  end
end

control 'ports-9.0' do
  impact 1.0
  title 'Port 8031 should be in use by Traefik'
  describe port(8031) do
    it { should be_listening }
    its('processes') {should include 'traefik'}
  end
end