require 'spec_helper'

describe 'ucspi-tcp::default' do
  %w( 14.04 12.04 10.04 ).each do |platform_version|
    context "ubuntu #{platform_version}" do
      let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: platform_version).converge(described_recipe) }
      it 'should install from package by default' do
        expect(chef_run).to include_recipe('ucspi-tcp::package')
        expect(chef_run).to install_package('ucspi-tcp')
      end
    end
  end

  %w( 6.0.5 7.0 ).each do |platform_version|
    context "debian #{platform_version}" do
      let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'debian', version: platform_version).converge(described_recipe) }
      it 'should install from package by default' do
        expect(chef_run).to include_recipe('ucspi-tcp::package')
        expect(chef_run).to install_package('ucspi-tcp')
      end
    end
  end

  %w( 5.10 6.5 7.0 ).each do |platform_version|
    context "centos #{platform_version}" do
      let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'centos', version: platform_version, file_cache_path: '/var/chef/cache').converge(described_recipe) }
      it 'should install from source by default' do
        expect(chef_run).to include_recipe('ucspi-tcp::source')
        expect(chef_run).to include_recipe('build-essential')
        resource = chef_run.remote_file('/var/chef/cache/ucspi-tcp-0.88.tar.gz')
        expect(resource).to notify('bash[install_ucspi]').to(:run).immediately
      end
    end
  end

  context 'arch 3.10.5-1-ARCH' do
    let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'arch', version: '3.10.5-1-ARCH').converge(described_recipe) }
    it 'should install from aur by default' do
      expect(chef_run).to include_recipe('ucspi-tcp::aur')
      expect(chef_run).to build_pacman_aur('ucspi-tcp')
    end
  end

  context 'gentoo 2.1' do
    let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'gentoo', version: '2.1').converge(described_recipe) }
    it 'should install with gentoo package name' do
      expect(chef_run).to install_package('ucspi-tcp').with(package_name: 'sys-apps/ucspi-tcp')
    end
  end
end
