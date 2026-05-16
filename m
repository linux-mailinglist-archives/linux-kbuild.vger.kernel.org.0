Return-Path: <linux-kbuild+bounces-13176-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJVDIC6ACGo/sgMAu9opvQ
	(envelope-from <linux-kbuild+bounces-13176-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 16 May 2026 16:33:18 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 208C955C16A
	for <lists+linux-kbuild@lfdr.de>; Sat, 16 May 2026 16:33:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ED95A300382C
	for <lists+linux-kbuild@lfdr.de>; Sat, 16 May 2026 14:33:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA3CF2848A8;
	Sat, 16 May 2026 14:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freenet.de header.i=@freenet.de header.b="VIz2YPVS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mout.freenet.de (mout.freenet.de [194.97.196.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48FCA2C21F1;
	Sat, 16 May 2026 14:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.97.196.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778941994; cv=none; b=FJ7yqdYKAM7yjz1vuG0Q8Mu3bezHATEqcrZnUYjYKtJJ0toapTXCaNPw0d5WGWW20oe/Cuj3g81n09L4nV0tk1WbJ251QnqCDDoOfSsP4BLawCu6z7jtyA2++cB/0Z0dwKelD89bYfaVt0Px8g99uPHSrUskGimKeqZfkx1QW2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778941994; c=relaxed/simple;
	bh=VWg7nIxI+TrD+IeLtrIfnR/VKpjZl9xkHzfNQOJqblI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NTLxfrxyrZh1LLI0knMK0fLqayR86ZuqnkZ19D+j4zhEwg+DlKjLzqZrJ0u91YdQz3Wk9ek5mB4NCiPzf9Sx1OnT5RYIY/LVHFOMIGA1Jjt1R5D5k8Dpe7/T9EzfxQWCmjRQgcx5yf5XJIyob9/9XtJcOJb9H/VlXE312EgQQPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=freenet.de; spf=pass smtp.mailfrom=freenet.de; dkim=pass (2048-bit key) header.d=freenet.de header.i=@freenet.de header.b=VIz2YPVS; arc=none smtp.client-ip=194.97.196.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=freenet.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freenet.de
Received: from [2001:748:400:2319::3] (helo=sub2.mail.fnrz.de)
	by mout4.mail.fnrz.de with esmtpa (ID viktor.jaegerskuepper@freenet.de) (port 25) (Exim 4.98.2 #2)
	id 1wOFzF-000000000Pd-07kD;
	Sat, 16 May 2026 16:27:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=freenet.de;
	s=mjaymdexmjqk; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=LYoy3qNlvQ+BYIyISGShV5obarDVEvQFxAkQVIHF77A=; b=VIz2YPVSHRjHeE02TqhQomqMTz
	TLRBSOpXZCNIGxvHGiGid6i26t8EaWLz7u0Mkzb93QIG5HUeilHtTUDRfKFQ5f58G6rVqRs1fX3uH
	3sFlIRawvoGS5OX/3Dw+SNajb3ZJ7134HcQDEFO/VH2SvNZI7+pPUn9xbBRV2JEZ1ke2wXz4O3A7Q
	hxnD/zcdTyGDhMzunAnN/TL59KaaGOcOcxE8HzGte2MJ6+w/YE0JFdLOhuVCO6+m3nYdobHERRnlc
	j8Tc3uAZI4SDkXS9D5Q3i3O2Z94ds/4SMD/eYMHZhmc//+lEUYs3JiFJYHnbYSnwhu+6lrhg4X26T
	te3S7tVQ==;
Received: from [2a02:8071:a85:f020:d23b:4d27:e558:ccdc] (port=42896 helo=[127.0.0.1])
	by sub2.mail.fnrz.de with esmtpsa (ID viktor.jaegerskuepper@freenet.de) (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (port 465) (Exim 4.96 #2)
	id 1wOFzE-005ZzW-2t;
	Sat, 16 May 2026 16:27:28 +0200
Message-ID: <bbed7fb2-11f7-4396-a89d-881972565f06@freenet.de>
Date: Sat, 16 May 2026 16:27:39 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] kbuild: pacman-pkg: make "rc" releases adhere to
 pacman versioning scheme
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Christian Heusel <christian@heusel.eu>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260515215913.92481-1-viktor_jaegerskuepper@freenet.de>
Content-Language: en-US
From: =?UTF-8?B?VmlrdG9yIErDpGdlcnNrw7xwcGVy?=
 <viktor_jaegerskuepper@freenet.de>
In-Reply-To: <20260515215913.92481-1-viktor_jaegerskuepper@freenet.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-FN-MUUID: 17789416483B17D207E8ACO
X-Scan-TS: Sat, 16 May 2026 16:27:28 +0200
X-Rspamd-Queue-Id: 208C955C16A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[freenet.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[freenet.de:s=mjaymdexmjqk];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13176-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[freenet.de:+];
	FREEMAIL_FROM(0.00)[freenet.de];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viktor_jaegerskuepper@freenet.de,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,weissschuh.net:email]
X-Rspamd-Action: no action

On 5/15/26 23:58, Viktor Jägersküpper wrote:
> The package versioning scheme does not enable smooth upgrades from "rc"
> releases to the corresponding stable releases (e.g. 7.0.0-rc7 -> 7.0.0)
> because pacman considers that a downgrade due to the underscore in
> pkgver (e.g. 7.0.0_rc7), see e.g. vercmp(8) for an explanation of the
> package version comparison used by pacman. Package versions which are
> derived from said releases (e.g. built from git revisions) are
> similarly affected. Fix this by modifying pkgver in order to remove the
> hyphen from kernel versions containing "-rcN", where N is a
> non-negative integer.
> 
> Acked-by: Thomas Weißschuh <linux@weissschuh.net>
> Signed-off-by: Viktor Jägersküpper <viktor_jaegerskuepper@freenet.de>
> ---
> v1 -> v2:
> - make the substitution more restrictive
> - enhance commit message accordingly
> - add Acked-by tag
> 
> v1: https://lore.kernel.org/linux-kbuild/20260513231745.51780-1-viktor_jaegerskuepper@freenet.de/
> 
> BTW this also works for something like "5.10.248-rt143-rc1" which is a
> recent example of an "rc" release of a realtime kernel.
> 
>  scripts/package/PKGBUILD | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUILD
> index 452374d63c24..1213c8e04671 100644
> --- a/scripts/package/PKGBUILD
> +++ b/scripts/package/PKGBUILD
> @@ -10,7 +10,7 @@ for pkg in $_extrapackages; do
>  	pkgname+=("${pkgbase}-${pkg}")
>  done
>  
> -pkgver="${KERNELRELEASE//-/_}"
> +pkgver="$(echo "${KERNELRELEASE}" | sed 's/-\(rc[0-9]\+\)/\1/;s/-/_/g')"

I will send a v3 patch later with the first substitution changed to
match "-rcN" where N is a strictly positive integer because this is
what we really had in the kernel so far, at least as far as I can
remember.

Best regards,
Viktor

>  # The PKGBUILD is evaluated multiple times.
>  # Running scripts/build-version from here would introduce inconsistencies.
>  pkgrel="${KBUILD_REVISION}"
> 
> ---
> base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
> 
> Best regards,
> Viktor


