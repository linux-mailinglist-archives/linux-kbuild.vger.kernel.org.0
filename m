Return-Path: <linux-kbuild+bounces-11410-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPFIAwDenWmuSQQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11410-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Feb 2026 18:21:04 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B98318A79C
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Feb 2026 18:21:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CC9643020FD4
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Feb 2026 17:20:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2D6727F195;
	Tue, 24 Feb 2026 17:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LT1jlzz8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5C723E346;
	Tue, 24 Feb 2026 17:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771953602; cv=none; b=RH0GL68C4jY5UM/54MIDEHKgNByYVUx3rvzkqs6PG4RABRqHHgI9MhSx4FveKUSmaubc9EIZ1/ti4L3+/LJBbO1k2vFZ+zDHLd87bimzl4bVNnGoh1C/Clbcz5zHhdgxPRJ3VAdY1a5VfMTJImor1GVMxH7wkVqiOW599DuKG6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771953602; c=relaxed/simple;
	bh=ZWmfjVGC04RsemPbN0f/c2oGaGmUqF6JaCPx4KMrvSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iQmCjOtJPcCoq41+gsZ5GeASuyl0mVOHkdQ69W67ATFqYMx5uflQwYH6Cia0UKjLQ+HdhMOz+UKxu5gHQ4DfPB+x9TXx2QR2r3Z0ilgaE+HhJYYjWK01ptTr/bfP6cyloLmCdt3b17EVT2HNftRb44lfc1RmuYl6Au7HmMuJEto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LT1jlzz8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EAA4C19422;
	Tue, 24 Feb 2026 17:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771953602;
	bh=ZWmfjVGC04RsemPbN0f/c2oGaGmUqF6JaCPx4KMrvSo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LT1jlzz8Ovy0fZgn7VU5yJ2vrBl1LBAT/NbaIp/XLdsYoYTCv4JZ0WNhGYInhOhvv
	 i0fXsnC6SvWbsY6z6dhGhTU83NyZyF3l+/DvFSjqY+ny0cC0H3SahpD4dV5NLFJubT
	 HD6giHh6dkNxqRYMR0rQ3sAfVcpk3fRmQmy/mnc+tvtUG4/6tMnbLi1Fww1RPPue+C
	 wLMA5gNwdxBNsBDqPRLZAEiW899kHFmzTZNgpw93u0Gnsg1lA0MSckHK8AAw6FVYRH
	 r5UBp6R0ATxu/3NbXoO4eiBaekqOOKsI5bYFsaTtKh7GxPHhsthu+rjOzhrIZUiyl+
	 UuPFkzYIeehuw==
Date: Tue, 24 Feb 2026 10:19:56 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Leo Yan <leo.yan@arm.com>
Cc: Nicolas Schier <nsc@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Ian Rogers <irogers@google.com>, Namhyung Kim <namhyung@kernel.org>,
	James Clark <james.clark@linaro.org>, Kees Cook <kees@kernel.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH RESEND v2] tools build: Use -fzero-init-padding-bits=all
Message-ID: <20260224171956.GA639152@ax162>
References: <20260224-tools_build_fix_zero_init-v2-1-b1acc817a01e@arm.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224-tools_build_fix_zero_init-v2-1-b1acc817a01e@arm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11410-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,google.com,linaro.org,vger.kernel.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,gnu.org:url]
X-Rspamd-Queue-Id: 1B98318A79C
X-Rspamd-Action: no action

Hi Leo,

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

Kbuild does not maintain/touch tools/. This should go via another tree
like perf or something. It does not look like
tools/scripts/Makefile.include has a clear owner, perf and bpf tend to
be the ones who touch it the most.

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

