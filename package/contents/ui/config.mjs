export const UnitStyle = [
    {
        value: "BitRate",
        text: "Bitrate (G/M/kb)",
        base: 1000,
        scale: 1,
        units: ['b', 'kb', 'Mb', 'Gb', 'Tb'],
        suffix: 'ps'
    },
    {
        value: "Metric",
        text: "Metric (G/M/kB)",
        base: 1000,
        scale: 8,
        units: ['B', 'kB', 'MB', 'GB', 'TB'],
        suffix: '/s'
    },
    {
        value: "Binary",
        text: "Binary (Gi/Mi/KiB)",
        base: 1024,
        scale: 8,
        units: ['B', 'KiB', 'MiB', 'GiB', 'TiB'],
        suffix: '/s'
    }
];
