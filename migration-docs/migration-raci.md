When planning a migration of AWS resources (such as infrastructure components, EC2 instances, and RDS databases) from one AWS account to another, especially across different organizations, it's crucial to establish clear roles and responsibilities. A RACI matrix is an excellent tool for this purpose, as it defines the participation of various roles in completing tasks or deliverables. RACI stands for Responsible, Accountable, Consulted, and Informed.

### Migration Plan Overview

1. **Preparation and Planning**: Assess the current environment, define the scope of migration, and prepare the migration plan.
2. **AWS Account Setup**: Configure the new AWS account according to best practices.
3. **Resource Migration**: Migrate EC2 instances, RDS databases, and other AWS resources.
4. **Testing**: Conduct thorough testing in the new environment to ensure everything works as expected.
5. **Cut-over and Go-live**: Switch production traffic to the new environment.
6. **Post-migration Support**: Provide support for any issues and optimize the new setup.

### RACI Matrix for AWS Account Migration

| Task                                             | Existing Account Owners | New Account Owners | Migration Team | Notes |
|--------------------------------------------------|-------------------------|--------------------|----------------|-------|
| **1. Preparation and Planning**                  |                         |                    |                |       |
| Define migration scope and objectives            | C                       | A                  | R              | New account owners are accountable for defining the scope and objectives, as it impacts their organization directly. |
| Inventory existing AWS resources                 | R                       |                    | A              | Migration team leads the inventory process but needs input from existing account owners. |
| **2. AWS Account Setup**                         |                         |                    |                |       |
| Create new AWS account and configure settings    |                         | R                  | A              | New account setup is primarily the responsibility of the new account owners, with the migration team providing guidance. |
| Configure IAM roles and policies                 | C                       | R                  | A              | New account owners handle IAM configurations with advice from the migration team. |
| **3. Resource Migration**                        |                         |                    |                |       |
| Migrate EC2 instances                            | C                       | C                  | R              | Migration team executes the migration, consulting with both account owners as needed. |
| Migrate RDS databases                            | C                       | C                  | R              | Similar to EC2, with close coordination required for data integrity. |
| **4. Testing**                                   |                         |                    |                |       |
| Conduct functional testing                       | C                       | C                  | R              | Migration team leads testing with input from account owners. |
| Perform load testing and validation              | C                       | C                  | R              | Ensures the new environment can handle expected traffic. |
| **5. Cut-over and Go-live**                      | C                       | A                  | R              | New account owners have the final say on going live, based on migration team's execution. |
| **6. Post-migration Support**                    | R                       | A                  | C              | Existing account owners might need to resolve lingering issues with the migration team's support. |

### Notes:
- **Responsible (R)**: Does the work to complete the task.
- **Accountable (A)**: Ultimately accountable for the correct and thorough completion of the task. There should be exactly one A specified for each task or deliverable.
- **Consulted (C)**: Subject matter experts consulted to provide insights or advice.
- **Informed (I)**: Kept informed of progress and with whom there is one-way communication.

This RACI matrix is a starting point. Depending on your organization's size, complexity, and specific needs during the AWS migration, roles and responsibilities might shift. It's crucial to adapt this framework to fit your unique circumstances.