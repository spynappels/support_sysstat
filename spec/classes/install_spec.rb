require 'spec_helper'

describe 'support_sysstat::install' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
      it { is_expected.to contain_package('sysstat').with_ensure('present') }
    end
  end
  %w[Debian Ubuntu].each do |os|
    context "Debian-like: operating system => #{os}" do
      let(:facts) do
        {
          'os' => {
            'family' => 'Debian',
          },
        }
      end

      it { is_expected.to contain_file_line('enable_sa2').with_ensure('present') }
    end
  end
end
