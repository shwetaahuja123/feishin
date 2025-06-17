// Shared state for stop-after-current functionality
let stopAfterCurrentState = false;

export const getStopAfterCurrent = (): boolean => {
    console.log('getStopAfterCurrent called, value:', stopAfterCurrentState);
    return stopAfterCurrentState;
};

export const setStopAfterCurrent = (value: boolean): void => {
    console.log('setStopAfterCurrent called with value:', value);
    stopAfterCurrentState = value;
};

export const resetStopAfterCurrent = (): void => {
    console.log('resetStopAfterCurrent called');
    stopAfterCurrentState = false;
}; 