Return-Path: <linux-kbuild+bounces-3413-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B0296E691
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Sep 2024 01:58:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13DA41C224EC
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Sep 2024 23:58:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F0ED1B86D1;
	Thu,  5 Sep 2024 23:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ui0ueq34"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E59718EFF8;
	Thu,  5 Sep 2024 23:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725580735; cv=none; b=IyK2/qNYc6Gx4f/X34l1asbOZUndT5irZqeYKuJ+wtxh3jSv33EaXngfBBSpa66pVKu5U6rlT8T9PQhtx2wfUabFHFwUBQJC+kQ6sPhA6fD/1oJ4i5Hsu1mHg9XN8OZ8EHx1jLPhiCO1R5l/x7ODc3XjnYXwiX7vHKYJhpD9zvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725580735; c=relaxed/simple;
	bh=8ZHNDVjmXPanHn2/Wa0JiV+2BK75PQlWnht1eUfa8vI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fAgRjSBFdHqkDnJYQZC7UstX+nUCyOBLtyiS5c0maXLf0ag2uXbSc5B+hd9rrEqYwcgK6TzFjBaXTtzW5aNUdqa3vkSa5UJwj+fDaUaVDLLOjo8umNA7OYwXvQzxhM1vv/B7IRS1Ie7Vef1YDw+ENsV9M+Js0vLAfRUrQjMdCSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ui0ueq34; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31F67C4CEE1;
	Thu,  5 Sep 2024 23:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725580735;
	bh=8ZHNDVjmXPanHn2/Wa0JiV+2BK75PQlWnht1eUfa8vI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Ui0ueq34yMDYskmFB0ACE4bR+zvsvNdtaGNBf/j7dl9hsTtzJ34jfYM3jzk6MQ70L
	 YI/l6ibXmPgPhGioTZ0cgSEITNApDLXimv7ziUZjQby63fzpF5yFbKpR3G1IcoW2df
	 JGZ1ydx0RUIaMBo1HSxGmPIovDA+hi/oeVJcZmJqmv2bCMcpY45M6ORIvu/PtxI/NA
	 29aLJUMh8WdL4HiedL5bo0VwIhzjn4xo85uCy8heqiNx3eLH90sUXbtLUEml+/iG0F
	 kFdUHu3OW/prwNqbEhvDQNuagEpf8tBGlAyZbOvJMQDHT7E3Iop1t9FxU+8E62ayjW
	 Y/7+7gEwNGxkw==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2f50966c448so16705161fa.2;
        Thu, 05 Sep 2024 16:58:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV+lNx9BemxZx9FtuovQu6NhZRcXyYBYwf6vDzHU3NHZ7Zh5n6suRiwtC+vneLwe9/m5W+HTLsoq3SL2pQp@vger.kernel.org, AJvYcCVBIcOFWpgyvG4KpWePL0hxwQ03jvy2y3opfYGoqYyB+jGTNKAb7IKIjW7bIsIqpaXbLZtkC0NUdw==@vger.kernel.org, AJvYcCWTWDT0FxtaeO9q5CRdmoJlCx03QCx3Ba3W0rcbmX+y4VSTr0xTnBs3njXO4gqdm1UU2XInr/YCEuquMlcg@vger.kernel.org, AJvYcCXHa37W+d0tT3lCjwmIxZvl1vwG3cCW1WCpC4bfq9jDHZ7xJMu2ybkSyLKBq8LSNWOUo2jRck+AG23PbKY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmQnhnLifKCukRbX2qNiEKeRpV11kMTW1EnyJ73eQFFcqelNjE
	YvR9rGBeVeIs9lkv11Zr0b7GVcedWnRjlW7qkJqe12MOsQCBdOOhdO9QvFj7tfaWo90Fi3S0/iw
	U97Rbyw40HBETVZaaR4qLcGURVSk=
X-Google-Smtp-Source: AGHT+IHwpQbkJrhmqboJoKb4jCLkJYJBTykwt13Bk4HzG9cGEgSCAjDEko9J5cj0FalKeiGaalBZ5m+OpradSeMR65w=
X-Received: by 2002:a05:651c:542:b0:2f0:1a8f:4cd2 with SMTP id
 38308e7fff4ca-2f75249602fmr3868171fa.33.1725580733429; Thu, 05 Sep 2024
 16:58:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240807-macos-build-support-v1-0-4cd1ded85694@samsung.com>
 <20240807-macos-build-support-v1-8-4cd1ded85694@samsung.com>
 <CGME20240807110435eucas1p2eca071b0a0122b8686d43c57bd94dc8c@eucas1p2.samsung.com>
 <2024080717-cross-retiree-862e@gregkh> <dxkmmrlhlhsrjulnyabfgcr37ojway2dxaypelf3uchkmhw4jn@z54e33jdpxmr>
 <2024080720-skyline-recapture-d80d@gregkh> <20240807-mottled-stoic-degu-d1e4cb@lindesnes>
 <20240823225450.spuvjs5b5ruujim4@AALNPWDAGOMEZ1.aal.scsc.local>
 <ZtIjNBhqdxmMBxfM@fjasle.eu> <CAK7LNAQhHBi7nSG5SAbqD3HFO3uMR6GHckZHcQXgWao7G8i9gw@mail.gmail.com>
 <20240905085626.ehhc5p7qwi57dagm@AALNPWDAGOMEZ1.aal.scsc.local>
In-Reply-To: <20240905085626.ehhc5p7qwi57dagm@AALNPWDAGOMEZ1.aal.scsc.local>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 6 Sep 2024 08:58:15 +0900
X-Gmail-Original-Message-ID: <CAK7LNASt2eP6q46YP0hCN=f5frt5r5qmwj25tiYrxjwOmGOwEg@mail.gmail.com>
Message-ID: <CAK7LNASt2eP6q46YP0hCN=f5frt5r5qmwj25tiYrxjwOmGOwEg@mail.gmail.com>
Subject: Re: [PATCH 08/12] include: add elf.h support
To: Daniel Gomez <da.gomez@samsung.com>
Cc: Nicolas Schier <nicolas@fjasle.eu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Nathan Chancellor <nathan@kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	William Hubbs <w.d.hubbs@gmail.com>, Chris Brannon <chris@the-brannons.com>, 
	Kirk Reiser <kirk@reisers.ca>, Samuel Thibault <samuel.thibault@ens-lyon.org>, 
	Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Ondrej Mosnacek <omosnace@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Jiri Slaby <jirislaby@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, 
	"intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"speakup@linux-speakup.org" <speakup@linux-speakup.org>, 
	"selinux@vger.kernel.org" <selinux@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, 
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>, Finn Behrens <me@kloenk.dev>, 
	"Daniel Gomez (Samsung)" <d+samsung@kruces.com>, "gost.dev@samsung.com" <gost.dev@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 5, 2024 at 5:56=E2=80=AFPM Daniel Gomez <da.gomez@samsung.com> =
wrote:
>
> On Mon, Sep 02, 2024 at 01:15:01AM +0900, Masahiro Yamada wrote:
> > On Sat, Aug 31, 2024 at 4:54=E2=80=AFAM Nicolas Schier <nicolas@fjasle.=
eu> wrote:
> > >
> > > On Sat, Aug 24, 2024 at 12:54:50AM +0200 Daniel Gomez wrote:
> > > > On Wed, Aug 07, 2024 at 05:46:03PM +0200, Nicolas Schier wrote:
> > > > > On Wed, Aug 07, 2024 at 04:18:54PM +0200, Greg Kroah-Hartman wrot=
e:
> > > > > > On Wed, Aug 07, 2024 at 02:13:57PM +0000, Daniel Gomez wrote:
> > > > > > > > Also, as this is not internal for the kernel, but rather fo=
r userspace
> > > > > > > > builds, shouldn't the include/ path be different?
> > > > > > >
> > > > > > > Can you suggest an alternative path or provide documentation =
that could help
> > > > > > > identify the correct location? Perhaps usr/include?
> > > > > >
> > > > > > That is better than the generic include path as you are attempt=
ing to
> > > > > > mix userspace and kernel headers in the same directory :(
> > > > >
> > > > > Please keep in mind, that usr/include/ currently does not hold a =
single
> > > > > header file but is used for dynamically composing the UAPI header=
 tree.
> > > > >
> > > > > In general, I do not like the idea of keeping a elf.h file here t=
hat
> > > > > possibly is out-of-sync with the actual system's version (even th=
ough
> > > > > elf.h should not see that much changes).  Might it be more helpfu=
l to
> > > > > provide a "development kit" for Linux devs that need to build on =
MacOS
> > > > > that provides necessary missing system header files, instead of m=
erging
> > > > > those into upstream?
> > > >
> > > > I took this suggestion and tried pushing a Homebrew formula/package=
 here [1].
> > > > I think I chose a wrong name and maybe something like "development =
kit" would
> > > > have been better. However, would it be possible instead to include =
the *.rb file
> > > > in the scripts/ directory? So users of this can generate the develo=
pment kit in
> > > > their environments. I would maintain the script to keep it in sync =
with the
> > > > required glibc version for the latest kernel version.
> > > >
> > > > [1] https://protect2.fireeye.com/v1/url?k=3D96027706-f7896236-9603f=
c49-000babffaa23-452f645d7a72e234&q=3D1&e=3D343dd31c-5e5b-4b09-8ee5-6c59a1f=
f826e&u=3Dhttps%3A%2F%2Fgithub.com%2FHomebrew%2Fhomebrew-core%2Fpull%2F1818=
85
> > >
> > > I think it sounds sensible to hold that formula file in the upstream =
tree.  But
> > > I am not sure if scripts/ is the best location.
> > >
> > > Masahiro, what do you think?
> >
> >
> > I do not know much about the homebrew, but why does the upstream
> > kernel need to merge such masOS stuff?
>
> The missing headers (in macOS) need to be provided somehow. One way can b=
e
> having the formula (*.rb file) in-tree, so users of this can install them=
 in
> their systems. This would also require to have a tarball with the missing
> headers either in-tree or somewhere accessible so it can be fetched.
>
> To avoid having the formula and a tarball in-tree, I've created a Homebre=
w Tap
> (3rd-Party Repository) called 'Bee Headers Project' [1][2][3] that can pr=
ovision
> the missing headers. The project provides a bee-headers package and formu=
la
> that will install byteswap.h, elf.h and endian.h in the user's system Hom=
brew
> directory. It also provides a *.pc file so pkg-config can be used to find=
 the
> location of these headers. I have a v2 with this solution ready, perhaps =
is
> easier to discuss this with the code.


It is up to you what project you start in Github.

Then, what do you need to submit v2 for this?





>
> I think we can extend the same package and include extra headers if we ne=
ed
> more in the future. I see for x86_64 asm/types.h and others might be requ=
ired.
> The bee-headers package can then be the repository to place and distribut=
e them.
>
> Please, let me know if you think of an alternative solution, I can give a=
 try
> and explore.
>
> [1] Project:
> https://github.com/bee-headers
> [2] Headers repository:
> https://github.com/bee-headers/headers.git
> [3] Homebrew Tap formula:
> https://github.com/bee-headers/homebrew-bee-headers.git
>
>
> >
> >
> >
> > >
> > > Kind regards,
> > > Nicolas
> >
> >
> >
> > --
> > Best Regards
> > Masahiro Yamada



--=20
Best Regards
Masahiro Yamada

