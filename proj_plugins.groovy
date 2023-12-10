import jenkins.model.Jenkins;

//Plugins Manager
pm = Jenkins.instance.pluginManager

//Jenkins PLugins Upage Center
uc = Jenkins.instance.updateCenter

// Calls Plugin Catalog and Download All the Information that require
pm.doCheckUpdatesServer()

// List of PlugIn with Dependencies
[].each {
  if (! pm.getPlugin(it)) {
    deployment = uc.getPlugin(it).deploy(true) //'true' will install all child plugins
    deployment.get()
  }
}

// Restart Jenkins after installing plugins (optional)
Jenkins.instance.restart()
