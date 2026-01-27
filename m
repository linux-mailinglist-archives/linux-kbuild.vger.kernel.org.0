Return-Path: <linux-kbuild+bounces-10906-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKFCIj0neWkMvwEAu9opvQ
	(envelope-from <linux-kbuild+bounces-10906-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Jan 2026 21:59:41 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D32B49A823
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Jan 2026 21:59:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E7E8430086DF
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Jan 2026 20:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B50502877DE;
	Tue, 27 Jan 2026 20:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FH37T6Qe"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929D317D2;
	Tue, 27 Jan 2026 20:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769547559; cv=none; b=DN7XkdNdYaywB4BBgMd5JxWXCDQ1WrQ8obYupmWfNJd9AzBE7JNneGb4yYeL5mVHghGVSgAhM0mHfEsf6R75l1NjnxXrCCIHmWxsyW6AaD1ymI5wzO39P/7+m1N8zIf/uw4fMq0u3eH58as3Qy+YqHq9v//4ML9sxkdf7/oH0QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769547559; c=relaxed/simple;
	bh=+CYUbSK28v3W3ng0yBuXbnuA6IAJ2jTWL+8p1VJwz80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kr2SRbIeejwCXbCW6zAHKkT/gzy1XQjRwPDqflI9UmFYiHXVrM1iSq+PLZDkZHRgzXC5a2wCxVfjOYn8Ghc8YwOWrH24lyQZTaLy8QhHxYC0Mf2gFc181/tkdQ/N0WNhhNJ2b4DTS3bSNLJ5ESRVdZrMfrXYIezh1jkppgKIT0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FH37T6Qe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06AECC116C6;
	Tue, 27 Jan 2026 20:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769547559;
	bh=+CYUbSK28v3W3ng0yBuXbnuA6IAJ2jTWL+8p1VJwz80=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FH37T6QeRe/A8SMkiXdj0/WPT2n5flOcpIDaN3AxW0bcStbKIynC5ppdThkhdhxG6
	 /s6hzzOsr57pc86q4KJJhczq/9A8Nk4wN5FCORBBP7MmtnQPh/2oqV2bo9np2oxq2h
	 iVwGaUjI7a6Ki//zLdVNd0rMQNsrNxmyZuJJBSreEJ5gJQhHwzThGE/m2cx2l5Px2H
	 2d6AqYkPFCinhFFtaozLmo5WjRWrAXUNGgL4XaLJzBFvEqmPukMR2sNiPiCSH1WCxH
	 5qZJVZWzi2ectO+y26LipmFOf8Zm+ChnA7D7wQR9I/umdWj9F2UM7I+V16D+PszoWF
	 Kmt/veWYQqrpQ==
Date: Tue, 27 Jan 2026 13:59:15 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Ethan Zuo <yuxuan.zuo@outlook.com>
Cc: nsc@kernel.org, masahiroy@kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: Fix permissions of modules.builtin.modinfo
Message-ID: <20260127205915.GA3856796@ax162>
References: <SY0P300MB0609BE844D61B504AB2013C99C90A@SY0P300MB0609.AUSP300.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SY0P300MB0609BE844D61B504AB2013C99C90A@SY0P300MB0609.AUSP300.PROD.OUTLOOK.COM>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[outlook.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10906-lists,linux-kbuild=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D32B49A823
X-Rspamd-Action: no action

Hi Ethan,

On Wed, Jan 28, 2026 at 03:23:23AM +0800, Ethan Zuo wrote:
> Currently, modules.builtin.modinfo is created with executable permissions
> (0755). This is because after commit 39cfd5b12160 ("kbuild: extract
> modules.builtin.modinfo from vmlinux.unstripped"), modules.builtin.modinfo
> is extracted from vmlinux.unstripped using objcopy. When extracting
> sections, objcopy inherits attributes from the source ELF file.

Ah, that explains why this is only visble after 39cfd5b12160, as
vmlinux.o was just a regular object file, whereas vmlinux.unstripped is
an executable. There was another patch submitted to address this issue
that did not explain that bit well:

https://lore.kernel.org/20251209-modinfo-executable-v1-1-ed0c553a4390@pengutronix.de/

> Since modules.builtin.modinfo is a data file and not an executable,
> it should have 0644 permissions. The executable bit can trigger
> warnings in Debian's Lintian tool.

I had asked on that previous submission what sort of issues could be
expected from being executable and warnings from tools is a reasonable
answer to that. Thanks for including that.

> Explicitly set the permissions to 0644 after generation.

Would it be better to do what the previous submission did and just
remove the execute bit via 'chmod -x'? That seems to be slightly more
common in the kernel (even though there are very few uses of 'chmod'
throughout Makefile instances) and seems to get at the issue a little
bit more. Not sure if the creation of these files respects umask, in
case someone had a more restrictive one, but that might be contrived.

> Fixes: 39cfd5b12160 ("kbuild: extract modules.builtin.modinfo from vmlinux.unstripped")
> Signed-off-by: Ethan Zuo <yuxuan.zuo@outlook.com>

Nicolas, do you want to take this as a fix for 6.19 or should I take it
via kbuild-next for 6.20/7.0?

> ---
>  scripts/Makefile.vmlinux | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
> index cd788cac9d91..c5305619b1d3 100644
> --- a/scripts/Makefile.vmlinux
> +++ b/scripts/Makefile.vmlinux
> @@ -113,7 +113,8 @@ vmlinux: vmlinux.unstripped FORCE
>  # what kmod expects to parse.
>  quiet_cmd_modules_builtin_modinfo = GEN     $@
>        cmd_modules_builtin_modinfo = $(cmd_objcopy); \
> -                                    sed -i 's/\x00\+$$/\x00/g' $@
> +                                    sed -i 's/\x00\+$$/\x00/g' $@; \
> +                                    chmod 644 $@
>  
>  OBJCOPYFLAGS_modules.builtin.modinfo := -j .modinfo -O binary
>  
> -- 
> 2.51.0
> 

