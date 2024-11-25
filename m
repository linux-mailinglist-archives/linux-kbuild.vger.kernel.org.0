Return-Path: <linux-kbuild+bounces-4841-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A1E9D7D61
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Nov 2024 09:48:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B678162616
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Nov 2024 08:48:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41CE018E050;
	Mon, 25 Nov 2024 08:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="Pazxyk1+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14EFA19B3E2;
	Mon, 25 Nov 2024 08:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732524354; cv=none; b=di3US80Y70ae4VGAd1ewXDDsnbr/EvcSyV5Y3UnO1mB+caw3hGMTO++TiG7SifPG7Fosuqz0y1dff9hxPu+KqRb+MMBI44rV8+QUbKgOn/oAYyAzyVdhthCcbjK6W0zo3MVxKMTgADnbfjIipLoNgod5Gmf2yLajBTAZt7OkjKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732524354; c=relaxed/simple;
	bh=EbW/+vGDDAweSBEPxCkWGq8mUAoK99u9rmU2Gdm/eQk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a3DjysNroezs6K+jx5bElrBuINMF+jH13iUDb30IvcvjYSlvc4SmgJTwL/iVAv9AbzNkK5WuwJGc6XbMAeAl9E2+h+FCTP6oX1AeMKI/j58z5O3gpahxe5/jheX/wVl8kVpOz8TebuO0MyNQzoZEkhnNMfg15HRVe1X9nI5rKkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=Pazxyk1+; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1732524349;
	bh=EbW/+vGDDAweSBEPxCkWGq8mUAoK99u9rmU2Gdm/eQk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pazxyk1+oZW0W5Z7Oxy5RXBYyxNwlLYxeBnK8MpMZxpfCsq1j1CbdEI4aojV3aKbP
	 Vdj83ubzxpNSCRSfa+xzovSrWZRPqD0F393J5nAk0Ve8Kg5d0S8YT1NEp5UnubVzAx
	 En7RqVzMpJo+mk5/fXyCV4LbK5o/7ZMlLoWCgXAA=
Date: Mon, 25 Nov 2024 09:45:48 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] kconfig: prefer toolchain default for debug information
 choice
Message-ID: <b204ba9d-beaf-4d8b-9bc3-22d88acf8b6a@t-8ch.de>
References: <20241124-kbuild-allconfig_debug_info-v1-1-07a7ac8d9a73@weissschuh.net>
 <CAK7LNARURUizjHNhCKjdLSJp1mCF0HYvyOfm7n8LHmUBjYByQw@mail.gmail.com>
 <CAK7LNATgCBzesiPzyQarGY8308jZ1rC5zC2e6xZCw0UmaB=qyw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNATgCBzesiPzyQarGY8308jZ1rC5zC2e6xZCw0UmaB=qyw@mail.gmail.com>

On 2024-11-25 10:36:45+0900, Masahiro Yamada wrote:
> On Mon, Nov 25, 2024 at 10:27 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > On Mon, Nov 25, 2024 at 12:59 AM Thomas Weißschuh <linux@weissschuh.net> wrote:
> > >
> > > Kconfig by default chooses the first entry of a choice setting.
> > > For the "debug information" choice this is DEBUG_INFO_NONE which
> > > disables debug information completely.
> > >
> > > The kconfig choice itself recommends to use "Toolchain default":
> > >
> > >         Choose which version of DWARF debug info to emit. If unsure,
> > >         select "Toolchain default".
> > >
> > > Align the actual configuration with the recommendation by providing an
> > > explicit default.
> > >
> > > This also enables more codepaths from allmodconfig/allyesconfig which
> > > depend on debug information being available.
> >
> > Please give me some examples for "more codepaths" enabled by DEBUG_INFO
> > because this is the opposite to the previous decision.

It's really only the BTF stuff. IIRC there was some very minor
arch-specific things, too but these should not matter.

> > Commit f9b3cd24578401e7a392974b3353277286e49cee mentions:
> >
> >   all*config target ends up taking much longer and the output is much larger.
> >   Having this be "default off" makes sense.
> >
> >
> >
> > allmodconfig is often used for compile testing in CI/CD.
> > We need to see the sufficient gain that sacrifices
> > the build speed.

Thanks for that pointer.
It feels wrong to me to deviate from the pure meaning of "allyesconfig"
for one specific usecase.
The CI systems presumably have to adapt the configs to various
constraint anyways (the thread in [0] comes to mind).
So they can disable debuginfo if they so desire.

Especially as the kconfig help text explicitly recommends to enable this
if unsure.

> Presumably, DEBUG_INFO_BTF is the one because you submitted
> some patches at the same time.

Yes, it's about DEBUG_INFO_BTF.
But it was not the first series where the BTF stuff was surprisingly not
compiled in an all{yes,mod}config.

> Are there some compile errors that are not detected
> when DEBUG_INFO_BTF is disabled?

Not in the current kernel, these would have been detected by at least
the randconfig builds.

[0] https://lore.kernel.org/lkml/202411221744.1a298e1e-lkp@intel.com/

