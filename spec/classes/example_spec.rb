require 'spec_helper'

describe 'mount' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "mount class without any parameters" do
          let(:params) {{ }}

          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('mount::params') }
          it { is_expected.to contain_class('mount::install').that_comes_before('mount::config') }
          it { is_expected.to contain_class('mount::config') }
          it { is_expected.to contain_class('mount::service').that_subscribes_to('mount::config') }

          it { is_expected.to contain_service('mount') }
          it { is_expected.to contain_package('mount').with_ensure('present') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'mount class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { is_expected.to contain_package('mount') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
