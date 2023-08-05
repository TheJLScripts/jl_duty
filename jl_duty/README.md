
## Dependencies
- [``es_extended``](https://github.com/esx-framework/esx-legacy/)
- [``ox_target``](https://github.com/overextended/ox_target)
## Config Example
```lua
Config.Jobs = {
    Ambulance = {
        OnDutyJob = 'ambulance',
        OffDutyJob = 'offambulance',
        Locations = {
            vec3(309.3660, -592.3234, 43.2840)
        }
    },

    Sheriff = {
        OnDutyJob = 'lspd',
        OffDutyJob = 'offlspd',
        Locations = {
            vec3(-447.9065, 6013.8262, 31.7163),
            vec3(1817.4017, 3672.9219, 35.3124)
        }
    }
}

INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
    ('offlspd', 'Off-Duty lspd', 1);

INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES 
    ('offlspd', 0, 'recruit', 'Recruit', 20, '{}', '{}'),
    ('offlspd', 1, 'officer', 'Officer', 40, '{}', '{}'),
    ('offlspd', 2, 'sergeant', 'Sergeant', 60, '{}', '{}'),
    ('offlspd', 3, 'lieutenant', 'Lieutenant', 85, '{}', '{}'),
    ('offlspd', 4, 'boss', 'Captain', 100, '{}', '{}');
