Return-Path: <linux-kbuild+bounces-11453-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Ex/NM6YoGlVlAQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11453-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Feb 2026 20:02:38 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5722B1AE234
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Feb 2026 20:02:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 04E0B307B215
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Feb 2026 18:38:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51756304972;
	Thu, 26 Feb 2026 18:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BER+/t05"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC352427A18;
	Thu, 26 Feb 2026 18:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772131085; cv=none; b=mHkHfT9xV4TfJjbqAj7SzDvOvA0Z5O/S7D4wSuv1WqVEa5r5jKDRtdPF+/S2W6wV2o8aPKN0eGYKaWJm9n16Pz0g5AGASGliM9XTLaGrD5IRo51SkfsymASu/dShG5QYz0vIFUMWOktwpquwo7ZWvBAtAcnsD7FU906wmTqlPuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772131085; c=relaxed/simple;
	bh=KDiaZJs2Xk2JTGE/2+p9vMWxm3Q9coBcc/t0Mrz81SQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ANmG8hk78QiSjVJl7qVC3B/Rp3X8xbJasKFmQ7LfioNRhkvRV8jHqDGkPIgghr2+k/JaGn8vSmKqT5tl6KsSbmuwze7a/1zXJmppEg6EAv/aLf4MamEv1+9rTFj4J9rgOsKVPyAGZhfgSqTbYNU/d/AuPBHQdmYKvCHRq8RysfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BER+/t05; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88FC5C116C6;
	Thu, 26 Feb 2026 18:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772131085;
	bh=KDiaZJs2Xk2JTGE/2+p9vMWxm3Q9coBcc/t0Mrz81SQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BER+/t05nE8ccGJ5r3C6rbDaGXuzEzHx62f/9nRU2GHtixL9n3WVcjKvd2GG5zKvz
	 5HopIEeDASsvQSe+zj5hkKat6c1j9N4v2rtfsg+p3dKrraVuDm6PGnEDFJ4ZgUG0oq
	 Etd46mMlyGJQHfXq6L88uHsRSsx0GzTFEzPOfdnhrDmeHV/8fOy3tWlsNmA+oou2ys
	 pRNSyPNudXvJqt0ogf7QhusduFLz4PljXQ3ncv3TOc1jXvcpgWTOSIm7+irZxL4HGg
	 DpFeQpCLzheyyB+E5dFod3KgagD3xy5D6gXaU6FHJZdg+wYzjr3Eclg1rFMfyOG3iq
	 x3P9R9FeFEmwg==
Date: Thu, 26 Feb 2026 10:38:03 -0800
From: Namhyung Kim <namhyung@kernel.org>
To: Leo Yan <leo.yan@arm.com>, Quentin Monnet <qmo@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Ian Rogers <irogers@google.com>,
	James Clark <james.clark@linaro.org>, Kees Cook <kees@kernel.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, bpf@vger.kernel.org
Subject: Re: [PATCH RESEND v2] tools build: Use -fzero-init-padding-bits=all
Message-ID: <aaCTC86U9KjnmZmu@google.com>
References: <20260224-tools_build_fix_zero_init-v2-1-b1acc817a01e@arm.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260224-tools_build_fix_zero_init-v2-1-b1acc817a01e@arm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11453-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,google.com,linaro.org,vger.kernel.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[namhyung@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,gnu.org:url,arm.com:email]
X-Rspamd-Queue-Id: 5722B1AE234
X-Rspamd-Action: no action

Adding bpftool maintainer.

On Tue, Feb 24, 2026 at 12:16:40PM +0000, Leo Yan wrote:
> GCC-15 release claims [1]:
> 
>   {0} initializer in C or C++ for unions no longer guarantees clearing
>   of the whole union (except for static storage duration initialization),
>   it just initializes the first union member to zero. If initialization
>   of the whole union including padding bits is desirable, use {} (valid
>   in C23 or C++) or use -fzero-init-padding-bits=unions option to
>   restore old GCC behavior.
> 
> As a result, this new behaviour might cause unexpected data when we
> initialize a union with using the '{ 0 }' initializer.
> 
> Since commit dce4aab8441d ("kbuild: Use -fzero-init-padding-bits=all"),
> the kernel has enabled -fzero-init-padding-bits=all to zero padding bits
> in unions and structures.  This commit applies the same option for tools
> building.
> 
> The option is not supported neither by any version older than GCC 15 and
> is also not supported by LLVM, this patch adds the cc-option function to
> dynamically detect the compiler option.
> 
> [1] https://gcc.gnu.org/gcc-15/changes.html
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
> Resent to linux-kbuild mailing list.
> ---
>  tools/scripts/Makefile.include | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/tools/scripts/Makefile.include b/tools/scripts/Makefile.include
> index b5ecf137febcae59f506e107a7f2e2ad72f4bef4..73f6aef4f3fda0cda7ee8f4b9a3b7ff7d956070d 100644
> --- a/tools/scripts/Makefile.include
> +++ b/tools/scripts/Makefile.include
> @@ -40,6 +40,30 @@ EXTRA_WARNINGS += -Wwrite-strings
>  EXTRA_WARNINGS += -Wformat
>  EXTRA_WARNINGS += -Wno-type-limits
>  
> +# output directory for tests below
> +TMPOUT = .tmp_$$$$
> +
> +# try-run
> +# Usage: option = $(call try-run, $(CC)...-o "$$TMP",option-ok,otherwise)
> +# Exit code chooses option. "$$TMP" serves as a temporary file and is
> +# automatically cleaned up.
> +try-run = $(shell set -e;		\
> +	TMP=$(TMPOUT)/tmp;		\
> +	trap "rm -rf $(TMPOUT)" EXIT;	\
> +	mkdir -p $(TMPOUT);		\
> +	if ($(1)) >/dev/null 2>&1;	\
> +	then echo "$(2)";		\
> +	else echo "$(3)";		\
> +	fi)
> +
> +# cc-option
> +# Usage: CFLAGS += $(call cc-option,-march=winchip-c6,-march=i586)
> +cc-option = $(call try-run, \
> +	$(CC) -Werror $(1) -c -x c /dev/null -o "$$TMP",$(1),$(2))
> +
> +# Explicitly clear padding bits with the initializer '{ 0 }'
> +CFLAGS += $(call cc-option,-fzero-init-padding-bits=all)
> +
>  # Makefiles suck: This macro sets a default value of $(2) for the
>  # variable named by $(1), unless the variable has been set by
>  # environment or command line. This is necessary for CC and AR
> 
> ---
> base-commit: 7dff99b354601dd01829e1511711846e04340a69
> change-id: 20260224-tools_build_fix_zero_init-dc5261bd8b8b
> 
> Best regards,
> -- 
> Leo Yan <leo.yan@arm.com>
> 

