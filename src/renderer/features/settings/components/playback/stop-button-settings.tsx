import { Divider } from '@mantine/core';
import { useTranslation } from 'react-i18next';

import { Switch } from '/@/renderer/components';
import {
    SettingOption,
    SettingsSection,
} from '/@/renderer/features/settings/components/settings-section';
import { usePlaybackSettings, useSettingsStoreActions } from '/@/renderer/store/settings.store';

export const StopButtonSettings = () => {
    const { t } = useTranslation();
    const settings = usePlaybackSettings();
    const { setSettings } = useSettingsStoreActions();

    const stopButtonOptions: SettingOption[] = [
        {
            control: (
                <Switch
                    defaultChecked={settings.enableModifiedStopButton}
                    onChange={(e) => {
                        setSettings({
                            playback: {
                                ...settings,
                                enableModifiedStopButton: e.currentTarget.checked,
                            },
                        });
                    }}
                />
            ),
            description: t('setting.enableModifiedStopButton', {
                context: 'description',
                postProcess: 'sentenceCase',
            }),
            title: t('setting.enableModifiedStopButton', { postProcess: 'sentenceCase' }),
        },
    ];

    return (
        <>
            <Divider />
            <SettingsSection divider={false} options={stopButtonOptions} />
        </>
    );
}; 