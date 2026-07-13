Return-Path: <linux-kbuild+bounces-13998-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ev5WGCzhVGpUgQAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13998-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jul 2026 14:59:24 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B44E974B319
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jul 2026 14:59:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13998-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13998-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=fritz.com (policy=quarantine);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D7FBB308B805
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jul 2026 12:57:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3B4640E8F1;
	Mon, 13 Jul 2026 12:57:04 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.avm.de (mail.avm.de [212.42.244.120])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BF637BE93;
	Mon, 13 Jul 2026 12:57:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783947424; cv=none; b=I8QwI1J6FErbHBU0cMUGUbFEjSFab42KLUd9CnHeYstaan8XCmC0rtEEZY/cS/AQV294U7bh2MZA3eltQHBlwtLzb5rcgcLWvRSm5au1ZV42bVmkFT8enOBSFpeEMEn7kzF+dK36wHn6UPWdTE676EPeHTB5/C8ngTxqDXq07+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783947424; c=relaxed/simple;
	bh=bIRqCHpriQsXZf5XV0nkylnIIJScooWgklVhK7I/yP8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WKoJNbZPIBORYiRaW38NFdzVVoIw4kCk1qpCfsF0siUw/7v8QT/eeNcyq6PU3O8C/+QDdG1QgPKVZS+IhPh5Zwdh0ysGLAIh3SX4yBStjF4SDlxn6uRyjythz/WKmFfIA2DS8lItVtvITbUTLGtoYk95XkZUhUTwdGHhcHEGeM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com; spf=pass smtp.mailfrom=fritz.com; arc=none smtp.client-ip=212.42.244.120
Received: from [2001:bf0:244:244::78] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.57.1)
	(envelope-from <n.schier@fritz.com>)
	id 6a54e095-7cb1-7f0000032729-7f0000018c44-1
	for <multiple-recipients>; Mon, 13 Jul 2026 14:56:53 +0200
Received: from mail-auth.fritz.com (unknown [IPv6:2001:bf0:244:244::78])
	by mail.avm.de (Postfix) with ESMTPS;
	Mon, 13 Jul 2026 14:56:53 +0200 (CEST)
Date: Mon, 13 Jul 2026 14:56:52 +0200
From: Nicolas Schier <n.schier@fritz.com>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Nick Huang <sef1548@gmail.com>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v2] scripts: headers_install.sh: Normalize __ASSEMBLER__
 to __ASSEMBLY__
Message-ID: <20260713-authentic-nimble-walrus-d4b40b@l-nschier-z2>
References: <20260630-uapi-assembly-v2-1-8e7bee2fe816@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260630-uapi-assembly-v2-1-8e7bee2fe816@weissschuh.net>
Organization: FRITZ! Technology GmbH
x-ms-reactions: disallow
X-purgate-ID: 149429::1783947413-74E981B0-ABE2B4B2/0/0
X-purgate-type: clean
X-purgate-size: 2368
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-pfmilter: queueID: 18055A0349
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.54 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[fritz.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13998-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[arndb.de,kernel.org,orcam.me.uk,gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linux@weissschuh.net,m:arnd@arndb.de,m:nathan@kernel.org,m:nsc@kernel.org,m:macro@orcam.me.uk,m:sef1548@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[n.schier@fritz.com,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[n.schier@fritz.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,msgid.link:url,vger.kernel.org:from_smtp,fritz.com:email,fritz.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B44E974B319

On Tue, Jun 30, 2026 at 11:15:00PM +0200, Thomas Weißschuh wrote:
> There is an ongoing effort to replace the usage of __ASSEMBLY__ with
> __ASSEMBLER__ throughout the kernel tree, see for example
> commit 287d163322b7 ("arm64: Replace __ASSEMBLY__ with __ASSEMBLER__ in
> non-uapi headers"). The latter is automatically provided by all compilers
> and preprocessors supported by the kernel, so the explicit definitions
> of __ASSEMBLY__ can be removed.
> 
> However the UAPI headers might be used with non-GCC-compatible
> compilers, which do not define __ASSEMBLER__ automatically.
> So this migration may break users. Also during the migration phase, the
> UAPI headers will use a mix of *both* __ASSEMBLY__ and __ASSEMBLER__ at
> the same time, which is ugly and inconsistent.
> 
> For now make sure that the exported UAPI headers consistently use
> __ASSEMBLY__ as before.
> 
> Link: https://lore.kernel.org/lkml/164baf81-2824-4943-bbc1-4ae8a160c0cc@t-8ch.de/
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> ---
> Changes in v2:
> - Normalize *to* __ASSEMBLY__.
> - Link to v1: https://patch.msgid.link/20260309-uapi-assembly-v1-1-a7ebfbf14309@weissschuh.net
> ---
> This should go either through kbuild or asm-generic, I think.
> ---
>  scripts/headers_install.sh | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/scripts/headers_install.sh b/scripts/headers_install.sh
> index 9c15e748761c..83e447596878 100755
> --- a/scripts/headers_install.sh
> +++ b/scripts/headers_install.sh
> @@ -36,6 +36,7 @@ sed -E -e '
>  	s/(^|[^a-zA-Z0-9])__packed([^a-zA-Z0-9_]|$)/\1__attribute__((packed))\2/g
>  	s/(^|[[:space:](])(inline|asm|volatile)([[:space:](]|$)/\1__\2__\3/g
>  	s@#(ifndef|define|endif[[:space:]]*/[*])[[:space:]]*_UAPI@#\1 @
> +	s/__ASSEMBLER__/__ASSEMBLY__/g
>  ' $INFILE > $TMPFILE || exit 1
>  
>  scripts/unifdef -U__KERNEL__ -D__EXPORTED_HEADERS__ $TMPFILE > $OUTFILE
> 
> ---
> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
> change-id: 20260302-uapi-assembly-0bb7213b41f1
> 
> Best regards,
> --  
> Thomas Weißschuh <linux@weissschuh.net>
> 

Thanks, I'll take it via kbuild.  Please veto, if it shall go through 
asm-generic instead.

Reviewed-by: Nicolas Schier <n.schier@fritz.com>
Tested-by: Nicolas Schier <n.schier@fritz.com>


Kind regards,
Nicolas

