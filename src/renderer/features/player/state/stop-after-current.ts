// Shared state for stop-after-current functionality
let stopAfterCurrentState = false;

export const getStopAfterCurrent = (): boolean => {
    return stopAfterCurrentState;
};

export const setStopAfterCurrent = (value: boolean): void => {
    stopAfterCurrentState = value;
};

export const resetStopAfterCurrent = (): void => {
    stopAfterCurrentState = false;
}; 