Return-Path: <linux-kbuild+bounces-8607-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FF7B34E1F
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Aug 2025 23:35:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4DEAA7A392A
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Aug 2025 21:34:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AFC8F9CB;
	Mon, 25 Aug 2025 21:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="AnFj76gL";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="kMXkMdIv";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="AnFj76gL";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="kMXkMdIv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753F5279788
	for <linux-kbuild@vger.kernel.org>; Mon, 25 Aug 2025 21:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756157732; cv=none; b=hKD/EIZGC8ZI8kBynPFLGrm7FlGPL+BQA1VV3/cDImMTHdCKRX4iqDIX/H5edkGXM5q2/i0lFl5VMR8h51d8eo/uWfzcJBuo4npjs5MqQV4c2uV5lVKrHmhun1R7NU5oPos0AGW/RXVFyUMcL/5sUjhDzAV2Ck7mrqQELoHn+Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756157732; c=relaxed/simple;
	bh=zZdXENOKMlNRYc1Y0AYVcQ2MmKeVsWVR/hQsWiR/d+U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kE5VSyvXSkXOxuK1o9jKKqRW1i33omK9iTR4Vgi8lPeGxwAtf/y7lkCYY+ZQ2d11O/bmJ/b2XA+LJjk+5Zojy2nHapgoqMjKgCjUcM3+j591EGrQglwB1CVQ+bloq5uiFHQjLhLJ+3BRA1wAHRPKlBp3CMjdJNQKJD9hO5GT3GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=AnFj76gL; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=kMXkMdIv; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=AnFj76gL; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=kMXkMdIv; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8EB8A1F787;
	Mon, 25 Aug 2025 21:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1756157728; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=WFqqdIGOHypxuBaV2I78OHESsO0HZPez/Xzs/qc1oIE=;
	b=AnFj76gL4LyRVK/vjISvhCWBrYotQkhF+1EY79/ZVxJp5psbbtgVa+jM1PaccaccV7dEXH
	cMuz4fkf2/P2IQPS9ESAmQ4AJCInuEs+nd4uEnyMQ++s9zjjo7AfBVBpDYhzgPM+ZUH+1j
	KGJvK0Q7h/sm7jzIqaIqzJ8KgwHsdt4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1756157728;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=WFqqdIGOHypxuBaV2I78OHESsO0HZPez/Xzs/qc1oIE=;
	b=kMXkMdIvww0qs6PXXH6PBAI5hs7TziwICZP414mAEXstOi+ZcQazsjuhLAOWLwyfPkHyz6
	RpuMOa8gfaVcgFBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1756157728; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=WFqqdIGOHypxuBaV2I78OHESsO0HZPez/Xzs/qc1oIE=;
	b=AnFj76gL4LyRVK/vjISvhCWBrYotQkhF+1EY79/ZVxJp5psbbtgVa+jM1PaccaccV7dEXH
	cMuz4fkf2/P2IQPS9ESAmQ4AJCInuEs+nd4uEnyMQ++s9zjjo7AfBVBpDYhzgPM+ZUH+1j
	KGJvK0Q7h/sm7jzIqaIqzJ8KgwHsdt4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1756157728;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=WFqqdIGOHypxuBaV2I78OHESsO0HZPez/Xzs/qc1oIE=;
	b=kMXkMdIvww0qs6PXXH6PBAI5hs7TziwICZP414mAEXstOi+ZcQazsjuhLAOWLwyfPkHyz6
	RpuMOa8gfaVcgFBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7C9911368F;
	Mon, 25 Aug 2025 21:35:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jM8LHiDXrGhQLQAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Mon, 25 Aug 2025 21:35:28 +0000
Message-ID: <c42a5ef3-a3da-47d3-affd-24796c4dfa21@suse.cz>
Date: Mon, 25 Aug 2025 23:35:28 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] scripts/misc-check: update export checks for
 EXPORT_SYMBOL_FOR_MODULES()
Content-Language: en-US
To: Nicolas Schier <nsc@kernel.org>, Nathan Chancellor <nathan@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, Daniel Gomez
 <da.gomez@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
References: <20250825-export_modules_fix-v1-1-5c331e949538@suse.cz>
 <20250825170710.GC2719297@ax162> <aKzFfToXptoHnrxI@levanger>
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 xsFNBFZdmxYBEADsw/SiUSjB0dM+vSh95UkgcHjzEVBlby/Fg+g42O7LAEkCYXi/vvq31JTB
 KxRWDHX0R2tgpFDXHnzZcQywawu8eSq0LxzxFNYMvtB7sV1pxYwej2qx9B75qW2plBs+7+YB
 87tMFA+u+L4Z5xAzIimfLD5EKC56kJ1CsXlM8S/LHcmdD9Ctkn3trYDNnat0eoAcfPIP2OZ+
 9oe9IF/R28zmh0ifLXyJQQz5ofdj4bPf8ecEW0rhcqHfTD8k4yK0xxt3xW+6Exqp9n9bydiy
 tcSAw/TahjW6yrA+6JhSBv1v2tIm+itQc073zjSX8OFL51qQVzRFr7H2UQG33lw2QrvHRXqD
 Ot7ViKam7v0Ho9wEWiQOOZlHItOOXFphWb2yq3nzrKe45oWoSgkxKb97MVsQ+q2SYjJRBBH4
 8qKhphADYxkIP6yut/eaj9ImvRUZZRi0DTc8xfnvHGTjKbJzC2xpFcY0DQbZzuwsIZ8OPJCc
 LM4S7mT25NE5kUTG/TKQCk922vRdGVMoLA7dIQrgXnRXtyT61sg8PG4wcfOnuWf8577aXP1x
 6mzw3/jh3F+oSBHb/GcLC7mvWreJifUL2gEdssGfXhGWBo6zLS3qhgtwjay0Jl+kza1lo+Cv
 BB2T79D4WGdDuVa4eOrQ02TxqGN7G0Biz5ZLRSFzQSQwLn8fbwARAQABzSBWbGFzdGltaWwg
 QmFia2EgPHZiYWJrYUBzdXNlLmN6PsLBlAQTAQoAPgIbAwULCQgHAwUVCgkICwUWAgMBAAIe
 AQIXgBYhBKlA1DSZLC6OmRA9UCJPp+fMgqZkBQJnyBr8BQka0IFQAAoJECJPp+fMgqZkqmMQ
 AIbGN95ptUMUvo6aAdhxaOCHXp1DfIBuIOK/zpx8ylY4pOwu3GRe4dQ8u4XS9gaZ96Gj4bC+
 jwWcSmn+TjtKW3rH1dRKopvC07tSJIGGVyw7ieV/5cbFffA8NL0ILowzVg8w1ipnz1VTkWDr
 2zcfslxJsJ6vhXw5/npcY0ldeC1E8f6UUoa4eyoskd70vO0wOAoGd02ZkJoox3F5ODM0kjHu
 Y97VLOa3GG66lh+ZEelVZEujHfKceCw9G3PMvEzyLFbXvSOigZQMdKzQ8D/OChwqig8wFBmV
 QCPS4yDdmZP3oeDHRjJ9jvMUKoYODiNKsl2F+xXwyRM2qoKRqFlhCn4usVd1+wmv9iLV8nPs
 2Db1ZIa49fJet3Sk3PN4bV1rAPuWvtbuTBN39Q/6MgkLTYHb84HyFKw14Rqe5YorrBLbF3rl
 M51Dpf6Egu1yTJDHCTEwePWug4XI11FT8lK0LNnHNpbhTCYRjX73iWOnFraJNcURld1jL1nV
 r/LRD+/e2gNtSTPK0Qkon6HcOBZnxRoqtazTU6YQRmGlT0v+rukj/cn5sToYibWLn+RoV1CE
 Qj6tApOiHBkpEsCzHGu+iDQ1WT0Idtdynst738f/uCeCMkdRu4WMZjteQaqvARFwCy3P/jpK
 uvzMtves5HvZw33ZwOtMCgbpce00DaET4y/UzsBNBFsZNTUBCACfQfpSsWJZyi+SHoRdVyX5
 J6rI7okc4+b571a7RXD5UhS9dlVRVVAtrU9ANSLqPTQKGVxHrqD39XSw8hxK61pw8p90pg4G
 /N3iuWEvyt+t0SxDDkClnGsDyRhlUyEWYFEoBrrCizbmahOUwqkJbNMfzj5Y7n7OIJOxNRkB
 IBOjPdF26dMP69BwePQao1M8Acrrex9sAHYjQGyVmReRjVEtv9iG4DoTsnIR3amKVk6si4Ea
 X/mrapJqSCcBUVYUFH8M7bsm4CSxier5ofy8jTEa/CfvkqpKThTMCQPNZKY7hke5qEq1CBk2
 wxhX48ZrJEFf1v3NuV3OimgsF2odzieNABEBAAHCwXwEGAEKACYCGwwWIQSpQNQ0mSwujpkQ
 PVAiT6fnzIKmZAUCZ8gcVAUJFhTonwAKCRAiT6fnzIKmZLY8D/9uo3Ut9yi2YCuASWxr7QQZ
 lJCViArjymbxYB5NdOeC50/0gnhK4pgdHlE2MdwF6o34x7TPFGpjNFvycZqccSQPJ/gibwNA
 zx3q9vJT4Vw+YbiyS53iSBLXMweeVV1Jd9IjAoL+EqB0cbxoFXvnjkvP1foiiF5r73jCd4PR
 rD+GoX5BZ7AZmFYmuJYBm28STM2NA6LhT0X+2su16f/HtummENKcMwom0hNu3MBNPUOrujtW
 khQrWcJNAAsy4yMoJ2Lw51T/5X5Hc7jQ9da9fyqu+phqlVtn70qpPvgWy4HRhr25fCAEXZDp
 xG4RNmTm+pqorHOqhBkI7wA7P/nyPo7ZEc3L+ZkQ37u0nlOyrjbNUniPGxPxv1imVq8IyycG
 AN5FaFxtiELK22gvudghLJaDiRBhn8/AhXc642/Z/yIpizE2xG4KU4AXzb6C+o7LX/WmmsWP
 Ly6jamSg6tvrdo4/e87lUedEqCtrp2o1xpn5zongf6cQkaLZKQcBQnPmgHO5OG8+50u88D9I
 rywqgzTUhHFKKF6/9L/lYtrNcHU8Z6Y4Ju/MLUiNYkmtrGIMnkjKCiRqlRrZE/v5YFHbayRD
 dJKXobXTtCBYpLJM4ZYRpGZXne/FAtWNe4KbNJJqxMvrTOrnIatPj8NhBVI0RSJRsbilh6TE
 m6M14QORSWTLRg==
In-Reply-To: <aKzFfToXptoHnrxI@levanger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.cz:mid,suse.cz:email]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -4.30

On 8/25/25 22:20, Nicolas Schier wrote:
> On Mon, Aug 25, 2025 at 10:07:10AM -0700, Nathan Chancellor wrote:
>> On Mon, Aug 25, 2025 at 05:00:37PM +0200, Vlastimil Babka wrote:
>> > The module export checks are looking for EXPORT_SYMBOL_GPL_FOR_MODULES()
>> > which was renamed to EXPORT_SYMBOL_FOR_MODULES(). Update the checks.
>> > 
>> > Fixes: 6d3c3ca4c77e ("module: Rename EXPORT_SYMBOL_GPL_FOR_MODULES to EXPORT_SYMBOL_FOR_MODULES")
>> > Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
>> > ---
>> > I've missed these new checks when renaming the export macro due to my
>> > git grep being too narrow. My commit went through Christian's vfs tree
>> > but seems the script is part of kbuild (which is currently Odd fixes).
>> 
>> If this needs to reach Linus's tree to avoid warnings, it could go via
>> another vfs fixes pull request with our ack or we could ask him to pick
>> it up directly (as I am not sure we will have a fixes pull request this
>> cycle). If it is not urgent, I can pick it up via kbuild-next for 6.18.
>> I have no strong preference.
> 
> Hm, you're right, the check will issue false warnings (and misses to
> warn when it should) without this update.  Therefore I think it would be
> good to get the patch merged soon - even though the warnings are only
> issued with W=2.

Note only two files use EXPORT_SYMBOL_FOR_MODULES() in mainline:

fs/anon_inodes.c - contains also EXPORT_SYMBOL_GPL() so the checks will
cover it anyway (and IIUC since it includes module.h and not export.h it
should be causing a warning already?)

drivers/tty/serial/8250/8250_rsa.c: has no other variants of EXPORT, doesn't
include export.h (includes module.h) so this will not trigger unnecessary
export.h warning. It should be triggering missing export.h include warning,
but will not without this patch.

So IIUC missing this fix results in missing warnings, not adding spurious
ones. And there seem to be many existing warnings already. So it doesn't
seem that urgent fwiw.

> So, I second asking for the patch to go via vfs fixes or directly via
> Linus.  If it helps:

Let's see what Christian thinks then.

> Acked-by: Nicolas Schier <nsc@kernel.org>
> 
> Kind regards,
> Nicolas


