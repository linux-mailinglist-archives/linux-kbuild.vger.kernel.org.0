Return-Path: <linux-kbuild+bounces-10766-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMkOEim8cGkRZgAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10766-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 12:44:41 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF7356308
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 12:44:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 218567CD35F
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 11:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB99E3D6666;
	Wed, 21 Jan 2026 11:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LzVz//uD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980D13ECBE2
	for <linux-kbuild@vger.kernel.org>; Wed, 21 Jan 2026 11:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768995331; cv=none; b=et9s6sLLb8axxgYaj5hdWvos6b602TqlFcbrmBFddOSquotGGQ1821mTbkK+nIFgNSQgKD0V+zKhVgUhW6CO3zEAbl4gU2HbSPWCiYYsiKU0FTYEUYHRZcd+DSnUVtFlagex10LGbxvfePFe8QO9SIKSdOylSTKRTTklxFsRRMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768995331; c=relaxed/simple;
	bh=mnit9faduXESpq7k2zLKj2eFzBQu3YWiBlcXiCFZWWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b3FxYz2aCnBsHzX1jmtsVdJs5g+cZNXVLN6iSaZJyO7e2Qmi7hiwBOOv+wSWvX4VYlOGvj8AoYADYYPE/RCQACpzgF83cnjXKqUDbmySLkHoNbsGyNjNYAmtWNtbpk9C4IcvgYRZ/8QufIt3UO5J2cExeJ//mthwIk7GLOv3dYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LzVz//uD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96079C116D0;
	Wed, 21 Jan 2026 11:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768995331;
	bh=mnit9faduXESpq7k2zLKj2eFzBQu3YWiBlcXiCFZWWg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LzVz//uDnBBaYdMRvFwzi9aopgsWDeSJi9YsHn5JT1xntrwfD2KlG7CWRYR/jnAim
	 Hu9MoxfMRPsUTOZNIZvX8cIDmCYIv8NL4y4lJRtK4GXqAsLkGt1J+qeIWYapF4K+97
	 VVWzGJvGrgxCxawXJF4LTOYd0NkaKCzPkzGckAVv19hqTHz1gESKKoLXB4umvUDLr7
	 h4TgwekfzM//3oK3h90aFZaLhOyoL+DT0nG3JLsI27bXKsd35w8GKqFiD7lRzJOkwZ
	 757EFroCcN1xDnla1T+QNXWNhR3WMmopdTPhNrqeQNnr3SBbbRWCml/fJmxX21Zdxq
	 wISGHuUHCNtoQ==
Date: Wed, 21 Jan 2026 12:34:49 +0100
From: Nicolas Schier <nsc@kernel.org>
To: David Disseldorp <ddiss@suse.de>
Cc: linux-kbuild@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH v2 2/2] scripts: headers_install: avoid extra sed call
 for license check
Message-ID: <aXC52UIHjmsNJG4B@derry.ads.avm.de>
Mail-Followup-To: David Disseldorp <ddiss@suse.de>,
	linux-kbuild@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>
References: <20260107205239.6390-1-ddiss@suse.de>
 <20260107205239.6390-3-ddiss@suse.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107205239.6390-3-ddiss@suse.de>
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-10766-lists,linux-kbuild=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,derry.ads.avm.de:mid,suse.de:email]
X-Rspamd-Queue-Id: ADF7356308
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

[Cc+=nathan]

On Thu, Jan 08, 2026 at 07:39:43AM +1100, David Disseldorp wrote:
> headers_install runs a sed script to check that any GPL variant
> SPDX-License-Identifier line carries a "WITH Linux-syscall-note".
> A subsequent sed invocation then handles removal of a few things that
> aren't desired in installed headers (e.g. __attribute_const__).
> 
> Combine these two sed scripts to avoid re-processing the same file.
> License check errors, as opposed to write errors, are indicated via a
> special sed exit status of 9.
> 
> Signed-off-by: David Disseldorp <ddiss@suse.de>
> ---
>  scripts/headers_install.sh | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/scripts/headers_install.sh b/scripts/headers_install.sh
> index 2181abd1c9b70..ef952cbbb8fde 100755
> --- a/scripts/headers_install.sh
> +++ b/scripts/headers_install.sh
> @@ -23,20 +23,25 @@ TMPFILE=$OUTFILE.tmp
>  
>  trap 'rm -f $OUTFILE $TMPFILE' EXIT
>  
> -# SPDX-License-Identifier with GPL variants must have "WITH Linux-syscall-note"
> -if [ -n "$(sed -n -e "/SPDX-License-Identifier:.*GPL-/{/WITH Linux-syscall-note/!p}" $INFILE)" ]; then
> -	echo "error: $INFILE: missing \"WITH Linux-syscall-note\" for SPDX-License-Identifier" >&2
> -	exit 1
> -fi
> -
> +# returns 9 if GPL SPDX-License-Identifier omits "WITH Linux-syscall-note"
>  sed -E -e '
> +	/SPDX-License-Identifier:.*GPL-/{/WITH Linux-syscall-note/! Q9}

thanks, I like the idea of combining the sed calls.  According to the
manual 'Q' (or 'q' with argument) is a GNU extension (non-POSIX).

May we expect GNU sed on all system running headers_install?

>  	s/([[:space:](])(__user|__force|__iomem)[[:space:]]/\1/g
>  	s/__attribute_const__([[:space:]]|$)/\1/g
>  	s@^#include <linux/compiler.h>@@
>  	s/(^|[^a-zA-Z0-9])__packed([^a-zA-Z0-9_]|$)/\1__attribute__((packed))\2/g
>  	s/(^|[[:space:](])(inline|asm|volatile)([[:space:](]|$)/\1__\2__\3/g
>  	s@#(ifndef|define|endif[[:space:]]*/[*])[[:space:]]*_UAPI@#\1 @
> -' $INFILE > $TMPFILE || exit 1
> +' $INFILE > $TMPFILE
> +case $? in
> +9)
> +	echo "error: $INFILE: missing \"WITH Linux-syscall-note\" for SPDX-License-Identifier" >&2
> +	exit 1
> +	;;
> +1)
> +	exit 1
> +	;;
> +esac

This silently ignores all other exit codes.  What about this:

9)
...
	;;
0)	;;
*)
	exit 1
	;;
esac


Kind regards,
Nicolas

