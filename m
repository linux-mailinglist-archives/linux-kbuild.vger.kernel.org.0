Return-Path: <linux-kbuild+bounces-13294-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePPLBPU5Dmqu8wUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13294-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 May 2026 00:47:17 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8038B59C45F
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 May 2026 00:47:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DCE2030166FC
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 May 2026 22:43:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A2933C0635;
	Wed, 20 May 2026 22:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yt/sqJlA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA998313293;
	Wed, 20 May 2026 22:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779316993; cv=none; b=o7OB/GMQMuD3fMVy9cHw9ZlnZtkbyosSxe4m7PbVkijINJ4/Jwt80LrPzdNQ2lVktZbHQn8So5nRTjGCNPnt1g1K/AeBQMLinlUWMm3RveALMmjeyJeVmzyK7mCfU0OVH/Gg0hXtoVB3x3HwCe5uwl+Nw9OLUWasnEira10WGdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779316993; c=relaxed/simple;
	bh=IX7YgJoTnHKfcuY8kXg9xo2Ef95Kq6Hev5dEFFricpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pgc90MdsICTzsVkvCzSv5q+mH1Ou4bomcxrs2bB1hkrCNgh+Sgm49RK/YtW4AJCDwlG6vNCsM7p4idG9wImg5k3xzC5upUz9Qw+t+ulDutOjTaD7q91HaM58jBnGsHoFpsPNhY0Jf57D+PgbSg9I1linc7L2fs5fIvVOFKonzxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yt/sqJlA; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BC201F000E9;
	Wed, 20 May 2026 22:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779316992;
	bh=GW96C9ZxfRtuVhTE0CX8qAdrU8Rf0aNn+PB/WbGuH2s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Yt/sqJlAVvVDCwmheBo83Tq4SOz0une36OkTkUCfQ93ogWfLNYTWXzBTvFvZlSFB0
	 Uwx0rqrVKHflN+d58ZAsfmbLTHAF39/p9TXlMI5h3P7kiPtzDMHIxVDSoehN92mryd
	 Y9jH334t6D59U0YVJAFWgX3FkYH09KOU3zku6kYJaJ/v8a3aGPV1rYfFA7fvSkhAec
	 1SGpNgnPlK6jwZ12oOxzP5DcTRayl5qkR6nfR4FoFCJeAU9anC7xo9DhhaThWFCsB1
	 VoeFmMLlNsIeOx/USkVZMJrowgXDy9pxtsmtB3QT6yO3wEoLuez/IogsKpPYzkwWLr
	 I6MjsuNuW3AmQ==
Date: Wed, 20 May 2026 15:43:08 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Zhou Yuhang <zhouyuhang1010@163.com>
Cc: nsc@kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, Zhou Yuhang <zhouyuhang@kylinos.cn>
Subject: Re: [PATCH] kconfig: Fix repeated include selftest expectation
Message-ID: <20260520224308.GD1607511@ax162>
References: <20260520070800.2265479-1-zhouyuhang1010@163.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520070800.2265479-1-zhouyuhang1010@163.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[163.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13294-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kylinos.cn:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 8038B59C45F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 03:08:00PM +0800, Zhou Yuhang wrote:
> From: Zhou Yuhang <zhouyuhang@kylinos.cn>
> 
> The err_repeated_inc test was added with an expected stderr fixture
> that does not match the diagnostic printed by kconfig.
> 
> Running "make testconfig" currently fails in that test even though the
> parser reports the duplicated include correctly:
> 
>   [stderr]
>   Kconfig.inc1:4: error: repeated inclusion of Kconfig.inc3
>   Kconfig.inc2:3: note: location of first inclusion of Kconfig.inc3
> 
> The fixture expects "Repeated" and "Location" with capital letters, but
> the diagnostic emitted by scripts/kconfig/util.c uses lowercase words.
> Update the fixture to match the real message.
> 
> Fixes: 102d712ded3e ("kconfig: Error out on duplicated kconfig inclusion")
> Signed-off-by: Zhou Yuhang <zhouyuhang@kylinos.cn>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  scripts/kconfig/tests/err_repeated_inc/expected_stderr | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/kconfig/tests/err_repeated_inc/expected_stderr b/scripts/kconfig/tests/err_repeated_inc/expected_stderr
> index 95d90d6a93c5..53071430ea7d 100644
> --- a/scripts/kconfig/tests/err_repeated_inc/expected_stderr
> +++ b/scripts/kconfig/tests/err_repeated_inc/expected_stderr
> @@ -1,2 +1,2 @@
> -Kconfig.inc1:4: error: Repeated inclusion of Kconfig.inc3
> -Kconfig.inc2:3: note: Location of first inclusion of Kconfig.inc3
> +Kconfig.inc1:4: error: repeated inclusion of Kconfig.inc3
> +Kconfig.inc2:3: note: location of first inclusion of Kconfig.inc3
> -- 
> 2.43.0
> 

-- 
Cheers,
Nathan

