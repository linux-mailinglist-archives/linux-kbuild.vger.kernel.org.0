Return-Path: <linux-kbuild+bounces-11924-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJ1TJimktGk7rgAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11924-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Mar 2026 00:56:25 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 005DC28AC61
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Mar 2026 00:56:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B143030E6F87
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Mar 2026 23:56:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09D8137E317;
	Fri, 13 Mar 2026 23:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SslktEk7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93C721E097;
	Fri, 13 Mar 2026 23:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773446182; cv=none; b=gqfJ4lNGDt8w21RcTe8qcKgpW0tsap5uMBRk87smFWTweCkT9MxTODX0DtNbyALaP+3zMrcLb15GqVcj0W6duLU/7jyKqhPAIgweWH24QGmWyqzbPC1V7ngNsCBmiINpc5tMAX0QQcEn8Nz4h45YXSP3QhXE4x43i/JpOLKX4B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773446182; c=relaxed/simple;
	bh=ruAhQhzBqfr12zaS8Vh7ahF6mSlPHZnK1n+cRy4cDX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iU1FhVECa/Dam7av5cFz4F+sykBTa4NmRPzxuihWnl2rqRVsA2zrXbeGUNPfOBJpvSLcc/rPD2QpDP4SKUwxqlaw3OSB6PGYFsEPgON1a3QPCBtO/JYObwcmjJt2pWfCHSj1De/6fcXVmAneSTT+3wJVXmoSKcNll1LizM6lPcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SslktEk7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01E33C19421;
	Fri, 13 Mar 2026 23:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773446182;
	bh=ruAhQhzBqfr12zaS8Vh7ahF6mSlPHZnK1n+cRy4cDX0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SslktEk70Oc6x0Iheh0eJy41WfbFyrWeQJ4EGAjkW2vHPWGngCMerfS6N+bXaBQa6
	 eQrVArdzpuFWWIqc2H2TGVcv0G2/JA6OBTMp9vY8so3sLDOyqcNBLIRiKoQQyGoHIB
	 OUz55c5TgGvemwPD7Dw0bxx9405UKaNzpAXl7WbwAwUYMKJKnVMmt3lwtkqyKbUoZM
	 MI6E0GACqN0TgZffNHxoazmUathR4/QT5uiWyztdrRA2F2o1tMctfH51oooU4DyUm2
	 ncSgLSNYRc3zt3LFZ5aPndzotyWXScqpQ8iC3tM4GHAK/FddCpUGg3jfOfMSMrGWEn
	 TbSgAsKPakPjw==
Date: Fri, 13 Mar 2026 16:56:18 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Arnd Bergmann <arnd@arndb.de>, Nicolas Schier <nsc@kernel.org>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Nick Huang <sef1548@gmail.com>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] scripts: headers_install.sh: Normalize __ASSEMBLY__ to
 __ASSEMBLER__
Message-ID: <20260313235618.GA4171564@ax162>
References: <20260309-uapi-assembly-v1-1-a7ebfbf14309@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260309-uapi-assembly-v1-1-a7ebfbf14309@weissschuh.net>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[arndb.de,kernel.org,orcam.me.uk,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-11924-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 005DC28AC61
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 09, 2026 at 04:58:11PM +0100, Thomas Weiﬂschuh wrote:
> There is an ongoing effort to replace the usage of __ASSEMBLER__ with
> __ASSEMBLY__ throughout the kernel tree, see for example

I think __ASSEMBLER__ and __ASSEMBLY__ are swapped here?

> commit 287d163322b7 ("arm64: Replace __ASSEMBLY__ with __ASSEMBLER__ in
> non-uapi headers"). The latter is automatically provided by all compilers
> and preprocessors supported by the kernel, so the explicit definitions
> of __ASSEMBLER__ can be removed.
> 
> However the UAPI headers might be used with older (< GCC 3.0) or
> non-GCC-compatible compilers, which do not define __ASSEMBLY__

__ASSEMBLER__?

> automatically. So this migration may brake users.

It sounds like the "< GCC 3.0" part of that might not be true based on
Maciej's research?

  https://lore.kernel.org/alpine.DEB.2.21.2603101412520.63708@angie.orcam.me.uk/

> Also during the migration phase, the UAPI headers will use a mix of
> *both* __ASSEMBLY__ and __ASSEMBLER__ at the same time, which is ugly.
> 
> For now make sure that the exported UAPI headers consistently use
> __ASSEMBLER__ as before.

__ASSEMBLY__?

> Link: https://lore.kernel.org/lkml/164baf81-2824-4943-bbc1-4ae8a160c0cc@t-8ch.de/
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> ---
> This should go either through kbuild or asm-generic, I think.
> ---
>  scripts/headers_install.sh | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/scripts/headers_install.sh b/scripts/headers_install.sh
> index 9c15e748761c..2f1d1767ca26 100755
> --- a/scripts/headers_install.sh
> +++ b/scripts/headers_install.sh
> @@ -36,6 +36,7 @@ sed -E -e '
>  	s/(^|[^a-zA-Z0-9])__packed([^a-zA-Z0-9_]|$)/\1__attribute__((packed))\2/g
>  	s/(^|[[:space:](])(inline|asm|volatile)([[:space:](]|$)/\1__\2__\3/g
>  	s@#(ifndef|define|endif[[:space:]]*/[*])[[:space:]]*_UAPI@#\1 @
> +	s/__ASSEMBLY__/__ASSEMBLER__/g

It seems like this does the opposite of what is intended or am I
misunderstanding something here?

>  ' $INFILE > $TMPFILE || exit 1
>  
>  scripts/unifdef -U__KERNEL__ -D__EXPORTED_HEADERS__ $TMPFILE > $OUTFILE
> 
> ---
> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> change-id: 20260302-uapi-assembly-0bb7213b41f1
> 
> Best regards,
> -- 
> Thomas Weiﬂschuh <linux@weissschuh.net>
> 

