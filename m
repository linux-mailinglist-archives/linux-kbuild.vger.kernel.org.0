Return-Path: <linux-kbuild+bounces-7148-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC0EABB574
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 May 2025 09:01:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 021C01893ECB
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 May 2025 07:01:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EF44264A92;
	Mon, 19 May 2025 07:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="sQJLGs16";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="A2ckA4i6";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="sQJLGs16";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="A2ckA4i6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118902641F9
	for <linux-kbuild@vger.kernel.org>; Mon, 19 May 2025 07:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747638068; cv=none; b=a6igSnjG3nKz4sjLrmxlR+kzZ6WKEtJ2/UOCZvBd9UL/vk8S+zMY2RD+EcwvNxT9h93MWPju/lLS/jzsk8nr6GECJo84jQA/ubmvEmdEY/BQBKQmB/W0/pBGDTehGiAGqwzASip4o7iNegfdvA5wDpoSrfYD7DQz2Qtpea3ZO74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747638068; c=relaxed/simple;
	bh=/53weL/WcemIcNVYtW5YIrgAoQWMvvL+SXcSBca5m78=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HZq92rYNWRVo2dJST5komwl7bP9hZTUV2NGyDOqQi3meX7vgW14mmKmTClWo9gEvcF3j95UUM9lh+bE0+33qhSIhnH4ruplVuuXoqx+cLon2he9HV81Z+5YUQxMAHqpbq1oqS15orfU0NMtC69AEDy/+pkYC/RwnlAi8rRt2NEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=sQJLGs16; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=A2ckA4i6; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=sQJLGs16; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=A2ckA4i6; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0B4C2201F1;
	Mon, 19 May 2025 07:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1747638064; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=vSJya8kg5xmYoxjpDRb8YQhjMacKeMPJtej4GZPacd0=;
	b=sQJLGs16rNLGsNpMiirE39c5iKKfMrkGWsIqghY0Glliq0qL3e335JLY+RK3llfy+Z8pEg
	vSJA490J8qhjPmUkUWZeqz0NfQ9/mkIHICQ+f1ZjRDjhPZxOHhpEk97k6bcukhUhpcQDSu
	o6Jq9/gJlGPR4yjmalG3agBhzuZN/HE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1747638064;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=vSJya8kg5xmYoxjpDRb8YQhjMacKeMPJtej4GZPacd0=;
	b=A2ckA4i6Gv+1DOp57mC5dsnfyxTU3W5xvFAwv+GkSPbJLgGNCygh7MEwVwx4bOvwVaF19y
	XefokuZnS9VIedBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=sQJLGs16;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=A2ckA4i6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1747638064; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=vSJya8kg5xmYoxjpDRb8YQhjMacKeMPJtej4GZPacd0=;
	b=sQJLGs16rNLGsNpMiirE39c5iKKfMrkGWsIqghY0Glliq0qL3e335JLY+RK3llfy+Z8pEg
	vSJA490J8qhjPmUkUWZeqz0NfQ9/mkIHICQ+f1ZjRDjhPZxOHhpEk97k6bcukhUhpcQDSu
	o6Jq9/gJlGPR4yjmalG3agBhzuZN/HE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1747638064;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=vSJya8kg5xmYoxjpDRb8YQhjMacKeMPJtej4GZPacd0=;
	b=A2ckA4i6Gv+1DOp57mC5dsnfyxTU3W5xvFAwv+GkSPbJLgGNCygh7MEwVwx4bOvwVaF19y
	XefokuZnS9VIedBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DCE911372E;
	Mon, 19 May 2025 07:01:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id TsnzMy/XKmjtSwAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Mon, 19 May 2025 07:01:03 +0000
Message-ID: <592eafcc-6460-4461-bab7-3c709e13d3c0@suse.cz>
Date: Mon, 19 May 2025 09:01:03 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Kconfig for range is being ignored
Content-Language: en-US
To: Masahiro Yamada <masahiroy@kernel.org>, Juan Yescas <jyescas@google.com>
Cc: linux-kbuild@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>,
 "T.J. Mercier" <tjmercier@google.com>, Kalesh Singh
 <kaleshsingh@google.com>, Isaac Manjarres <isaacmanjarres@google.com>,
 Zi Yan <ziy@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>,
 Minchan Kim <minchan@kernel.org>
References: <CAJDx_rjX4Z3QvoFDnQ7qH06x+Q+pTP3bAyLv2GD2C+CoWu9haQ@mail.gmail.com>
 <CAK7LNASeN7za4eq2rsTO255y2A6m9uzxec-MSn=TyM=qD1iEOQ@mail.gmail.com>
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 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
 m6M14QORSWTLRg==
In-Reply-To: <CAK7LNASeN7za4eq2rsTO255y2A6m9uzxec-MSn=TyM=qD1iEOQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:mid,suse.cz:dkim]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -4.51
X-Rspamd-Queue-Id: 0B4C2201F1
X-Spam-Level: 
X-Spam-Flag: NO

On 5/17/25 08:45, Masahiro Yamada wrote:
> On Wed, May 14, 2025 at 5:18 AM Juan Yescas <jyescas@google.com> wrote:
>>
>> Hi Kbuild team,
>>
>> In the patch from below, I am adding a new configuration that depends
>> on ARCH_FORCE_MAX_ORDER.
>>
>> https://lore.kernel.org/all/20250510010338.3978696-1-jyescas@google.com/
>>
>> When ARCH_FORCE_MAX_ORDER is defined, the max value of PAGE_BLOCK_ORDER has
>> to be ARCH_FORCE_MAX_ORDER.
>>
>> mm/Kconfig
>>
>> config ARCH_FORCE_MAX_ORDER
>>       int
>> config PAGE_BLOCK_ORDER
>>        int "Page Block Order"
>>        range 1 10 if !ARCH_FORCE_MAX_ORDER
>>        default 10 if !ARCH_FORCE_MAX_ORDER
> 
> 
> The logical calculations such as "!", "if"
> are allowed for bool and tristate types.
> 
> Here, ARCH_FORCE_MAX_ORDER is "int".
> 
> So, I do not understand what
> "!ARCH_FORCE_MAX_ORDER" is intended for.

A kernel developer used to program in C can easily assume hat it means
"== 0" :)

> You are doing what is not supposed to work.

It would be great, if kconfig either behaved like C here ("cast" int to
bool), or warn/error out. Silently treating such tests as false isn't great
IMHO. Wonder how many other buggy instances we have now. At least
ARCH_MMAP_RND_BITS_DEFAULT handling is also broken then, as Juan has shown.


