Return-Path: <linux-kbuild+bounces-1867-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBA58C71AD
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 May 2024 08:39:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0E559B21792
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 May 2024 06:39:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D9EE171AF;
	Thu, 16 May 2024 06:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NY4Vu6KN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133D72E636;
	Thu, 16 May 2024 06:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715841583; cv=none; b=MvDKZ46ffBJsKAq/jpnjzeFXwyOCT4YDQqF7WKiAGFuvnenvbA1++3ST4A0jdq6E4wNNBzSlqyBRcmBaBdv0x8LaDWLjCKEm5Bh7yTj9RhF3saYp2N/5m0P+7IhU2jjt+S/K8negRWBPIRzuv3CyMPT6MrevgPQZMS2W86Uks+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715841583; c=relaxed/simple;
	bh=fe30kxws1ZQSDjHwrtE3WIv5KN1f7GF2umfF2EynWW8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=thsmqrbJBOOwJsNpCVXPpBj/ux2o6G6lvNxDwpFn6tnjubFsZSFJoCCl3NlmDOZGubfsLGB6VQacPhi2Zhj5w9Ud/twY2ap7U+JkjR42mLuv5O6FQssLM7gEqGIXG2A/+SUW1NpTjv77yb0Z8EVkLYP4t8sldHaUrIgmizNntlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NY4Vu6KN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CA57C113CC;
	Thu, 16 May 2024 06:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715841582;
	bh=fe30kxws1ZQSDjHwrtE3WIv5KN1f7GF2umfF2EynWW8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NY4Vu6KNFlg0zcQRIFL2l9ZAxL/DHXAmyaglyGTmHbKnQhpow7JCkLjc4kIXg44Tn
	 IU0uNK1VSpFd+6MQBtN06rOBAZHPQJegdnw0/NqmgyEIfuYnNhFMwoQ9lYsSqDDaJw
	 2xnikyG6IKox/Owq6aHZgUYBPRY+hVrBEaRt+uDdr4RrEivyRntr3whOGdk8dVkaIn
	 rkSoRkF+fCUcu0hfBZwncogxLQrXTX+/e9xxycPGZsTLve6BiXZZZcdQ4Lv1NxQKXx
	 mVwe3J5p5X9ctiwyWP2vSAXASvANW8QzovH8CakRVEBKEPeNQRxJ9d5pf9tjjAOZjB
	 uE8bTQPkNkWcQ==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52327368e59so413804e87.1;
        Wed, 15 May 2024 23:39:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWHb9PZGgrjCkKLhL3+zCJaM27KiM9fRYryURFwAzQ4nDlb5ePIZOPrR8kn7YAZ0TzdxehqlAdjqic73KuNIZnDbjh9F44Bvh1E1mGREpXq9Bth5r47/v2C2cDOIGgcKNeaumYcEN+U0ecD
X-Gm-Message-State: AOJu0YwSim0Q0ODECkqG/od0L4KQGMX1VFCXLhCnkwE0Xc5JcGIS+63c
	Bs1SE8Esi1adgL9bAVClLtnk8/l9nPOXG64TDyh42MSXpK58UJWsLrpVgrgZky0vxCcRTz8WKJk
	5rHQKF0BtlUapGLMjMzYVj9LotBA=
X-Google-Smtp-Source: AGHT+IGZE0fdvk0d7QmweFxfEh/SAnCnlITpVeebRE3eICucY6lna1HBSVpPPJeYKeROIPM8JKpUqtfHytaKU5LCdqU=
X-Received: by 2002:a05:6512:388f:b0:51d:5f0b:816f with SMTP id
 2adb3069b0e04-5220fc7950dmr10317494e87.15.1715841581173; Wed, 15 May 2024
 23:39:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <212a9464-d52b-4730-95b9-5a0aebd38c91@gmail.com>
 <CAHx5RXCWW5M-eW5v65bAkQWZemsU2NTvDv3jA9_XKz=+YP56Qg@mail.gmail.com>
 <688e54ec-3b29-4e3b-a2c3-f2c83b9c97b7@lunn.ch> <CAHx5RXBFdzsgKXR94gdZd2b=uz8PJDg4OjLPJxKtsdhcjJq3Qw@mail.gmail.com>
 <e307a237-68e3-40c9-be31-4fe3d560ada2@lunn.ch> <CAHx5RXCF0=Soz_k88RGvJFGrajaxn=mVnqpb99GAQ=b7XOcWiw@mail.gmail.com>
 <732d8bb2-1d4f-4958-b130-0bd15a407271@gmail.com> <CAHx5RXDaweFTF_Qt0GdBH4nBeMqwL4VVto7xzHBvFgFL5n=Ebg@mail.gmail.com>
 <c8c01e53-0a45-4319-88ff-bfb0caba150c@lunn.ch> <CAHx5RXDzN93WaYFe2bk6m2TmMC+A9vsmhodRFmZi17cFY5CrWQ@mail.gmail.com>
 <949fcbea-23dc-44c1-9146-c358b15b9253@lunn.ch> <b7d6fdcb-4b01-4bc1-8e4b-3cf4ccb951e3@gmail.com>
 <19db38dd-b265-45d3-af1c-85d4cb8d075a@gmail.com> <CAK7LNAS9dpp9aW-ESpJq8qaAffrQgUSnAFVVupPcnD3SP8eWZA@mail.gmail.com>
 <8a699761-de25-409d-9d8a-aa0c1ac4c605@gmail.com>
In-Reply-To: <8a699761-de25-409d-9d8a-aa0c1ac4c605@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 16 May 2024 15:39:04 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQMjrsu1GNRUe6guhucjbEndXzZPX=e_n+Y_Q9oxG8tpw@mail.gmail.com>
Message-ID: <CAK7LNAQMjrsu1GNRUe6guhucjbEndXzZPX=e_n+Y_Q9oxG8tpw@mail.gmail.com>
Subject: Re: drivers/net/dsa/dsa_loop_bdinfo.c build problems
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Stephen Langstaff <stephenlangstaff1@gmail.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, linux-kernel@vger.kernel.org, 
	OlteanV@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 16, 2024 at 12:35=E2=80=AFPM Florian Fainelli <f.fainelli@gmail=
.com> wrote:
>
>
>
> On 5/15/2024 7:17 PM, Masahiro Yamada wrote:
> > On Thu, May 16, 2024 at 4:21=E2=80=AFAM Florian Fainelli <f.fainelli@gm=
ail.com> wrote:
> >>
> >> Adding Olek and Masahiro,
> >>
> >> On 5/14/24 21:05, Florian Fainelli wrote:
> >>>
> >>>
> >>> On 5/14/2024 9:17 AM, Andrew Lunn wrote:
> >>>> On Tue, May 14, 2024 at 05:08:24PM +0100, Stephen Langstaff wrote:
> >>>>> On Tue, May 14, 2024 at 1:32=E2=80=AFPM Andrew Lunn <andrew@lunn.ch=
> wrote:
> >>>>>
> >>>>>> So try to making FIXED_PHY =3D m, and load it after dsa_loop_bdinf=
o.ko.
> >>>>>
> >>>>> In my configuration FIXED_PHY is selected by several other modules:
> >>>>>     =E2=94=82 Selected by [y]:
> >>>>>     =E2=94=82   - FSL_DPAA_ETH [=3Dy] && NETDEVICES [=3Dy] && ETHER=
NET [=3Dy] &&
> >>>>> NET_VENDOR_FREESCALE [=3Dy] && FSL_DPAA [=3Dy] && FSL_FMAN [=3Dy]
> >>>>>     =E2=94=82   - FWNODE_MDIO [=3Dy] && NETDEVICES [=3Dy] && MDIO_D=
EVICE [=3Dy] &&
> >>>>> (ACPI [=3Dy] || OF [=3Dy] || COMPILE_TEST [=3Dn])
> >>>>>     =E2=94=82   - OF_MDIO [=3Dy] && NETDEVICES [=3Dy] && MDIO_DEVIC=
E [=3Dy] && OF [=3Dy]
> >>>>> && PHYLIB [=3Dy]
> >>>>>
> >>>>> ...so it looks pretty tied up with the MDIO support which I guess I
> >>>>> will need for the real PHY!
> >>>>>
> >>>>> If I sorted out building the dsa_loop_bdinfo.c code as a built-in d=
o
> >>>>> you think that would solve the ordering issue?
> >>>
> >>> I have re-created the issue with CONFIG_FIXED_PHY=3Dy and for a reaso=
n I
> >>> do not yet understand the following rule:
> >>>
> >>> obj-$(CONFIG_FIXED_PHY)                +=3D dsa_loop_bdinfo.o
> >>>
> >>> does not result in the kernel image containing the dsa_loop_bdinfo.o
> >>> object symbols. I am fairly sure this worked when this was submitted
> >>> back then, so give me a day or two to figure out why. AFAICT the make
> >>> rule is simply not executed.
> >>
> >> Bisection landed on 227d72063fccb2d19b30fb4197fba478514f7d83 ("dsa:
> >> simplify Kconfig symbols and dependencies") which appeared in v5.13 an=
d
> >> specifically this hunk being reverted back to how it was before gets u=
s
> >> the build results we want:
> >>
> >> diff --git a/drivers/net/Makefile b/drivers/net/Makefile
> >> index 7ffd2d03efaf..5da6424bc6f8 100644
> >> --- a/drivers/net/Makefile
> >> +++ b/drivers/net/Makefile
> >> @@ -45,7 +45,7 @@ obj-$(CONFIG_ARCNET) +=3D arcnet/
> >>    obj-$(CONFIG_DEV_APPLETALK) +=3D appletalk/
> >>    obj-$(CONFIG_CAIF) +=3D caif/
> >>    obj-$(CONFIG_CAN) +=3D can/
> >> -obj-$(CONFIG_NET_DSA) +=3D dsa/
> >> +obj-y +=3D dsa/
> >>    obj-$(CONFIG_ETHERNET) +=3D ethernet/
> >>    obj-$(CONFIG_FDDI) +=3D fddi/
> >>    obj-$(CONFIG_HIPPI) +=3D hippi/
> >>
> >> Masahiro, for context in drivers/net/dsa/Makefile we have this bit:
> >>
> >> obj-$(CONFIG_NET_DSA_LOOP)      +=3D dsa_loop.o
> >> ifdef CONFIG_NET_DSA_LOOP
> >> obj-$(CONFIG_FIXED_PHY)         +=3D dsa_loop_bdinfo.o
> >> endif
> >>
> >> whereby we want dsa_loop.o to follow the value of CONFIG_NET_DSA_LOOP,
> >> and we want dsa_loop_bdinfo.o to be either built as a module or built
> >> into the kernel and we want to follow the value of CONFIG_FIXED_PHY
> >> because there is a functional dependency between the two objects.
> >>
> >> Prior to Olek's change this would work just fine because we would alwa=
ys
> >> descend into drivers/net/dsa/ but after his change, and assuming that
> >> CONFIG_NET_DSA=3Dm which is the case, then we no longer get
> >> dsa_loop_bdinfo.o to be built at all when CONFIG_FIXED_PHY=3Dy.
> >> Essentially only obj-m rules are being processed, obj-y rules are not.
> >>
> >> That does not really seem intuitive to me as to why any suggestions on
> >> how to fix that, short of unconditionally descending into the tree lik=
e
> >> we used to?
> >
> >
> >
> > "obj-m +=3D dsa/" means everything under dsa/ must be modular.
> >
> >
> >
> > If there is a built-in object under dsa/ with CONFIG_NET_DSA=3Dm,
> > you cannot do  "obj-$(CONFIG_NET_DSA) +=3D dsa/".
> >
> >
> > You need to change it back to "obj-y +=3D dsa/".
>
> Thanks, posted a patch doing that! Is there anyway that Kbuild could be
> warning about such a situation?


I posted such a patch a few years ago.

https://lore.kernel.org/lkml/20190912162254.9603-2-yamada.masahiro@socionex=
t.com/#t

but I noticed some corner cases where false alarms are reported.

I can revisit it when I have spare time.



--=20
Best Regards
Masahiro Yamada

