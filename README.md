# Week 2 — Signals in MATLAB

This mini‑project generates and visualizes common signals used in Signals & Systems:

- **Unit Impulse** (δ(t), shown via a narrow, unit‑area pulse approximation)
- **Unit Step** (u(t))
- **Unit Ramp** (r(t) = t·u(t))
- **Exponential** (x(t) = e^{a t}·u(t), with a = –2 by default)
- **Signum** (sgn(t))
- **Sinc** (sinc(t) = sin(πt)/(πt), using MATLAB’s `sinc`)

## How to Run

1. Open MATLAB in this folder.
2. Run:
   ```matlab
   signals
   ```
3. PNG plots will be saved into the `figures/` directory.

## Sample Output (after running)

> The images will be created when you run `signals.m`:
- `figures/01_impulse.png`
- `figures/02_step.png`
- `figures/03_ramp.png`
- `figures/04_exponential.png`
- `figures/05_signum.png`
- `figures/06_sinc.png`

You can embed them here, e.g.:
```md
![Impulse](figures/01_impulse.png)
![Step](figures/02_step.png)
![Ramp](figures/03_ramp.png)
![Exponential](figures/04_exponential.png)
![Signum](figures/05_signum.png)
![Sinc](figures/06_sinc.png)
```

## File List

- `signals.m` — MATLAB script that generates and saves all plots.
- `figures/` — Output images (created on first run).
- `.gitignore` — Ignores MATLAB autosave files and OS clutter.

## Notes

- The **impulse δ(t)** is not numerically representable; we visualize a *narrow, unit‑area* pulse centered at 0.
- The **exponential** is made **causal** by multiplying with `u(t)`.
- Time is simulated on a dense grid with `Ts = 1e-3` s to approximate “continuous time.”

## How to Reproduce Plots with Different Settings

Open `signals.m`, change parameters like the decay `a`, time step `Ts`, or time window `t = tmin:Ts:tmax`, then rerun.

---

### (Optional) Blog Post (300–400 words)

**Why these signals matter for IoT/Data/AI engineers**  
Signals are the language of real‑world systems. From temperature sensors and accelerometers to ECG leads and radar returns, everything we measure is a signal that varies over time. Building intuition for a few “canonical” signals—impulse, step, ramp, exponential, signum, and sinc—pays off across embedded systems, machine learning pipelines, and control applications.

**Walkthrough of the MATLAB script**  
The script simulates continuous time using a small step `Ts` and creates six plots. Because the true Dirac impulse δ(t) is mathematically ideal (infinite at t=0 with unit area), we visualize it as a very narrow rectangular pulse whose total area is one. The unit step u(t) and ramp r(t)=t·u(t) describe on/off behavior and linearly increasing inputs—both essential when analyzing system responses. We include a causal exponential e^{a t}·u(t), a classic model for charging, discharging, or thermal decay. The signum function sgn(t) is helpful for symmetry arguments and piecewise reasoning. Finally, sinc(t)=sin(πt)/(πt) shows up in sampling theory and ideal low‑pass filters; its side‑lobes are a reminder that time‑domain truncation has frequency‑domain consequences.

**Reflection and real‑world link**  
In IoT practice, these shapes appear everywhere: step‑like actuator commands, exponential sensor settling, ramped setpoints, and impulse‑like disturbances. By generating and labeling these signals in MATLAB, I deepened my ability to read plots quickly, verify units, and reason about causality. This foundation makes it easier to debug firmware filters, design digital controllers, and interpret ML features extracted from raw sensor streams. The repo includes runnable code and saved figures so others can replicate and extend the experiments.
