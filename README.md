# CorpSenQST
These matlab files give concise code for solving the corrupted sensing quantum state tomography optimization problem <a href="#ref-1">[1]</a>, using the [***QETLAB***](https://qetlab.com/) and [***CVX***](https://cvxr.com/cvx/) packages. 

Main files:
- `Allpaulis.m` obtain all the Pauli operators.
- `RanGetdataGau.m` simulate experimental measurement and obtain the noisy data.
- `Solve_FP.m` solve the optimization problem and get the reconstructed state and sparse noise.
- `RanGau.m` This file can be run directly by calling other function files to obtain data on state fidelity and mean squared error of sparse noise.

We would like to thank the authors of Refs. <a href="#ref-2-3">[2-3]</a> for providing the helpful reference code.

# References
<a id="ref-1"></a>[1] M. Ma, J. Shang, Corrupted sensing quantum state tomography, [arXiv:2405.14396.](https://arxiv.org/abs/2405.14396)  
<a id="ref-2-3"></a>[2] S. T. Flammia, D. Gross, Y.-K. Liu, and J. Eisert, Quantum tomography via compressed sensing: error bounds, sample complexity and efficient estimators, [New J. Phys. 14, 095022 (2012).](https://iopscience.iop.org/article/10.1088/1367-2630/14/9/095022)  
<a id="ref-2-3"></a>[3] J. Chen and Y. Liu, Stable recovery of structured signals from corrupted sub-Gaussian measurements, [IEEE Trans. Inf. Theory 65, 2976 (2019).](https://ieeexplore.ieee.org/document/8594650)  

# License
MIT License

Copyright (c) 2024 cQST-24

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
