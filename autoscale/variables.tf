#(Required) The name which should be used for this Virtual Desktop Scaling Plan . Changing this forces a new Virtual Desktop Scaling Plan to be created.
variable "scaling_plan_name"{
    type    = string
    default = "AVDScalingPlan"
}

#(Required) The Azure Region where the Virtual Desktop Scaling Plan should exist. Changing this forces a new Virtual Desktop Scaling Plan to be created.
variable "location"{
    type = string
    default = null
}

#(Required) The name of the Resource Group where the Virtual Desktop Scaling Plan should exist. Changing this forces a new Virtual Desktop Scaling Plan to be created.
variable "rg_name"{
    type    = string
    default = null
}

#(Optional) Friendly name of the Scaling Plan.
variable "friendly_name"{
    type = string
    default = "AVD Scaling Plan"
}

#(Optional) A description of the Scaling Plan.
variable "description"{
    type = string
    default = "AVD Scaling Plan"
}

# (Required) Specifies the Time Zone which should be used by the Scaling Plan for time based events.
    type    =string
    default ="Central Standard Time"
}

#(Required) The ID of the HostPool to assign the Scaling Plan to.
variable "hostpool_id"{
    type    =string
    default = null
}


variable "schedule" {
    type    = set(object({

    name                                 = string
    days_of_week                         = list(string)     #(Required) A list of Days of the Week on which this schedule will be used. Possible values are Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, and Sunday.
    ramp_up_start_time                   = string           #(Required) The time at which Ramp-Up scaling will begin. This is also the end-time for the Ramp-Up period. The time must be specified in "HH:MM" format.    
    ramp_up_load_balancing_algorithm     = string           #(Required) The load Balancing Algorithm to use during the Ramp-Up period. Possible values are DepthFirst and BreadthFirst.
    ramp_up_minimum_hosts_percent        = number           #(Optional) Specifies the minimum percentage of session host virtual machines to start during ramp-up for peak hours. For example, if Minimum percentage of hosts is specified as 10% and total number of session hosts in your host pool is 10, autoscale will ensure a minimum of 1 session host is available to take user connections.
    ramp_up_capacity_threshold_percent   = number           #(Optional) This is the value of percentage of used host pool capacity that will be considered to evaluate whether to turn on/off virtual machines during the ramp-up and peak hours. For example, if capacity threshold is specified as 60% and your total host pool capacity is 100 sessions, autoscale will turn on additional session hosts once the host pool exceeds a load of 60 sessions.
    peak_start_time                      = string           #(Required) The time at which Peak scaling will begin. This is also the end-time for the Ramp-Up period. The time must be specified in "HH:MM" format.
    peak_load_balancing_algorithm        = string           #(Required) The load Balancing Algorithm to use during Peak Hours. Possible values are DepthFirst and BreadthFirst.
    ramp_down_start_time                 = string           #(Required) The time at which Ramp-Down scaling will begin. This is also the end-time for the Ramp-Up period. The time must be specified in "HH:MM" format.
    ramp_down_load_balancing_algorithm   = string           #(Required) The load Balancing Algorithm to use during the Ramp-Down period. Possible values are DepthFirst and BreadthFirst.
    ramp_down_minimum_hosts_percent      = number           #(Required) The minimum percentage of session host virtual machines that you would like to get to for ramp-down and off-peak hours. For example, if Minimum percentage of hosts is specified as 10% and total number of session hosts in your host pool is 10, autoscale will ensure a minimum of 1 session host is available to take user connections.
    ramp_down_force_logoff_users         = bool             #(Required) Whether users will be forced to log-off session hosts once the ramp_down_wait_time_minutes value has been exceeded during the Ramp-Down period. Possible
    ramp_down_wait_time_minutes          = number           #(Required) The number of minutes during Ramp-Down period that autoscale will wait after setting the session host VMs to drain mode, notifying any currently signed in users to save their work before forcing the users to logoff. Once all user sessions on the session host VM have been logged off, Autoscale will shut down the VM.
    ramp_down_notification_message       = string           #(Required) The notification message to send to users during Ramp-Down period when they are required to log-off.
    ramp_down_capacity_threshold_percent = number           #Required) This is the value in percentage of used host pool capacity that will be considered to evaluate whether to turn on/off virtual machines during the ramp-down and off-peak hours. For example, if capacity threshold is specified as 60% and your total host pool capacity is 100 sessions, autoscale will turn on additional session hosts once the host pool exceeds a load of 60 sessions.
    ramp_down_stop_hosts_when            = string           #(Required) Controls Session Host shutdown behaviour during Ramp-Down period. Session Hosts can either be shutdown when all sessions on the Session Host have ended, or when there are no Active sessions left on the Session Host. Possible values are ZeroSessions and ZeroActiveSessions.
    off_peak_start_time                  = string           #Required) The time at which Off-Peak scaling will begin. This is also the end-time for the Ramp-Down period. The time must be specified in "HH:MM" format.
    off_peak_load_balancing_algorithm    = string           #(Required) The load Balancing Algorithm to use during Off-Peak Hours. Possible values are DepthFirst and BreadthFirst.

    }))
    default = [{
    name                                 = "Weekdays"
    days_of_week                         = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
    ramp_up_start_time                   = "05:00"
    ramp_up_load_balancing_algorithm     = "BreadthFirst"
    ramp_up_minimum_hosts_percent        = 20
    ramp_up_capacity_threshold_percent   = 10
    peak_start_time                      = "09:00"
    peak_load_balancing_algorithm        = "BreadthFirst"
    ramp_down_start_time                 = "19:00"
    ramp_down_load_balancing_algorithm   = "DepthFirst"
    ramp_down_minimum_hosts_percent      = 10
    ramp_down_force_logoff_users         = false
    ramp_down_wait_time_minutes          = 45
    ramp_down_notification_message       = "Please log off in the next 45 minutes..."
    ramp_down_capacity_threshold_percent = 5
    ramp_down_stop_hosts_when            = "ZeroSessions"
    off_peak_start_time                  = "22:00"
    off_peak_load_balancing_algorithm    = "DepthFirst"
  
  }]
}