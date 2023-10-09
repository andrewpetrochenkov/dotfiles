SELECT name, setting, sourcefile, sourceline
FROM pg_settings
WHERE source='configuration file';
