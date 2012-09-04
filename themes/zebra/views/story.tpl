{extends file='layout.zebra.tpl'}

{block name=content}
	
	{get_flashdata('error')}
	{if $story}
		<div id="story-book">
			<div class="story-row">
				<div class="story-voting">
					<a href="javascript:void(0);" data-story-id="{$story->id}" data-vote-action="up" class="upvote{if story_upvoted()}disabled{/if}">&#9652;</a>
					<span class="story-upvotes">{$story->upvotes}</span>
					<a href="javascript:void(0);" data-story-id="{$story->id}" data-vote-action="down" class="downvote{if story_downvoted()}disabled{/if}">&#9662;</a>
				</div>
				<div class="story-meat">
					{if $story->external_link}
						<a class="story-title" href="{$story->external_link}" target="_blank">{$story->title}</a> 
						<span class="story-domain">({get_domain($story->external_link)})</span>
					{else}
						<a class="story-title" href="story/{$story->id}/{$story->slug}">{$story->title}</a>
					{/if}
					<div class="story-meta">
						<p>by <a href="user/{strtolower(get_username($story->user_id))}">{strtolower(get_username($story->user_id))}</a> {timespan($story->created, time(), 1)} ago | <a href="story/{$story->id}/{$story->slug}#comments">5 comments</a></p>
					</div>
				</div>

				{if !$story->external_link AND $story->description}
				<div id="story-description">
					{$story->description}
				</div>
				{/if}
			</div>
		</div>
	{else}
		<div id="empty-book">
			<p>Sorry, there are no stories to display. Either something broke or nobody has submitted anything yet.</p>
		</div>
	{/if}
{/block}