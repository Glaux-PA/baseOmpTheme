{**
 * lib/pkp/templates/frontend/components/headerDesktop.tpl
 *
 * Copyright (c) 2025 GLAUX Publicaciones Académicas.
 *
 *}

<header class="pkp_structure_head is-desktop" id="headerNavigationContainer" role="banner">    
    {* Menu Desktop *}
    <div class="pkp_head_wrapper">
        <div class="container">
            <div class="head_innerwrapper">
                <div class="menu-group-wrapper">
                    {* Search form *}
                    {if $currentContext && $requestedPage !== 'search'}
                    <div class="pkp_navigation_search_wrapper">
                        <a href="{url page="search"}" class="pkp_search pkp_search_desktop">
                            <i class="bi bi-search" aria-hidden="true"></i>
                            <span class="visually-hidden">{translate key="common.search"}</span>
                        </a>
                    </div>
                    {/if}

                    {* User menu *}
                    <div class="pkp_navigation_user_wrapper" id="navigationUserWrapper">
						{load_menu name="user" id="navigationUser" ulClass="pkp_navigation_user" liClass="profile"}
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="container">
        <div class="row">
            <div class="col-md-3 site_name_wrapper">
                <div class="pkp_site_name">
                	{if !$requestedPage || $requestedPage === 'index'}
						<h1 class="pkp_screen_reader">
							{if $currentContext}
								{$displayPageHeaderTitle|escape}
							{else}
								{$siteTitle|escape}
							{/if}
						</h1>
					{/if}

					{capture assign="homeUrl"}
						{url page="index" router=\PKP\core\PKPApplication::ROUTE_PAGE}
					{/capture}

					{* revisar --este código es provisional-- *}
					<a href="{$homeUrl}" class="is_img">
						<img src="{$baseUrl}/plugins/themes/baseOjsTheme/img/logo-omp.svg" alt="Logo">
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

            <div class="col-md-9">
				{capture assign="primaryMenu"}
					{load_menu name="primary" id="navigationPrimary" ulClass="pkp_navigation_primary"}
				{/capture}

                {* Primary navigation menu *}
                <nav class="pkp_site_nav_menu" aria-label="{translate|escape key="common.navigation.site"}">
                    <div class="pkp_navigation_primary_row">
                        <div class="pkp_navigation_primary_wrapper">
							{* Primary navigation menu for current application *}
							{$primaryMenu}                        
						</div>    
                    </div>
                </nav>
            </div>
        </div>
    </div>
</header>
{* Fin Menu Desktop *}