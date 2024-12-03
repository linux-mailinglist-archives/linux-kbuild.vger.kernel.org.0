Return-Path: <linux-kbuild+bounces-4970-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9A19E2600
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Dec 2024 17:07:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0B482B26C99
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Dec 2024 14:24:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5C9F17BB16;
	Tue,  3 Dec 2024 14:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wc6jpX6g"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D561DE2DE
	for <linux-kbuild@vger.kernel.org>; Tue,  3 Dec 2024 14:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733235888; cv=none; b=e5uT6RrML7LMBEOO7JJEtJwsWYQ8Fn9Spi2m+uXBd4QCbfx1RfXmz5kgP4f3iqz6XbsTdturJfXmJ89A7iiQIgw9VMLKcPepMRHTkGVfCVE60FnLp4i5bLqaQUdxbk1pKTggYllR7RSrNcvkj/aPVmuWuP7POTR6F47eacZszrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733235888; c=relaxed/simple;
	bh=TBuSmQ0+MMVxzfLDAleArYWYmzm4Z/MB9tK6Th440+k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E/rD0ztvoZ4Ry3snCRERQWNMZTbeKbWsqN2Ic8VjIF8ykUKAU/xihTBUeh5LnvtQqpfnF4Amw1iJBfKHpsI3GRMStbCsr5krqMZ80bpO3ao4+NRnzxVl9Gus+qCc8ETpkkSX2GfnGOoF8H3DmqUYqTPv144tSVymm6wbofbDp88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wc6jpX6g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D2E1C4CECF
	for <linux-kbuild@vger.kernel.org>; Tue,  3 Dec 2024 14:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733235888;
	bh=TBuSmQ0+MMVxzfLDAleArYWYmzm4Z/MB9tK6Th440+k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Wc6jpX6gVMA+Rfy/31Qe+xOTMY5RJLectibudgChEXSX/QJCI79n8F5opzQVX/Jyg
	 h9FXWysp0ZXR7rawaC+SSkeMCSBC+AhS6NRJ6cSq2+ePhtHWn+laDQK4SZVFEXMGwG
	 +DXxcc5GR6+UepSt55lZ80wp1Dj4hAVTMgNGZSsCEycrAsEbJvAZKClovfmaZgI9X0
	 f0vi1ykHaGJz+rXecGgDQmbDH+9OEM+wq93/y9HkkEZRTF6sZNF7idIiuHnJsUHH0w
	 23EqgEgjfh+XvA+l7EwHO/PSz15sgqGGJFH4QtJQfVgpgaYVCwsodBh7aNcIk45fVo
	 dzocjcPQWC3PQ==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53dd0cb9ce3so4950498e87.3
        for <linux-kbuild@vger.kernel.org>; Tue, 03 Dec 2024 06:24:48 -0800 (PST)
X-Gm-Message-State: AOJu0Yyw5TMAizzjPG6HLaJI5sstF6M+GQEZkI1ebUV9vTL55chG5LnV
	2w8sgfZa/Yr1TldyziYINuyd0ttyeL3gSqPOUcfv2UzBmSec9BNVfZJkJtvBC8QNUdY3ERK6l+j
	JytedMBCVY+cqrGphCggSeQwlCjw=
X-Google-Smtp-Source: AGHT+IHEpGZYUQWq3vcfzfMm1i/SPUvJOmbzQTCmIXUrZPUgLMOzACpgzGxB0cynwq3brVMGgd+1RvzC4gChOpolZno=
X-Received: by 2002:a05:6512:2313:b0:53d:de48:7409 with SMTP id
 2adb3069b0e04-53e1b81e7a4mr222544e87.0.1733235886779; Tue, 03 Dec 2024
 06:24:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAK7LNARarqG2Okacbp4TKJAFz9OagB2NF=qs-Cq2rzOW4CA2Bg@mail.gmail.com>
 <20241203065441.2341579-1-josch@mister-muffin.de> <20241203065441.2341579-2-josch@mister-muffin.de>
 <CAK7LNASiENba_7O2-6utUaWCad=rsFkD5ZMeSheqG64MGhZGQg@mail.gmail.com> <173321885530.3934267.7112925923730589277@localhost>
In-Reply-To: <173321885530.3934267.7112925923730589277@localhost>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 3 Dec 2024 23:24:10 +0900
X-Gmail-Original-Message-ID: <CAK7LNATQ6Gu6D6gpH3htJS=e136zPBQbCxtMLZU3YZx_bkWiLg@mail.gmail.com>
Message-ID: <CAK7LNATQ6Gu6D6gpH3htJS=e136zPBQbCxtMLZU3YZx_bkWiLg@mail.gmail.com>
Subject: Re: [PATCH 1/1] scripts/package/builddeb: allow hooks also in /usr/share/kernel
To: Johannes Schauer Marin Rodrigues <josch@mister-muffin.de>
Cc: linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 3, 2024 at 6:41=E2=80=AFPM Johannes Schauer Marin Rodrigues
<josch@mister-muffin.de> wrote:
>
> Quoting Masahiro Yamada (2024-12-03 10:27:11)
> > > @@ -68,11 +70,18 @@ install_linux_image () {
> > >         # kernel packages, as well as kernel packages built using mak=
e-kpkg.
> > >         # make-kpkg sets $INITRD to indicate whether an initramfs is =
wanted, and
> > >         # so do we; recent versions of dracut and initramfs-tools wil=
l obey this.
> > > -       debhookdir=3D${KDEB_HOOKDIR:-/etc/kernel}
> > > +       debhookdir=3D${KDEB_HOOKDIR:-/etc/kernel /usr/share/kernel}
> > > +
> > > +       # Only pre-create the first hook directory. Support for more =
than one hook
> > > +       # directory requires run-parts 5.21 and it is the responsibil=
ity of packages
> > > +       # creating additional hook directories to declare that depend=
ency.
> > > +       firsthookdir=3D${debhookdir%% *}
> > >         for script in postinst postrm preinst prerm; do
> > > -               mkdir -p "${pdir}${debhookdir}/${script}.d"
> > > +               mkdir -p "${pdir}${firsthookdir}/${script}.d"
> >
> > I still do not understand why this 'mkdir' is needed.
> >
> > linux-image package does not install any script into the hook directory=
.
> > In general, there exist some scripts (e.g. initramfs-tools) already
> > under /etc/kernel/*.d/  (and under /usr/share/kernel/*.d/ once the
> > new location is used broader).
> > If nothing exists under the hook directory, there is no point to
> > execute run-parts.
>
> Unless I'm misunderstanding the old code, the existing script *does* crea=
te
> /etc/kernel/*.d/ (That's the "- mkdir -p" line above) so I wanted to pres=
erve
> this behaviour even with more than one directory in KDEB_HOOKDIR. Do I
> misunderstand something?

Right. The existing code does create empty directories, which
are unnecessary.


> Are you saying that with this change, no
> /etc/kernel/*.d/ should be created anymore? Why?


The 'mkdir' is unnecessary regardless of your patch,
unless I am misunderstanding the code.

At present, it is a single line of code.
You are extending it into several lines of verbose code simply
in order to precisely retain these unnecessary directories.
This is a problem for me because I will need to maintain code
whose necessity is unclear.

Judging from your cautious approach and verbose changes, I
assume you are trying to avoid any risks (a common trait
among many contributors).

That said, I understand you are not motivated to strive for
clean code at all costs. Once you commit the run-parts
changes, you may feel your work is done. However, as the
maintainer, I must manage this code for many years,
so I aim to proactively remove unneeded code.

I have decided to take responsibility for cleaning up this
single line myself:

https://lore.kernel.org/linux-kbuild/CAK7LNARU=3DM282fAOOgzPOBPtDNFPjH8To9e=
K2vYstWxkEDEEPA@mail.gmail.com/T/#t

If something breaks due to missing directories,
it will be my fault, not yours.

Now that the dummy directories are gone from the linux-image
package, please prepare the next version without the
"pre-create the first hook directory" stuff.

A few more requests.

Please add the version number (the next patch will be v4?) like others do.
And "kbuild: deb-pkg:" as the patch subject.
('git log script/package/buildeb' to see examples)



>
> > > +       done
> > >
> > > -               mkdir -p "${pdir}/DEBIAN"
> > > +       mkdir -p "${pdir}/DEBIAN"
> >
> > Please drop this noise change.
> >
> > If you want to optimize this, please split it into a separate patch lik=
e
> > "kbuild: deb-pkg: create DEBIAN directory just once" etc.
>
> Okay, no need to optimize this now. mkdir -p is cheap.
>
> Thanks!
>
> cheers, josch
--
Best Regards
Masahiro Yamada

