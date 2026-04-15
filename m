Return-Path: <linux-kbuild+bounces-12797-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kKcwC6Sz32lCXwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-12797-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Apr 2026 17:49:56 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 152B6406170
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Apr 2026 17:49:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EC8AB300349E
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Apr 2026 15:48:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70CE03E316C;
	Wed, 15 Apr 2026 15:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="PHd987CT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD01334C3D;
	Wed, 15 Apr 2026 15:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776268104; cv=none; b=aSAwLzIm6EJPOgRG4Rwzje0K0pMr11P5Ps9dH6Jm/AIik8ekeK7JWHPHbrFBhERRkLLLW38oYndMbdvbfZSHiLy0NR0lgVgUdWWHqrhgUa5Vg7/IzXMcf76L/VRcNmdoDKuRM4W3yXONF9QpiP248GZH85zLpPKQ9CjR7CIU6pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776268104; c=relaxed/simple;
	bh=+N13We6u1aTuDl065kI8NF7yQBpuUo5PFRNdhNo0bb4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RJKXR89yoI9nY0D7NbLf7cpRkqXNPbnm69EExK5LLkNG4+8d8SRcQ1nt/W70TNcPf5cWpon/5R21sS5/L+V8YL39PZguoJ/MryPdYXezZ77mElbMdjgMqd0FwP/lNywaweZNzLH42ZWIigiXbfPc3ocIVv4XM/xEl2ry7Y428XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=PHd987CT; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <15d50eb0-685f-49b8-986c-bd54262865d8@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776268087;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q0ir231c0MGV6mGNBlLaPWnwdLwfewiRnCNnLDv3p10=;
	b=PHd987CTVEMNQ8ZUbkftc92HFo/CPILriZ61sNlfDKzl9YpQni4+xU+KdOPrAYVCo7gl6B
	WEs8rD+RjL96mMhV3K1HTrnP4gMNRe/jSrlMzaoi9i97PoJRWh5+HVmDjOVh4YC5ZJrIZz
	0oHWxv0N9Lflpco0WQZQEBY/Qch3IHc=
Date: Wed, 15 Apr 2026 08:47:50 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] kbuild/btf: Remove broken module relinking exclusion
To: Petr Pavlu <petr.pavlu@suse.com>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>
Cc: Martin KaFai Lau <martin.lau@linux.dev>,
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 Aaron Tomlin <atomlin@atomlin.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Sasha Levin <sashal@kernel.org>, linux-kbuild@vger.kernel.org,
 bpf@vger.kernel.org, linux-modules@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260410131343.2519532-1-petr.pavlu@suse.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ihor Solodrai <ihor.solodrai@linux.dev>
In-Reply-To: <20260410131343.2519532-1-petr.pavlu@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12797-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.dev,gmail.com,kernel.org,fomichev.me,google.com,atomlin.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ihor.solodrai@linux.dev,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,linux.dev:dkim,linux.dev:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,suse.com:email]
X-Rspamd-Queue-Id: 152B6406170
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/10/26 6:13 AM, Petr Pavlu wrote:
> Commit 5f9ae91f7c0d ("kbuild: Build kernel module BTFs if BTF is enabled
> and pahole supports it") in 2020 introduced CONFIG_DEBUG_INFO_BTF_MODULES
> to enable generation of split BTF for kernel modules. This change required
> the %.ko Makefile rule to additionally depend on vmlinux, which is used as
> a base for deduplication. The regular ld_ko_o command executed by the rule
> was then modified to be skipped if only vmlinux changes. This was done by
> introducing a new if_changed_except command and updating the original call
> to '+$(call if_changed_except,ld_ko_o,vmlinux)'.
> 
> Later, commit 214c0eea43b2 ("kbuild: add $(objtree)/ prefix to some
> in-kernel build artifacts") in 2024 updated the rule's reference to vmlinux
> from 'vmlinux' to '$(objtree)/vmlinux'. This accidentally broke the
> previous logic to skip relinking modules if only vmlinux changes. The issue
> is that '$(objtree)' is typically '.' and GNU Make normalizes the resulting
> prerequisite './vmlinux' to just 'vmlinux', while the exclusion logic
> retains the raw './vmlinux'. As a result, if_changed_except doesn't
> correctly filter out vmlinux. Consequently, with
> CONFIG_DEBUG_INFO_BTF_MODULES=y, modules are relinked even if only vmlinux
> changes.
> 
> It is possible to fix this Makefile issue. However, having the %.ko rule
> update the resulting file in place without starting from the original
> inputs is rather fragile. The logic is harder to debug if something breaks
> during a subsequent .ko update because the old input is lost due to the
> overwrite. Additionally, it requires that the BTF processing is idempotent.
> For example, sorting id+flags BTF_SET8 pairs in .BTF_ids by resolve_btfids
> currently doesn't have this property.
> 
> One option is to split the %.ko target into two rules: the first for
> partial linking and the second one for generating the BTF data. However,
> this approach runs into an issue with requiring additional intermediate
> files, which increases the size of the build directory. On my system, when
> using a large distribution config with ~5500 modules, the size of the build
> directory with debuginfo enabled is already ~25 GB, with .ko files
> occupying ~8 GB. Duplicating these .ko files doesn't seem practical.
> 
> Measuring the speed of the %.ko processing shows that the link step is
> actually relatively fast. It takes about 20% of the overall rule time,
> while the BTF processing accounts for 80%. Moreover, skipping the link part
> becomes relevant only during local development. In such cases, developers
> typically use configs that enable a limited number of modules, so having
> the %.ko rule slightly slower doesn't significantly impact the total
> rebuild time. This is supported by the fact that no one has complained
> about this optimization being broken for the past two years.
> 
> Therefore, remove the logic that prevents module relinking when only
> vmlinux changes and simplify Makefile.modfinal.

The change makes sense to me.

Acked-by: Ihor Solodrai <ihor.solodrai@linux.dev>

Thank you!

> 
> Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
> ---
> My previous attempt to fix this logic can be found at
> https://lore.kernel.org/linux-modules/20260402141911.1577711-1-petr.pavlu@suse.com/
> ---
>  scripts/Makefile.modfinal | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
> index adcbcde16a07..01a37ec872b9 100644
> --- a/scripts/Makefile.modfinal
> +++ b/scripts/Makefile.modfinal
> @@ -46,17 +46,9 @@ quiet_cmd_btf_ko = BTF [M] $@
>  		$(CONFIG_SHELL) $(srctree)/scripts/gen-btf.sh --btf_base $(objtree)/vmlinux $@; \
>  	fi;
>  
> -# Same as newer-prereqs, but allows to exclude specified extra dependencies
> -newer_prereqs_except = $(filter-out $(PHONY) $(1),$?)
> -
> -# Same as if_changed, but allows to exclude specified extra dependencies
> -if_changed_except = $(if $(call newer_prereqs_except,$(2))$(cmd-check),      \
> -	$(cmd);                                                              \
> -	printf '%s\n' 'savedcmd_$@ := $(make-cmd)' > $(dot-target).cmd, @:)
> -
>  # Re-generate module BTFs if either module's .ko or vmlinux changed
>  %.ko: %.o %.mod.o .module-common.o $(objtree)/scripts/module.lds $(and $(CONFIG_DEBUG_INFO_BTF_MODULES),$(KBUILD_BUILTIN),$(objtree)/vmlinux) FORCE
> -	+$(call if_changed_except,ld_ko_o,$(objtree)/vmlinux)
> +	+$(call if_changed,ld_ko_o)
>  ifdef CONFIG_DEBUG_INFO_BTF_MODULES
>  	+$(if $(newer-prereqs),$(call cmd,btf_ko))
>  endif
> 
> base-commit: 591cd656a1bf5ea94a222af5ef2ee76df029c1d2


