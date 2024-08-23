Return-Path: <linux-kbuild+bounces-3172-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B39D95CD20
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Aug 2024 15:03:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4BE6AB22B5A
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Aug 2024 13:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 040A91865F8;
	Fri, 23 Aug 2024 13:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H5Yf7Ekh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65EB1448E3;
	Fri, 23 Aug 2024 13:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724418223; cv=none; b=GhakYWEZL/qIrtfFGf/u0LBk/4ygffjSs+xrbauhXNyujJ9cOZyObGCk27V5NbAfJuvXaGP0z8fkwKJQ06oMwu1iabFscYCtvw7jcVVP+8PCMC/XV16cw+Cn0ICQGOmveH3ab19Jk2QgsCcTaKup5kTy3gdfnIR4kUfmDLpPew4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724418223; c=relaxed/simple;
	bh=p2xLj28GHKMKhvQhgLBI9NF7kK+N1OH33hLkP6mFMDQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V9u/WoF9/pvfokyFdoWVDHkGyTLMIz+x+9ThcuPciLQE04sLSyad0ZflzOVPbjTj7SdX0uZEZn5NkXV0k+jXAVcgLM64uawQrp6u1OptRV0+cYVRUzUMfIfiebo37uL1Th8JK9UhHedyNLHrfy9Nz/47plbYBjTcPu7Xy356R/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H5Yf7Ekh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 637A1C4AF0F;
	Fri, 23 Aug 2024 13:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724418223;
	bh=p2xLj28GHKMKhvQhgLBI9NF7kK+N1OH33hLkP6mFMDQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=H5Yf7Ekh6zGk0IrzfsKAPMrENQES9oFFnIF7cGjPT8EJAK4iof69D/15RH7+8BSWr
	 4A4DNt1OPs5VaTcAaF/84Aqv1BBRDILPw8lmp6qvnP0STpBtnYBKK2LxwvaYlsFjFQ
	 +p1YoQ32UzXjokNyDuayv1qOYLa98uQzUkaJiUL7K0tg+2GOajIOOMHHG8ycFPAPOm
	 V19zo5hkQu75Zmvpg5Vj+yuFDd+I3MlSLk5Bbsv8pVEDMf1J8SIWuin74L3+j29UNW
	 MPG1teQRFFdPZsrZquZ6M4fiGe5Tf/dOKnIs2u3Ci1Du6Cgpa5T53dfR7mM5rFDJRx
	 H5F7k4uIs0Prw==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2f3b8eb3df5so19222411fa.1;
        Fri, 23 Aug 2024 06:03:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCULVQTgjwuEuLQOpzbnuGArCMzT1InY40hh2LDr2rZI4eTd779WqD1H1+VB93Kc/+rRKA2bCkUmEvf5CCJb@vger.kernel.org, AJvYcCWnepowlcu1Ujp4QvONuB+vPdppDDNxm+8z08c4lt898swdd6QIVBAkIKH1tHd41BpL+fwR0ZTtze1yrEhzrw==@vger.kernel.org, AJvYcCXhknBV2QlJXRJMK+s5BDsVcShTfDsPweuTOJlVuTrMjQfI2ThsqVldIgI+98a47Isowfi6bB8i9sJ76Qg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRq62+8sDyFmMXNUkdSMAMEm1Cv7/QSe4HcwuQQcnlYJZyyT6+
	gSzpI3mROTcjZahOILD8chSyjrbA6Vd46SuUnY2xaBjkmTWGCrE1pE1qJRaeiLh8e+cAwdn91+t
	fXCbbv6ioTNVb35kxe718nGaYDdY=
X-Google-Smtp-Source: AGHT+IGmCxpPlHHAMaDBV/FLeAgm08sZpEZkejfjDPLomNWsnGnuzWdCXEQMqVRspnbDaJgrkvwBr1RsluIaJoc3Cwc=
X-Received: by 2002:a2e:b90c:0:b0:2ef:2b45:b71d with SMTP id
 38308e7fff4ca-2f4f576b3aamr11269451fa.24.1724418221846; Fri, 23 Aug 2024
 06:03:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <e3yow7ih6af2hxzkmjay2oan3jypmo4hda64vxvpfco66ajcew@i3zewn4nbklf>
 <cover.1699618135.git.msuchanek@suse.de> <xbgto5tttcah4mrtyjih72ubod3qb375ww6e2fd4pi342rg4eg@wipwd57q43cc>
 <CAK7LNARYK-xjBS8puEM9xFtmjBNW6KJ2Qd6f7diZkdEEbUgVHA@mail.gmail.com>
 <5gx6vt4tzgk4zvboxrrahexr4ja6zm6fisjshdvnlfihsysqzb@quhp42ydtvh2> <20240822083600.GF26466@kitsune.suse.cz>
In-Reply-To: <20240822083600.GF26466@kitsune.suse.cz>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 23 Aug 2024 22:03:05 +0900
X-Gmail-Original-Message-ID: <CAK7LNASEdXPiP0_i5=1uLW-W0kZ9LiMt9r5aq0Gu5nK2yP5wDA@mail.gmail.com>
Message-ID: <CAK7LNASEdXPiP0_i5=1uLW-W0kZ9LiMt9r5aq0Gu5nK2yP5wDA@mail.gmail.com>
Subject: Re: [PATCH 0/2] kmod /usr support
To: =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, linux-modules@vger.kernel.org, 
	Takashi Iwai <tiwai@suse.com>, Lucas De Marchi <lucas.de.marchi@gmail.com>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Jiri Slaby <jslaby@suse.com>, Jan Engelhardt <jengelh@inai.de>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nicolas Schier <nicolas@fjasle.eu>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 22, 2024 at 5:36=E2=80=AFPM Michal Such=C3=A1nek <msuchanek@sus=
e.de> wrote:
>
> Hello,
>
> On Thu, Aug 22, 2024 at 01:05:11AM -0500, Lucas De Marchi wrote:
> > On Tue, Dec 19, 2023 at 05:37:31PM GMT, Masahiro Yamada wrote:
> > > On Thu, Dec 7, 2023 at 3:37=E2=80=AFAM Lucas De Marchi <lucas.demarch=
i@intel.com> wrote:
> > > >
> > > > On Fri, Nov 10, 2023 at 01:13:53PM +0100, Michal Suchanek wrote:
> > > > >Hello,
> > > > >
> > > > >This is resend of the last patch in the series that adds prefix su=
pport
> > > > >to kernel module location together with additional patch for valid=
ating
> > > > >the user supplied input to options that are interpreted as directo=
ries.
> > > > >
> > > > >Thanks
> > > >
> > > > applied, thanks
> > > >
> > > > Lucas De Marchi
> > >
> > >
> > >
> > > If I understood this correctly, MODULE_DIRECTORY is determined
> > > by "configure --with-module-directory=3D...", and there is no
> > > way to change it after that.
> > >
> > >
> > > If so, how to work with cross-building?
> > >
> > > Cross-building is typical when building embedded Linux systems.
> >
> > I was thinking the `pkg-config --variable=3Dmodule_directory`
> > from the target would be sufficient, but...
> >
> > >
> > >
> > > Consider this scenario:
> > >
> > > - Your build machine adopts
> > >    MODULE_DIRECTORY=3D/usr/lib/modules
> > > - The target embedded system adopts
> > >    MODULE_DIRECTORY=3D/lib/modules
> > >
> > > (or vice a versa)
> > > depmod is used also for cross-building because
> > > it is executed as a part of "make module_install".
> > >
> > >
> > > The counterpart patch set for Kbuild provides
> > > KERNEL_MODULE_DIRECTORY, which only changes
> > > the destination directory to which *.ko are copied.
> > >
> > > You cannot change the directory where the
> > > depmod searches for modules, as it is fixed
> > > at the compile-time of kmod.
> > >
> > >
> > >
> > >
> > > In this case, what we can do is to build another
> > > instance of kmod configured for the target system,
> >
> > the target system may not even have depmod actually, so using just the
> > host one seems more appropriate. But target should have the kmod.pc for
> > the pkg-config call to work.
> >
> > > and use it for modules_install:
> > >
> > > 1. In the kmod source directory
> > >    ./configure --with=3Dmodule-directory=3D/lib/modules
> > >    make
> > >
> > > 2. make modules_install INSTALL_MOD_PATH=3D<staging-dir>
> > >     KERNEL_MODULE_DIRECTORY=3D/lib/modules
> > >     DEPMOD=3D<new-depmod-you-has-just-built>
> > >
> > >
> > >
> > > If you use OpenEmbedded etc., this is what you do
> > > because host tools are built from sources.
> > >
> > > But, should it be required all the time?
> > > Even when the target embedded system uses
> > > busybox-based modprobe instead of kmod?
> >
> > no, I don't think we can rely on depmod from the target.
> >
> > >
> > >
> > >
> > > depmod provides --basedir option, which changes
> > > the prefix part, but there is no way to override
> > > the stem part, MODULE_DIRECTRY.
> > >
> > > In the review of the counter patch set,
> > > I am suggesting an option to override MODULE_DIRECTRY
> > > (let's say --moduledir) at least for depmod.
> >
> > ok
> >
> > >
> > > (Perhaps modinfo too, as it also supports --basedir)
> > >
> > >
> > >
> > > Then, we can change scripts/depmod.sh so that
> > > Kbuild can propagate KERNEL_MODULE_DIRECTORY
> > > to depmod.
> > >
> > >
> > > if  <depmod supports --moduledir>; then
> > >    set -- "$@"  --moduledir "${KERNEL_MODULE_DIRECTORY}"
> > > fi
> > >
> > >
> > >
> > > Does it make sense?
>
> It does not make sense for the common case: building kernel for the host
> system.
>
> Then overriding the directory is wrong, and using what kmod was compiled
> with is needed to get correct module directory layout.


NACK.

scripts/Makefile.modinst and depmod must agree about
the install destination.

Both must refer to the same ${KERNEL_MODULE_DIRECTORY}.




>
> Or it would make sense if both was done:
>
> Default KERNEL_MODULE_DIRECTORY to what kmod was compiled with, and
> then pass the actual value to depmod so that depmod uses the compiled-in
> value by default, and the user-provided value when
> KERNEL_MODULE_DIRECTORY was overridden by the user.
>
> Thanks
>
> Michal



--=20
Best Regards
Masahiro Yamada

