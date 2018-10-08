title 'Check the ports in use'

control 'ports-1.0' do
  impact 1.0
  title 'Port 3306 should be in use by mysql'
  describe port(3306) do
    it { should be_listening }
    its('processes') {should include 'mysqld'}
  end
end

control 'ports-2.0' do
  impact 1.0
  title 'Port 5432 should be in use by pgsql'
  describe port(5432) do
    it { should be_listening }
    its('processes') {should include 'postmaster'}
  end
end
