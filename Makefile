init:
	terraform init

clean:
	rm -frv .terraform*
	rm -fv terraform.tfstate*
	rm -fv */terraform.tfstate*
	rm -frv */.terraform*
        
