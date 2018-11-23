# # encoding: utf-8

control 'package-01' do
  impact 1.0
  title 'Check Packages'
  desc 'Blablubb'
  describe package("openssh-server") do
    it { should be_installed } 
  end
  describe package("vim") do
    it { should be_installed }
  end
  describe package("zsh") do
    it { should be_installed }
  end
  describe package("zsh-antigen") do
    it { should be_installed }
  end
  describe package("zsh-syntax-highlighting") do
    it { should be_installed }
  end
end

control 'package-02' do
  impact 1.0
  title 'Check users and groups'
  desc 'Blubb'
  describe group('justanothergroup') do
    it { should exist }
  end
  describe group('lecturer') do
    it { should exist }
  end
  describe user('ckappel') do
    it { should exist }
    its('groups') { should eq ['ckappel', 'sudo'] }
    its('home') { should eq '/home/kappelc' }
    its('shell') { should eq '/bin/zsh' }
    # pubkey deployd
  end
  describe user('animmervoll') do
    it { should exist }
    its('groups') { should eq ['animmervoll', 'lecturer'] }
    its('home') { should eq '/home/nimm' }
    its('shell') { should eq '/bin/bash' }
  end
end


control 'package-03' do
  impact 1.0
  title 'Check SSH Service'
  desc 'Checking for Proto, PwAuth, root login,..'
  describe sshd_config do
    its('Protocol') { should eq '2' }
    its('PermitRootLogin') { should eq 'no' }
    its('PasswordAuthentication') { should eq ["no", "yes", "yes"] }
    its('PubkeyAuthentication') { should eq ["yes", "yes"] }
    its('Match') { should eq ["User ckappel Address *", "User vagrant Address 10.0.2.0/24"] }
  end
end

describe file '/etc/motd' do
  it { should be_file }
end

describe command('cat /etc/motd') do
  its('stdout') { should match "     _              _ _     _\n    / \\   _ __  ___(_) |__ | | ___\n   / _ \\ | '_ \\/ __| | '_ \\| ...ergroup\nMembers: kati ian ing \nLecturer:lecturer\nLast tool run was: \d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}\nBlubb\n" }
  its('stderr') { should eq '' }
  its('exit_status') { should eq 0 }
end


