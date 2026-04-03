# 📊 Canonical Correlation Analysis: Economic Indicators and COVID-19 Impact

This repository contains the dataset and R-based data science pipeline for an advanced multivariate statistical analysis. The project explores the underlying structural relationships between **Macroeconomic/Development Indicators** and the **Impact of the COVID-19 Pandemic** at a global scale (based on 2020 data).

Instead of analyzing variables in isolated pairs, this project applies **Canonical Correlation Analysis (CCA)** and **Redundancy Analysis (RDA)**. These techniques allow us to investigate the complex, multidimensional correlations between two distinct sets of variables simultaneously.

## 🛠️ Tools & Libraries Used

* **Language:** R
* **Data Manipulation:** `dplyr`
* **Statistical Analysis:** * `CCA`, `CCP` (For Canonical Correlation Analysis and significance testing)
  * `vegan` (For Redundancy Analysis)
  * `lme4`

---

## 🗂️ Dataset & Variables

The raw dataset was aggregated into country-level averages. The variables are divided into two main sets for the multivariate analysis:

**Set 1: Economic & Development Indicators**
* `GDPCAP` (GDP per capita) - A measure of a country's economic output per person.
* `STI` - Science, Technology, and Innovation index.
* `HDI` (Human Development Index) - A summary measure of average achievement in key dimensions of human development.

**Set 2: COVID-19 Impact Indicators**
* `total_cases` - Total accumulated COVID-19 cases.
* `total_deaths` - Total accumulated COVID-19 deaths.
* `stringency_index` - A composite measure of the strictness of government responses (e.g., closures, travel bans). This continuous variable was discretized into an ordinal scale (1 to 5) to categorize the strictness levels.

---

## ⚙️ Analysis Workflow & Methodology

The analytical process, contained within the `Impact of Covid-19.R` script, follows these structured steps:

### 1. Data Preprocessing
* **Aggregation:** Condensing the dataset by calculating the mean values for each country to perform a macro-level analysis.
* **Data Typing:** Ensuring all features are correctly formatted as numeric vectors.
* **Discretization:** Converting the continuous `stringency_index` into categorical ordinal labels (1 through 5) to simplify the interpretation of government policy responses.

### 2. Exploratory Data Analysis (EDA)
* Constructing a Cross-Correlation Matrix to visually and quantitatively assess the initial linear relationships, both *within-set* (e.g., how GDP correlates with HDI) and *between-set* (e.g., how HDI correlates with total cases).

### 3. Canonical Correlation Analysis (CCA)
* Extracting **Canonical Variates** (latent artificial variables) that represent linear combinations of the variables in Set 1 and Set 2. The goal is to find the weights that maximize the correlation between the economic set and the COVID-19 set.
* Analyzing the **Canonical Coefficients** to identify which specific indicators (e.g., HDI or Stringency) carry the most weight in driving the relationship between a country's development and its pandemic situation.

### 4. Redundancy Analysis (RDA)
* While CCA shows correlation, **RDA** is used to evaluate the *explained variance*. It measures how much of the variance in the COVID-19 impact variables can actually be explained by the Economic/Development variables (and vice versa). This provides a clearer picture of the magnitude and direction of the structural dependencies.

---

## 📈 Key Value of the Analysis

Applying CCA and RDA allows us to answer nuanced, multidimensional questions. For example: *Do countries with higher income and human development report higher COVID-19 cases (potentially due to better testing infrastructure), and how does that correlate with the strictness of their government policies compared to less developed nations?* The results from this statistical model provide empirical evidence regarding the intersection of a nation's foundational infrastructure and its public health outcomes during a global crisis.

---
