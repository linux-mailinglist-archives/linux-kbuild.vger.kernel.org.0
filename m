Return-Path: <linux-kbuild+bounces-10958-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 1gDnDK8bfmn5VgIAu9opvQ
	(envelope-from <linux-kbuild+bounces-10958-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 31 Jan 2026 16:11:43 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9D4C2A23
	for <lists+linux-kbuild@lfdr.de>; Sat, 31 Jan 2026 16:11:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 90A9A3001FDB
	for <lists+linux-kbuild@lfdr.de>; Sat, 31 Jan 2026 15:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C5832F0C45;
	Sat, 31 Jan 2026 15:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BrGh1neY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A6A125A9;
	Sat, 31 Jan 2026 15:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769872300; cv=none; b=YTY6WKoNAdp/VvTChRjctowbxFRBjYW70VlI9W9p63kBHgk5CDwmcoC+xGKG6mHXADIRggGFX9fnTaj5LLATFKFp+q6IVeLE1EPBK3C346BtGW1jPvfOTKHHerf3yu1egbBJF6TGOy9K93nHefwnGM7P1Pn37O34uM7N7ratEGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769872300; c=relaxed/simple;
	bh=lWBTiOqlUAZ7JBLIVwbm2l3NoYSC+eqHpbkInAiWTwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QI1PG+6YegtPOZoNJdcWNxGCqLIYhUUf++HOY6gJUx0cNMTBYxr3oQEbXnKF7MAX3LX7zAibtbiAP5K5Th+98QouwJ3vVVIurw86eisZmONpAcwnQ0Ezl2LHeaxEoXit5BhwGumfhE6Yfc9zewuU5/k9N7oaBfCAs4SLVGSJwvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BrGh1neY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49415C16AAE;
	Sat, 31 Jan 2026 15:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769872299;
	bh=lWBTiOqlUAZ7JBLIVwbm2l3NoYSC+eqHpbkInAiWTwI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BrGh1neYKGTVUkcJHYI1X7o5L0ZBI5qRIplfPUohhJGCKHeB+pIHv+WV0D8Mtwrf/
	 2ZjmsPeuV5XCYvnZH+roygV9BH+MzxE5LMqLLRq3DUqqXx5OXhByxj/t6aFvTjzseE
	 AWN97ZpCgKY9+7ubuz30rDJsmJEDab3BuXnTZ84h86evXAY0AOhOStokosUxR9DnAX
	 D+47CT3sW/ok6R2DBfgSz2XHRyOi3RkEIA4cl9rgRFe5Q0SXNv6HuCfGMmnCxJE+fY
	 8c6OO2hcp8XpbOn+uLwQlpW6pxDsQMq/f0ofb61ueH1f+CQGNUqmKnrXNMAFEskFhb
	 C2d3FfPY1M8nA==
Date: Sat, 31 Jan 2026 16:11:30 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Rong Zhang <i@rong.moe>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: Run kernel-doc only for in-tree builds
Message-ID: <aX4bonSINSuju-OO@levanger>
Mail-Followup-To: Nathan Chancellor <nathan@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Rong Zhang <i@rong.moe>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20260131-run-kernel-doc-only-in-tree-v1-1-93a9c695dfb1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260131-run-kernel-doc-only-in-tree-v1-1-93a9c695dfb1@kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10958-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild,huawei];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rong.moe:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7D9D4C2A23
X-Rspamd-Action: no action

On Sat, Jan 31, 2026 at 04:02:32PM +0100, Nicolas Schier wrote:
> Stop running kernel-doc when building out-of-tree kernel modules.
> 
> Rong Zhang reported that building external modules with W set fails
> since v6.19-rc1 as the kernel-doc Python modules are no more available
> when building against a kernel module build tree exported by
> scripts/package/install-extmod-build.
> 
> As there is no good reason for checking documentation when building
> out-of-tree kernel modules, stop it.
> 
> Fixes: 778b8ebe5192 ("docs: Move the python libraries to tools/lib/python")
> Reported-by: Rong Zhang <i@rong.moe>
> Closes: https://lore.kernel.org/linux-kbuild/20260129175321.415295-1-i@rong.moe
> Suggested-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Tested-by: Nicolas Schier <nsc@kernel.org>
> Signed-off-by: Nicolas Schier <nsc@kernel.org>
> ---
> I left out a 'Cc: stable@kernel.org' as the problem exists just since
> v6.19-rc1; please intervene ASAP if you think it should be added.
> ---
> 
> ---
> Thanks for the report (Rong) and the patch suggestion (Mauro)!
> I left out a 'Cc: stable@kernel.org' as the problem exists just since
> 6.19-rc1; please intervene ASAP if you think it should be added.
> ---
>  scripts/Makefile.build | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 5037f4715d7491761b75d086441367c6c08c099e..05674bae3c637b4476a11b5e6af630d8daa3b613 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -166,10 +166,12 @@ else ifeq ($(KBUILD_CHECKSRC),2)
>          cmd_force_checksrc = $(CHECK) $(CHECKFLAGS) $(c_flags) $<
>  endif
>  
> -ifneq ($(KBUILD_EXTRA_WARN),)
> -  cmd_checkdoc = PYTHONDONTWRITEBYTECODE=1 $(PYTHON3) $(KERNELDOC) -none $(KDOCFLAGS) \
> -        $(if $(findstring 2, $(KBUILD_EXTRA_WARN)), -Wall) \
> -        $<
> +ifeq ($(KBUILD_EXTMOD),)
> +    ifneq ($(KBUILD_EXTRA_WARN),)
> +      cmd_checkdoc = PYTHONDONTWRITEBYTECODE=1 $(PYTHON3) $(KERNELDOC) -none $(KDOCFLAGS) \
> +            $(if $(findstring 2, $(KBUILD_EXTRA_WARN)), -Wall) \
> +            $<
> +    endif
>  endif
>  
>  # Compile C sources (.c)
> 
> ---
> base-commit: 6d60354ea2f90352b22039ed8371c4f4321df90e
> change-id: 20260131-run-kernel-doc-only-in-tree-18be87e88208
> 
> Best regards,
> -- 
> Nicolas
> 

Oh, sorry. I overlooked Nathan's patch.  Sorry for the noise.

