Return-Path: <linux-kbuild+bounces-10809-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPg9Ayo9cmnpfAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10809-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 16:07:22 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C1E68608
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 16:07:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id F14156093EE
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 14:25:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41E57346A04;
	Thu, 22 Jan 2026 14:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="lEjXapYc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC42934A3BF;
	Thu, 22 Jan 2026 14:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769091947; cv=none; b=gJ/Ae/G7ne0nOsJd/g612I6Lv52bnGN0tjNZmvlRNZT7YpO7hzc2hBTf0/XhFKIA6su4OX9ljVqBxKU4qnl+V65el7Yt2oZdnB8mKOD9ZWsEbCAWGd7vd9HnwhJbY8NJ67dyOE5FF+erONB54eQDmAf9rmh+O5libEBI+LBvjVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769091947; c=relaxed/simple;
	bh=rAVk+7dHqw02BXWuJqp0ZkIhnh7KV5XSHW2CoTnQyGI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kGQyfnJGbhR/b4k8tl8eGDzD2v3S5eOSyXaPcaZWqnhPvrqP2d0M3re/VyHauihAFlzjRFL1asKFGCXLpj37iZXhdGWR0r4vF4SU3oaeL45qYV7f+TEc7A+lPbl73fX/oXT0th9VtnmwVDShZ0qQ43v89brYkusAOLd9B0lGlKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=lEjXapYc; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1916943A6F;
	Thu, 22 Jan 2026 14:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1769091937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o+jsTFoKwJaKbSn2wZVJclWCHlmNHFi9g2UVter9KI8=;
	b=lEjXapYcfevUV8NhlNhH1qNXJCGli3V27rrpOEao4NWdWHcgjnYuSiPiNODN4oY6pTi+Qa
	9FAUa9Zrad9tUmbqatWMbpa8XKyKmcbRvptQIcL4B2CB6wv4Cth4XwtGXRXa9aHQ17tNBf
	64fxXnsyauA+/Xg08rdwSwr/+XS0O0njy4H3ddzvmRZ1YxF8Pe3f7zO4X4p4maU7pJ1mE2
	bxdXqo3rx6WwlWNuuTZAM0QNL4fAUIKvlKrK+55cb+xk0OOylNi2o8ZDSVQzQrpeu/NOEr
	WyfoJa2ezGPJJT1nGrh9ERPR/M/LerKGmb4hZHYdh0lXQ6Va1IjW5p18FA1PGg==
Message-ID: <472515f8-2737-4444-9eb6-1f6a0650f26b@gtucker.io>
Date: Thu, 22 Jan 2026 15:25:35 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] Documentation: dev-tools: add container.rst page
To: Nathan Chancellor <nathan@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, David Gow <davidgow@google.com>,
 =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
 automated-testing@lists.yoctoproject.org, workflows@vger.kernel.org,
 llvm@lists.linux.dev
References: <cover.1767199119.git.gtucker@gtucker.io>
 <c859f9b6dd5313136f7a445497d6209405eafa7e.1767199119.git.gtucker@gtucker.io>
 <aW-I3fNqp_7X0oeg@derry.ads.avm.de> <20260120183550.GD2749368@ax162>
 <e96a6e71-80b3-4556-a4eb-fd242e0f5713@gtucker.io>
 <20260122045534.GA3770486@ax162>
Content-Language: en-GB
From: Guillaume Tucker <gtucker@gtucker.io>
Organization: gtucker.io
In-Reply-To: <20260122045534.GA3770486@ax162>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-Sasl: gtucker@gtucker.io
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugeeifeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhohgjtgfgsehtjeertddtvdejnecuhfhrohhmpefiuhhilhhlrghumhgvucfvuhgtkhgvrhcuoehgthhutghkvghrsehgthhutghkvghrrdhioheqnecuggftrfgrthhtvghrnhepvdeihfekhfejtdfgueevieffkeduhfejhfettdetudetteejieduveevueeugefgnecukfhppedvtddtudemkeeiudemgegrgedtmeekiedvtdemvdeigegsmedurgefheemuggsheegmedufeegvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemgegrgedtmeekiedvtdemvdeigegsmedurgefheemuggsheegmedufeegvgdphhgvlhhopeglkffrggeimedvtddtudemkeeiudemgegrgedtmeekiedvtdemvdeigegsmedurgefheemuggsheegmedufeegvggnpdhmrghilhhfrhhomhepghhtuhgtkhgvrhesghhtuhgtkhgvrhdrihhopdhqihgupeduleduieelgeefteeihfdpmhhouggvpehsmhhtphhouhhtpdhnsggprhgtphhtthhopeduuddprhgtphhtthhopehnrghthhgrnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlr
 dhorhhgpdhrtghpthhtohepuggrvhhiughgohifsehgohhoghhlvgdrtghomhdprhgtphhtthhopeifohhrkhesohhnuhhrohiikhgrnhdruggvvhdprhgtphhtthhopegrrhhnugesrghrnhgusgdruggvpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-State: clean
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[gtucker.io:s=gm1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[gtucker.io];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TAGGED_FROM(0.00)[bounces-10809-lists,linux-kbuild=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gtucker.io:+];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gtucker@gtucker.io,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gtucker.io:mid,gtucker.io:dkim,ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns]
X-Rspamd-Queue-Id: B7C1E68608
X-Rspamd-Action: no action

Hi Nathan,

On 22/01/2026 05:55, Nathan Chancellor wrote:
> On Wed, Jan 21, 2026 at 10:55:53AM +0100, Guillaume Tucker wrote:
>> Feel free to make these tweaks now, or we might wait a bit to see if
>> others have more feedback with further changes and I can send a v4.
> 
> How about this? Send a v4 with:
> 
> 1. An initial MAINTAINERS entry addition in patch 1 for
>    scripts/container like I suggested earlier and scripts/container
>    explicitly added to the KERNEL BUILD section so that Nicolas and I
>    are included for handling patches.
> 
> 2. Add the Documentation to the aforementioned MAINTAINERS entry as part
>    of patch 2.
> 
> 3. Either encorporate my suggested change for preferring podman over
>    docker with the appropriate changes elsewhere inte the patch set like
>    you mentioned or explore checking for the docker alias explicitly.
>    Entirely up to you timewise, as long as it results in Nicolas's
>    environment working, since I don't think that will be too uncommon.
> 
> 4. Encorporate any other feedback that you feel is appropriate at this
>    stage (if there is any low hanging fruit).

Sounds great, I just sent a v4 as described above.  I've kept any
extra features out for now to avoid introducing new issues and added
a workaround for out-of-tree builds in the docs.  Hopefully this will
solve Nicolas' use cases and work for others too.

> Then we can apply it so that folks can start using it in -next for
> testing and validation. After that, you can start thinking of things you
> would want to work on for future merge windows from the list you already
> started, as I know how that goes when working on a new tool :)

Thanks again for all the reviews, it'll be good to see what people
make of it!  Meanwhile I'll keep working on further improvements,
starting with the limitations mentioned in the docs.

Cheers,
Guillaume


