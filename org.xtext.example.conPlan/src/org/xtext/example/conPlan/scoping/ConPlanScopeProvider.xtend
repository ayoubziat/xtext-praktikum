/*
 * generated by Xtext 2.12.0
 */
package org.xtext.example.conPlan.scoping

import org.eclipse.emf.ecore.EObject
import org.eclipse.emf.ecore.EReference
import org.xtext.example.conPlan.conPlan.RoomsTalks
import org.xtext.example.conPlan.conPlan.ConPlanPackage
import org.eclipse.xtext.EcoreUtil2
import org.eclipse.xtext.scoping.Scopes
import org.xtext.example.conPlan.conPlan.Room
import org.eclipse.xtext.scoping.impl.FilteringScope
import org.xtext.example.conPlan.conPlan.Slot
import org.xtext.example.conPlan.conPlan.Rooms
import org.eclipse.xtext.nodemodel.util.NodeModelUtils
import org.xtext.example.conPlan.conPlan.ConferenceDay

/**
 * This class contains custom scoping description.
 * 
 * See https://www.eclipse.org/Xtext/documentation/303_runtime_concepts.html#scoping
 * on how and when to use it.
 */
class ConPlanScopeProvider extends AbstractConPlanScopeProvider {
	override getScope(EObject object, EReference ref){
		/*
			* */
		//Rooms
		if (ref == ConPlanPackage.Literals.ROOMS_TALKS__ROOM) {
			
				val slot = EcoreUtil2.getContainerOfType(object, Slot)
				val assignedRoomNames = slot.roomstalks.filter[it!=object].map[
					val node = NodeModelUtils.findNodesForFeature(it,ConPlanPackage.Literals.ROOMS_TALKS__ROOM).head
					return NodeModelUtils.getTokenText(node)
				].toList
				
				return new FilteringScope(super.getScope(object, ref), [!assignedRoomNames.contains(it.qualifiedName.lastSegment)])
			}
		//Talks
		
		return super.getScope(object, ref);
	}
	
}