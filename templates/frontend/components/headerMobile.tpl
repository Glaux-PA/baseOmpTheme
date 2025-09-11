{**
 * lib/pkp/templates/frontend/components/headerMobile.tpl
 *
 * Copyright (c) 2025 GLAUX Publicaciones Académicas.
 *
 *}

<header class="pkp_structure_head is-mobile" id="headerNavigationContainer" role="banner">
	{* Revisar Skip to content nav links *}
	{* {include file="frontend/components/skipLinks.tpl"} *}

	<div class="pkp_head_wrapper">
		<div class="container">
			<div class="row head-innerwrapper">
				<div class="col-10">
					<div class="pkp_site_name_wrapper">
						{if !$requestedPage || $requestedPage === 'index'}
						<h1 class="pkp_screen_reader">
							{if $currentContext}
								{$displayPageHeaderTitle|escape}
							{else}
								{$siteTitle|escape}
							{/if}
						</h1>
						{/if}
						
						<div class="pkp_site_name">
							{capture assign="homeUrl"}
								{url page="index" router=\PKP\core\PKPApplication::ROUTE_PAGE}
							{/capture}
							
							{* revisar --este código es provisional-- *}
							<a href="{$homeUrl}" class="is_img">
								<img src="{$baseUrl}/plugins/themes/baseOmpTheme/img/logo-omp.svg" alt="Logo">
		            		</a>
		            		

		            		{* revisar este código para cargar bien el logo
							{if $displayPageHeaderLogo}
								<a href="{$homeUrl}" class="is_img">
									<img src="{$publicFilesDir}/{$displayPageHeaderLogo.uploadName|escape:"url"}" width="{$displayPageHeaderLogo.width|escape}" height="{$displayPageHeaderLogo.height|escape}" {if $displayPageHeaderLogo.altText != ''}alt="{$displayPageHeaderLogo.altText|escape}"{/if} />
								</a>
							{elseif $displayPageHeaderTitle}
								<a href="{$homeUrl}" class="is_text">{$displayPageHeaderTitle|escape}</a>
							{else}
								<a href="{$homeUrl}" class="is_img">
									<img src="{$baseUrl}/templates/images/structure/logo.png" alt="{$applicationName|escape}" title="{$applicationName|escape}" width="180" height="90" />
								</a>
							{/if}
							*}
						</div>
					</div>
				</div>
                <div class="col-2">
					<div class="pkp_site_nav_toggle">
                        <a class="btn-menu" href="#"><i class="bi bi-list"></i></a>
                    </div>
            	</div>
			</div>
		</div>

		<div class="pkp_head_wrapper overlay-menu-wrapper hidden-element">
            <div class="container">
                <div class="row head_innerwrapper">
                    <div class="col-10 site-name-wrapper">
						<div class="pkp_site_name">

							{capture assign="homeUrl"}
								{url page="index" router=\PKP\core\PKPApplication::ROUTE_PAGE}
							{/capture}
							
							{* revisar --este código es provisional-- *}
							<a href="{$homeUrl}" class="is_img">
								<img src="{$baseUrl}/plugins/themes/baseOmpTheme/img/logo-omp.svg" alt="Logo">
		            		</a>

							{* revisar este código para cargar bien el logo
							{if $displayPageHeaderLogo}
								<a href="{$homeUrl}" class="is_img">
									<img src="{$publicFilesDir}/{$displayPageHeaderLogo.uploadName|escape:"url"}" width="{$displayPageHeaderLogo.width|escape}" height="{$displayPageHeaderLogo.height|escape}" {if $displayPageHeaderLogo.altText != ''}alt="{$displayPageHeaderLogo.altText|escape}"{/if} />
								</a>
							{elseif $displayPageHeaderTitle}
								<a href="{$homeUrl}" class="is_text">{$displayPageHeaderTitle|escape}</a>
							{else}
								<a href="{$homeUrl}" class="is_img">
									<img src="{$baseUrl}/templates/images/structure/logo.png" alt="{$applicationName|escape}" title="{$applicationName|escape}" width="180" height="90" />
								</a>
							{/if}
							*}
						</div>
                    </div>

                   <div class="col-2">
						<div class="pkp_site_nav_toggle">
                            <a class="btn-menu" href="#"><i class="bi bi-list"></i></a>
                        </div>
                	</div>
                </div>

                <div class="row">
                    <div class="col-12">
                        {* User menu *}
                        <div class="pkp_navigation_user_wrapper" id="navigationUserWrapper">
                            {load_menu name="user" id="navigationUser" ulClass="pkp_navigation_user" liClass="profile"}
                        </div>

                        {* Search form *}
                        <div class="pkp_navigation_search_wrapper">
                            <div id="search"><a name="search-form"></a>
                               {include file="frontend/components/searchForm_simple.tpl"}
                            </div>
                        </div>

                        {capture assign="primaryMenu"}
							{load_menu name="primary" id="navigationPrimary" ulClass="pkp_navigation_primary"}
						{/capture}

                        {* Primary navigation menu *}
                        <nav class="pkp_site_nav_menu" aria-label="{translate|escape key="common.navigation.site"}">
                            <div class="pkp_navigation_primary_row">
                                <div class="pkp_navigation_primary_wrapper">
                                    {$primaryMenu}
                                </div>    
                            </div>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
	</div><!-- .pkp_head_wrapper -->
</header><!-- .pkp_structure_head -->