require 'spec_helper'

describe 'support_sysstat' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
      it { is_expected.to contain_class('support_sysstat::install') }
    end
  end
  context "Windows OS " do
    let(:facts) do
      {
        'os' => {
          'family' => 'Windows',
        },
      }
    end
    it { is_expected.to compile.and_raise_error(%r{This sysstat module only supports EL and Debian derivative Linux nodes.}) }
  end
end
