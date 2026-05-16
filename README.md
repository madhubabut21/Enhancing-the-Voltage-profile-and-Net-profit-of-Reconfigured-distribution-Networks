Enhancing the Voltage Profile and Net Profit of Reconfigured Distribution Networks with the Optimal Integration of EVCS and Capacitor Banks with Chaotic HBA
Enhancing the Voltage profile and Net profit of Reconfigured distribution Networks with the Optimal integration of EVCS and Capacitor Banks with Chaotic HBA
Manuscript Information

Title: Enhancing the Voltage Profile and Net Profit of Reconfigured Distribution Networks with the Optimal Integration of EVCS and Capacitor Banks with Chaotic HBA

Authors:

•	K. Asokan

•	Madhubabu Thiruveedula

Department of Electrical and Electronics Engineering,
Annamalai University, Chidambaram,
Tamilnadu, India
________________________________________
📘 Overview

This repository provides MATLAB source code, input datasets, and simulation results for the research work titled:

"Enhancing the Voltage Profile and Net Profit of Reconfigured Distribution Networks with the Optimal Integration of EVCS and Capacitor Banks with Chaotic HBA."

The study proposes a Chaotic Honey Badger Algorithm (CHBA) to determine the optimal location of Electric Vehicle Charging Stations (EVCS), optimal placement and sizing of capacitor banks, and optimal network reconfiguration in radial distribution systems.
________________________________________
🧠 Key Features

•	Chaotic Honey Badger Algorithm (CHBA): Enhances standard HBA using Henon chaotic maps for improved exploration and avoiding local optima.

•	Simultaneous Optimization: Integrates EVCS placement, capacitor sizing, and network reconfiguration in a unified framework.

•	Multi-Objective Function: Combines technical (power loss minimization, voltage profile improvement) and economic (net profit maximization) criteria.

•	Network Reconfiguration: Modifies topology using tie-switches to reduce losses and improve voltage.

•	Statistical Analysis: Validates robustness through mean and standard deviation metrics.
________________________________________
📁 Files Description

/scripts/ – MATLAB Simulation Scripts

•	main_CHBA_IEEE33.m – Main execution file for running CHBA optimization

•	load_ieee33_data.m – Loads IEEE 33-bus system line and bus data

•	forward_backward_sweep.m – Basic load flow calculation for radial networks

•	initialize_chba_population.m – Initializes population using Henon chaotic map

•	evaluate_fitness.m – Computes fitness based on loss and voltage violation

•	apply_reconfiguration.m – Applies network reconfiguration via tie-switches

•	update_chaotic_parameters.m – Updates β(t) and C(t) using Henon map

•	calculate_intensity.m – Computes prey scent intensity (inverse square law)

•	apply_bounds.m – Applies variable bounds to solutions

•	compute_vsi.m – Computes Voltage Stability Index
/data/ – Input Data Files

•	ieee33_bus_data.mat – IEEE 33-bus load and line parameters

•	ieee33_line_data.mat – Branch impedance and tie-switch data

•	cost_parameters.mat – EVCS and capacitor installation/operating costs
/results/ – Output Files

•	chba_results_ieee33.mat – Optimal EVCS locations, capacitor sizes, tie-switches

•	voltage_profile_comparison.png – Voltage comparison across all buses

•	convergence_curve.png – CHBA convergence behaviour over iterations

•	power_loss_comparison.png – Loss reduction bar chart

•	net_profit_comparison.png – Economic comparison with existing methods
________________________________________
🔬 Tested Scenarios

•	Case 1 (Base Case) – No EVCS, no capacitors, no reconfiguration

•	Case 2 – EVCS and capacitor placement only (without reconfiguration)

•	Case 3 – Simultaneous EVCS placement, capacitor placement, and network reconfiguration
________________________________________
⚙️ System Specifications

•	Distribution System: IEEE 33-bus radial distribution network

•	Base Voltage: 12.66 kV

•	Base Power: 100 MVA

•	EVCS Rating: 975 kW per station 

•	Capacitor Size Range: 0–2000 kVAR

•	Population Size: 40

•	Maximum Iterations: 300

•	Tie-Switches: Lines 34, 35, 36, 37
________________________________________
📊 Results Summary

Case	Method	Active Power Loss	Minimum Voltage	Net Profit	VSI Minimum

Case 1	Base	201.87 kW	0.9131 p.u.	–	0.6951

Case 2	CHBA	135.26 kW	0.9381 p.u.	$19,123	0.7419

Case 3	CHBA	106.98 kW	0.9581 p.u.	$35,834	0.8424

Improvement (Case 3 vs Base):

•	Power Loss Reduction: 47.0%

•	Voltage Improvement: 4.93%

•	VSI Improvement: 21.2%
________________________________________
🧮 Step-by-Step Algorithm

Base Case – No EVCS, No Capacitors, No Reconfiguration

1.	Load IEEE 33-bus network data

2.	Perform forward-backward sweep load flow

3.	Record base active power loss and minimum voltage

Case 2 – EVCS and Capacitor Placement Only

1.	Load base network data and cost parameters

2.	Initialize CHBA population with EVCS locations and capacitor sizes

3.	Add EVCS loads and capacitor injections

4.	Run load flow and compute fitness (loss + voltage penalty)

5.	Execute CHBA optimization (digging and honey phases)

6.	Record optimal EVCS locations, capacitor sizes, and metrics

Case 3 – Simultaneous EVCS, Capacitor, and Reconfiguration

1.	Load network with tie-switch data (lines 34–37)

2.	Initialize CHBA population with EVCS locations, capacitor sizes, and tie-switch states

3.	Apply network reconfiguration (close selected tie-switches)

4.	Add EVCS loads and capacitor injections

5.	Run load flow and compute fitness

6.	Execute CHBA with chaotic parameter updates

7.	Output optimal EVCS, capacitor locations/sizes, and open tie-switches

8.	Compute net profit from loss reduction benefit minus installation and operating costs
________________________________________
📌 Applications

•	EV charging infrastructure planning in distribution networks

•	Reactive power compensation using capacitor banks

•	Network reconfiguration for loss minimization

•	Smart grid and distribution system optimization

•	Voltage profile improvement in radial networks
________________________________________
⚠️ Limitations

•	Queuing and waiting-time constraints at charging stations not modelled

•	Radial topology assumption; extension to meshed networks requires modification
________________________________________
📧 Contact

For questions or support in reproducing results:

•	K. Asokan – [asokan@gcebargur.ac.in]

•	Madhubabu Thiruveedula – [madhubabu@tkrec.ac.in]
