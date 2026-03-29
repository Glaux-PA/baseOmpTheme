{* Chapters *}
{if $chapters|@count}
    <div class="item chapters_list">
        <h2 class="chapters_list_title">
            {translate key="submission.chapters"}
        </h2>
        
        <div class="row">
            {foreach from=$chapters item=chapter}
                {assign var=chapterId value=$chapter->getId()}
                
                <div class="col-12 col-sm-6 col-md-4">
                    <div class="chapter_summary">
                        
                        {if $chapter->isPageEnabled()}
                            {if $publication->getId() === $currentPublication->getId()}
                                <a href="{url page="catalog" op="book" path=$monograph->getBestId()|to_array:"chapter":$chapter->getSourceChapterId()}">
                            {else}
                                <a href="{url page="catalog" op="book" path=$monograph->getBestId()|to_array:"version":$publication->getId():"chapter":$chapter->getSourceChapterId()}">
                            {/if}
                        {/if}
                        
                        <div class="title">
                            {$chapter->getLocalizedTitle()|escape}
                            {if $chapter->getLocalizedSubtitle() != ''}
                                <div class="subtitle">
                                    {$chapter->getLocalizedSubtitle()|escape}
                                </div>
                            {/if}
                        </div>

                        {if $chapter->isPageEnabled()}
                            </a>
                        {/if}

                        {assign var=chapterAuthors value=$chapter->getAuthorNamesAsString()}
                        {if $authorString != $chapterAuthors}
                            <div class="authors">
                                {$chapterAuthors|escape}
                            </div>
                        {/if}

                        {* DOI *}
                        {assign var=chapterDoiObject value=$chapter->getData('doiObject')}
                        {if $chapterDoiObject}
                            {assign var="doiUrl" value=$chapterDoiObject->getData('resolvingUrl')|escape}
                            <div class="doi">{translate key="doi.readerDisplayName"} <a href="{$doiUrl}">{$doiUrl}</a></div>
                        {/if}

                        {* Display any files that are assigned to this chapter *}
                        {pluck_files assign="chapterFiles" files=$availableFiles by="chapter" value=$chapterId}
                        {if $chapterFiles|@count}
                            <div class="files">

                                {* Display chapter files sorted by publication format so that they are ordered
                                   consistently across all chapters. *}
                                {foreach from=$publicationFormats item=format}
                                    {pluck_files assign="pubFormatFiles" files=$chapterFiles by="publicationFormat" value=$format->getId()}

                                    {foreach from=$pubFormatFiles item=file}

                                        {* Use the publication format name in the download link unless a pub format has multiple files *}
                                        {assign var=useFileName value=false}
                                        {if $pubFormatFiles|@count > 1}
                                            {assign var=useFileName value=true}
                                        {/if}

                                        {include file="frontend/components/downloadLink.tpl" downloadFile=$file monograph=$monograph publicationFormat=$format currency=$currency useFilename=$useFileName}
                                    {/foreach}
                                {/foreach}
                            </div>
                        {/if}
                    </div>
                </div>
            {/foreach}
        </div>
    </div>
{/if}