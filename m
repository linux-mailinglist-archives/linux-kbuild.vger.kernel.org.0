Return-Path: <linux-kbuild+bounces-317-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C55C580BC91
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 Dec 2023 19:45:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75A6D1F20F3F
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 Dec 2023 18:45:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C5281A58C;
	Sun, 10 Dec 2023 18:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EdD0Cccc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FB928E3;
	Sun, 10 Dec 2023 18:45:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4492C433C9;
	Sun, 10 Dec 2023 18:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702233911;
	bh=skyqUr35HpShBRuA1+rQmpve+SHE2Muqp1aZH8EcMNE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EdD0CcccleHZ6zyod+UY3GEQGA8Y1gbrVpSY/dPlXaOppTVbT4RdUTz+LoSfsZ4Hh
	 JkwbKCaA1YFUNB471gVb/HEnPkiX2yfzzvRwn8cqK4VZPNegJNUKMG0dmkhU/XivkS
	 MaAx0Gt6Iw+D3+lNbwYxSOD27drKKDXo89q2Cj35VL4tiXrpjIAFK+HFbBaAAUVJHr
	 IxEs+ai3DPsObG8u8vju6It3iRLyDutsByL/2r2i47JUs8V9S+ejrqA3hTLlo0qgdB
	 pWKVSeFqmdigR9mYY4tzwT5ACEvY99+yb7yoLvC4DQESlx+so3+fnu4ouf/8xzyQco
	 mz1rmh8k6uR7g==
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-59052ab970eso1617191eaf.1;
        Sun, 10 Dec 2023 10:45:11 -0800 (PST)
X-Gm-Message-State: AOJu0YyH6TuMq2UyUBWzMGPxu3brKoAeeVHnXyjayeZFyjiEL7Ti5yOM
	blDsKgjWqWzEnHXzZT5MFgpiy++3pfOpNSsWFKg=
X-Google-Smtp-Source: AGHT+IHLk+vqWf4njTFzWbFxotECTxaPuc0qRJioS5hfK4ZFAQw7bJe9+IAlrnt30U3HAJsjdBPPocvE8nqI7DX8neU=
X-Received: by 2002:a05:6870:6ec7:b0:1fa:fa54:1a4f with SMTP id
 qv7-20020a0568706ec700b001fafa541a4fmr1642722oab.13.1702233911082; Sun, 10
 Dec 2023 10:45:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAK7LNAT3N82cJD3GsF+yUBEfPNOBkhzYPk37q3k0HdU7ukz9vQ@mail.gmail.com>
 <baa3224bece94220dfe7173432143a91f7612c09.1701892062.git.msuchanek@suse.de>
In-Reply-To: <baa3224bece94220dfe7173432143a91f7612c09.1701892062.git.msuchanek@suse.de>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 11 Dec 2023 03:44:35 +0900
X-Gmail-Original-Message-ID: <CAK7LNARdnt0QXn6TRbuS_wzzMVXTY6NrCnu9WOM6PFztnyRmuQ@mail.gmail.com>
Message-ID: <CAK7LNARdnt0QXn6TRbuS_wzzMVXTY6NrCnu9WOM6PFztnyRmuQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] kbuild: rpm-pkg: Fix build with non-default MODLIB
To: Michal Suchanek <msuchanek@suse.de>
Cc: linux-modules@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, 
	Lucas De Marchi <lucas.de.marchi@gmail.com>, =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Jiri Slaby <jslaby@suse.com>, Jan Engelhardt <jengelh@inai.de>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nicolas Schier <nicolas@fjasle.eu>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 7, 2023 at 4:48=E2=80=AFAM Michal Suchanek <msuchanek@suse.de> =
wrote:
>
> The default MODLIB value is composed of three variables
>
> MODLIB =3D $(INSTALL_MOD_PATH)$(KERNEL_MODULE_DIRECTORY)/$(KERNELRELEASE)
>
> However, the kernel.spec hadcodes the default value of
> $(KERNEL_MODULE_DIRECTORY), and changed value is not reflected when
> building the package.
>
> Pass KERNEL_MODULE_DIRECTORY to kernel.spec to fix this problem.
>
> Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> ---
> Build on top of the previous patch adding KERNEL_MODULE_DIRECTORY


The SRPM package created by 'make srcrpm-pkg' may not work
if rpmbuild is executed in a different machine.



%{make} %{makeflags} INSTALL_MOD_PATH=3D%{buildroot}
KERNEL_MODULE_DIRECTORY=3D%{KERNEL_MODULE_DIRECTORY} modules_install


will align with the specified install destination,
but depmod will still fail.
(same issue as 1/2)









> ---
>  scripts/package/kernel.spec | 8 ++++----
>  scripts/package/mkspec      | 1 +
>  2 files changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spec
> index 3eee0143e0c5..12996ed365f8 100644
> --- a/scripts/package/kernel.spec
> +++ b/scripts/package/kernel.spec
> @@ -67,7 +67,7 @@ cp $(%{make} %{makeflags} -s image_name) %{buildroot}/b=
oot/vmlinuz-%{KERNELRELEA
>  %{make} %{makeflags} INSTALL_HDR_PATH=3D%{buildroot}/usr headers_install
>  cp System.map %{buildroot}/boot/System.map-%{KERNELRELEASE}
>  cp .config %{buildroot}/boot/config-%{KERNELRELEASE}
> -ln -fns /usr/src/kernels/%{KERNELRELEASE} %{buildroot}/lib/modules/%{KER=
NELRELEASE}/build
> +ln -fns /usr/src/kernels/%{KERNELRELEASE} %{buildroot}%{KERNEL_MODULE_DI=
RECTORY}/%{KERNELRELEASE}/build
>  %if %{with_devel}
>  %{make} %{makeflags} run-command KBUILD_RUN_COMMAND=3D'${srctree}/script=
s/package/install-extmod-build %{buildroot}/usr/src/kernels/%{KERNELRELEASE=
}'
>  %endif
> @@ -98,8 +98,8 @@ fi
>
>  %files
>  %defattr (-, root, root)
> -/lib/modules/%{KERNELRELEASE}
> -%exclude /lib/modules/%{KERNELRELEASE}/build
> +%{KERNEL_MODULE_DIRECTORY}/%{KERNELRELEASE}
> +%exclude %{KERNEL_MODULE_DIRECTORY}/%{KERNELRELEASE}/build
>  /boot/*
>
>  %files headers
> @@ -110,5 +110,5 @@ fi
>  %files devel
>  %defattr (-, root, root)
>  /usr/src/kernels/%{KERNELRELEASE}
> -/lib/modules/%{KERNELRELEASE}/build
> +%{KERNEL_MODULE_DIRECTORY}/%{KERNELRELEASE}/build
>  %endif
> diff --git a/scripts/package/mkspec b/scripts/package/mkspec
> index ce201bfa8377..e952fa4f2937 100755
> --- a/scripts/package/mkspec
> +++ b/scripts/package/mkspec
> @@ -24,6 +24,7 @@ fi
>  cat<<EOF
>  %define ARCH ${ARCH}
>  %define KERNELRELEASE ${KERNELRELEASE}
> +%define KERNEL_MODULE_DIRECTORY ${KERNEL_MODULE_DIRECTORY}
>  %define pkg_release $("${srctree}/init/build-version")
>  EOF
>
> --
> 2.42.0
>
>


--
Best Regards
Masahiro Yamada

