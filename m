Return-Path: <linux-kbuild+bounces-3467-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BACFD97049D
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Sep 2024 03:18:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46E521F21FDC
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Sep 2024 01:18:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D886D79CD;
	Sun,  8 Sep 2024 01:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aeuYSbfK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C1829A0;
	Sun,  8 Sep 2024 01:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725758306; cv=none; b=f4s72IiGUEi5h0yedqz/3iYdWoweVIidZEmrB+oflB9+Q6/2FfJ8b/5XXV7h3YzBsHb3/qmT+o11INhUG/hhoFkczQVq84bRFNg9NFjHq9FfhlX3zeJABMHE7ae5XniIlffAhpwd8Fhsk7gKGDC9ZfxwoEjO6nNauZQ+dZ8S1/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725758306; c=relaxed/simple;
	bh=M8wGQ4W/KVkVnctgfPoNFBJOh6tq/LCaviiGYsF9L8s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VUPKN6gE3LsxiRqEku1EwPvB1X/fRdf9bGnkqUaAAWTzxWcY1WMthMgzQBZ7e2nFiT3fxq3L5NMB+LxRj9QMwxLDmV5bZn8KQmLKA++EWt8rMX9H7qYH3IqL581BMAVXxKEKfqRh0rQMyF/XcM9kuyZdj9ZIduJEINgwOEDfIbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aeuYSbfK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD3EEC4CECE;
	Sun,  8 Sep 2024 01:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725758305;
	bh=M8wGQ4W/KVkVnctgfPoNFBJOh6tq/LCaviiGYsF9L8s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=aeuYSbfKlnhUtM7GWwEpkMyBWzN2sduR47gZmQWQdgr6u+TkTZUxcBnxIIHkYiAg2
	 gWqCHEKeBA33+fRjZay3l3O8huJXZ8Ju09TC/Z10pIWT/t+9KKGs/FcTcQIqkf2k/R
	 4uMwm7Jmh176hHzRJo9IPRzYFJ66iw6+1VOsoe0Y0f5qQHabexbY07/6ZT+CsZstVL
	 VipiPlrcTaN9XRj/1E5EwNSax4kujLgJSHtUEuQP2M0AGXLOl4//nEW5enWM4ry/fm
	 HWpwcZxCnCMrsdnIfCrqYhxmhzCkmQbRrlsMGjirPso4MwanDiCRQCtnEXsrJQrrYs
	 D0Q2YHpHYhOMA==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-536584f6c84so2544401e87.0;
        Sat, 07 Sep 2024 18:18:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUVBbJJlwpllvT/SVHZL08KKp/H+crkI1O/9/3fCUrnUVsH45+NBgYj/2EYjyBnjWowJYUZBpwxQs3u9cuC@vger.kernel.org, AJvYcCVb3XlYF85QI3yIJuYzNVMT31L/pozDgK3WMgsLjdijZm1+qih9UCDvDP1equ4ESzJK/YfddALF+qi+VmaX@vger.kernel.org, AJvYcCX6/dzRM0NH1bt44nN+vYwpcrexPG16nZAopqRJZb9FVA0cUKLdDmmLSsQK200ZX6lBu1T+KIyiIQ==@vger.kernel.org, AJvYcCXvzfHDGXDz1/Xkzc5ANkCycN76fsx/j3GV7OUx8lfFzLPFCgCpj+SlLA97QtDp2VV06mJBMe9klsjueb0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQN+P40oZZE6cABC8F7sq9jv56Ij0sBG9qKaO/kb9BVslI/znE
	7S6Ze/sHlHsmtKusXVU3Iy/cv+CS6eLzM+PMMO1AbkxdrJNpCZ9AqBomWs+6GqOGGmvTaU2kvkl
	wPFqcyWzsQtmW/6Jd3SK9axBmt+0=
X-Google-Smtp-Source: AGHT+IG//4gp0E4CfR083hPUBPN1CAx4mVwnwf3ahT0xcRrWXpKuALg+jAmTZu237ZONFZpFVA24RBtvauTzOfWgMvg=
X-Received: by 2002:a05:6512:224b:b0:536:56d6:ea4f with SMTP id
 2adb3069b0e04-536587b4312mr5939673e87.29.1725758304396; Sat, 07 Sep 2024
 18:18:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240906-macos-build-support-v2-0-06beff418848@samsung.com>
 <20240906-macos-build-support-v2-4-06beff418848@samsung.com>
 <CAK7LNARTnJ10ABuD96U-MaYitnX3AF=GD+N-skH7VBfAmOw9RQ@mail.gmail.com> <CABj0suDiPf0ySOwQx=6k+6bTZqRmq1+tjPx7=dxSTO5DVqO4nQ@mail.gmail.com>
In-Reply-To: <CABj0suDiPf0ySOwQx=6k+6bTZqRmq1+tjPx7=dxSTO5DVqO4nQ@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 8 Sep 2024 10:17:48 +0900
X-Gmail-Original-Message-ID: <CAK7LNATc8-mxNLRjLLwd6bKs9mbpo2FxhChWbJHwiGpOr_hzBg@mail.gmail.com>
Message-ID: <CAK7LNATc8-mxNLRjLLwd6bKs9mbpo2FxhChWbJHwiGpOr_hzBg@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] arm64: nvhe: add bee-headers support
To: "Daniel Gomez (Samsung)" <d+samsung@kruces.com>
Cc: da.gomez@samsung.com, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Lucas De Marchi <lucas.demarchi@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	William Hubbs <w.d.hubbs@gmail.com>, Chris Brannon <chris@the-brannons.com>, 
	Kirk Reiser <kirk@reisers.ca>, Samuel Thibault <samuel.thibault@ens-lyon.org>, 
	Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Ondrej Mosnacek <omosnace@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Simona Vetter <simona.vetter@ffwll.ch>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, intel-xe@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, speakup@linux-speakup.org, 
	selinux@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-serial@vger.kernel.org, llvm@lists.linux.dev, 
	Finn Behrens <me@kloenk.dev>, gost.dev@samsung.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 7, 2024 at 6:28=E2=80=AFPM Daniel Gomez (Samsung)
<d+samsung@kruces.com> wrote:
>
> On Fri, Sep 6, 2024 at 4:03=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.=
org> wrote:
> >
> > On Fri, Sep 6, 2024 at 8:01=E2=80=AFPM Daniel Gomez via B4 Relay
> > <devnull+da.gomez.samsung.com@kernel.org> wrote:
> > >
> > > From: Daniel Gomez <da.gomez@samsung.com>
> > >
> > > endian.h header is not provided by default in macOS. Use pkg-config w=
ith
> > > the new development package 'bee-headers' [1] to find the path where =
the
> > > headers are installed.
> > >
> > > [1] Bee Headers Project links:
> > > https://github.com/bee-headers/headers
> > > https://github.com/bee-headers/homebrew-bee-headers
> > >
> > > It requires to install bee-headers Homebrew Tap:
> > >
> > >   brew tap bee-headers/bee-headers
> > >   brew install bee-headers/bee-headers/bee-headers
> > >
> > > Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
> > > ---
> > >  arch/arm64/kernel/pi/Makefile     | 1 +
> > >  arch/arm64/kernel/vdso32/Makefile | 1 +
> > >  arch/arm64/kvm/hyp/nvhe/Makefile  | 3 ++-
> > >  3 files changed, 4 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/arch/arm64/kernel/pi/Makefile b/arch/arm64/kernel/pi/Mak=
efile
> > > index 4d11a8c29181..259c9a45fba0 100644
> > > --- a/arch/arm64/kernel/pi/Makefile
> > > +++ b/arch/arm64/kernel/pi/Makefile
> > > @@ -20,6 +20,7 @@ KBUILD_CFLAGS :=3D $(filter-out $(CC_FLAGS_SCS), $(=
KBUILD_CFLAGS))
> > >  KBUILD_CFLAGS  :=3D $(filter-out $(CC_FLAGS_LTO), $(KBUILD_CFLAGS))
> > >
> > >  hostprogs      :=3D relacheck
> > > +HOSTCFLAGS_relacheck.o =3D $(shell $(HOSTPKG_CONFIG) --cflags bee-he=
aders 2> /dev/null)
> > >
> > >  quiet_cmd_piobjcopy =3D $(quiet_cmd_objcopy)
> > >        cmd_piobjcopy =3D $(cmd_objcopy) && $(obj)/relacheck $(@) $(<)
> > > diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vd=
so32/Makefile
> > > index 25a2cb6317f3..6cb8a04bd829 100644
> > > --- a/arch/arm64/kernel/vdso32/Makefile
> > > +++ b/arch/arm64/kernel/vdso32/Makefile
> > > @@ -107,6 +107,7 @@ VDSO_LDFLAGS +=3D --orphan-handling=3D$(CONFIG_LD=
_ORPHAN_WARN_LEVEL)
> > >  # $(hostprogs) with $(obj)
> > >  munge :=3D ../../../arm/vdso/vdsomunge
> > >  hostprogs :=3D $(munge)
> > > +HOSTCFLAGS_$(munge).o =3D $(shell $(HOSTPKG_CONFIG) --cflags bee-hea=
ders 2> /dev/null)
> > >
> > >  c-obj-vdso :=3D note.o
> > >  c-obj-vdso-gettimeofday :=3D vgettimeofday.o
> > > diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nv=
he/Makefile
> > > index b43426a493df..d20a440b6964 100644
> > > --- a/arch/arm64/kvm/hyp/nvhe/Makefile
> > > +++ b/arch/arm64/kvm/hyp/nvhe/Makefile
> > > @@ -15,7 +15,8 @@ ccflags-y +=3D -fno-stack-protector     \
> > >              $(DISABLE_STACKLEAK_PLUGIN)
> > >
> > >  hostprogs :=3D gen-hyprel
> > > -HOST_EXTRACFLAGS +=3D -I$(objtree)/include
> > > +HOST_EXTRACFLAGS +=3D -I$(objtree)/include \
> > > +       $(shell $(HOSTPKG_CONFIG) --cflags bee-headers 2> /dev/null)
> > >
> > >  lib-objs :=3D clear_page.o copy_page.o memcpy.o memset.o
> > >  lib-objs :=3D $(addprefix ../../../lib/, $(lib-objs))
> > >
> > > --
> > > 2.46.0
> > >
> > >
> >
> > NACK.
> >
> > Developers working on Linux distributions have no interest
> > in your homebrew setup.
> >
> > For 99% of users, pkg-config does not do anything good.
> > It is a waste of process forks.
>
> I didn't think of this, and I agree with you.
>
> >
> >
> >
> > You need to do it outside.
> >
> >
> >  $ HOSTCFLAGS=3D$(pkg-config --cflags bee-headers) make
> >
> > or
> >
> >  $ export HOSTCFLAGS=3D$(pkg-config --cflags bee-headers)
> >  $ make
>
> Would a Makefile variable be suitable for this use case to make it
> easier in the command-line?



HOSTCFLAGS is an environment variable.


See Documentation/kbuild/kbuild.rst


  HOSTCFLAGS
  ----------
  Additional flags to be passed to $(HOSTCC) when building host programs.




If you do not want to type it every time,
add the following to ~/.profile or ~/.bashrc, etc.


export HOSTCFLAGS=3D"$(pkg-config --cflags bee-headers) -D_UUID_T
-D__GETHOSTUUID_H"




Or, if you want to limit this HOSTCFLAGS definition
only to a specific kernel tree, you can add GNUmakefile
to wrap Makefile.

This is how people often add local setups without
typing a long command.



GNUmakefile:

  export HOSTCFLAGS =3D $(shell pkg-config --cflags bee-headers)
-D_UUID_T -D__GETHOSTUUID_H
  include Makefile




Then, you do not need to bother the upstream kernel.







> We can detect we are in a non-linux based environment and enable a
> Makefile <VAR> (e.g., NOLINUX=3D1) and handle the NOLINUX build case
> (with pkg-config/bee-headers) inside the Makefiles for these non-linux
> cases.


NACK.



>
> >
> >
> >
> >
> >
> > --
> > Best Regards
> > Masahiro Yamada



--
Best Regards
Masahiro Yamada

