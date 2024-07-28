Return-Path: <linux-kbuild+bounces-2693-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7F593E3F3
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jul 2024 09:37:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB2CE1C20FC9
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jul 2024 07:37:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20458B676;
	Sun, 28 Jul 2024 07:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="de8BkjUQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A348BEE;
	Sun, 28 Jul 2024 07:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722152275; cv=none; b=Ot+cGDGJAjPsprzDOvMbjTJ8SbQhWI9j4MWqV3q4EqJBVgqi3sCLaKJszF3NR8etanGYT8wBMnAxzYHhkTUTzB9b8JnVeEIJyNTHKLWGQevk9Cg3nkqJOiLtECJq1dPOtyhCjZZqh5fP8UVFOQW/nNz6TeM27E+dkGNCu01xK8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722152275; c=relaxed/simple;
	bh=738Fy8rulOrZe/368/OUV72dszBRYib5pVFz8QyqEXc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PqhtA5Zp+pxLrmDiw43XPQo1KSiS3r5pI6wSPHAd0k8igw30LsbdFyyq58cg1HD3xcva6ExJ3E2n5wEVqkIpuxQljIglY6HkxyaNIoYFhRUPP3XB5ih6itjPD65L+hcoGRsIojLKxPqMm8QbRrBe4uCpUgbGLdppMR5Q2MAHMrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=de8BkjUQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78F7EC4AF09;
	Sun, 28 Jul 2024 07:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722152274;
	bh=738Fy8rulOrZe/368/OUV72dszBRYib5pVFz8QyqEXc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=de8BkjUQZ4rwasBz0qICUiJYGb/E9tO8pB3eU2zSNIbiwrynkg4rQx6D575jbSQJc
	 FvaNrpCvW4VWvbp/8YTE1l7L5YCB7gMpDAHllKETapARikxcRfkw1bBS487z68WSr+
	 geQsMB9CkVw3I1ckDnmcPaimExXgap6j+AS1OJaCF5Iyngb6f4BHwSZE37xQ7FIhSV
	 kLTczTXSH63JVZXOnHqmwAIIGhEebnTkwCCn7D3moaqt0krdOJFcHyWhv/4qPo6hmx
	 8nEoOKBdkIVtXmXDS5MT7YO5YAhEdGi5pmIr2HqvJwvkOcKVLpXmDTmKUoSTak+96z
	 oXakiqkxCc7bQ==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2eeb1051360so25150461fa.0;
        Sun, 28 Jul 2024 00:37:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU05RrUNbiC+4C0vVVTnLKja85oNsGcgAredFMgQWDymHk2dtHihK0jetkWCu24jQnLJdMz07AlM1Xpy3ydkxQotWLeyB5ZzAQ7+eOgAzxqo3lx/yKXi9b2ub7i2mLMrAShTTJsrJg/SyUt4ZmpH7IVev4QRVkWZ81A+T/HxxmejByUIEgqYttTDcgGPKaOSZLI7yYtxQnOwyKJaORA
X-Gm-Message-State: AOJu0YyPLfWTjXwma90FJ9/yfm7xStYn9YpCaEcuJP4+PPKJNal7GZgJ
	lQjOMPtSsPQX3kQuiaBrlXuKkm+HGPxRrG2xkFBZkPTq5PJ5pVy/vpRGFwY8jEWYroSs2dhZXsc
	5moCIsuTtiJTEBptYCMNtF7xjtPc=
X-Google-Smtp-Source: AGHT+IH8UbSBJkWjoGA9ro9kWmmQSy5IgjZHawnk8q5jtJpAbniHZd4Uqo6hKYhbUVl8ucODdr2mh3lNeZVyrfC90IA=
X-Received: by 2002:a05:6512:2c08:b0:52f:cbce:b9b7 with SMTP id
 2adb3069b0e04-5309b1d749emr2557381e87.0.1722152272923; Sun, 28 Jul 2024
 00:37:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <bcc81ea0-78e1-476e-928c-b873a064b479@lunn.ch> <20240726121530.193547-1-jtornosm@redhat.com>
In-Reply-To: <20240726121530.193547-1-jtornosm@redhat.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 28 Jul 2024 16:37:16 +0900
X-Gmail-Original-Message-ID: <CAK7LNARg-xxm3FecQ654OnxcMGtc8BjsXmZsymaNKnr_6sM=zw@mail.gmail.com>
Message-ID: <CAK7LNARg-xxm3FecQ654OnxcMGtc8BjsXmZsymaNKnr_6sM=zw@mail.gmail.com>
Subject: Re: [PATCH] net: usb: lan78xx: add weak dependency with micrel phy module
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: andrew@lunn.ch, UNGLinuxDriver@microchip.com, davem@davemloft.net, 
	edumazet@google.com, f.fainelli@gmail.com, gregkh@linuxfoundation.org, 
	kuba@kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, lucas.demarchi@intel.com, mcgrof@kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, woojung.huh@microchip.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 26, 2024 at 9:15=E2=80=AFPM Jose Ignacio Tornos Martinez
<jtornosm@redhat.com> wrote:
>
> Hello Andrew,
>
> > What this does appear to do is differentiate between 'pre' which will
> > load the kernel module before it is requested. Since there is no 'pre'
> > for this, it seems pointless whacking this mole.
> Precisely, we need to fix the lan78xx case with micrel phy (and other
> possible phy modules) too, due to the commented issue generating initramf=
s
> in order to include the phy module.
>
> > What to me make more sense it to look at all the existing 'pre'
> > drivers and determine if they can be converted to use this macro.
> Of course, now that we have the possibility we can do this with other cas=
es
> that have been already detected (and fixed with a softdep pre) and others
> still not detected (if anyone apart from lan78xx).
>
> Thanks
>
> Best regards
> Jos=C3=A9 Ignacio
>



I am not familiar with MAC/PHY interface, but perhaps the
situation might be different on internal/external PHYs?

I do not know if "micrel" is an internal or an external PHY, though.


[1] internal PHY

Commit e57cf3639c323eeed05d3725fd82f91b349adca8 moved the
internal PHY code from drivers/net/usb/lan78xx.c
to drivers/net/phy/microchip.c

So, lan78xx.ko is likely to use microchip.ko

Perhaps, is the following useful?

  MODULE_WEAKDEP("microchip");    /* internal PHY */

Or, is this the case for MODULE_SOFTDEP()?



[2] external PHY

When an external PHY device is connected, the MAC/PHY combination is
pretty much board-specific. We may end up with
a bunch of MODULE_WEAKDEP().





The second question is, is it so important to enable network
at the initramfs time? Personally, I am fine with having network
drivers in the root file system.

Is this useful when the root file system is nfs or something?



--=20
Best Regards
Masahiro Yamada

