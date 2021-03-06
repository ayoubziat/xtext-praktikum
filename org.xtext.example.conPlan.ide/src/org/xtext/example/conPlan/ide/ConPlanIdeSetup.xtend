/*
 * generated by Xtext 2.12.0
 */
package org.xtext.example.conPlan.ide

import com.google.inject.Guice
import org.eclipse.xtext.util.Modules2
import org.xtext.example.conPlan.ConPlanRuntimeModule
import org.xtext.example.conPlan.ConPlanStandaloneSetup

/**
 * Initialization support for running Xtext languages as language servers.
 */
class ConPlanIdeSetup extends ConPlanStandaloneSetup {

	override createInjector() {
		Guice.createInjector(Modules2.mixin(new ConPlanRuntimeModule, new ConPlanIdeModule))
	}
	
}
