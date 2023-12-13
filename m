Return-Path: <linux-kbuild+bounces-322-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3453480C05F
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Dec 2023 05:34:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C0B01C20621
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Dec 2023 04:34:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08D0A18E1F;
	Mon, 11 Dec 2023 04:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N0l7Q09e"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F54137F;
	Mon, 11 Dec 2023 04:34:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35BE8C433C9;
	Mon, 11 Dec 2023 04:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702269240;
	bh=WQmmFM7+2b72O3G9hhh8eE5TPDlkXNRawk8A5t2M6a0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=N0l7Q09eJQfnZG3INq9PmZNflY3/gnjtU8zNyadwdLx0/TobCxRHx02CNi709mUg5
	 sgiuOIct99rGCRbU+UYfiUdz9oHm+XUteen52qrycNrl4OoPOBuM/cSdKET+dzwOwo
	 tB0d5QNGjt3CJ5P8MSHMFCpB39A50mkpnXuRBtwU1cZD1R+IfXVBJ2/EMPCJh3Hqya
	 IX14UW45+6rMt8Mo7Be/wdf7jS8W7BpNWxinbCdZtH2hBfxNkHD3LH8rNHLq/4u8KP
	 TJoqroqRvDb5+gC3Xoepp8ETQMbpWGunOLygdRxD1lAJsOTQmPFh7AMVz8wRWKKqTF
	 OMmfvPdS8eUSw==
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1f055438492so3137632fac.3;
        Sun, 10 Dec 2023 20:34:00 -0800 (PST)
X-Gm-Message-State: AOJu0YwptOjbjwhMHAOmSNIK51aXLCbuRwUb1jHJ8/UvbxfqT1OioH8O
	gnSJS5s/eXPuv1bu3akkfdfkF1B80XDm6apmKQM=
X-Google-Smtp-Source: AGHT+IFdfuvVnqdIw+nEBCBLTwqVHHKzBwvprtFPw8eRbTPB1nNuDJEduyiDoWC1q3sixGIIxvs/bRMo8vtmB4NEVS0=
X-Received: by 2002:a05:6870:a454:b0:1fa:f170:bf27 with SMTP id
 n20-20020a056870a45400b001faf170bf27mr4673457oal.40.1702269239586; Sun, 10
 Dec 2023 20:33:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAK7LNAT3N82cJD3GsF+yUBEfPNOBkhzYPk37q3k0HdU7ukz9vQ@mail.gmail.com>
 <baa3224bece94220dfe7173432143a91f7612c09.1701892062.git.msuchanek@suse.de>
 <CAK7LNARdnt0QXn6TRbuS_wzzMVXTY6NrCnu9WOM6PFztnyRmuQ@mail.gmail.com> <20231210210859.GN9696@kitsune.suse.cz>
In-Reply-To: <20231210210859.GN9696@kitsune.suse.cz>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 11 Dec 2023 13:33:23 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQo1p3dmdoqQRM_JxBp78Rxj5YpVqXGzMr5Xs9K-V3BiA@mail.gmail.com>
Message-ID: <CAK7LNAQo1p3dmdoqQRM_JxBp78Rxj5YpVqXGzMr5Xs9K-V3BiA@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] kbuild: rpm-pkg: Fix build with non-default MODLIB
To: =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>
Cc: linux-modules@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, 
	Lucas De Marchi <lucas.de.marchi@gmail.com>, =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Jiri Slaby <jslaby@suse.com>, Jan Engelhardt <jengelh@inai.de>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nicolas Schier <nicolas@fjasle.eu>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 11, 2023 at 6:09=E2=80=AFAM Michal Such=C3=A1nek <msuchanek@sus=
e.de> wrote:
>
> On Mon, Dec 11, 2023 at 03:44:35AM +0900, Masahiro Yamada wrote:
> > On Thu, Dec 7, 2023 at 4:48=E2=80=AFAM Michal Suchanek <msuchanek@suse.=
de> wrote:
> > >
> > > The default MODLIB value is composed of three variables
> > >
> > > MODLIB =3D $(INSTALL_MOD_PATH)$(KERNEL_MODULE_DIRECTORY)/$(KERNELRELE=
ASE)
> > >
> > > However, the kernel.spec hadcodes the default value of
> > > $(KERNEL_MODULE_DIRECTORY), and changed value is not reflected when
> > > building the package.
> > >
> > > Pass KERNEL_MODULE_DIRECTORY to kernel.spec to fix this problem.
> > >
> > > Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> > > ---
> > > Build on top of the previous patch adding KERNEL_MODULE_DIRECTORY
> >
> >
> > The SRPM package created by 'make srcrpm-pkg' may not work
> > if rpmbuild is executed in a different machine.
>
> That's why there is an option to override KERNEL_MODULE_DIRECTORY?


Yes.
But, as I pointed out in 1/2, depmod must follow the packager's decision.

'make srcrpm-pkg' creates a SRPM on machine A.
'rpmbuild' builds it into binary RPMs on machine B.

If A and B disagree about kmod.pc, depmod will fail
because there is no code to force the decision made
on machine A.












> Thanks
>
> Michal
>
> >
> >
> >
> > %{make} %{makeflags} INSTALL_MOD_PATH=3D%{buildroot}
> > KERNEL_MODULE_DIRECTORY=3D%{KERNEL_MODULE_DIRECTORY} modules_install
> >
> >
> > will align with the specified install destination,
> > but depmod will still fail.
> > (same issue as 1/2)
> >
> >
> >
> >
> >
> >
> >
> >
> >
> > > ---
> > >  scripts/package/kernel.spec | 8 ++++----
> > >  scripts/package/mkspec      | 1 +
> > >  2 files changed, 5 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spe=
c
> > > index 3eee0143e0c5..12996ed365f8 100644
> > > --- a/scripts/package/kernel.spec
> > > +++ b/scripts/package/kernel.spec
> > > @@ -67,7 +67,7 @@ cp $(%{make} %{makeflags} -s image_name) %{buildroo=
t}/boot/vmlinuz-%{KERNELRELEA
> > >  %{make} %{makeflags} INSTALL_HDR_PATH=3D%{buildroot}/usr headers_ins=
tall
> > >  cp System.map %{buildroot}/boot/System.map-%{KERNELRELEASE}
> > >  cp .config %{buildroot}/boot/config-%{KERNELRELEASE}
> > > -ln -fns /usr/src/kernels/%{KERNELRELEASE} %{buildroot}/lib/modules/%=
{KERNELRELEASE}/build
> > > +ln -fns /usr/src/kernels/%{KERNELRELEASE} %{buildroot}%{KERNEL_MODUL=
E_DIRECTORY}/%{KERNELRELEASE}/build
> > >  %if %{with_devel}
> > >  %{make} %{makeflags} run-command KBUILD_RUN_COMMAND=3D'${srctree}/sc=
ripts/package/install-extmod-build %{buildroot}/usr/src/kernels/%{KERNELREL=
EASE}'
> > >  %endif
> > > @@ -98,8 +98,8 @@ fi
> > >
> > >  %files
> > >  %defattr (-, root, root)
> > > -/lib/modules/%{KERNELRELEASE}
> > > -%exclude /lib/modules/%{KERNELRELEASE}/build
> > > +%{KERNEL_MODULE_DIRECTORY}/%{KERNELRELEASE}
> > > +%exclude %{KERNEL_MODULE_DIRECTORY}/%{KERNELRELEASE}/build
> > >  /boot/*
> > >
> > >  %files headers
> > > @@ -110,5 +110,5 @@ fi
> > >  %files devel
> > >  %defattr (-, root, root)
> > >  /usr/src/kernels/%{KERNELRELEASE}
> > > -/lib/modules/%{KERNELRELEASE}/build
> > > +%{KERNEL_MODULE_DIRECTORY}/%{KERNELRELEASE}/build
> > >  %endif
> > > diff --git a/scripts/package/mkspec b/scripts/package/mkspec
> > > index ce201bfa8377..e952fa4f2937 100755
> > > --- a/scripts/package/mkspec
> > > +++ b/scripts/package/mkspec
> > > @@ -24,6 +24,7 @@ fi
> > >  cat<<EOF
> > >  %define ARCH ${ARCH}
> > >  %define KERNELRELEASE ${KERNELRELEASE}
> > > +%define KERNEL_MODULE_DIRECTORY ${KERNEL_MODULE_DIRECTORY}
> > >  %define pkg_release $("${srctree}/init/build-version")
> > >  EOF
> > >
> > > --
> > > 2.42.0
> > >
> > >
> >
> >
> > --
> > Best Regards
> > Masahiro Yamada



--
Best Regards
Masahiro Yamada

