# Lab 02

Control of a nonlinear system through feedback linearization (FL). Once obtained a linearized system, I decided to apply a proportional gain.

$$y^{(\gamma)} \doteq v = r^{(\gamma)} + k_\gamma \tilde \mu_\gamma + \cdots + k_2 \tilde \mu_2 + k_1 \tilde \mu$$


![schematics](../images/lab02_schematics.PNG)

The system successfully reached asyntotic stability to a constant value, which I deliberately chose as $1$.

![as](../images/lab02_fl_asymptotic_stability.png)