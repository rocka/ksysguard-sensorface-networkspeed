import * as Config from './config.mjs';

// https://invent.kde.org/plasma/libksysguard/-/blob/Plasma/6.1/formatter/Unit.h#L21
export const MetricPrefix = {
    AutoAdjust: -1,
    Unity: 0,
    Kilo: 1,
    Mega: 2,
    Giga: 3,
    Tera: 4,
    Peta: 5
};

// unit: https://invent.kde.org/plasma/libksysguard/-/blob/Plasma/6.1/formatter/Unit.h#L36
export const Unit = {
    Invalid: -1,
    None: 0,

    // Byte size units.
    Byte: 100,
    KiloByte: MetricPrefix.Kilo + 100,
    MegaByte: MetricPrefix.Mega + 100,
    GigaByte: MetricPrefix.Giga + 100,
    TeraByte: MetricPrefix.Tera + 100,
    PetaByte: MetricPrefix.Peta + 100,

    // Data rate units.
    ByteRate: 200,
    KiloByteRate: MetricPrefix.Kilo + 200,
    MegaByteRate: MetricPrefix.Mega + 200,
    GigaByteRate: MetricPrefix.Giga + 200,
    TeraByteRate: MetricPrefix.Tera + 200,
    PetaByteRate: MetricPrefix.Peta + 200,

    // Data rate units in bits.
    BitRate: 500,
    KiloBitRate: MetricPrefix.Kilo + 500,
    MegaBitRate: MetricPrefix.Mega + 500,
    GigaBitRate: MetricPrefix.Giga + 500,
    TeraBitRate: MetricPrefix.Tera + 500,
    PetaBitRate: MetricPrefix.Peta + 500
};

export function formatNetworkSpeed(sensorsInstantiator, unitStyle, shortUnit) {
    const count = sensorsInstantiator.count;
    // data rate sum in bits
    let sum = 0;
    for (let i = 0; i < count; i++) {
        const { unit, value } = sensorsInstantiator.objectAt(0);
        // value can be `undefined` on startup
        if (unit === Unit.Invalid || value === undefined) {
            continue;
        }
        if (unit >= Unit.ByteRate && unit <= Unit.PetaByteRate) {
            sum += value * Math.pow(2, (unit - Unit.ByteRate) * 10) * 8;
        } else if (unit >= Unit.BitRate && unit <= Unit.PetaBitRate) {
            sum += value * Math.pow(2, (unit - Unit.BitRate) * 10);
        }
    }
    const { base, scale, units, suffix } = Config.UnitStyle[unitStyle];
    sum /= scale;
    let unitIndex = 0;
    while (sum >= 1000) {
        sum /= base;
        unitIndex++;
    }
    const decimal = (unitIndex > 0) ? 2 - Math.trunc(Math.log10(sum)) : 0;
    let s = sum.toFixed(decimal) + " " + units[unitIndex];
    if (shortUnit === false) {
        s += suffix;
    }
    return s;
}
