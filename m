Return-Path: <linux-kbuild+bounces-11820-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QI1XJksjsWmFrQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11820-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Mar 2026 09:09:47 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF3525EAFD
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Mar 2026 09:09:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6B84D3061D92
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Mar 2026 08:06:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A69C634A3D6;
	Wed, 11 Mar 2026 08:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f0YS7QPV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E23334B663;
	Wed, 11 Mar 2026 08:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773216411; cv=none; b=kcLDcuAxm9RiCRliP+e2ZPWBCw86C25KS4fp16gvdyoeUbvN2PV5SXbUKxpDnQe/GG072v4V9XYJO32vBFTxHXIoFqiU7pRwWHEwlOxqIOtuulRWTdx12Q//pnEmBc+f0LzUK1dFtVkiYSMZ5vnTMe6lCpuBqbYVItwJyfLgY7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773216411; c=relaxed/simple;
	bh=dVEH6w6A2ru6wvApMC4aSElWkR/TFzmlhS1C9lEPXbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=luBsKiBpLWtwWfJUKPeMeMGqvQCx/xxHfgzS2ynHFmn2WIoi8Euvezc+Bzj6wxXJuxld3an3AaaTb6rWbx1/a4cMcksNq2CTo71K56OR5F6gWD4NmxaWfEpdk1QgsKxhSToCjXrVlo6tw7tXcpUZdI2B030Oxy+SVVD/B9f11N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f0YS7QPV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E249C4CEF7;
	Wed, 11 Mar 2026 08:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773216411;
	bh=dVEH6w6A2ru6wvApMC4aSElWkR/TFzmlhS1C9lEPXbI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f0YS7QPVkOH607lM76aLFMmSumjt0Of0A0d4z+MQ7kBskP6mZZaJpSKjbxJHsjj/1
	 wFTO3exIeXQWhdfCt2e3Q+tcHR69ooaxaXv0OXWmAtSQC/YruMn7Dni+AYjAlOyPc6
	 Lbryy0ceS1snZPxx2UsF5Nxrdkp4ntuFoqzsv88M0+SbfD5ljo1b4Q3qIUiLG0R1Pz
	 HlXou7vXIQn+nL2S8ONlpTkyHTnXAq43mu025S9Z9bMFU+b7OSXHYulPOY/u98iCb9
	 uZNYABgBGn0KGD0cvDhN+cML/aMAe/bKbASvnqdljde098YLluGDc0qElXIv1zbF1+
	 TVTN2BKE1jOHw==
Date: Wed, 11 Mar 2026 01:06:45 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Daniel Gomez <da.gomez@kernel.org>
Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>,
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Daniel Gomez <da.gomez@samsung.com>
Subject: Re: [PATCH] Documentation/kbuild: fix empty string
 KBUILD_BUILD_TIMESTAMP
Message-ID: <20260311080645.GC1996626@ax162>
References: <20260310-fix-llvm-docs-v1-1-234878874762@samsung.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260310-fix-llvm-docs-v1-1-234878874762@samsung.com>
X-Rspamd-Queue-Id: 3CF3525EAFD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11820-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,google.com,kernel.org,lwn.net,linuxfoundation.org,linux.dev,hust.edu.cn,lists.linux.dev,vger.kernel.org,samsung.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[samsung.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 12:48:43PM +0100, Daniel Gomez wrote:
> From: Daniel Gomez <da.gomez@samsung.com>
> 
> The ccache example in llvm.rst uses KBUILD_BUILD_TIMESTAMP='' but the
> text says "should be set to a deterministic value". An empty string is
> not deterministic because init/Makefile uses $(or) which treats empty
> as false and falls through to $(shell LC_ALL=C date), embedding the
> current time:
> 
> 	cat /tmp/test-or.mk
> 	build-timestamp-auto = fallback
> 	build-timestamp = $(or $(KBUILD_BUILD_TIMESTAMP),$(build-timestamp-auto))
> 	all:
> 	        @echo "[$(build-timestamp)]"
> 
> 	make --file=/tmp/test-or.mk
> 	[fallback]
> 
> 	KBUILD_BUILD_TIMESTAMP='' make --file=/tmp/test-or.mk
> 	[fallback]
> 
> 	KBUILD_BUILD_TIMESTAMP="Sun Aug 25 20:57:08 UTC 1991" \
> 		make --file=/tmp/test-or.mk
> 	[Sun Aug 25 20:57:08 UTC 1991]
> 
> The same applies to a real kernel build:
> 
> 	make O=../build LLVM=1 CC="ccache clang" tinyconfig
> 	make O=../build LLVM=1 CC="ccache clang" \
> 		KBUILD_BUILD_TIMESTAMP='' --jobs=$(nproc)
> 	cat ../build/include/generated/utsversion.h
> 	#define UTS_VERSION "#2 Wed Mar  4 12:13:43 CET 2026"
> 
> Replace the empty string with an actual date, matching the pattern
> in kbuild.rst and reproducible-builds.rst. Use the first public Linux
> announcement as example date.
> 
> 	make O=../build LLVM=1 CC="ccache clang" tinyconfig
> 	make O=../build LLVM=1 CC="ccache clang" \
> 		KBUILD_BUILD_TIMESTAMP="Sun Aug 25 20:57:08 UTC 1991" \
> 		--jobs=$(nproc)
> 	cat ../build/include/generated/utsversion.h
> 	#define UTS_VERSION "#4 Sun Aug 25 20:57:08 UTC 1991"
> 
> Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
> ---
> Do not use an empty KBUILD_BUILD_TIMESTAMP Makefile variable.
> ---
>  Documentation/kbuild/llvm.rst                    | 2 +-
>  Documentation/translations/zh_CN/kbuild/llvm.rst | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
> index bc8a283bc44b..ef46533d785f 100644
> --- a/Documentation/kbuild/llvm.rst
> +++ b/Documentation/kbuild/llvm.rst
> @@ -128,7 +128,7 @@ Ccache
>  KBUILD_BUILD_TIMESTAMP_ should be set to a deterministic value between builds
>  in order to avoid 100% cache misses, see Reproducible_builds_ for more info)::

To be entirely honest, I don't think this is quite valid anymore, at
least not with fairly modern ccache versions.

  $ ccache --version | head -1
  ccache version 4.12.3

  $ ccache -C

  $ make -skj"$(nproc)" ARCH=arm64 CC="ccache clang" HOSTCC="ccache clang" LLVM=1 mrproper defconfig all

  $ ccache -z
  Statistics zeroed

  $ make -skj"$(nproc)" ARCH=arm64 CC="ccache clang" HOSTCC="ccache clang" LLVM=1 clean all

  $ ccache -s
  Cacheable calls:   10497 / 10554 (99.46%)
    Hits:            10496 / 10497 (99.99%)
      Direct:        10488 / 10496 (99.92%)
      Preprocessed:      8 / 10496 ( 0.08%)
    Misses:              1 / 10497 ( 0.01%)
  Uncacheable calls:    57 / 10554 ( 0.54%)
  Local storage:
    Cache size (GB):   1.2 / 100.0 ( 1.21%)
    Hits:            10496 / 10497 (99.99%)
    Misses:              1 / 10497 ( 0.01%)

I think we should just remove mention of KBUILD_BUILD_TIMESTAMP all together.

Ccache
------

``ccache`` can be used with ``clang`` to improve subsequent builds::

	make LLVM=1 CC="ccache clang"

> -	KBUILD_BUILD_TIMESTAMP='' make LLVM=1 CC="ccache clang"
> +	KBUILD_BUILD_TIMESTAMP="Sun Aug 25 20:57:08 UTC 1991" make LLVM=1 CC="ccache clang"
>  
>  .. _KBUILD_BUILD_TIMESTAMP: kbuild.html#kbuild-build-timestamp
>  .. _Reproducible_builds: reproducible-builds.html#timestamps
> diff --git a/Documentation/translations/zh_CN/kbuild/llvm.rst b/Documentation/translations/zh_CN/kbuild/llvm.rst
> index f87e0181d8e7..c68fd395f64c 100644
> --- a/Documentation/translations/zh_CN/kbuild/llvm.rst
> +++ b/Documentation/translations/zh_CN/kbuild/llvm.rst
> @@ -116,7 +116,7 @@ Ccache
>  KBUILD_BUILD_TIMESTAMP_ 应设置为同一确定值，以避免 100% 的缓存未命中，
>  详见 Reproducible_builds_ 获取更多信息）::
>  
> -	KBUILD_BUILD_TIMESTAMP='' make LLVM=1 CC="ccache clang"
> +	KBUILD_BUILD_TIMESTAMP="Sun Aug 25 20:57:08 UTC 1991" make LLVM=1 CC="ccache clang"
>  
>  .. _KBUILD_BUILD_TIMESTAMP: kbuild.html#kbuild-build-timestamp
>  .. _Reproducible_builds: reproducible-builds.html#timestamps
> 
> ---
> base-commit: 11439c4635edd669ae435eec308f4ab8a0804808
> change-id: 20260310-fix-llvm-docs-1f91c1ec7608
> 
> Best regards,
> --  
> Daniel Gomez <da.gomez@samsung.com>
> 

