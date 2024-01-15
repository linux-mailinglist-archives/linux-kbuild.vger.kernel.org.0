Return-Path: <linux-kbuild+bounces-565-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A4082DB3A
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Jan 2024 15:26:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C87DA1F20F8C
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Jan 2024 14:26:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F18C317596;
	Mon, 15 Jan 2024 14:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="ossE4xXg"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF521175AC;
	Mon, 15 Jan 2024 14:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=QzTOpoDL9E+dx4mqdsQmUkIpXI6CXwmTvNdCbceQJbQ=; b=ossE4xXgxfQoviJwEPnvEVSFpD
	2ufWj+q75LN2fpv/f9BqdZRDsVX7cDZ1Viwd2v6A1STMct6pNoLwWHwA18DMw2HBIU6gB8Vlf97xh
	kmLqbWiuA9vxSe0IAmcGV5yPBvhYYsihUdF5wwKq8BipuisU0BKJ5az6zjZYCvbVkJmelh4j611l8
	86qHn8VIu0NrGUOl9JkPSuYiymv0wwt1KxJ82gy0GO8auAqR38gaZSKryb/33yjzIvrmX+NBy1tIo
	BAHDEilOpQuSL6Ma6Oin5eyxK7bHjYRYijB7X6sbIebgplon/brMs7FkOqarasjHpRNTLZhGG6EIq
	JiowNUFg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53508)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rPNuM-0002TG-0D;
	Mon, 15 Jan 2024 14:25:46 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rPNuL-00031C-H0; Mon, 15 Jan 2024 14:25:45 +0000
Date: Mon, 15 Jan 2024 14:25:45 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Luis Chamberlain <mcgrof@kernel.org>, linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] kbuild: detect depmod version to exclude new SHA3 module
 signing options
Message-ID: <ZaVAaScCdwpWuAH0@shell.armlinux.org.uk>
References: <E1rNVlL-000qDm-Pg@rmk-PC.armlinux.org.uk>
 <ZaUo7ctf5H/qqqkG@shell.armlinux.org.uk>
 <CADWks+a7jBSqWZh-MJSp9x8vTUFvzu6c2GTHc8eQaMNE5VDrQg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADWks+a7jBSqWZh-MJSp9x8vTUFvzu6c2GTHc8eQaMNE5VDrQg@mail.gmail.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Mon, Jan 15, 2024 at 01:09:25PM +0000, Dimitri John Ledkov wrote:
> On Mon, 15 Jan 2024 at 12:45, Russell King (Oracle)
> <linux@armlinux.org.uk> wrote:
> >
> > Ping?
> >
> 
> The intent is good.
> The implementation is incomplete.
> 
> Please respond or address review feedback emailed previously. See
> https://lore.kernel.org/all/CADWks+Z5iZ=P_OAanA-PiePFbMpwtRe3_dF8wRTak8YAi87zvQ@mail.gmail.com/#t

> Did you test that things are successful wtih kmod 29, 30, 31?

No I didn't. See my comment below the "---" line:

"I don't know what the minimum requirement is for SHA3 to work, so I
have chosen a minimum of version 29 for the purposes of this patch."

> The code to correctly support sha3 in kmod was committed after 31 was
> tagged, and there is no newer tag yet hence the revision that has the
> correct code is v31-6-g510c8b7f74.

Thanks for the information.

> If such check is desired, kmod 32 should be tagged and check should
> check for 32.

"If such a check is desired" ? You mean you prefer systems to segfault
during the installation step when the build system doesn't have a new
enough kmod?

> If possible please use min-tool-version.sh to set the lower bound of
> kmod that is supported by the build. Assuming module signing is
> generally desired to be supported, the minimum required kmod should be
> set to 26. Otherwise at least modinfo doesn't work.

That's a separate issue though, and has build-breaking ramifications.
Enforcing a minimum kmod 26 will mean that the kernel will fail if
kmod isn't new enough, whereas someone may be building with module
signing disabled and thus be fine with older kmod.

These are two separate issues, and I think _this_ _fix_ needs to be
first because the issue is already there and affecting people (me),
and then maybe add the minimum version thing _afterwards_ in case it
needs to be reverted.

Doing it the other way around would make reverting the min-version
thing much harder.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

