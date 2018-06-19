require 'spec_helper'

describe 'support_sysstat' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
      it { is_expected.to contain_class('support_sysstat::install')}
    end
  end
end
