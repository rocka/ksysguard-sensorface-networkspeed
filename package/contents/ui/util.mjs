export function formatNetworkSpeed(sensorsInstantiator) {
    const count = sensorsInstantiator.count;
    let sum = 0;
    for (var i = 0; i < count; i++) {
        sum += sensorsInstantiator.objectAt(i).value;
    }
    const unit = ['B', 'KiB', 'MiB', 'GiB', 'TiB', 'PiB'];
    let unitIndex = 0;
    while (sum >= 1000) {
        sum /= 1024;
        unitIndex++;
    }
    const decimal = (unitIndex > 0) ? 2 - Math.trunc(Math.log10(sum)) : 0;
    return sum.toFixed(decimal) + " " + unit[unitIndex];
}
