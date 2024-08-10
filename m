Return-Path: <linux-kbuild+bounces-2928-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE72B94DB3E
	for <lists+linux-kbuild@lfdr.de>; Sat, 10 Aug 2024 09:42:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 867861F21BCA
	for <lists+linux-kbuild@lfdr.de>; Sat, 10 Aug 2024 07:42:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF2EB45BE3;
	Sat, 10 Aug 2024 07:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cUPDCPvT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964504409;
	Sat, 10 Aug 2024 07:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723275732; cv=none; b=kmRgB0nwdAX3sielDZlPtr1JrH8xjRnCkZdcBUZm9go7j6qhadCLPbYTQ2DsKxjduMVKFDsGicSsdaikSdLQBsqhn7eZXLBt7wsj102YF0CiFjJZWUMgDGq+e4LQs6Dl8W4BFC4V2K+sw75vUME7WdM8hcG6OsyZhBRIyO5rEZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723275732; c=relaxed/simple;
	bh=venEbJeLY1keYVx1mBsecVmKdgZyvzJTRYHNngVs3+g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aiAzqEqOQY2qmjXhqNxy09FPp17ZzIjsgp5V7M5OJMomNN5D0zyHyN9HuUMnaG59Z7QXAV0mOqKZnzib+s59QLEltzd7jCfL0WN8og4PoinTd2l4CSrAuv9aKSPYmnJ67HdVl4LXhWzQf8V/hbLmi0xlMBdCHV2DgQ4WGuT4Y9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cUPDCPvT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28825C4AF0B;
	Sat, 10 Aug 2024 07:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723275732;
	bh=venEbJeLY1keYVx1mBsecVmKdgZyvzJTRYHNngVs3+g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cUPDCPvTchI1Jb6Jjb/lHf8FbeH/a+ZPqA1iAotDA86PuhSKRSPtJNAhhSJ7fRJrY
	 8/AA5m2NMx1X6QUiTCsl+Pyeo7ioSSXYr13n8/JsnooOWN8J8y9+dFwfn2cU+1f2QT
	 EBmW/TMM0UMBq/TaK3ukWicv1Bu5ndM1J7u2KpCVW8HOitIk7qkWwmR8F1VJ/qEgnS
	 ySTiAhrdgZhYOJSEgGNnNLd6hlUXpXcFruME0ypLYzQX7XzKi+Uz/aTm1AxpD0nIEQ
	 XfcTbiTlREL4ujIU+pEOreZAYYFWPMm4TQ8bwBm4oVH3HQHM9AtPql0t1ju93W9cTs
	 MHrdp0xacnY8Q==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2f136e23229so29277551fa.1;
        Sat, 10 Aug 2024 00:42:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWnoepb5U5GxOrWXwtI+AdFBUc1pOMMR/JpYpjqMGMy9H3hFdzeWPoAot6xKqYQMixdjzULTFsFYHVTZ3t+GpJlcWzv09qRgduGkdOZA44CLacnLCxcdDtQ7C6jMI2pdSEmGI8q9/aWvsW6
X-Gm-Message-State: AOJu0YzA90acQUlbKOdlHnsx0zTbW1CtN7tRIlValY/ZvajhTADXODvX
	+Rhqo71mpmr+Td6Ro07b+Y7PIk5LHvg1u3DB7XsNt68369ywqnHWxrHriDMfZnmztt0GCu6+irg
	dQ35KpdPMOjQWUCTQIay5HNxqido=
X-Google-Smtp-Source: AGHT+IHNg1VsiJ/dt4/RADK6EgqhfrzkjF7X9d3+6AzFYJOjDUsk8UDfdHd/jN6I6sQ4gSg1D3YJLuvZMfiSXIN2uJk=
X-Received: by 2002:a2e:5109:0:b0:2ee:7c12:7b36 with SMTP id
 38308e7fff4ca-2f1a6d0e42dmr29516321fa.19.1723275730799; Sat, 10 Aug 2024
 00:42:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240807022718.24838-2-jose.fernandez@linux.dev>
 <CAK7LNAS4t_naRxdxFTaj9zrdf2Hjjoaq+cBO4Gx7=PhCJk9+4w@mail.gmail.com>
 <f65f1d49-8c6f-45e9-a4b2-30d4cfff10b1@t-8ch.de> <CAK7LNATuA4O3xVLcp5Lywr4njaUneKOJwPHZa11YQe63KXQpMA@mail.gmail.com>
 <66ef2ce9-5e7d-48fd-abeb-96e463d575ad@t-8ch.de> <nbr7h4owyxfdyd4olis7ccrh3ljz6gco6qf7p7uzttw5ijsquj@ws7iqib576rm>
In-Reply-To: <nbr7h4owyxfdyd4olis7ccrh3ljz6gco6qf7p7uzttw5ijsquj@ws7iqib576rm>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 10 Aug 2024 16:41:34 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ0CDceJNAhD-RbE3Ph0Q+UOqk1=M6k3tEKb_5j9j2GNw@mail.gmail.com>
Message-ID: <CAK7LNAQ0CDceJNAhD-RbE3Ph0Q+UOqk1=M6k3tEKb_5j9j2GNw@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: control extra pacman packages with PACMAN_EXTRAPACKAGES
To: Jose Fernandez <jose.fernandez@linux.dev>
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Christian Heusel <christian@heusel.eu>, Peter Jung <ptr1337@cachyos.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 10, 2024 at 9:16=E2=80=AFAM Jose Fernandez <jose.fernandez@linu=
x.dev> wrote:
>
> On 24/08/07 07:31PM, Thomas Wei=C3=9Fschuh wrote:
> > On 2024-08-08 02:02:59+0000, Masahiro Yamada wrote:
> > > On Thu, Aug 8, 2024 at 1:41=E2=80=AFAM Thomas Wei=C3=9Fschuh <linux@w=
eissschuh.net> wrote:
> > > > On 2024-08-07 22:37:47+0000, Masahiro Yamada wrote:
> > > > > On Wed, Aug 7, 2024 at 11:28=E2=80=AFAM Jose Fernandez <jose.fern=
andez@linux.dev> wrote:
> >
> > <snip>
> >
> > > > > Lastly, I will never accept new error messages
> > > > > with CONFIG_MODULES=3Dn.
> > > >
> > > > Could you elaborate?
> > > > For me this works fine with CONFIG_MODULES=3Dn.
> > > > (After having fixed the above issues so all subpackages are built)
> > >
> > > $ make  allnoconfig pacman-pkg
> > >
> > > Check the linux-headers log closely.
> >
> > I see now, previously I was not on kbuild/for-next and had an old
> > Module.symvers sitting around, hiding the issue.
> >
> > =3D=3D> Starting package_linux-upstream-headers()...
> > Installing build files...
> > tar: Module.symvers: Cannot stat: No such file or directory
> > tar: Exiting with failure status due to previous errors
> > Installing System.map and config...
> > Adding symlink...
> > =3D=3D> Tidying install...
> >
> > (coming from scripts/package/install-extmod-build)
> >
> > linux-upstream-headers also contains .config and System.map which are
> > useful without modules.
> > So either we completely disable linux-upstream-headers or skip
> > install-extmod-build when CONFIG_MODULES=3Dn.
> > And maybe move System.map and .config to some other package,
> > which would then deviate from the original PKGBUILD.
> >
> > Neither option feels great, but it probably won't make a big difference=
.
> > If you have a preference, let's go with that.
>
> Thomas, Masahiro,
> Thanks for the feedback. It seems that System.map and .config are commonl=
y
> included in -header Arch packages. To avoid deviating too much and to add=
ress
> the issue with install-extmod-build when CONFIG_MODULES=3Dn, how about co=
nsidering
> something like this:


I am fine.


>
> mkdir -p "${builddir}" # needed if install-extmod-build is not run

This comment might not be necessary if you move this code
right before copying System.map.




> if grep -q CONFIG_MODULES=3Dy include/config/auto.conf; then
>         echo "Installing build files..."
>         "${srctree}/scripts/package/install-extmod-build" "${builddir}"
> fi
>
> echo "Installing System.map and config..."
> cp System.map "${builddir}/System.map"
> cp .config "${builddir}/.config"
>
> Thanks,
> Jose



--=20
Best Regards
Masahiro Yamada

