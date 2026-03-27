Return-Path: <linux-kbuild+bounces-12318-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AD4BDKq3xmnoNwUAu9opvQ
	(envelope-from <linux-kbuild+bounces-12318-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Mar 2026 18:00:26 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1E6347F9B
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Mar 2026 18:00:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 012AA3094276
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Mar 2026 16:53:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8F3E17B418;
	Fri, 27 Mar 2026 16:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="SYrs2liw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F343B35E949
	for <linux-kbuild@vger.kernel.org>; Fri, 27 Mar 2026 16:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774630403; cv=none; b=a84DB0ibU+DqO/1+yfukP86MWb4GYFgE53vOsv3Kvo+H5qL03ZORkwPJgPUWrpcPXlg3KKUcomXwe2KAFdxzNk27tK3Lt6P7hGXntZl7dp6sJc4SZLELCo/a7GS/Ocb5NIs9d9gk2hnMuqoXPTh212x195z0it7ByFhFSCsd8r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774630403; c=relaxed/simple;
	bh=JOch/s0VMKx5mXcCvj6ugZ/KuqVtrtBBIl5RknJpjmY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bA9k1L/7enWATnHrxqbR58NjO171tQaLA9F6psj0WsW7dv6pq+JmFjUbjgU9fz+VJ56EN/OtxVOazGJ1H1OQwDp/1oS2oVXHgJpeHcUtF5qT3A4pfbQimr4eF9XdUwzvoRNc3Fbk22r0ovdKF5Jj4+858xbdGhT+ugNjoSo0hjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=SYrs2liw; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <f362d898-d999-43a4-a07c-4d32a5078809@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774630390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AqDUYA4wt/kvPgCIPt6ZRqk3ooGfNV1nhG6CnRCk2AA=;
	b=SYrs2liwd1XfVgj9axRIWkyr7cjIdwzILYamfUEcAIuRqnLrpnCPhxjud72LexU9lKcaVL
	fJjWPCkUy01FNGW8sNeBCH2ndfwKO46pxGqajegjHxeMXzg+iqkhvHu9yb4XwGz3X0DgmK
	IYVDe5C6gFx6AfqDVX9wLD9jXEcufwE=
Date: Fri, 27 Mar 2026 09:53:00 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] kbuild: fix decl_tag_kfuncs gating to require pahole
 v1.27
To: zhidao su <soolaugust@gmail.com>, bpf@vger.kernel.org,
 linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, ast@kernel.org, daniel@iogearbox.net,
 andrii@kernel.org, corbet@lwn.net, nathan@kernel.org,
 zhidao su <suzhidao@xiaomi.com>
References: <20260327002433.4138813-1-suzhidao@xiaomi.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ihor Solodrai <ihor.solodrai@linux.dev>
In-Reply-To: <20260327002433.4138813-1-suzhidao@xiaomi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-12318-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linux.dev:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ihor.solodrai@linux.dev,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:email,linux.dev:dkim,linux.dev:email,linux.dev:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8A1E6347F9B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/26/26 5:24 PM, zhidao su wrote:
> decl_tag_kfuncs was implemented in pahole v1.27 (dwarves commit
> 72e88f29c6f7 [1]).  However, ebb79e96f1ea ("kbuild: bpf: Tell pahole
> to DECL_TAG kfuncs") appended it to the list of --btf_features flags
> already gated on pahole >= 1.26, making it silently inactive on any
> pahole v1.26 build.
> 
> Without decl_tag_kfuncs, pahole does not emit DECL_TAG BTF entries for
> __bpf_kfunc-annotated functions.  resolve_btfids then skips
> process_kfunc_with_implicit_args(), so KF_IMPLICIT_ARGS kfuncs keep
> their full prototype (including the implicit aux parameter) in vmlinux
> BTF.  BPF programs loading such kfuncs as weak ksyms fail with:
> 
>   libbpf: extern (func ksym) 'scx_bpf_create_dsq': func_proto [N]
>           incompatible with vmlinux [M]
> 
> Fix by splitting decl_tag_kfuncs into its own >= 127 line in
> Makefile.btf.  Add a PAHOLE_HAS_DECL_TAG_KFUNCS Kconfig symbol so
> build rules can gate on this feature explicitly.  Update
> Documentation/process/changes.rst to reflect the corrected minimum
> pahole version for KF_IMPLICIT_ARGS support.
> 
> [1] https://github.com/acmel/dwarves/commit/72e88f29c6f7e14201756e65bd66157427a61aaf
> 
> Fixes: ebb79e96f1ea ("kbuild: bpf: Tell pahole to DECL_TAG kfuncs")
> Reported-by: Ihor Solodrai <ihor.solodrai@linux.dev>
> Closes: https://lore.kernel.org/bpf/e0ca748d-3204-4160-b37d-0f76cbac8c6c@linux.dev/

No. Please read the feedback behind this link carefully and check the
patch bumping to v1.22 before submitting a new version.

Hint: you can feed it to your "AI agent" too, it should be able to
figure it out.

We don't need a new kconfig flag to enforce higher minimum pahole version.

pw-bot: cr

> Signed-off-by: zhidao su <suzhidao@xiaomi.com>
> ---
>  Documentation/process/changes.rst |  4 ++--
>  lib/Kconfig.debug                 | 10 ++++++++++
>  scripts/Makefile.btf              |  6 +++++-
>  3 files changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
> index 02068d72a101..bfe98e38c9c0 100644
> --- a/Documentation/process/changes.rst
> +++ b/Documentation/process/changes.rst
> @@ -38,7 +38,7 @@ bash                   4.2              bash --version
>  binutils               2.30             ld -v
>  flex                   2.5.35           flex --version
>  bison                  2.0              bison --version
> -pahole                 1.26             pahole --version
> +pahole                 1.27             pahole --version
>  util-linux             2.10o            mount --version
>  kmod                   13               depmod -V
>  e2fsprogs              1.41.4           e2fsck -V
> @@ -145,7 +145,7 @@ Since Linux 5.2, if CONFIG_DEBUG_INFO_BTF is selected, the build system
>  generates BTF (BPF Type Format) from DWARF in vmlinux, a bit later from kernel
>  modules as well.  This requires pahole v1.22 or later.
>  
> -Since Linux 7.0, kfuncs annotated with KF_IMPLICIT_ARGS require pahole v1.26
> +Since Linux 7.0, kfuncs annotated with KF_IMPLICIT_ARGS require pahole v1.27
>  or later.  Without it, such kfuncs will have incorrect BTF prototypes in
>  vmlinux, causing BPF programs to fail to load with a "func_proto incompatible
>  with vmlinux" error.  Many sched_ext kfuncs are affected.
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 93f356d2b3d9..38ef8b6ce98d 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -425,6 +425,16 @@ config PAHOLE_HAS_LANG_EXCLUDE
>  	  otherwise it would emit malformed kernel and module binaries when
>  	  using DEBUG_INFO_BTF_MODULES.
>  
> +config PAHOLE_HAS_DECL_TAG_KFUNCS
> +	def_bool PAHOLE_VERSION >= 127
> +	help
> +	  Support for the decl_tag_kfuncs BTF feature, which is required for
> +	  kfuncs annotated with KF_IMPLICIT_ARGS to receive correct BTF
> +	  prototypes.  Without it, such kfuncs retain their full prototype
> +	  (including the implicit aux parameter) in vmlinux BTF, causing BPF
> +	  programs to fail to load with a "func_proto incompatible" error.
> +	  Implemented in pahole v1.27 (commit 72e88f29c).
> +
>  config DEBUG_INFO_BTF_MODULES
>  	bool "Generate BTF type information for kernel modules"
>  	default y
> diff --git a/scripts/Makefile.btf b/scripts/Makefile.btf
> index 562a04b40e06..c804643c5040 100644
> --- a/scripts/Makefile.btf
> +++ b/scripts/Makefile.btf
> @@ -14,7 +14,11 @@ pahole-flags-$(call test-ge, $(pahole-ver), 125)	+= --skip_encoding_btf_inconsis
>  else
>  
>  # Switch to using --btf_features for v1.26 and later.
> -pahole-flags-$(call test-ge, $(pahole-ver), 126)  = -j$(JOBS) --btf_features=encode_force,var,float,enum64,decl_tag,type_tag,optimized_func,consistent_func,decl_tag_kfuncs
> +pahole-flags-$(call test-ge, $(pahole-ver), 126)  = -j$(JOBS) --btf_features=encode_force,var,float,enum64,decl_tag,type_tag,optimized_func,consistent_func
> +
> +# decl_tag_kfuncs was implemented in pahole v1.27 (commit 72e88f29c).
> +# It was incorrectly gated on >= 126 by ebb79e96f1ea.
> +pahole-flags-$(call test-ge, $(pahole-ver), 127) += --btf_features=decl_tag_kfuncs
>  
>  pahole-flags-$(call test-ge, $(pahole-ver), 130) += --btf_features=attributes
>  


