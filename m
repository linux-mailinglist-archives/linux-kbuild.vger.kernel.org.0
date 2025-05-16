Return-Path: <linux-kbuild+bounces-7128-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9646AAB9CFA
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 May 2025 15:11:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8521E17BEE2
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 May 2025 13:10:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BA1A242D67;
	Fri, 16 May 2025 13:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="FRRC8cF6";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="9sUu26EW";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="FRRC8cF6";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="9sUu26EW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5031242D6A
	for <linux-kbuild@vger.kernel.org>; Fri, 16 May 2025 13:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747401036; cv=none; b=orEar2TsStnHy5/Scu9TPEijI6Dky4QjjVnart1kkMzrFFPIEPYtWMshxHr56UkeWdfzS4NE7knj5DPqjFgggRumD9/erSXULM30AH0hKmb4Nw2OqSOyi2fpHx+73VEyzOqo5aFLyQB0RMHytM3rToWX1Nv5Mb6jnBmETl9UkiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747401036; c=relaxed/simple;
	bh=6YXteyblXnxrChf3daUg7VodS7B9CbzBaq8O6TtADOQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ktAQ1hb44IOP2xF1vJYjHNyBbOgmKUiH6DvyU+boqzU9OiBQ4IhoaM7R6yV13l99M9iCmqzVVkPGboxzzZeMB0CGSktyTFwc46baRG58owYY1QqhLtGuGtqw4yamXvqunxfp8857Fz6Vpd+wQC9zLS9xarKOnOcHU/qiybPkkTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=FRRC8cF6; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=9sUu26EW; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=FRRC8cF6; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=9sUu26EW; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8E24A219FF;
	Fri, 16 May 2025 13:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1747401032; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P8rgL5XOFCaHWG5gSyPt5Zu0LOsU1CW5frqzvIuPZZE=;
	b=FRRC8cF6U1k3JTQXaJFqjOHcbKqBQ3zTkZH9D/RqE2hG3HPoxjagMz9vaIA6ugp8djG93H
	+KvwwLaAcdy9e9gYQR76Wd0QLg7GrI6BWyoURz37fTw2PGT2bNuXHAw6Qs+zjuox42AZvE
	cyo+bNR4Xi3CGCloqxUpyZFpTULkiS0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1747401032;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P8rgL5XOFCaHWG5gSyPt5Zu0LOsU1CW5frqzvIuPZZE=;
	b=9sUu26EW0h8F6FtyQ6+raJaj7pvR7naYL3Dr9/uFjf16LdmDx21TKZocZxFPwdPaj4AL2Q
	1CLs/pryW6nj9RDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=FRRC8cF6;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=9sUu26EW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1747401032; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P8rgL5XOFCaHWG5gSyPt5Zu0LOsU1CW5frqzvIuPZZE=;
	b=FRRC8cF6U1k3JTQXaJFqjOHcbKqBQ3zTkZH9D/RqE2hG3HPoxjagMz9vaIA6ugp8djG93H
	+KvwwLaAcdy9e9gYQR76Wd0QLg7GrI6BWyoURz37fTw2PGT2bNuXHAw6Qs+zjuox42AZvE
	cyo+bNR4Xi3CGCloqxUpyZFpTULkiS0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1747401032;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P8rgL5XOFCaHWG5gSyPt5Zu0LOsU1CW5frqzvIuPZZE=;
	b=9sUu26EW0h8F6FtyQ6+raJaj7pvR7naYL3Dr9/uFjf16LdmDx21TKZocZxFPwdPaj4AL2Q
	1CLs/pryW6nj9RDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 710F613411;
	Fri, 16 May 2025 13:10:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 07I1G0g5J2h2NQAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Fri, 16 May 2025 13:10:32 +0000
Message-ID: <e6f335a4-c981-4bb1-8ea4-70e9efc56ae3@suse.cz>
Date: Fri, 16 May 2025 15:10:32 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Kconfig for range is being ignored
Content-Language: en-US
To: Juan Yescas <jyescas@google.com>, linux-kbuild@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>,
 "T.J. Mercier" <tjmercier@google.com>, Kalesh Singh
 <kaleshsingh@google.com>, Isaac Manjarres <isaacmanjarres@google.com>,
 Zi Yan <ziy@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>,
 Minchan Kim <minchan@kernel.org>
References: <CAJDx_rjX4Z3QvoFDnQ7qH06x+Q+pTP3bAyLv2GD2C+CoWu9haQ@mail.gmail.com>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <CAJDx_rjX4Z3QvoFDnQ7qH06x+Q+pTP3bAyLv2GD2C+CoWu9haQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 8E24A219FF
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.cz:mid,suse.cz:dkim,bootlin.com:url];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.cz:+]
X-Spam-Score: -4.51

On 5/13/25 22:17, Juan Yescas wrote:
> Hi Kbuild team,
> 
> In the patch from below, I am adding a new configuration that depends
> on ARCH_FORCE_MAX_ORDER.
> 
> https://lore.kernel.org/all/20250510010338.3978696-1-jyescas@google.com/
> 
> When ARCH_FORCE_MAX_ORDER is defined, the max value of PAGE_BLOCK_ORDER has
> to be ARCH_FORCE_MAX_ORDER.
> 
> mm/Kconfig
> 
> config ARCH_FORCE_MAX_ORDER
>       int
> config PAGE_BLOCK_ORDER
>        int "Page Block Order"
>        range 1 10 if !ARCH_FORCE_MAX_ORDER
>        default 10 if !ARCH_FORCE_MAX_ORDER
>        range 1 ARCH_FORCE_MAX_ORDER if ARCH_FORCE_MAX_ORDER
>        default ARCH_FORCE_MAX_ORDER if ARCH_FORCE_MAX_ORDER
> 
> This configuration works on ARM64, however, on powerpc, the restriction is
> not being respected.
> 
> The main difference that I see between arch/arm64/Kconfig and
> arch/powerpc/Kconfig
> is that powerpc/Kconfig is using ranges, but not in arm64/Kconfig
> 
> https://elixir.bootlin.com/linux/v6.14.6/source/arch/arm64/Kconfig#L1637
> config ARCH_FORCE_MAX_ORDER
> int
> default "13" if ARM64_64K_PAGES
> default "11" if ARM64_16K_PAGES
> default "10"

I've changed this default "10" to default "8" and

> ARCH=arm64 make allmodconfig
> grep ORDER .config
CONFIG_ARCH_FORCE_MAX_ORDER=8
CONFIG_PAGE_BLOCK_ORDER=10

So I'd say it has the same issue as powerpc, just not obvious due to the
different default.

Poking a bit I found this interesting bit in arch/Kconfig:

# Note: arch/$(SRCARCH)/Kconfig needs to be included first so that it can
# override the default values in this file.
#
source "arch/$(SRCARCH)/Kconfig"

Thus I've tried to move the whole config PAGE_BLOCK_ORDER thing from
mm/Kconfig to arch/Kconfig. But to my surprise it didn't change anything.

AFAICS "config ARCH_MMAP_RND_BITS" is doing very similar stuff than we're
trying with "config PAGE_BLOCK_ORDER" but it seems to work? I'm puzzled.

> https://elixir.bootlin.com/linux/v6.14.6/source/arch/powerpc/Kconfig#L918
> config ARCH_FORCE_MAX_ORDER
> int "Order of maximal physically contiguous allocations"
> range 7 8 if PPC64 && PPC_64K_PAGES
> default "8" if PPC64 && PPC_64K_PAGES
> range 12 12 if PPC64 && !PPC_64K_PAGES
> default "12" if PPC64 && !PPC_64K_PAGES
> range 8 10 if PPC32 && PPC_16K_PAGES
> 
> How to reproduce it
>  $ ARCH=powerpc make allmodconfig
>  $ cat .config | grep MAX_ORDER
> CONFIG_ARCH_FORCE_MAX_ORDER=8
>  $ cat .config | grep PAGE_BLOCK
> CONFIG_PAGE_BLOCK_ORDER=10.   -> This should be 8, NOT 10.
> 
> Is the Kconfig in this change
> https://lore.kernel.org/all/20250510010338.3978696-1-jyescas@google.com/
> configured properly? What needs to be changed?
> 
> Thanks
> Juan


