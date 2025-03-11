Return-Path: <linux-kbuild+bounces-6062-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF62A5CD29
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 19:06:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6403916E9C5
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 18:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B8FD262D13;
	Tue, 11 Mar 2025 18:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ft4oGmHe"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522CA2620C3;
	Tue, 11 Mar 2025 18:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741716357; cv=none; b=lWQuvLeQaN1sFDuI/Ul/xBxvwL7SUPSOjtEp1g6GHoQCnNpBc/nbf4fdsQUfkCjie7cS5LLRZbqHfS4LpwmkmsB9J+wILteSUH3DaCa3NSiK/otefuD92/j0Kdp0bQpcHT0fySVzRV/rFWIS5Q6kdzJXViSaWMGGEcceXNfiWCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741716357; c=relaxed/simple;
	bh=11Irf0tEDIGV3dK6QbQ3UhX4UB4z39GWrpYACLCFReI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AYKSf8IJOChQkqzMFzli2m9uXRlJnovU+/naUdln0aORtCKxqRKBTdmUdy24B2iFI9ZnByEgDEaSrNeWfnY3QtIOcELaUJmdoaCKEbycFsD71CXwzRTwJ/vHLuhEqYkzLSnsNhcfbdP7ZO/eyPWzfKmdOhL3yzE7/o/zDmbqk4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ft4oGmHe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C35A7C4CEEA;
	Tue, 11 Mar 2025 18:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741716356;
	bh=11Irf0tEDIGV3dK6QbQ3UhX4UB4z39GWrpYACLCFReI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ft4oGmHeMCF/4B+JBUtZYLqh+mH7iNMfPsnD8+PVP4LH2/yJxsKXVJRsFX8MoRAnd
	 W5BBYZt+U7DVFNdazggqUYWTo+DU2Cd3WzG5+2/EzhG3Ao4kkyP4udHAns9oLorFvR
	 o66jFrU0igSRo6DDKTVvwPmeNfOIeH3znuEOOGkYywUwIjhTTRCiyHRKbq5Rnst39K
	 jy4YRgwG1nB+SC3+UM0YcGgozV9Upb0F0AvYXQI7xn8gRIA5NOeuuv7/f4zAED6/Hk
	 dFz+hZB5DBq9lY0t66R7ZZHViJdFmIoPdz+ZsLufQc6Sg4hijTqOxTS7L3IJhaipJi
	 A5EnzzFvUyNSg==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5495c1e1b63so5964877e87.0;
        Tue, 11 Mar 2025 11:05:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVBQz5m+FHk1vk5hSafFSlu90CZ4SdYTQ7r6AQuuVHdXO3T5vTZ8ULxIVQlR/3Rdw8eEv4iCk3p@vger.kernel.org, AJvYcCVgywyawW+HfaMEv2YScYYzZknImp465tNgCx0AcVa9+7FHAy1Yb/twEdBAJUQsgalLE2liJJQsHxuPHqdM@vger.kernel.org, AJvYcCXraUh5HCRg+c6fGqc8WzizFlZ2fcLXrIJTUGALhk4PbI9qpQoav5BvsgkphhD/FIJnzrwbJ/PO41AzfYA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywydc1Mzombz4p6xc+26yLiBRuvYzPs8a0hkcSmR68kBDTc2+/v
	0aqKUupDHiYoWFNMDwrjck+zsVn3m8mp4o/EdC0Ipxh7jF87SQ6SuBFvxhMg9VVmWyTz3IluqJR
	O7usERv7MTP349fU+rImBt+Pdweg=
X-Google-Smtp-Source: AGHT+IE1DhdzUxYfeRm9Qc57aIFuhnE1fxuQD7rqwy5wQRfpLpQIss0yR5vEY9Km1clMnMeURrvlVLa2n0ApHcBINmw=
X-Received: by 2002:a05:6512:114f:b0:549:8963:eaf0 with SMTP id
 2adb3069b0e04-549abae96f7mr1803311e87.39.1741716355424; Tue, 11 Mar 2025
 11:05:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250305192536.1673099-1-alexandru.gagniuc@hp.com>
In-Reply-To: <20250305192536.1673099-1-alexandru.gagniuc@hp.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 12 Mar 2025 03:05:18 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQzheUCQN031sJekqDR8AVVjqi_A0nW8cSZmnG1ZAENNQ@mail.gmail.com>
X-Gm-Features: AQ5f1JpI_YJkfwIj1l5KI9YrTRH_tJ6-D90WQK3RndmobfKn6geow3CzLRLYN50
Message-ID: <CAK7LNAQzheUCQN031sJekqDR8AVVjqi_A0nW8cSZmnG1ZAENNQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: deb-pkg: don't set KBUILD_BUILD_VERSION indiscriminately
To: Alexandru Gagniuc <alexandru.gagniuc@hp.com>
Cc: nathan@kernel.org, linux-kbuild@vger.kernel.org, nicolas@fjasle.eu, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 6, 2025 at 4:27=E2=80=AFAM Alexandru Gagniuc
<alexandru.gagniuc@hp.com> wrote:
>
> In ThinPro, we use the convention <upstream_ver>+hp<patchlevel> for
> the kernel package. This does not have a dash in the name or version.

So, the kernel is a native package in ThinPro, in contrast to
Debian and Ubuntu, where the kernel is a non-native package.

I think it is a little odd, but if you want to use a version number
without a hyphen, we can support this only for bindeb-pkg.

Please keep in mind that you still cannot do
"make deb-pkg" or "make srcdeb-pkg" in your way.


In Debian Policy [1], the version format is:

    [epoch:]upstream_version[-debian_revision]

[1]: https://www.debian.org/doc/debian-policy/ch-controlfields.html#version


Here, the absence of the debian_revision indicates that the package is
a native package.

Because Kbuild uses the debian format 3.0 (quilt),
the debian_revision portion must be appended with a hyphen
when you generate a source package.



> This is built by editing ".version" before a build, and setting
> EXTRAVERSION=3D"+hp" and KDEB_PKGVERSION make variables:
>
>     echo 68 > .version
>     make -j<n> EXTRAVERSION=3D"+hp" bindeb-pkg KDEB_PKGVERSION=3D6.6.6+hp=
69

So, you are doing math.

You write a smaller number into .version by one
("68" into the .version file and set "+hp69" to the variable)
as the number in the .version file is incremented
during the kernel build.

Tricky, but seems to work.






>     .deb name: linux-image-6.6.6+hp_6.6.6+hp69_amd64.deb
>
> Since commit 7d4f07d5cb71 ("kbuild: deb-pkg: squash
> scripts/package/deb-build-option to debian/rules"), this no longer
> works. The deb build logic changed, even though, the commit message
> implies that the logic should be unmodified.
>
> Before, KBUILD_BUILD_VERSION was not set if the KDEB_PKGVERSION did
> not contain a dash. After the change KBUILD_BUILD_VERSION is always
> set to KDEB_PKGVERSION. Since this determines UTS_VERSION,the uname
> output to look off:
>
>     (now)      uname -a: version 6.6.6+hp ... #6.6.6+hp69
>     (expected) uname -a: version 6.6.6+hp ... #69
>
> Update the debian/rules logic to restore the original behavior.
>
> Cc: <stable@vger.kernel.org> # v6.12+
> Fixes: 7d4f07d5cb71 ("kbuild: deb-pkg: squash scripts/package/deb-build-o=
ption to debian/rules")
> Signed-off-by: Alexandru Gagniuc <alexandru.gagniuc@hp.com>
> ---
>  scripts/package/debian/rules | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/package/debian/rules b/scripts/package/debian/rules
> index ca07243bd5cd..bbc214f2e6bd 100755
> --- a/scripts/package/debian/rules
> +++ b/scripts/package/debian/rules
> @@ -21,9 +21,13 @@ ifeq ($(origin KBUILD_VERBOSE),undefined)
>      endif
>  endif
>
> -revision =3D $(lastword $(subst -, ,$(shell dpkg-parsechangelog -S Versi=
on)))
> +debian_revision =3D $(shell dpkg-parsechangelog -S Version)
> +revision =3D $(lastword $(subst -, ,$(debian_revision)))
>  CROSS_COMPILE ?=3D $(filter-out $(DEB_BUILD_GNU_TYPE)-, $(DEB_HOST_GNU_T=
YPE)-)
> -make-opts =3D ARCH=3D$(ARCH) KERNELRELEASE=3D$(KERNELRELEASE) KBUILD_BUI=
LD_VERSION=3D$(revision) $(addprefix CROSS_COMPILE=3D,$(CROSS_COMPILE))
> +make-opts =3D ARCH=3D$(ARCH) KERNELRELEASE=3D$(KERNELRELEASE) $(addprefi=
x CROSS_COMPILE=3D,$(CROSS_COMPILE))
> +ifneq ($(revision), $(debian_revision))

dpkg-parsechangelog is invoked multiple times,
even for 'debian/rules clean'.


I would write the code like this:

revision =3D $(shell dpkg-parsechangelog -S Version | sed -n 's/.*-//p')
CROSS_COMPILE ?=3D $(filter-out $(DEB_BUILD_GNU_TYPE)-, $(DEB_HOST_GNU_TYPE=
)-)
make-opts =3D ARCH=3D$(ARCH) KERNELRELEASE=3D$(KERNELRELEASE) $(addprefix
KBUILD_BUILD_VERSION=3D,$(revision)) $(addprefix
CROSS_COMPILE=3D,$(CROSS_COMPILE))



WIth this, dpkg-parsechangelog is invoked just one time
only when building the package.




> +    make-opts+=3DKBUILD_BUILD_VERSION=3D$(revision)
> +endif
>
>  binary-targets :=3D $(addprefix binary-, image image-dbg headers libc-de=
v)
>
> --
> 2.48.1
>


--
Best Regards

Masahiro Yamada

