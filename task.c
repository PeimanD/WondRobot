#define xdc__strict // gets rid of #303-D typedef warning re Uint16, Uint32
#include <xdc/std.h>
#include <ti/sysbios/BIOS.h>
#include <xdc/runtime/System.h>
#include <ti/sysbios/knl/Swi.h>
#include <Peripheral_Headers/F2802x_Device.h>

//function prototypes
extern void DeviceInit(void);       // Initializes device peripherals

// Global variables
volatile UInt pwmCount = 0;         // Pwm period where each number represents SYSCLK/(256)
volatile UInt pwmDC = 0;            // Pwm duty cycle between 0-pwmCount
volatile UInt range = 0;            // Range from ultrasonic sensor in cm
volatile UInt riseE = 0;            // Rising edge detector of ultrasonic echo
volatile UInt trig = 0;             // Tracks triggering of the ultrasonic sensor
volatile ULong startCounter = 0;    // Start of ultrasonic echo pulse
volatile ULong stopCounter = 0;     // End of ultrasonic echo pulse
volatile long pulseTime = 0;        // Total time of ultrasonic echo pulse in timer counts
volatile ULong period = 0;			// time period for Ultrasonic range sensor to calculate distance
volatile ULong dist1 = 0;			// distance in cm to an object in front
#define T2DIS 3480					// Value t oconvert time to distance in cm
volatile UInt carState = 0;				// status of car ==> 0=Stopped,  1=Slow,  2=Fast,  3=Turning

extern const Swi_Handle SpeedSWI;    // Modified by PD

void main(void)
{
    DeviceInit();                           //Initialize peripherals
    CpuTimer0Regs.TCR.bit.TIE = 1;          // Enable timer0 ISR
    System_printf("Initialized\n");         //Confirm initialization occurred
    BIOS_start(); // Initiate real time operating system, does not return
}


void timer0Fxn(void) //UArg arg
{
    if (!trig)
    {
        trig++;
        GpioDataRegs.GPASET.bit.GPIO6 = 1;      // Set Trigger Pin
    }

    else if (trig == 1)
    {
        GpioDataRegs.GPACLEAR.bit.GPIO6 = 1;    // Clear Trigger Pin
        XIntruptRegs.XINT1CR.bit.ENABLE = 1;    // Enable Peripheral Interrupt 1
        CpuTimer0Regs.TCR.bit.TIE = 0;          // Disable timer0 ISR
        trig++;
    }
}


void timer1Fxn(void)
{
    trig = 0;                                   // Reset Trigger tracker
    riseE = 0;                                  // Clear rising edge count
    CpuTimer0Regs.TCR.bit.TIE = 1;              // Enable timer0 ISR
    XIntruptRegs.XINT1CR.bit.ENABLE = 0;        // Disable Peripheral Interrupt 1
}


void ultraSonicHWIFxn(void)
{
    if (riseE == 0)
    {
        riseE++;
        ReloadCpuTimer1();
        StartCpuTimer1();
        startCounter = ReadCpuTimer1Counter();
        period = ReadCpuTimer1Period();
    }

    else if (riseE == 1)
    {
        stopCounter = ReadCpuTimer1Counter();
        pulseTime = (startCounter - stopCounter);
        XIntruptRegs.XINT1CR.bit.ENABLE = 0;    // Disable Peripheral Interrupt 1
        riseE++;
		Swi_post(SpeedSWI);
    }
}


void SpeedSWIFxn(UArg arg)
{
	dist1 = pulseTime/(T2DIS) * 1.3;
    if (dist1 < 5){
        EPwm2Regs.CMPA.half.CMPA = 0;     // Compare counter for EPWMA, sets duty cycle
        EPwm2Regs.CMPB = 200;               // Compare counter for EPWMB, sets duty cycle
        EPwm3Regs.CMPA.half.CMPA = 0;     // Compare counter for EPWMA, sets duty cycle
        EPwm3Regs.CMPB = 200;               // Compare counter for EPWMB, sets duty cycle
        //GpioDataRegs.GPACLEAR.bit.GPIO12 = 1;
        //GpioDataRegs.GPACLEAR.bit.GPIO19 = 1;
		carState = 0;
		
    }
    else if (dist1 < 15 && dist1 > 5){
		EPwm2Regs.CMPA.half.CMPA = 200;     // Compare counter for EPWMA, sets duty cycle
        EPwm2Regs.CMPB = 0;               // Compare counter for EPWMB, sets duty cycle
        EPwm3Regs.CMPA.half.CMPA = 200;     // Compare counter for EPWMA, sets duty cycle
        EPwm3Regs.CMPB = 0;               // Compare counter for EPWMB, sets duty cycle
        carState = 1;
    }
	else if(dist1 >= 15){
		EPwm2Regs.CMPA.half.CMPA = 500;     // Compare counter for EPWMA, sets duty cycle
        EPwm2Regs.CMPB = 0;               // Compare counter for EPWMB, sets duty cycle
        EPwm3Regs.CMPA.half.CMPA = 500;     // Compare counter for EPWMA, sets duty cycle
        EPwm3Regs.CMPB = 0;               // Compare counter for EPWMB, sets duty cycle
        GpioDataRegs.GPASET.bit.GPIO12 = 1;
        GpioDataRegs.GPASET.bit.GPIO19 = 1;
        carState = 2;
    }
	//EPwm3Regs.CMPB = 200;               // Compare counter for EPWMB, sets duty cycle

}


void myIdleFxn(void)
{

}
