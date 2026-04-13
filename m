Return-Path: <linux-kbuild+bounces-12769-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LUNNTej3GkEUgkAu9opvQ
	(envelope-from <linux-kbuild+bounces-12769-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Apr 2026 10:03:03 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6233E8B30
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Apr 2026 10:03:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 83DC030584BB
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Apr 2026 07:54:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D8FE39DBC3;
	Mon, 13 Apr 2026 07:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="N+B9oLmM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C6B39A06A
	for <linux-kbuild@vger.kernel.org>; Mon, 13 Apr 2026 07:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776066863; cv=none; b=g7Gkm7vLpZMmJilOlOllY8QzCelgJPKT+ZcQaBbhZvo4Yx8bvtEELxtgMot9lyeVThQVfDAem9aOCsE6Ox6OJRwWGMbBQ5VuJcLHaCWYLcdKSOwsIxbFVsFW9rCbWKj69ZHH/EImP+WvnEBhikWqZP+Jc862myadvLPAVgFwpDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776066863; c=relaxed/simple;
	bh=orB0DgU4wxJRKiIe3DWuU3+rc1kYgBrsrLIu4o42Cv0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FsxQx3BJ+aXg34ls30qE3I6tTsFVM0hiMUThDH/GynA6SU2ofjSfTSg1cQA03xjAYFO72+S9PWQwKWng95Y0sBkLUwDpN5yAdUfqYksDKXpkFdZmN1WadUGfh30N+uRPrIJoGuDAjqEtzoFA+o2S/giuTuwkXH9bSORW/fqC7CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=N+B9oLmM; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43d17bb1c65so2646671f8f.0
        for <linux-kbuild@vger.kernel.org>; Mon, 13 Apr 2026 00:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776066861; x=1776671661; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6snTvocp4fL1cYl7s1+cy6ol2rfDxDg3UNIgS0nANoA=;
        b=N+B9oLmMVBzyOHuqyQK76nBsJAfpvmlEIEwt6xNZbGa+Fq3W8kiFOJiZ/3FJ5DHuDv
         2PRPmtobICFZmoq6Q4MPlpFLxoebKTM1STGK17oktf96mP9w4N6xrHPRu8c+nYzHaYVL
         r4Dsf2nQWGkBrLWPpw59N5w0mNSr/Gfcd4D+pcIWaczOoW4cWKqVPKjEUUAXE6j3sYgz
         +eFvw/vjPFwgUnuSRG7qD42ILVjjOq/Vy+b+MDBq2tdtyR9kKXETo01oJMS444Sg0uQd
         nCZf7KjfoOiVLbNsUJrp74A9d9SWu9pM0Ie+Ymom87ts8MMSgX7yUUuy8LIY9qR1jF3C
         d/dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776066861; x=1776671661;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6snTvocp4fL1cYl7s1+cy6ol2rfDxDg3UNIgS0nANoA=;
        b=YTyT8xB7OqOGSYwRefE12Ds6+4FTT0a0NLwcSuWHJaMZSH1zAUzNPup/yYxcy83Uho
         2EavLuXw2vt+WLQkBKc8OwQ2gZYNlsKEUj2m35dod/rZa4GGRIDqg5M7C3PcoN6yoQFv
         1CYlh+JXYdhHJE+gvK58dL2RjVllS9X6+zKbOEdg4ynvfIrFw2vf/UShJCs2PfCLzf9a
         fHHyMncEsj4GVfHQJmF/byXl4gj8QnaXMn+BA6Sf/5p5RIjMITXGn0iOIHkn0xF5gLTB
         QW9l+axm+qbgnEvm0UIM19XrshMmMoAZqfTRT6YI3HX7ZRJnvFiTJDGlzEWyPV37FpOp
         wVsA==
X-Forwarded-Encrypted: i=1; AFNElJ/wa/sjufK9RXL520f54MbrBBXw5Mk18ST7Cu9ZuontR+J2Rp2a72bFDleAjN/1h0G6ZM4CmBq8jFWhJrI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3qweiXnbiVvWufw80VZsVnXdtYOkqtK4B/NM9lDYxyQwtlbyT
	qOJPDe556n8o7n5lF9rD5EZV5gTTpNLuEvKEIJn6SqFLxPI+oyrnXV4DTRpLYJoiWus=
X-Gm-Gg: AeBDiesPO4jwlh8WxcQOo6vo2t+ccKrz1ecFDc9rl30SmD/UBaqIzHOuHc9k/eME0Lh
	ZVinJNBLB67lNl/NrIfFBTB1RPdyzYuAp+YM6QHB8+7XHmSq97HbgvvojCUtJaDFf+bdQpVxtM+
	QeHUfsPxXiofIGKpZuxCExC2/T7TqYMmaSC9Rr0qZH4NL5bHrfwVW8tsDlc/WQJf2Jam+Sfm9p/
	/hT5PvPFEhnjeh/gdlNdgzMBg44NQ5UnBFdQx2rWxqRiw5V3zASkDvtBZyS33+1JeZwU9C87XG6
	Aixmf2xNWLGSjuY8QT6HPWaI84HdmupyXn8GuubJ6F0dPVHCFVjFc4Rv0+FR7n0Y1bCroYQKeh9
	LXdLmUyZKKgynBsTIt2tAS7WH1ElJ/bozC9fuqiw+wUKdiKkfR0rXDRBtSVl0cIcPjUOrId8nQY
	cg+dBxK/mvqElO6GR7vSL/uBxT4BO9Ghab8DJJ+DXTXJhL
X-Received: by 2002:a5d:5849:0:b0:43d:7261:8759 with SMTP id ffacd0b85a97d-43d726187ccmr6706140f8f.28.1776066860612;
        Mon, 13 Apr 2026 00:54:20 -0700 (PDT)
Received: from [10.100.51.209] (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d76eeb2d1sm10959190f8f.22.2026.04.13.00.54.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 00:54:20 -0700 (PDT)
Message-ID: <a48e9d73-90b7-4108-b5a9-5619a5659556@suse.com>
Date: Mon, 13 Apr 2026 09:54:19 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kbuild/btf: Remove broken module relinking exclusion
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>
Cc: Martin KaFai Lau <martin.lau@linux.dev>,
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 Aaron Tomlin <atomlin@atomlin.com>, Ihor Solodrai <ihor.solodrai@linux.dev>,
 Masahiro Yamada <masahiroy@kernel.org>, Sasha Levin <sashal@kernel.org>,
 linux-kbuild@vger.kernel.org, bpf@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260410131343.2519532-1-petr.pavlu@suse.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260410131343.2519532-1-petr.pavlu@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.dev,gmail.com,kernel.org,fomichev.me,google.com,atomlin.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-12769-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[petr.pavlu@suse.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sashiko.dev:url,suse.com:dkim,suse.com:email,suse.com:mid]
X-Rspamd-Queue-Id: 6E6233E8B30
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/10/26 3:13 PM, Petr Pavlu wrote:
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

The Sashiko review system makes the following observation [1]:

> Will this result in missing BTF data if the module is rebuilt solely due
> to a command-line change?
> 
> Since Kbuild's if_changed executes when either a prerequisite is newer or
> the command line has changed, a command-line-only change (such as modifying
> LDFLAGS_MODULE) will trigger ld_ko_o. This overwrites the .ko file with a
> freshly linked object that lacks a BTF section.
> 
> However, because no prerequisite files actually changed, Make's $? variable
> is empty, meaning newer-prereqs is also empty. The subsequent check
> $(if $(newer-prereqs),$(call cmd,btf_ko)) would then evaluate to false and
> skip generating the BTF data entirely.
> 
> Could these commands be unified under a single custom Kbuild rule
> (e.g., rule_ld_ko_o) and invoked together using $(call if_changed_rule,ld_ko_o)
> to ensure both linking and BTF generation occur atomically?

I'm aware of this issue. However, it is a separate problem that has
already been present. I'd like to address the exclusion rule first.

[1] https://sashiko.dev/#/patchset/20260410131343.2519532-1-petr.pavlu%40suse.com

-- Petr

