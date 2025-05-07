Return-Path: <linux-kbuild+bounces-6997-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B377AADEF3
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 May 2025 14:22:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AE9C5B21E01
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 May 2025 12:21:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB10725E830;
	Wed,  7 May 2025 12:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RrJZpz/x"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6AE72566F6
	for <linux-kbuild@vger.kernel.org>; Wed,  7 May 2025 12:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746620443; cv=none; b=ocwJWdt51F8zhllJj36hhH2wAN7Sx3tHqlRVFKtI2qxYsO4t1aRNtRi++gK82KoaK+3Y46mjkrB8NHacvKXAzuSwjZflYuGxmAZbVbuqc2TDO/lX+IOOdLQygkP5WU1gkp3WEVJvjozqqkBqoDayv8mn6HEqWR51qU0ghViADYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746620443; c=relaxed/simple;
	bh=/SdNXxPhBxg0mLGuJqeb5bQdVrqrr20N7JZk1onAd60=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QBoxMNbkb2F4e1GLnIoSg4/njwVH9QygbWQHEzJxMZ0Xx0jxZvSkOh5MnM7eE1SpClYNTTQ6GaP6vcFo//60kLqwXwB+rVhZJkCxugadumxRWZp6xi9CLgbUtzOW3VDnjJ80cyVowxawidLOdAXt+PJiiFklilnX2/+WQh2XC9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RrJZpz/x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C570C4CEE7
	for <linux-kbuild@vger.kernel.org>; Wed,  7 May 2025 12:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746620443;
	bh=/SdNXxPhBxg0mLGuJqeb5bQdVrqrr20N7JZk1onAd60=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RrJZpz/x/4iwlT38LTIqx1jdFSCf+HUf2pqw9vsHyhal2gBV0zOagp5ay9YGUKCEJ
	 ThKAswVUgIxEt2AmGrA1Gf6u09HSyIP1DizKT5IbPR5GRg+Wb1r6DM7HnAyJ3k5kjv
	 9Nntz1ssdlZuAeWZ8yxSwcLqqfKXliMx01RsGavG97h8GOtQOIN4Np0xDkF2d/sXD/
	 QB8MQSvfFt9Dhkr+F36bUyxv8rP3bJ3O8x6x1HC8hdaH3t/hJSVS8usRoLpJLrRUYr
	 eYa1yVEo+4WtuggpwJzhpM7LrjIM+t1qkCIxu9rBhTgVsTJWXf6GWhi7OgeO7gKAnG
	 OPgDPdtWEEVmw==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54d6f933152so9313423e87.1
        for <linux-kbuild@vger.kernel.org>; Wed, 07 May 2025 05:20:43 -0700 (PDT)
X-Gm-Message-State: AOJu0Yy8lkTvwPg8cwZqLwb6RiQ8lCqozPkAMnqFT6WhowzamESF6yoj
	Sk+TjC/IV34eqM6FiFGKX5Az/8Bu6Vyp0utaMwgxoQY9oovf3FEFMmyu75i9CBvnS4oDXYeQR4x
	0EPeTrV8v7zVK9EbXMTkc67C5UQk=
X-Google-Smtp-Source: AGHT+IH3ukPECruJsKUxQeva9NVi+GZMIEdJ2KPmKMOHyUyLm91h/mNX8at5vS6n1rMlTUKtkrkReYGeGVKYpV5gtCo=
X-Received: by 2002:a05:651c:3138:b0:309:1fee:378d with SMTP id
 38308e7fff4ca-326ad1be568mr11239681fa.19.1746620441806; Wed, 07 May 2025
 05:20:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407105857.2568209-1-nvidia@cohens.org.il>
In-Reply-To: <20250407105857.2568209-1-nvidia@cohens.org.il>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 7 May 2025 21:20:05 +0900
X-Gmail-Original-Message-ID: <CAK7LNARW4agbd7cW9BvDhrKYP-nxm3o===C57JZAwiFOi8+xkw@mail.gmail.com>
X-Gm-Features: ATxdqUGof_-9xl5A8H-RhLH9eH_cQebjKl40FRK-N1TOZ01PryKFEvas3qpa_JI
Message-ID: <CAK7LNARW4agbd7cW9BvDhrKYP-nxm3o===C57JZAwiFOi8+xkw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rpm-pkg: Include symvers in kernel package
To: Tzafrir Cohen <nvidia@cohens.org.il>
Cc: linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry for the late reply.

To align with Fedora's kernel.spec file,
is it better to use 'compression' macro etc. ?





--- a/scripts/package/kernel.spec
+++ b/scripts/package/kernel.spec
@@ -45,6 +45,10 @@ This package provides kernel headers and makefiles
sufficient to build modules
 against the %{version} kernel package.
 %endif

+%global compression xz
+%global compression_flags --compress
+%global compext xz
+
 %if %{with_debuginfo}
 # list of debuginfo-related options taken from distribution kernel.spec
 # files
@@ -91,7 +95,7 @@ cp $(%{make} %{makeflags} -s image_name)
%{buildroot}/lib/modules/%{KERNELRELEAS
 %{make} %{makeflags} INSTALL_HDR_PATH=3D%{buildroot}/usr headers_install
 cp System.map %{buildroot}/lib/modules/%{KERNELRELEASE}
 cp .config %{buildroot}/lib/modules/%{KERNELRELEASE}/config
-%{__gzip} -n -9 <Module.symvers >
%{buildroot}/lib/modules/%{KERNELRELEASE}/symvers.gz
+%{compression} --stdout %{compression_flags} < Module.symvers >
%{buildroot}/lib/modules/%{KERNELRELEASE}/symvers.%{compext}
 if %{make} %{makeflags} run-command KBUILD_RUN_COMMAND=3D'test -d
${srctree}/arch/${SRCARCH}/boot/dts' 2>/dev/null; then
        %{make} %{makeflags}
INSTALL_DTBS_PATH=3D%{buildroot}/lib/modules/%{KERNELRELEASE}/dtb
dtbs_install
 fi




On Mon, Apr 7, 2025 at 7:59=E2=80=AFPM Tzafrir Cohen <nvidia@cohens.org.il>=
 wrote:
>
> This change adds an extra file to the generated kernel rpm package:
> symvers.gz under the modules directory.
>
> With that extra file, rpm-build on some systems (specifically many
> systems based on Centos >=3D 8) can create better dependencies when
> it builds binary modules packages using weak-modules.
>
> Normally it creates dependencies of type:
>
>   kmod(foo.ko)
>
> but with the symver information available, it will create extra
> dependencies of the sort of:
>
>   kernel(foo_sym_bol) =3D 0x112233445566
>
> And therefore if a binary kernel module was built with that specific
> kernel, the package manager can check if another kernel provides
> foo_sym_bol and of the same version. This is similar to the tests
> that The weak-modules script runs at run time.
>
> Using gzip explicitly as with Centos 8 only symvers.gz is tested for.
> See /usr/lib/rpm/fileattrs/kabi.attr . Centos 9 and 10 also tests for
> symvers.xz .
>
> Signed-off-by: Tzafrir Cohen <nvidia@cohens.org.il>
> ---
>  scripts/package/kernel.spec | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spec
> index 726f34e11960..2a2de5df83ed 100644
> --- a/scripts/package/kernel.spec
> +++ b/scripts/package/kernel.spec
> @@ -90,6 +90,7 @@ cp $(%{make} %{makeflags} -s image_name) %{buildroot}/l=
ib/modules/%{KERNELRELEAS
>  %{make} %{makeflags} INSTALL_HDR_PATH=3D%{buildroot}/usr headers_install
>  cp System.map %{buildroot}/lib/modules/%{KERNELRELEASE}
>  cp .config %{buildroot}/lib/modules/%{KERNELRELEASE}/config
> +%{__gzip} -n -9 <Module.symvers > %{buildroot}/lib/modules/%{KERNELRELEA=
SE}/symvers.gz
>  if %{make} %{makeflags} run-command KBUILD_RUN_COMMAND=3D'test -d ${srct=
ree}/arch/${SRCARCH}/boot/dts' 2>/dev/null; then
>         %{make} %{makeflags} INSTALL_DTBS_PATH=3D%{buildroot}/lib/modules=
/%{KERNELRELEASE}/dtb dtbs_install
>  fi
> --
> 2.47.2
>


--=20
Best Regards
Masahiro Yamada

