{**
 * templates/frontend/components/navigationMenu.tpl
 *
 *
 * Copyright (c) 2025 GLAUX Publicaciones Académicas.
 *
 *
 * @brief Primary navigation menu list for the application
 *
 * @uses navigationMenu array Hierarchical array of navigation menu item assignments
 * @uses id string Element ID to assign the outer <ul>
 * @uses ulClass string Class name(s) to assign the outer <ul>
 * @uses liClass string Class name(s) to assign all <li> elements
 *}

{if $navigationMenu}
	<ul id="{$id|escape}" class="{$ulClass|escape} pkp_nav_list">
		{foreach key=field item=navigationMenuItemAssignment from=$navigationMenu->menuTree}
			{if !$navigationMenuItemAssignment->navigationMenuItem->getIsDisplayed()}
				{continue}
			{/if}
			<li class="{$liClass|escape}">
				{if $navigationMenuItemAssignment->children}
					<i class="bi bi-caret-down-fill"></i>{$navigationMenuItemAssignment->navigationMenuItem->getLocalizedTitle()}
				{else}
					<a href="{$navigationMenuItemAssignment->navigationMenuItem->getUrl()}">
					{$navigationMenuItemAssignment->navigationMenuItem->getLocalizedTitle()}
				</a>
				{/if}
				{if $navigationMenuItemAssignment->navigationMenuItem->getIsChildVisible()}
					<ul class="submenu hidden-element">
						{foreach key=childField item=childNavigationMenuItemAssignment from=$navigationMenuItemAssignment->children}
							{if $childNavigationMenuItemAssignment->navigationMenuItem->getIsDisplayed()}
								<li class="{$liClass|escape}">
									<a href="{$childNavigationMenuItemAssignment->navigationMenuItem->getUrl()}">
										{$childNavigationMenuItemAssignment->navigationMenuItem->getLocalizedTitle()}
									</a>
								</li>
							{/if}
						{/foreach}
					</ul>
				{/if}
			</li>
		{/foreach}
	</ul>
{/if}
