## Code description : Terraform template module to add an Azure Virtual Desktop Autoscaling rule 
## Author : Pranav Singh
## Created Date : 29th May 2023
## Version : 1.0
## Last Modified Date : --
## Last Modified By : --
## For any information please reach out to "OCC_Engineering@ds.uhc.com"



resource "azurerm_virtual_desktop_scaling_plan" "avd_scaling_plan" {
  name                = var.scaling_plan_name
  location            = var.location 
  resource_group_name = var.rg_name
  friendly_name       = var.friendly_name
  description         = var.description
  time_zone           = var.time_zone

  dynamic "schedule" {
    for_each = var.schedule

    content {
    name                                 = schedule.value["name"]
    days_of_week                         = schedule.value["days_of_week"]
    ramp_up_start_time                   = schedule.value["ramp_up_start_time"]
    ramp_up_load_balancing_algorithm     = schedule.value["ramp_up_load_balancing_algorithm"]
    ramp_up_minimum_hosts_percent        = schedule.value["ramp_up_minimum_hosts_percent"]
    ramp_up_capacity_threshold_percent   = schedule.value["ramp_up_capacity_threshold_percent"]
    peak_start_time                      = schedule.value["peak_start_time"]
    peak_load_balancing_algorithm        = schedule.value["peak_load_balancing_algorithm"]
    ramp_down_start_time                 = schedule.value["ramp_down_start_time"]
    ramp_down_load_balancing_algorithm   = schedule.value["ramp_down_load_balancing_algorithm"]
    ramp_down_minimum_hosts_percent      = schedule.value["ramp_down_minimum_hosts_percent"]
    ramp_down_force_logoff_users         = schedule.value["ramp_down_force_logoff_users"]
    ramp_down_wait_time_minutes          = schedule.value["ramp_down_wait_time_minutes"]
    ramp_down_notification_message       = schedule.value["ramp_down_notification_message"]
    ramp_down_capacity_threshold_percent = schedule.value["ramp_down_capacity_threshold_percent"]
    ramp_down_stop_hosts_when            = schedule.value["ramp_down_stop_hosts_when"]
    off_peak_start_time                  = schedule.value["off_peak_start_time"]
    off_peak_load_balancing_algorithm    = schedule.value["off_peak_load_balancing_algorithm"]
    }
  }

  host_pool {
    hostpool_id          = var.hostpool_id
    scaling_plan_enabled = true
  }
}