Return-Path: <linux-kbuild+bounces-13155-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GtrDoeyBWqeZwIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13155-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 May 2026 13:31:19 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2436654108B
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 May 2026 13:31:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1546D300B2BC
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 May 2026 11:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E789C3B5F59;
	Thu, 14 May 2026 11:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="IR3s6tyQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7E5388378;
	Thu, 14 May 2026 11:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778758273; cv=none; b=t+NHXxT6sJcyz0w4dAjeYaPC7BO731sfJAE16skwfan2SDyW3uBitEn+vpa+NO1cxQv186bWQP0Vm6h/Qx5u/lBTdGJJU+0R5pqFwfx3TO59HI2qkyOLe3gzM6A+qslF/ad3CXCklV6FPe3sKsaS8tvJFymYqClP/9Gi7IhXx4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778758273; c=relaxed/simple;
	bh=ogt7RJ7TLjf5SRY4nGaMYBaqSNNoRwxFevzQIxH5QFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QudHfxllZWILKEDSaKEcykBl4ZpmAuRj2sE9acgSENno7Z7qXi0XZXdiUFT/ERPB2UFSjSztwDOxEFaOIvGnARyZ9vNS4YxkYR5RnX/347rjQHPYBpOkToq5h3lL5ohY/6soKm4q0lPmhozEpOYYfnI7Sch8PAW7VXP85kkJE4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=IR3s6tyQ; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1778758269;
	bh=ogt7RJ7TLjf5SRY4nGaMYBaqSNNoRwxFevzQIxH5QFI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IR3s6tyQHgiIPzlJgpz5y5eoTdE5I7/o82+qvZ+IOWkuYbTJRrn6SaH7SWblDH4dW
	 ynIaJboSKPZdMLD617ACuklj3hNbbsSrvktkNr7fY9NK9MfXJp7gLl0ER5k+4QH1k6
	 ++NTaIE6nRo2zZhqAUzS0EH05YXVxB+XZi757Qyg=
Date: Thu, 14 May 2026 13:31:08 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Viktor =?utf-8?B?SsOkZ2Vyc2vDvHBwZXI=?= <viktor_jaegerskuepper@freenet.de>
Cc: Christian Heusel <christian@heusel.eu>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: pacman-pkg: make "rc" releases adhere to pacman
 versioning scheme
Message-ID: <ac256794-25c2-46bf-8375-e65b2f0b06ff@t-8ch.de>
References: <20260513231745.51780-1-viktor_jaegerskuepper@freenet.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260513231745.51780-1-viktor_jaegerskuepper@freenet.de>
X-Rspamd-Queue-Id: 2436654108B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[weissschuh.net,quarantine];
	R_DKIM_ALLOW(-0.20)[weissschuh.net:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[freenet.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13155-lists,linux-kbuild=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@weissschuh.net,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[weissschuh.net:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[freenet.de:email]
X-Rspamd-Action: no action

On 2026-05-14 01:17:29+0200, Viktor Jägersküpper wrote:
> The package versioning scheme does not enable smooth upgrades from "rc"
> releases to the corresponding stable releases (e.g. 7.0.0-rc7 -> 7.0.0)
> because pacman considers that a downgrade due to the underscore in
> pkgver (e.g. 7.0.0_rc7), see e.g. vercmp(8) for an explanation of the
> package version comparison used by pacman. Package versions which are
> derived from said releases (e.g. built from git revisions) are
> similarly affected. Fix this by modifying pkgver in order to remove the
> hyphen from kernel versions containing "-rc".
> 
> Signed-off-by: Viktor Jägersküpper <viktor_jaegerskuepper@freenet.de>

Acked-by: Thomas Weißschuh <linux@weissschuh.net>

Thanks!

> ---
>  scripts/package/PKGBUILD | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

(...)

