Return-Path: <linux-kbuild+bounces-13534-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ks63I3mAH2ojmgAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13534-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 03 Jun 2026 03:16:41 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3E46335E0
	for <lists+linux-kbuild@lfdr.de>; Wed, 03 Jun 2026 03:16:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=YuJa5eYa;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13534-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13534-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DFD3B302AD13
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Jun 2026 01:16:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5716D2FDC27;
	Wed,  3 Jun 2026 01:16:35 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5173A2B9A4;
	Wed,  3 Jun 2026 01:16:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780449395; cv=none; b=tRa2cOhyurvRRR6sxq7MGxT7XyLgKpkioQonqbUSNFa/A9nub/RHsJCBMsT2bXAYhTKFNS1hebQnK3Kbf5fqZ7gIELxJp155/gIt3SaXZEPw+Ye/qLKHjpJbkwDg8W1uzXIPOcinh3Zukf1p5Dsxqm0WH8zfPkkjF8mgoI8T1ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780449395; c=relaxed/simple;
	bh=aSxhV7Dzuxt+88a2tyUyNJwTZ/2Z2mfgZ9AhdPFwnAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ssFMl8m0785Oc+Y294/KD7Udv9GYFgLcFWdpg07oX47byOKKE1sVXxGM9F8yAFfgnUtT6ZE6Wjgl8HPXVhjSqysr+xZbY39Z7c4e83pWKvpJ9UDxaCxhMcSvOZqn2WykCvu+Q0KyvW51OvcZTB8PFHGZewsJnWaci88uHSc6fPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YuJa5eYa; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5272D1F00893;
	Wed,  3 Jun 2026 01:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780449393;
	bh=0fBTevK6gNCF+y1Qpad9tw8VN5c/evrMNB7AyYy+84U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YuJa5eYan0ZRGi8oX/AjTIbHCBHT/Ab4ivKUR1dGtqh+w5Iy7fwxqMBm9qeKbgS3l
	 S+bjWNgN/1rVyijVXS/p1B0ca+/H05ffed0UBnCw7LKt1vAtdUnTbWIo4OQ9OL7CRD
	 dqhFRBD0dEzSgbkK11hU2HeV/VxwTKv9JX7ihC1rhS6UdVYRColXC7TQ82YqWLmvAg
	 rzXhbHBuveKfmU9l8fRbEE9wldOn2+GxvLg8EtXAxEaYcCDOlxq4weQWzulUH50t45
	 hWaE2YdgG4oc7Dlj5e7J5FmoHcpttn4uoQxSd3kTYaG8a34b7qqXSNL5J/RUG8BHl+
	 cdEOmgC6zhWBw==
Date: Tue, 2 Jun 2026 18:16:29 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>,
	KBuild Mailing List <linux-kbuild@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the kbuild tree with the clang-fixes
 tree
Message-ID: <20260603011629.GA1940387@ax162>
References: <ah7geBSoDn696L9S@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ah7geBSoDn696L9S@sirena.org.uk>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:nsc@kernel.org,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-next@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-13534-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,ax162:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CF3E46335E0

On Tue, Jun 02, 2026 at 02:54:00PM +0100, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the kbuild tree got a conflict in:
> 
>   include/linux/compiler-clang.h
> 
> between commit:
> 
>   175db11786bde ("Disable -Wattribute-alias for clang-23 and newer")
> 
> from the clang-fixes tree and commit:

Technically now Linus's tree after he merged clang-fixes in

  77590cacabb3 ("Merge tag 'clang-fixes-7.1-2' of git://git.kernel.org/pub/scm/linux/kernel/git/nathan/linux")

>   c919893eabb43 ("compiler-clang.h: Drop explicit version number from "all" diagnostic macro")
> 
> from the kbuild tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> diff --cc include/linux/compiler-clang.h
> index 527e4e1360205,a105e2e8016c2..0000000000000
> --- a/include/linux/compiler-clang.h
> +++ b/include/linux/compiler-clang.h
> @@@ -131,16 -122,10 +122,16 @@@
>   #define __diag_str(s)		__diag_str1(s)
>   #define __diag(s)		_Pragma(__diag_str(clang diagnostic s))
>   
>  +#if CONFIG_CLANG_VERSION >= 230000
>  +#define __diag_clang_23(s)	__diag(s)
>  +#else
>  +#define __diag_clang_23(s)
>  +#endif
>  +
> - #define __diag_clang_13(s)	__diag(s)
> + #define __diag_clang_all(s)	__diag(s)
>   
>   #define __diag_ignore_all(option, comment) \
> - 	__diag_clang(13, ignore, option)
> + 	__diag_clang(all, ignore, option)
>   
>   /*
>    * clang has horrible behavior with "g" or "rm" constraints for asm

Thanks a lot, looks good to me and noted for my 7.2 Kbuild pull request.

-- 
Cheers,
Nathan

