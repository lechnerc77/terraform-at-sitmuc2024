package terraform.analysis

import rego.v1

import input as tfplan

########################
# Parameters for Policy
########################

# acceptable score for automated authorization
blast_radius := 40

# weights assigned for each operation on each resource-type
weights := {
	"btp_subaccount": {"delete": 100, "create": 10, "modify": 1},
	"btp_subaccount_entitlement": {"delete": 10, "create": 1, "modify": 5},
  "btp_subaccount_subscription":{"delete": 5, "create": 1, "modify": 3},
}

# Consider exactly these resource types in calculations
resource_types := {"btp_subaccount", "btp_subaccount_entitlement", "btp_subaccount_subscription"}

#########
# Policy
#########

# Authorization holds if score for the plan is acceptable and no changes are made to IAM
default autoexec := false

autoexec if {
	score < blast_radius
}

# Compute the score for a Terraform plan as the weighted sum of deletions, creations, modifications
score := s if {
	all := [x |
		some resource_type
		crud := weights[resource_type]
		del := crud.delete * num_deletes[resource_type]
		new := crud.create * num_creates[resource_type]
		mod := crud.modify * num_modifies[resource_type]
		x := del + new + mod
	]
	s := sum(all)
}

####################
# Terraform Library
####################

# list of all resources of a given type
resources[resource_type] := all if {
	some resource_type
	resource_types[resource_type]
	all := [name |
		name := tfplan.resource_changes[_]
		name.type == resource_type
	]
}

# number of creations of resources of a given type
num_creates[resource_type] := num if {
	some resource_type
	resource_types[resource_type]
	all := resources[resource_type]
	creates := [res | res := all[_]; res.change.actions[_] == "create"]
	num := count(creates)
}

# number of deletions of resources of a given type
num_deletes[resource_type] := num if {
	some resource_type
	resource_types[resource_type]
	all := resources[resource_type]
	deletions := [res | res := all[_]; res.change.actions[_] == "delete"]
	num := count(deletions)
}

# number of modifications to resources of a given type
num_modifies[resource_type] := num if {
	some resource_type
	resource_types[resource_type]
	all := resources[resource_type]
	modifies := [res | res := all[_]; res.change.actions[_] == "update"]
	num := count(modifies)
}
