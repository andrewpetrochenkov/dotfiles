SELECT name, setting
FROM pg_settings
WHERE source='override';
