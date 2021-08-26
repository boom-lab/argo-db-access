## WHOI Argo database API tools

Matlab and Python tools are provided for access to WHOI float metadata

The following API access points are supported:<br>
https://db.whoifloatgroup.org/api/deployment_metadata<br>
https://db.whoifloatgroup.org/api/sensor_metadata<br>
https://db.whoifloatgroup.org/continuous_profile_stats<br>
https://db.whoifloatgroup.org/discrete_profile_stats<br>
https://db.whoifloatgroup.org/api/cycle_meta_get

#### Repository Structure

```
├── LICENSE
├── README.md
├── matlab
│   ├── api_request.m
│   ├── get_continuous_profiles_stats.m
│   ├── get_cycle_metadata.m
│   ├── get_deployment_metadata.m
│   ├── get_discrete_profiles_stats.m
│   ├── get_sensor_metadata.m
│   └── get_wmo.m
│   ├── examples
│       ├── api_example_summary_stats.m
│       └── api_examples.m
└── python
    └── get_metadata.py
    ├── examples
        └── metadata_analysis.ipynb
```

#### Authors

Ryan Anderson and David Nicholson, Woods Hole Oceanographic Institution
