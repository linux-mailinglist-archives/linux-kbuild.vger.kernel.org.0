Return-Path: <linux-kbuild+bounces-564-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2773382DA84
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Jan 2024 14:49:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB0931F2264D
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Jan 2024 13:49:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A17A171C1;
	Mon, 15 Jan 2024 13:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="Vvn1tp4B"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F65B17546;
	Mon, 15 Jan 2024 13:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=l2YZeODFNINthcEQ1wcuEvA6QV/cSlp6sc/zFwA3BDs=; b=Vvn1tp4BTdxzHlNa0ZpxGXIjZw
	bFcINPBk3PeObUCcA99WmoCrMfcqY2nOYLTRiorGAQCD6RJBT2gP7V3ynINkty+IgrIVkxmHWzBJ1
	PDPVef3In1B1B7Y9pLnNJ6CmZsaR+sc2HD949/KGVZUt1Kw5ik3R/IQB5P7ukV6oO2Cq2tavkz7hZ
	iXKO2U+fgyGosGBzvC1MErMCOi7de/bCoqemZs1h77iz43uSqTAmdbuXo5WhKmApNYZ2+06d0FWfz
	XvbMR3nPO2tjpk/QDk8MAJOuCeeXnVlwHZp+W2NGvZY5FkFWZJd8t3EWGNkQqwOZLWJDGx8NyK4SE
	58jfsOXg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45786)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rPNKj-0002Ru-25;
	Mon, 15 Jan 2024 13:48:57 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rPNKi-000304-Tq; Mon, 15 Jan 2024 13:48:56 +0000
Date: Mon, 15 Jan 2024 13:48:56 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Luis Chamberlain <mcgrof@kernel.org>, linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] kbuild: detect depmod version to exclude new SHA3 module
 signing options
Message-ID: <ZaU3yDU+p6dDxvbd@shell.armlinux.org.uk>
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

There was feedback to it? News to me... I'll take a look.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

