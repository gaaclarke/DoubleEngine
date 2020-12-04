flutter_application_path = './DoubleEngine/double_engine/'
load File.join(flutter_application_path, '.ios', 'Flutter', 'podhelper.rb')

target 'DoubleEngine' do
  install_all_flutter_pods(flutter_application_path)
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['ONLY_ACTIVE_ARCH'] = 'YES'
    end
  end
end
