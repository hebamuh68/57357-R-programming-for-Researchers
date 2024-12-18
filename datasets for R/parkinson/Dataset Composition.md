# **Dataset Composition**
This dataset is used to study Parkinson’s disease and includes patient information and various acoustic and clinical features derived from their voice recordings.

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
