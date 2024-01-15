Return-Path: <linux-kbuild+bounces-566-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F14682DB8B
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Jan 2024 15:43:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B6375B219AD
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Jan 2024 14:43:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03414179AE;
	Mon, 15 Jan 2024 14:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="NlGySQza"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38C6179AA
	for <linux-kbuild@vger.kernel.org>; Mon, 15 Jan 2024 14:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id DA6A04114D
	for <linux-kbuild@vger.kernel.org>; Mon, 15 Jan 2024 14:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1705329582;
	bh=a6vmQriq897GbXCbayJx6ujg7D26fduQsfNn7VbXkBk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=NlGySQza2zRWdAsWM0iJMuiFi09by+Plg/jGzdjAWmYF/8lQaM7Vem4YTn6M92eFo
	 Zny3hdtOn3O/94CWdV2pbk/1pqvqQ4ihHnYtSL8TiD/WPKWLu2E1GJKYX1fcvefw0K
	 ENb3Hh32o/ZwQ8ADknIJ0+Bz4FuvXvCEAFI9+ZOGX1KgKasn+UuUhC2sdli2Z7JSFS
	 6XZ/vD2wmr4w0FXfy5twHpt6PAGsDIPWCd6Xc89NhvPlaCS7LfRdD7V17nJ9mQkMYc
	 RhdRtVQGqNcdxC5v23OWhjKrpMP97oPSr4Kycvy5lxq6/J4296+xi5AIHc3KLnQL8j
	 Vy2nHeD113w1Q==
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3377a359fdaso3340463f8f.2
        for <linux-kbuild@vger.kernel.org>; Mon, 15 Jan 2024 06:39:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705329582; x=1705934382;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a6vmQriq897GbXCbayJx6ujg7D26fduQsfNn7VbXkBk=;
        b=IX2IlTVMuBukZ4IdCIAUsoL+FZwT39SsZclcLb3mozXg+zrlywggeBlNudIufWNYbQ
         zjaki4/pVKWAkWS3kf3Ii/YWLGF25Y9tEnfaB1qR/xnwKo+DipMErk50AEETcx/LQ9p0
         mOxLKJZDojxib5jR0+ifCTnjjHms+oA7P2BUqu4L6jJnS/CBP5bVa05vEDMbspOirMfK
         k4Wls2sjpN1oUDIX+NoC4vbyR/QxGAAge5Yw2Ew06zkb3L3Ae21wrsECYvuvoa7n/smO
         SKrzcgxMzQRmO0MzstF8w37+Rp/+h8tez8oZaUSKML4aBIDdr+Tqv470nJDor4Dps3nN
         sWTg==
X-Gm-Message-State: AOJu0YxXGp6UasZBGxZ5KNn5M8/zFGn7pH7lAwSzgtTjpXCNeAAZFFOH
	UgfoO8L/0IWsXGltUTcOayK11zEa+6zU346Lcblgw3OS6lT7wJsEgcDHUDXKyrgY5EQ9YRpiplT
	UJE3s8nE8BzMaUHc4pRd9ry9VD3g63LboyjVNr0l4bMA6U040jiJFB1etfo6ZuB+dGgiM3Gqkk+
	3bAA==
X-Received: by 2002:adf:f087:0:b0:336:8609:633 with SMTP id n7-20020adff087000000b0033686090633mr3402462wro.140.1705329582352;
        Mon, 15 Jan 2024 06:39:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEDW4a3sc01IYS0bg9Ep4faGJ/3PC/r1pfdLjVgTSie+AglorNzqorfSd1WnQXP7e5XuzKgeHgbnYVzJNooNzA=
X-Received: by 2002:adf:f087:0:b0:336:8609:633 with SMTP id
 n7-20020adff087000000b0033686090633mr3402454wro.140.1705329581987; Mon, 15
 Jan 2024 06:39:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <E1rNVlL-000qDm-Pg@rmk-PC.armlinux.org.uk> <ZaUo7ctf5H/qqqkG@shell.armlinux.org.uk>
 <CADWks+a7jBSqWZh-MJSp9x8vTUFvzu6c2GTHc8eQaMNE5VDrQg@mail.gmail.com> <ZaVAaScCdwpWuAH0@shell.armlinux.org.uk>
In-Reply-To: <ZaVAaScCdwpWuAH0@shell.armlinux.org.uk>
From: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
Date: Mon, 15 Jan 2024 14:39:05 +0000
Message-ID: <CADWks+YDgxa1EgM1NqKBtQ5VOF2=e62q7SPGkHQ2MLjrvK0Kxw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: detect depmod version to exclude new SHA3 module
 signing options
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Jan 2024 at 14:25, Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Mon, Jan 15, 2024 at 01:09:25PM +0000, Dimitri John Ledkov wrote:
> > On Mon, 15 Jan 2024 at 12:45, Russell King (Oracle)
> > <linux@armlinux.org.uk> wrote:
> > >
> > > Ping?
> > >
> >
> > The intent is good.
> > The implementation is incomplete.
> >
> > Please respond or address review feedback emailed previously. See
> > https://lore.kernel.org/all/CADWks+Z5iZ=P_OAanA-PiePFbMpwtRe3_dF8wRTak8YAi87zvQ@mail.gmail.com/#t
>
> > Did you test that things are successful wtih kmod 29, 30, 31?
>
> No I didn't. See my comment below the "---" line:
>
> "I don't know what the minimum requirement is for SHA3 to work, so I
> have chosen a minimum of version 29 for the purposes of this patch."
>
> > The code to correctly support sha3 in kmod was committed after 31 was
> > tagged, and there is no newer tag yet hence the revision that has the
> > correct code is v31-6-g510c8b7f74.
>
> Thanks for the information.
>
> > If such check is desired, kmod 32 should be tagged and check should
> > check for 32.
>
> "If such a check is desired" ? You mean you prefer systems to segfault
> during the installation step when the build system doesn't have a new
> enough kmod?
>
> > If possible please use min-tool-version.sh to set the lower bound of
> > kmod that is supported by the build. Assuming module signing is
> > generally desired to be supported, the minimum required kmod should be
> > set to 26. Otherwise at least modinfo doesn't work.
>
> That's a separate issue though, and has build-breaking ramifications.
> Enforcing a minimum kmod 26 will mean that the kernel will fail if
> kmod isn't new enough, whereas someone may be building with module
> signing disabled and thus be fine with older kmod.
>
> These are two separate issues, and I think _this_ _fix_ needs to be
> first because the issue is already there and affecting people (me),

I don't believe the fix you desire is as critical as you think it is.

Majority of people do not compile and install bleeding edge kernels,
on an EOL release with a 5 year old kmod, when both are released by
the same upstream project (more or less).
Also your fix will prevent people to use EOL release for kernel
compilation (or introduce requirement to have kmod installed on the
build host), when they do not execute install on the same system (but
transfer the files into a packaging format / execute depmod using up
to date kmod not in path). Thus you may actually break even more
people with this change, as kmod versions have never been enforced
before.

I am still waiting for a response from you:
1) why you attempted this given non-default configuration build -
given your obsolete kmod in the installation target system
(intentionally attempting to choose config options to suitable for
your target)
2) why you want people to prevent compiling such a build, which they
can install later on with a compatible kmod (when their build-time and
install-time systems are different)

Which you have ignored responding to, in the previous emails.

I am trying to politely help you, and yet the tone of your emails are
very aggressive and very dismissive to me.

So far, this patch is a NACK from me.

> and then maybe add the minimum version thing _afterwards_ in case it
> needs to be reverted.
>
> Doing it the other way around would make reverting the min-version
> thing much harder.
>
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!


--
Dimitri

Sent from Ubuntu Pro
https://ubuntu.com/pro

