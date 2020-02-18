
### ***
| Config                         |
|--------------------------------|
| GCP_PROJECT = co-swipelab-rage |


### GCloud 
* Install Google Cloud SDK (gcloud) https://cloud.google.com/sdk/ 
* Then
  * $ gcloud auth login
  * $ gcloud config set project <GCP_PROJECT>
  * $ gcloud auth application-default login

### Pulumi
* $ pulumi config set gcp:project <GCP_PROJECT>
* $ pulumi config set gcp:zone europe-west2-a     // any valid GCP Zone here
**
* $ pulumi config set gcp:region <GCP-REGION>


GCP Zones
https://cloud.google.com/compute/docs/regions-zones/