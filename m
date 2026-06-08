Return-Path: <linux-kbuild+bounces-13659-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fkqaEoM9J2qCtwIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13659-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 09 Jun 2026 00:09:07 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C4165AE3B
	for <lists+linux-kbuild@lfdr.de>; Tue, 09 Jun 2026 00:09:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Lq52nAwS;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13659-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13659-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B3EE93040CA6
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Jun 2026 22:09:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 146B130C157;
	Mon,  8 Jun 2026 22:09:05 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0540823393E;
	Mon,  8 Jun 2026 22:09:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780956545; cv=none; b=SYvTxWtFVuQ7xGpDSnpwpY9w7wQjJPecszmYYsd4dBUZMhlIXfgoQyhBgdIfTGmqWPfeypfgP8Ixb8HrOPXiNlHV0j/YscN+a2xSoE+yAcOKFy7pWnR52LwmVT+cOYtbanSh8EbpSAipNHJ7NSKXphkfp5UewFPS5C8ZrcaJgeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780956545; c=relaxed/simple;
	bh=ttxWLXGOlDSySVHKZ3U+0o9Uc5DvoTjKmBQoTecrvvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bEowe00RbCLRZYcNTny+Qq5+CaK9QX4JnZ7hR8kq38dE5WZYwck9on6b0uOQs+h+fMwb7SVxXhYcQrQHa6kVd8ml5zSGl8e1HBb6WdydUIGv/zbZrYhesiAGco/JBOS6NjJw7bMJhYHukUjx+moXEu4VvenDFEA0JZjnEK7tQGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lq52nAwS; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67A311F00893;
	Mon,  8 Jun 2026 22:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780956543;
	bh=Vf4KV/Op+GCD+8s2g1BpM2ZXvm3GjRLZVA0QNpLP9II=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Lq52nAwSWBA0ASzi+/c36WvWckTTUheWrAqw5zcVFj1KVuNu8GgVDTsiD7D5q7RqU
	 h6ngq9g1+bKSwb8DHU5LnXB8qdfA9HQIGpU7lRibq2Fkjwvl4t1wdDn6doEGTR8Qpt
	 TtpB2B1Dp92hAIWi5COy6dcu7Np9w3DGEriEBdTsHHkdITyjHS4t/GKgOwMpE6K27S
	 Gdq5RFKMdvAalnTd2OlAw+ejlllhAhswpSDrxLL+/8JD1QO3AR8ld05uSqpEOnIYwa
	 /izlvVzXTjtzg9aRodC1J3vBCm/BDI8+EiodVusuV2NDav80s7aiFiJtVqRmFh2KmP
	 POI75G7OHQSWQ==
Date: Mon, 8 Jun 2026 15:08:59 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Yang Wang <kevinyang.wang@amd.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org, nsc@kernel.org
Subject: Re: [PATCH] kbuild: normalize paths in quiet compile output
Message-ID: <20260608220859.GC2340474@ax162>
References: <20260608070039.4069917-1-kevinyang.wang@amd.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608070039.4069917-1-kevinyang.wang@amd.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kevinyang.wang@amd.com,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:nsc@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-13659-lists,linux-kbuild=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ax162:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B5C4165AE3B

Hi Yang,

On Mon, Jun 08, 2026 at 03:00:39PM +0800, Yang Wang wrote:
> Composite objects may contain relative components in their member object
> paths. This can make quiet compile output include noisy dot-dot components,
> for example:
> 
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_module.o
> 
> Use the existing normalize_path helper for quiet C and assembly compile
> output so the same target is printed as:
> 
>   CC [M]  drivers/gpu/drm/amd/amdkfd/kfd_module.o
> 
> The actual compile commands still use $@, so object paths, dependency
> tracking and generated files are unchanged.
> 
> Signed-off-by: Yang Wang <kevinyang.wang@amd.com>

While I agree that the dots are ugly, I do not want to take this change
because it makes it harder to figure out how to build these .o files
individually. For example:

  $ make -kj"$(nproc)" ARCH=x86_64 CROSS_COMPILE=x86_64-linux- mrproper allmodconfig drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_module.o
  ...
    CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_module.o

works for building this file individually but the normalized path
produced by this patch

  $ make -kj"$(nproc)" ARCH=x86_64 CROSS_COMPILE=x86_64-linux- mrproper allmodconfig drivers/gpu/drm/amd/amdkfd/kfd_module.o
  ...
    CC      drivers/gpu/drm/amd/amdkfd/kfd_module.o
  In file included from drivers/gpu/drm/amd/amdkfd/kfd_module.c:26:
  drivers/gpu/drm/amd/amdkfd/kfd_priv.h:46:10: fatal error: kgd_kfd_interface.h: No such file or directory
     46 | #include <kgd_kfd_interface.h>
        |          ^~~~~~~~~~~~~~~~~~~~~
  compilation terminated.
  make[7]: *** [scripts/Makefile.build:289: drivers/gpu/drm/amd/amdkfd/kfd_module.o] Error 1

does not.

> ---
>  scripts/Makefile.lib | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 28a1c08e3b22..7d1589d993a8 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -239,7 +239,7 @@ ifdef CONFIG_LTO_CLANG
>  cmd_ld_single = $(if $(objtool-enabled)$(is-single-obj-m), ; $(LD) $(ld_flags) -r -o $(tmp-target) $@; mv $(tmp-target) $@)
>  endif
>  
> -quiet_cmd_cc_o_c = CC $(quiet_modtag)  $@
> +quiet_cmd_cc_o_c = CC $(quiet_modtag)  $(call normalize_path,$@)
>        cmd_cc_o_c = $(CC) $(c_flags) -c -o $@ $< \
>  		$(cmd_ld_single) \
>  		$(cmd_objtool)
> @@ -254,7 +254,7 @@ define rule_cc_o_c
>  	$(call cmd,warn_shared_object)
>  endef
>  
> -quiet_cmd_as_o_S = AS $(quiet_modtag)  $@
> +quiet_cmd_as_o_S = AS $(quiet_modtag)  $(call normalize_path,$@)
>        cmd_as_o_S = $(CC) $(a_flags) -c -o $@ $< $(cmd_objtool)
>  
>  define rule_as_o_S
> -- 
> 2.47.3
> 

-- 
Cheers,
Nathan

