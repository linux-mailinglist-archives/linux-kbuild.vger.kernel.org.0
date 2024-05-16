Return-Path: <linux-kbuild+bounces-1864-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D1AFA8C7034
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 May 2024 04:17:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 039BE1C2152B
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 May 2024 02:17:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A244138C;
	Thu, 16 May 2024 02:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ddKc7nli"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EE21366;
	Thu, 16 May 2024 02:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715825873; cv=none; b=LBY2YfYqgPLCp7FBd7mPhi73waNapCtFvD24qQgof43WeAwaSZSR/Nzh2IdEgcs1SEl4qOvEJMGx1th0lLZ9GRMG/Xd6QFhLytEyublOhXqi/Fn3x+bfbavJzhZ4CyT8+8JnflD7gLxUiZMJgs6MR6ogoSTeUbo3GMl16vOe/Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715825873; c=relaxed/simple;
	bh=QDKrZ+eoc7syQo7mjbFONIZPwtCS41Fpew869d9ulNo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tl5i6aSPeuam2oNhKoSqQnA3kl/29Dl5GICh1CphQJ1rysrcjpDHtsf98+TDGFSrrmVL8dML/BtPXaV9DqA0FqtfOORsrkEGivZh+A8s5TCvGVlZHn6fPbGUEEQ/H3LvdQb2bcSamdCWAgJyVR4PJ60bBa1lNCHPFipLhnweBHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ddKc7nli; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D953C4AF07;
	Thu, 16 May 2024 02:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715825873;
	bh=QDKrZ+eoc7syQo7mjbFONIZPwtCS41Fpew869d9ulNo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ddKc7nlipscYnm+PMFC0DNsB3I73Xq1lLCRXd9ijw2MleCq55k/4F6SMcwNG253Y1
	 qyR2MnPhkPAI74YwnO9QjSMVwjrq5+0J7U7XXIebW/EvmfDGErsDHx6AzIQs8n4n2q
	 WEl9IqpQJkMVn3WI7I6lsD1WqwGGFrPqSwCBN3vKgb4CnnmSVmWyp8ez1s54TxuSuf
	 amrM0BJh++S2p7+lKcKyOFIMWLW9UEXldUsu6u9QpQWaN/ehfr211FosPsPQA6t0YS
	 x+s8wb43mfCME2m+Rxy9dTP5bz54I/4KKN/TM/lV7eZ3shbkBNAUwDIuRpLAE1niEj
	 tBQI5Yj64p6dw==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-51f71e4970bso261777e87.2;
        Wed, 15 May 2024 19:17:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVMOmqCpWsrMEamSFhYM1+rj4exny/zV7yAWZ3H1h4wwNgbw8/v6+l5pITXCcfE0+MXkYqla/5n/QxnsDbVBKHZR90aflJmpKkr5kUUzQfOz97LsHoU/gjct4r7e3BAuaH1NZ81bNwDEB5g
X-Gm-Message-State: AOJu0YzIpTuHI+a8LMR4/zaXHLOUTJCnwmjQegCPawfr81gg9mu1e+42
	c/rlI3333e8m6YVgCEgqQGsXTlHCG5o2iqKO+d74VtgDYqB09Pqsx1PV56vRHpuXt+EV74cUK6g
	rOOPvfUXmKkz5ufJtq6EPSSed49Q=
X-Google-Smtp-Source: AGHT+IH8pgR6wSD7iR30CYm4REYN+pY2+GnITsIcp+IsuTX3s23rze7v1IfJBQQ3FMWDfT/jq5pQtPnbjQzdXznjd4c=
X-Received: by 2002:ac2:518d:0:b0:51c:d8f6:4e6f with SMTP id
 2adb3069b0e04-5220fd7bd61mr14260360e87.40.1715825871987; Wed, 15 May 2024
 19:17:51 -0700 (PDT)
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
 <19db38dd-b265-45d3-af1c-85d4cb8d075a@gmail.com>
In-Reply-To: <19db38dd-b265-45d3-af1c-85d4cb8d075a@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 16 May 2024 11:17:15 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS9dpp9aW-ESpJq8qaAffrQgUSnAFVVupPcnD3SP8eWZA@mail.gmail.com>
Message-ID: <CAK7LNAS9dpp9aW-ESpJq8qaAffrQgUSnAFVVupPcnD3SP8eWZA@mail.gmail.com>
Subject: Re: drivers/net/dsa/dsa_loop_bdinfo.c build problems
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Stephen Langstaff <stephenlangstaff1@gmail.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, linux-kernel@vger.kernel.org, 
	OlteanV@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 16, 2024 at 4:21=E2=80=AFAM Florian Fainelli <f.fainelli@gmail.=
com> wrote:
>
> Adding Olek and Masahiro,
>
> On 5/14/24 21:05, Florian Fainelli wrote:
> >
> >
> > On 5/14/2024 9:17 AM, Andrew Lunn wrote:
> >> On Tue, May 14, 2024 at 05:08:24PM +0100, Stephen Langstaff wrote:
> >>> On Tue, May 14, 2024 at 1:32=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> =
wrote:
> >>>
> >>>> So try to making FIXED_PHY =3D m, and load it after dsa_loop_bdinfo.=
ko.
> >>>
> >>> In my configuration FIXED_PHY is selected by several other modules:
> >>>    =E2=94=82 Selected by [y]:
> >>>    =E2=94=82   - FSL_DPAA_ETH [=3Dy] && NETDEVICES [=3Dy] && ETHERNET=
 [=3Dy] &&
> >>> NET_VENDOR_FREESCALE [=3Dy] && FSL_DPAA [=3Dy] && FSL_FMAN [=3Dy]
> >>>    =E2=94=82   - FWNODE_MDIO [=3Dy] && NETDEVICES [=3Dy] && MDIO_DEVI=
CE [=3Dy] &&
> >>> (ACPI [=3Dy] || OF [=3Dy] || COMPILE_TEST [=3Dn])
> >>>    =E2=94=82   - OF_MDIO [=3Dy] && NETDEVICES [=3Dy] && MDIO_DEVICE [=
=3Dy] && OF [=3Dy]
> >>> && PHYLIB [=3Dy]
> >>>
> >>> ...so it looks pretty tied up with the MDIO support which I guess I
> >>> will need for the real PHY!
> >>>
> >>> If I sorted out building the dsa_loop_bdinfo.c code as a built-in do
> >>> you think that would solve the ordering issue?
> >
> > I have re-created the issue with CONFIG_FIXED_PHY=3Dy and for a reason =
I
> > do not yet understand the following rule:
> >
> > obj-$(CONFIG_FIXED_PHY)                +=3D dsa_loop_bdinfo.o
> >
> > does not result in the kernel image containing the dsa_loop_bdinfo.o
> > object symbols. I am fairly sure this worked when this was submitted
> > back then, so give me a day or two to figure out why. AFAICT the make
> > rule is simply not executed.
>
> Bisection landed on 227d72063fccb2d19b30fb4197fba478514f7d83 ("dsa:
> simplify Kconfig symbols and dependencies") which appeared in v5.13 and
> specifically this hunk being reverted back to how it was before gets us
> the build results we want:
>
> diff --git a/drivers/net/Makefile b/drivers/net/Makefile
> index 7ffd2d03efaf..5da6424bc6f8 100644
> --- a/drivers/net/Makefile
> +++ b/drivers/net/Makefile
> @@ -45,7 +45,7 @@ obj-$(CONFIG_ARCNET) +=3D arcnet/
>   obj-$(CONFIG_DEV_APPLETALK) +=3D appletalk/
>   obj-$(CONFIG_CAIF) +=3D caif/
>   obj-$(CONFIG_CAN) +=3D can/
> -obj-$(CONFIG_NET_DSA) +=3D dsa/
> +obj-y +=3D dsa/
>   obj-$(CONFIG_ETHERNET) +=3D ethernet/
>   obj-$(CONFIG_FDDI) +=3D fddi/
>   obj-$(CONFIG_HIPPI) +=3D hippi/
>
> Masahiro, for context in drivers/net/dsa/Makefile we have this bit:
>
> obj-$(CONFIG_NET_DSA_LOOP)      +=3D dsa_loop.o
> ifdef CONFIG_NET_DSA_LOOP
> obj-$(CONFIG_FIXED_PHY)         +=3D dsa_loop_bdinfo.o
> endif
>
> whereby we want dsa_loop.o to follow the value of CONFIG_NET_DSA_LOOP,
> and we want dsa_loop_bdinfo.o to be either built as a module or built
> into the kernel and we want to follow the value of CONFIG_FIXED_PHY
> because there is a functional dependency between the two objects.
>
> Prior to Olek's change this would work just fine because we would always
> descend into drivers/net/dsa/ but after his change, and assuming that
> CONFIG_NET_DSA=3Dm which is the case, then we no longer get
> dsa_loop_bdinfo.o to be built at all when CONFIG_FIXED_PHY=3Dy.
> Essentially only obj-m rules are being processed, obj-y rules are not.
>
> That does not really seem intuitive to me as to why any suggestions on
> how to fix that, short of unconditionally descending into the tree like
> we used to?



"obj-m +=3D dsa/" means everything under dsa/ must be modular.



If there is a built-in object under dsa/ with CONFIG_NET_DSA=3Dm,
you cannot do  "obj-$(CONFIG_NET_DSA) +=3D dsa/".


You need to change it back to "obj-y +=3D dsa/".


>
> Reproducer configuration available here:
>
> https://gist.github.com/ffainelli/2650a832803b502b94b2d247209f61b1
>
> rm drivers/net/dsa/*.o
> ARCH=3Dx86 make drivers/net/dsa/
> ls drivers/net/dsa/dsa_loop_bdinfo.o
>
> Thanks!
> --
> Florian
>


--=20
Best Regards
Masahiro Yamada

