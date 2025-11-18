Return-Path: <linux-kbuild+bounces-9668-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF26C6A9E6
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Nov 2025 17:28:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 94B6636009B
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Nov 2025 16:18:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B85136A017;
	Tue, 18 Nov 2025 16:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KH16ukRP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kNMpTgxY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="E48M3eqb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="az9HKZt9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B6536655F
	for <linux-kbuild@vger.kernel.org>; Tue, 18 Nov 2025 16:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763482714; cv=none; b=WCIMdI5eIDmxQCkUlcufO+GG1kVxwC/HXADOuYfD7kA504nrLoxZB1DMjTfIxUvG+Hq8spJ0Dp6N4CFrpxODwrQANqck9n3rSzeML+F0zgK2CZwovCT9AiX5mpIe7QWNI53a7LQ3CvNFpxq24A/HM55NMbvOuu7O6smN0kM5oq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763482714; c=relaxed/simple;
	bh=VCaiqV8vCrrsLqqf8b1+K9+FOBl2AhCdEyAraBkbibA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hBcadRawanKss1dNKXf7Dq86JjFmj3RR0wyk8n9uwtK3WRrNOS1HifcILdAVm4esfsMJjpALR5+75KK3PH6PAwqMT7IIr7S/pnT36O3Qo9ri+1T+lJGmpF9bdBJV5IitXivyXKeZ0Dj9199i/9izKDEVDt9FiI6//0tGa0D4fxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KH16ukRP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kNMpTgxY; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=E48M3eqb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=az9HKZt9; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from kitsune.suse.cz (unknown [10.100.12.127])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CFDEE1FF90;
	Tue, 18 Nov 2025 16:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763482710; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lV22ABgqhfmxJGlxKAwcYaFPokRsrb2FS9hJwycUbYk=;
	b=KH16ukRPSLAQKNON4fDq3e0cySt60gkhrJbsAE6il46Zx5NkZMpWN5Xw+eaObV0QYabFpK
	IggmZtIN+43xGo3qMknMT0h07lK9z8Epn8uzgf8rLJDJBglVRuRrefie/gk9fNaMw8m22T
	lFwlJwc5bnNqEypSCnPNryxjrEK2NIw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763482710;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lV22ABgqhfmxJGlxKAwcYaFPokRsrb2FS9hJwycUbYk=;
	b=kNMpTgxYQiXHAV7fn6GiscHJXuEVD0Q53hVRUGFendzeHDv1Aplq4lBqUlmnPkw2DoLtBK
	YtY8SfGE7Dwu+WCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763482709; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lV22ABgqhfmxJGlxKAwcYaFPokRsrb2FS9hJwycUbYk=;
	b=E48M3eqb0FNOKTFlsCmDQcpSYChHjCVm7CbKBRSw5zz+tGtTtbpD2sw7IYy2z4goIPX3dc
	Yw0cJRwerzDhFA2PtrnZMB4Dwjr+PDTZk5DGO6D6ndJ4IaTSSIjZXmDEIK9uE1L4sPMZ+j
	1UsJhui0wBelbtKDOGrae9tf7H0UMiU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763482709;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lV22ABgqhfmxJGlxKAwcYaFPokRsrb2FS9hJwycUbYk=;
	b=az9HKZt9LUWa3JKL3A5DFDDewT8jNcVyOVq52fgI6Fv8pt9P3IsYE9ROjUBSDP9YEmMQO9
	h8j12jkzYUj5VXAA==
Date: Tue, 18 Nov 2025 17:18:28 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: linux-modules@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gendwarfksyms: Fix build on 32-bit hosts
Message-ID: <aRycVOe5ZXSJJFpn@kitsune.suse.cz>
References: <20251117203806.970840-2-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251117203806.970840-2-samitolvanen@google.com>
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email]
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spam-Level: 

Hello,

On Mon, Nov 17, 2025 at 08:38:07PM +0000, Sami Tolvanen wrote:
> We have interchangeably used unsigned long for some of the types
> defined in elfutils, assuming they're always 64-bit. This obviously
> fails when building gendwarfksyms on 32-bit hosts. Fix the types.
> 
> Reported-by: Michal Suchánek <msuchanek@suse.de>
> Closes: https://lore.kernel.org/linux-modules/aRcxzPxtJblVSh1y@kitsune.suse.cz/
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> ---
>  scripts/gendwarfksyms/dwarf.c   | 4 +++-
>  scripts/gendwarfksyms/symbols.c | 5 +++--
>  2 files changed, 6 insertions(+), 3 deletions(-)

with this patch gendwarfksyms builds on 32bit x86 and Arm.

Tested-by: Michal Suchánek <msuchanek@suse.de>

Thanks

Michal

> 
> diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
> index 3538a7d9cb07..e76d732f5f60 100644
> --- a/scripts/gendwarfksyms/dwarf.c
> +++ b/scripts/gendwarfksyms/dwarf.c
> @@ -750,6 +750,7 @@ static void process_enumerator_type(struct state *state, struct die *cache,
>  				    Dwarf_Die *die)
>  {
>  	bool overridden = false;
> +	unsigned long override;
>  	Dwarf_Word value;
>  
>  	if (stable) {
> @@ -761,7 +762,8 @@ static void process_enumerator_type(struct state *state, struct die *cache,
>  			return;
>  
>  		overridden = kabi_get_enumerator_value(
> -			state->expand.current_fqn, cache->fqn, &value);
> +			state->expand.current_fqn, cache->fqn, &override);
> +		value = override;
>  	}
>  
>  	process_list_comma(state, cache);
> diff --git a/scripts/gendwarfksyms/symbols.c b/scripts/gendwarfksyms/symbols.c
> index ecddcb5ffcdf..42cd27c9cec4 100644
> --- a/scripts/gendwarfksyms/symbols.c
> +++ b/scripts/gendwarfksyms/symbols.c
> @@ -3,6 +3,7 @@
>   * Copyright (C) 2024 Google LLC
>   */
>  
> +#include <inttypes.h>
>  #include "gendwarfksyms.h"
>  
>  #define SYMBOL_HASH_BITS 12
> @@ -242,7 +243,7 @@ static void elf_for_each_global(int fd, elf_symbol_callback_t func, void *arg)
>  				error("elf_getdata failed: %s", elf_errmsg(-1));
>  
>  			if (shdr->sh_entsize != sym_size)
> -				error("expected sh_entsize (%lu) to be %zu",
> +				error("expected sh_entsize (%" PRIu64 ") to be %zu",
>  				      shdr->sh_entsize, sym_size);
>  
>  			nsyms = shdr->sh_size / shdr->sh_entsize;
> @@ -292,7 +293,7 @@ static void set_symbol_addr(struct symbol *sym, void *arg)
>  		hash_add(symbol_addrs, &sym->addr_hash,
>  			 symbol_addr_hash(&sym->addr));
>  
> -		debug("%s -> { %u, %lx }", sym->name, sym->addr.section,
> +		debug("%s -> { %u, %" PRIx64 " }", sym->name, sym->addr.section,
>  		      sym->addr.address);
>  	} else if (sym->addr.section != addr->section ||
>  		   sym->addr.address != addr->address) {
> 
> base-commit: 6a23ae0a96a600d1d12557add110e0bb6e32730c
> -- 
> 2.52.0.rc1.455.g30608eb744-goog
> 

