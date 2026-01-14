Return-Path: <linux-kbuild+bounces-10578-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A64D1F108
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Jan 2026 14:27:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 15DA9300AC86
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Jan 2026 13:27:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBBEA23504B;
	Wed, 14 Jan 2026 13:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R0Lny3Ab"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97041A08AF
	for <linux-kbuild@vger.kernel.org>; Wed, 14 Jan 2026 13:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768397234; cv=none; b=cLH5ur1O5Qo8gpMxU5nAFM8PpIt0PAW/i6+T/il+sXgVXSWx+5PNnvEmgEdj8QUxEHcRC7lTbBk/qO7ALWTkv2sHiG0vt+BFM4A/ASUJFuCzZ9keSKkc4Gcj5dt3wPEjbUeMqLZYukAljMThSxcAJKON7leLrvCT1kU84kqtrrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768397234; c=relaxed/simple;
	bh=aVJMqs7HooMwt6RhwmhULFLQlzfy5ojkkIg7QCs54yQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RqJVFSmb4WhRKjedmtDjXpCNHqdHPpxaOrwMmbkF2e0xHCVeI0hIyFWCVauV1exMkjIfvkHAXD1tRWF9utP0DdR9ndiBn1G8MyafeiQnL402Hom6m1ksEoPYKffJMSuM6BRlLcdUYc2IQH0nNWce/I0nxzWxM/siN08h0mOTuDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R0Lny3Ab; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFF48C4CEF7;
	Wed, 14 Jan 2026 13:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768397234;
	bh=aVJMqs7HooMwt6RhwmhULFLQlzfy5ojkkIg7QCs54yQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R0Lny3Ab4nZHehuxU5t+5qAzy4URIsP9xy8V6TF4RYxpDstAExM8xHUBosEJkPezU
	 wxI8/tdkdDE4UVqZFQRV/1yL+dH5SnGNrdjv/zDDBDDJHz3JDAEQfHNDq6gPIyc+9r
	 WTowL7dV1h2UEHYIMIMowOuhyFFoWgW9VOYGSq/TXGbwjWSBdec70wh89zHzPfxK+V
	 KtMWU+JHloYCfkhEISY6EMC/yrndihikrYdalTxNZPDK+7lWZCstId3BBD1yGXsWny
	 qA6dBwLV9KVPcJE5yV9jUEfsMDVkFxDz17Hu/KOxQDdQNat1sFSDMohuq0E1jboQAy
	 i9RVuui2suIkg==
Date: Wed, 14 Jan 2026 14:26:27 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Arkadiusz Kozdra <floss@arusekk.pl>
Cc: Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Mark Brown <broonie@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] kconfig: fix static linking of nconf
Message-ID: <aWeZg7cn66FD2MVk@derry.ads.avm.de>
Mail-Followup-To: Arkadiusz Kozdra <floss@arusekk.pl>,
	Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Mark Brown <broonie@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
References: <20260110114808.22595-1-floss@arusekk.pl>
 <20260110232043.GA90060@ax162>
 <35312d4f-0783-43bf-8a91-0e80bffe821c@arusekk.pl>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <35312d4f-0783-43bf-8a91-0e80bffe821c@arusekk.pl>

On Mon, Jan 12, 2026 at 02:24:42PM +0100, Arkadiusz Kozdra wrote:
> W dniu 11.01.2026 o 00:20, Nathan Chancellor pisze:
> > > -PKG="ncursesw menuw panelw"
> > > -PKG2="ncurses menu panel"
> > Is it worth a comment that the order of these packages is intentional to
> > support static library builds? I do not mind adding after the fact to
> > save you from sending a v2. I guess this situation is not too common
> > since 1c5af5cf9308 is over six years old at this point but if any other
> > dependencies become necessary in the future, it might help folks place
> > them in the correct order.
> 
> Sure, this is because ld still only visits each archive once, left-to-right,
> by design.
> I think a comment about library dependencies and order would do a lot.
> Feel free to reword and/or add comments as you please.
> Thank you for your help.
> 
> - Arusekk
> 

I will add this to kbuild-fixes-for-next with this comment added to
nconf-cfg.sh:

    # Keep library order for static linking (HOSTCC='cc -static')

final inclusion in kbuild-fixes in about a week as long as there are no
regressions or vetos.

Kind regards,
Nicolas

