# **Context**

Parkinson’s Disease (PD) is a degenerative neurological disorder marked by decreased dopamine levels in the brain. It manifests itself through a deterioration of movement, including the presence of tremors and stiffness. There is commonly a marked effect on speech, including dysarthria (difficulty articulating sounds), hypophonia (lowered volume), and monotone (reduced pitch range). Additionally, cognitive impairments and changes in mood can occur, and risk of dementia is increased.

Traditional diagnosis of Parkinson’s Disease involves a clinician taking a neurological history of the patient and observing motor skills in various situations. Since there is no definitive laboratory test to diagnose PD, diagnosis is often difficult, particularly in the early stages when motor effects are not yet severe. Monitoring progression of the disease over time requires repeated clinic visits by the patient. An effective screening process, particularly one that doesn’t require a clinic visit, would be beneficial. Since PD patients exhibit characteristic vocal features, voice recordings are a useful and non-invasive tool for diagnosis. If machine learning algorithms could be applied to a voice recording dataset to accurately diagnosis PD, this would be an effective screening step prior to an appointment with a clinician.

<br></br>
# **Dataset Composition**
This dataset is composed of a range of biomedical voice measurements from 31 people, 23 with Parkinson's disease (PD). Each column in the table is a particular voice measure, and each row corresponds to one of 195 voice recordings from these individuals ("name" column). The main aim of the data is to discriminate healthy people from those with PD, according to the "status" column which is set to 0 for healthy and 1 for PD.


#### **1. Patient Information**
- **Name (Patient ID)**: A unique identifier for each patient. For example: `phon_R01_S01_1`.
- **Status**: The label indicating whether the patient is diagnosed with Parkinson’s disease.
  - `1`: Patient has Parkinson's disease.
  - `0`: Patient does not have Parkinson's disease.

#### **2. Acoustic Features**
These features are derived from voice recordings and capture variations in frequency and amplitude, as well as noise and harmonic properties:
- **Fundamental Frequencies**:
  - `MDVP:Fo(Hz)`: Average vocal fundamental frequency.
  - `MDVP:Fhi(Hz)`: Maximum vocal fundamental frequency.
  - `MDVP:Flo(Hz)`: Minimum vocal fundamental frequency.

- **Jitter (Frequency Variations)**:
  - Measures the stability of the vocal frequency:
    - `MDVP:Jitter(%)`
    - `MDVP:Jitter(Abs)`
    - `MDVP:RAP`
    - `MDVP:PPQ`
    - `Jitter:DDP`

- **Shimmer (Amplitude Variations)**:
  - Measures the stability of the vocal amplitude:
    - `MDVP:Shimmer`
    - `MDVP:Shimmer(dB)`
    - `Shimmer:APQ3`
    - `Shimmer:APQ5`
    - `MDVP:APQ`
    - `Shimmer:DDA`

- **Noise Metrics**:
  - `NHR` (Noise-to-Harmonics Ratio): The ratio of noise to tonal components in the voice.
  - `HNR` (Harmonics-to-Noise Ratio): The ratio of harmonic sounds to noise in the voice.

#### **3. Clinical Features**
These are advanced measurements used to capture nonlinear and dynamic properties of the voice:
- **Nonlinear Dynamical Features**:
  - `RPDE` (Recurrence Period Density Entropy): Analyzes voice stability using nonlinear dynamics.
  - `DFA` (Detrended Fluctuation Analysis): Measures the long-term signal correlation.

- **Frequency Spread**:
  - `Spread1` and `Spread2`: Capture variations in voice frequency.

- **Other Features**:
  - `D2`: A nonlinear measure capturing the complexity of vocal signal dynamics.
  - `PPE` (Pitch Period Entropy): Quantifies the irregularity in pitch period.

<br></br>
#### **Citation**
Exploiting Nonlinear Recurrence and Fractal Scaling Properties for Voice Disorder Detection', Little MA, McSharry PE, Roberts SJ, Costello DAE, Moroz IM. BioMedical Engineering OnLine 2007, 6:23 (26 June 2007)
