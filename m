Return-Path: <linux-kbuild+bounces-5076-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6766C9EC3B0
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Dec 2024 04:48:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A85CE283FAC
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Dec 2024 03:48:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 454D01369A8;
	Wed, 11 Dec 2024 03:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JS7W37mj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2074E6F073
	for <linux-kbuild@vger.kernel.org>; Wed, 11 Dec 2024 03:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733888795; cv=none; b=aDDyqjaShqAa+IY/ITQR9ijZ+U1glrPniNC2QOTyGBdi35bGwhn+w8UjC+9Z4VYdMzOUjXlEW6K1m0yRTZTyn5sJ35oJG5JYAisYgCd6CW9533lYDg9KtZ9LiPCTgGUFFl0ZMWQ9WeT1FteotXTn+hIdl8uKAhzYe1fMP4Y3gNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733888795; c=relaxed/simple;
	bh=EioujOrzbzo5LFHXvlTyhjx/ojyvTC0Zgqp/pH435cU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y/UVfZohjyPO/VZgo0rSVmBOlXXM2kYVTSZ6achwO4pLWs1EuZqVy0njdVVjgfd6Rxtadozx7jnrFKZxYb5RXBr/DzfeHKMsG8TBVIusvK6pDDv9XCoiCYn6kkNPIRaKH2Zr6JgSahg2F/dL4sXelIR5ZhBFoWDGGFd7KNlbsRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JS7W37mj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF8DCC4CED2
	for <linux-kbuild@vger.kernel.org>; Wed, 11 Dec 2024 03:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733888794;
	bh=EioujOrzbzo5LFHXvlTyhjx/ojyvTC0Zgqp/pH435cU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JS7W37mjedA3Osfi89vCyNX+bJXTBYxSeJvrRaMrjgpBJEmF/qX7XzXkTLF2d0wrW
	 4h6U4xD4iUH4KDDmEqPMmqUlHdJQSfinHCpEyjkQFMOg1xdJ5qTFduAAVrirB7dEgQ
	 Ip0M669KQllMIqYJ4tzekE1L1HkP+LTaBp31U7PTE7mAQrmgU4KyjopirPZh+t7O3N
	 0HDHIWAjzu1NgUVaAGjjQtG0B3yXG3QA0H7ATeVwNLq+4JgmgQsWIVRnasw1cK0M41
	 9C4tD25W9YEBbUvvGi4L37Wo3jTb7QeM1/d9f9goCqP18ZEvrJMhOHmXW0EIGlCMTM
	 ucpxCRQa58d3A==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ffd6b7d77aso71278881fa.0
        for <linux-kbuild@vger.kernel.org>; Tue, 10 Dec 2024 19:46:34 -0800 (PST)
X-Gm-Message-State: AOJu0YyTDPP0Yq8GFqmhTliMjsykWpm3o6LGkncGoH0zxJU8dzsGKbCy
	PJmLuhYAVxI/uiIP+ar81WJIc7/VPk87UkRGr6C6yyRqwuy/RnKAw+sdm3zROFu6bBDX957oAte
	L+9bPNZjxK2QmH1w00zRXBvGDEX4=
X-Google-Smtp-Source: AGHT+IGW0xP64WFTilLYZm3PXUA3ADlzl8KpJKjz5U9Tdp+/qxXGGbykTGxm1iv4plGXbhvV8jslU8Nt3rSCbtTVSn8=
X-Received: by 2002:a05:651c:154e:b0:302:264e:29e9 with SMTP id
 38308e7fff4ca-30240d64f37mr5189861fa.37.1733888793336; Tue, 10 Dec 2024
 19:46:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <b7bb8d16-2d05-43b5-95fc-7d303b925f44@limbasan.ro>
 <CAK7LNARHWcHiXPWxRD804vO6hF5H06kgBho-EXSa1f8eiPj5rQ@mail.gmail.com> <9b87eed3-4b6e-4a2a-88c6-db56c043c9fe@limbasan.ro>
In-Reply-To: <9b87eed3-4b6e-4a2a-88c6-db56c043c9fe@limbasan.ro>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 11 Dec 2024 12:45:57 +0900
X-Gmail-Original-Message-ID: <CAK7LNARqEOVOzP5vdUVF0KxQBNb9xtYs-COSXXWDMpBzGaLGow@mail.gmail.com>
Message-ID: <CAK7LNARqEOVOzP5vdUVF0KxQBNb9xtYs-COSXXWDMpBzGaLGow@mail.gmail.com>
Subject: Re: [Bug] 6.12+ DKMS modsign breakage due to missing .config in
 Debian headers package
To: =?UTF-8?B?TWloYWkgTGltYsSDyJlhbg==?= <mihai@limbasan.ro>
Cc: linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2024 at 8:08=E2=80=AFPM Mihai Limb=C4=83=C8=99an <mihai@lim=
basan.ro> wrote:
>
> Hi!
>
> On 2024-12-10 12:45, Masahiro Yamada wrote:
> > On Mon, Dec 9, 2024 at 5:31=E2=80=AFPM Mihai Limb=C4=83=C8=99an <mihai@=
limbasan.ro> wrote:
> >> Hi!
> >>
> >> Would like to report a DKMS build system impacting bug with kernel 6.1=
2+
> >> introduced in commit aaed5c7739be81ebdd6008aedc8befd98c88e67a . Hope I=
'm
> >> addressing this following proper protocol by mailing linux-kbuild, tri=
ed
> >> mailing the maintainer directly on 2024-11-20 but received no feedback=
;
> >> my apologies otherwise, it's my first kernel bug report.
> > Sorry, I missed that.
> >
> > Before you, another guy asked me the same question off-list.
> > Multiple people contacted me off-list for the same question.
> >
> > Presumably, asking this in the ML is better because
> > other people may find the answer and avoid duplicated questions.
> Oh my, not a problem. Initially approached directly to avoid potentially
> bugging a lot of unrelated people, but you're absolutely right, easier
> to find this way. Thank you!
>
> >> Specifically, the commit changes scripts/package/install-extmod-build =
to
> >> remove the shipped copy of the kernel configuration as .config in the
> >> generated package. Unfortunately, this breaks DKMS when secure boot is
> >> being used and any locally compiled the modules need to be signed. DKM=
S
> >> needs it to extract various characteristics of the built kernel, among
> >> which CONFIG_MODULE_SIG_HASH so that it can sign the .ko files it
> >> creates. It's likely that it also uses various other symbols from the
> >> kernel config, e.g. clang-related stuff, but I didn't test that.
> >>
> >> The removal of the other formerly shipped files doesn't appear to caus=
e
> >> any problems, at least not in this scenario.
> > I do not think removal of the .config is a problem because
> > another copy, include/config/auto.conf exists in the package.
> >
> > DKMS can parse "${kernel_source_dir}/include/config/auto.conf
> > for CONFIG options.
> True. The problem I see with  with that is that it unexpectedly breaks
> the current behavior (even though admittedly there never was a formal
> API contract in place) and requires an update to DKMS across *all*
> distributions. I'll report a bug to upstream DKMS to this effect, but it
> might take a long time to fix this, and many distros will likely not
> backport a future DKMS fix to current or older-but-still-supported
> versions, whereas re-including .config in the kernel headers package at
> the cost of a 200-300kb .config copy would not let users of the mainline
> kernel hanging, *and* would minimize the surprise factor.

This is a problem only when users replace the distro kernel
with the upstream one.
Distributions do not use scripts/package/install-extmod-build.





>  From my testing, things seem to work perfectly well when creating a
> relative symlink from "${kernel_source_dir}/.config" to
> "include/config/auto.conf" -- maybe this could be a compromise solution?
> It'd avoid shipping the extra noise from the full .config while at the
> same time avoid breaking already-shipped DKMS versions.
>
> Mind you, it's not like it's a big deal for me personally. It's just
> that the behavior of the system as a whole with this issue in place is
> thoroughly unintuitive: DKMS does *not* report an error nor does it fail
> OOT module build. From an user point of view, what happens are problems
> on the next system boot (potentially boot failure, depending on what
> failure to load the OOT modules does), with module load failure messages
> that initially give no clue as to the root cause. And since the use case
> for DKMS here is *exactly* a set-and-forget approach to OOT module
> building, it can take a *while* before people think to check the build
> logs (if they even keep them) and somehow figure out that "Kernel config
> ${kernel_config} not found, modules won't be signed" means "upstream
> changed the kernel headers package semantics".
>
> Thanks,
> Mihai

The linux-headers package is intended to provide the necessary tools
for building external modules.

The .config file is not required for building external modules,
so it was removed.

This is an issue with DKMS.

Furthermore, I do not understand why they decided to allow the process
to proceed successfully when the file DKMS requires is missing:

https://github.com/dell/dkms/blob/93bf2bd79704c0a8a39b240a52b001610cdc419b/=
dkms.in#L1026

They need to fix the issue in DKMS.

--=20
Best Regards
Masahiro Yamada

