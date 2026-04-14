Return-Path: <linux-kbuild+bounces-12785-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id U306O9ak3mnTGwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-12785-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Apr 2026 22:34:30 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F0FA43FE641
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Apr 2026 22:34:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7387A301FA7C
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Apr 2026 20:34:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C97A027FB3C;
	Tue, 14 Apr 2026 20:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="as5O93zt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BE222332E;
	Tue, 14 Apr 2026 20:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776198866; cv=none; b=bPGu7s2EgvLQOqQMPcPhPI2P8Kl4OENmfnslyaC33HHhX+LeHKozCpOm4wVVkfxScTA/incZfZHrhLf1Y1s6IOhfK1vzYMKPET5eTTrVTOz7k1jUSUwcth1w36m+agZZEaUXsaz7bEO+nxG9+kh3he11Ge8iXLE2kKGOg3izYLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776198866; c=relaxed/simple;
	bh=XYHZBZZq/WlKpnfk8V8nvtrvlc9gsMQNaF0WcYETyqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cue/pNAKowuF4W16OQOYwmIpHARygNiWuD/1qkHZD7NmeIt8yidRThnTBAvd4zeDFLrMzAnmZDeJhYM1faAYjSFoKQ79lK78Vh+NYa8Yvk9JkcEjHm4N1DCdi6v+3pJggP9vHm6G+c35d/m62sFF3KI5bycaOfkHKcyNwWoW9vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=as5O93zt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 781CBC19425;
	Tue, 14 Apr 2026 20:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776198866;
	bh=XYHZBZZq/WlKpnfk8V8nvtrvlc9gsMQNaF0WcYETyqA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=as5O93ztneTN0G6XdHqJvjzPW88jPn4thvhZqK2fpeqnxRIbjEtqiL5BTUJzXVEvQ
	 OXHsmNV6+s61r1x6ViUiMdaJ1yXwPOKJHabD6VxNnvW5kt3jI8cga9KBIXnaEZxzfm
	 8EVdyH5fbZuUm4fy7gjeclQ4JzndkIspECCZVMAkCzsqUx2fdSMgqDcjAFyxd8Nj5X
	 SnyWNdgL56bz45xrfLk5J9RUbB4BEy3912lGi6MaRC08ssl/EZSvhvGNFXwLeQh0LF
	 6NQ58fVtuIzclzZkYlaGGO1WSjYbL5E5YGhg4Ul6bVIDVNkfbarSrV93nP0qUuDc9b
	 KAhIncF4Lrfog==
Date: Tue, 14 Apr 2026 13:34:18 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Nicolas Schier <nsc@kernel.org>, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Sasha Levin <sashal@kernel.org>, linux-kbuild@vger.kernel.org,
	bpf@vger.kernel.org, linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild/btf: Remove broken module relinking exclusion
Message-ID: <20260414203418.GA1022044@ax162>
References: <20260410131343.2519532-1-petr.pavlu@suse.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410131343.2519532-1-petr.pavlu@suse.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12785-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,iogearbox.net,linux.dev,gmail.com,fomichev.me,google.com,atomlin.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F0FA43FE641
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 03:13:29PM +0200, Petr Pavlu wrote:
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
> 
> Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>

If the BPF folks want to take this since it deals with BTF:

Acked-by: Nathan Chancellor <nathan@kernel.org>

Otherwise, either Nicolas can take this for 7.1 or I will pick it up for
7.2 when 7.1-rc1 is out.

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
> -- 
> 2.53.0
> 

