Return-Path: <linux-kbuild+bounces-6293-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 04598A6CB63
	for <lists+linux-kbuild@lfdr.de>; Sat, 22 Mar 2025 17:09:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1BD2188CC8D
	for <lists+linux-kbuild@lfdr.de>; Sat, 22 Mar 2025 16:09:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4791822F392;
	Sat, 22 Mar 2025 16:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ri4rRLfx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A8C223709;
	Sat, 22 Mar 2025 16:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742659746; cv=none; b=OMeA2v69SITvQESDkHtXkj5qSGRo0ttPugg/Nl0aBeixUO/f1vczV8NQTviwFn6oPTWESxs1MBdv/SUujAGWrELf5cz6lXwOqThX+s7w5Wer3jH5xkSxuQypLjej2ikGd6CAJxNHzcQzRn3H7CYE/7OgkPY7x7MW9XR1O1d50GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742659746; c=relaxed/simple;
	bh=ogiup8WnQslTGUZU0BFHkkJFFWNXpnnTIqwzlBuFulU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kU8NELaZJEQHkkBGUecZYL1lWVJIixjCMAOdgkIsrHeCrLEa3YHdUIMx1HXJ4F1QZ+6z7StISpKCtgUng2nWbU2o/W7ovP7wSSvR+HO2LWLO4RkQqhZGDh4jeac8T9bbSuX5G0iLXecw7kNi6N82KqSh6CS6UnVM4HpuyThHfVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ri4rRLfx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7927DC4CEED;
	Sat, 22 Mar 2025 16:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742659744;
	bh=ogiup8WnQslTGUZU0BFHkkJFFWNXpnnTIqwzlBuFulU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ri4rRLfxX7aIjGdZAAhS9qz7ccVBs5oNk/dIcBLue0hMc7mCHXw3jQcmnsvJkGXmT
	 aouPq4Av7yAWEzOROtPnuRvFClbUt/mQI05eds5Y6ia1SWPfWNAzCwx/b8NjXKcPzN
	 VweTjel+vYKN6LXlcMdE8wEnPBdcKjmGBond/75w2N7zPgvdQjkswNH3SzMQVT2nF/
	 XrgowwjqQOUl+DOWqerKIUws6AQ+/lQHlzL9QU4aC2ve7Z3ltd+VOt+5JthKZc4z9d
	 Zoo3+Fo/dMJYPFYqe6/MNWvgp6KwwTLXYzy5tJceC6qxxbnYZX8U8qd+usVfbG0KNm
	 qIrKLby/W3mLQ==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54963160818so3624787e87.2;
        Sat, 22 Mar 2025 09:09:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUlYuVP7kjupH1LLv3BOKUflS9wv9uz8ckXyRigCCymo/2MU/WQDb79FuZZBac2+zo8mNbeZJ9c0d2IAZw=@vger.kernel.org, AJvYcCW+HMNWdgo/ihVkEZphppxd5ifd0IGSMFRzDQJDwLVLkfo7me7Zu1V7UQxTQjqDNo/GF1SueTFJ@vger.kernel.org, AJvYcCW/s78pjDecgxQowzcuRULzn4oAbSNqzcYUlRNI4USYs8KFac2jxSBNJwa1kd45JDTY7YGhSJI4adyVtUsU@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm/ES+wGzaH3vBuBXp0Q5m2StlH+9cBqXUc//s69+XgyXEYgBn
	OknH24X34fxVql4zsQi1Myfr9cqTXYUJffiEZ5XOnxblN/lsnT9Ej0VOE0DMWk61m78O0TDMvzW
	1rX4nva/Y2RqtJl19MExeEiWLFFs=
X-Google-Smtp-Source: AGHT+IHCu2qN8+d+VY8tTgzZzAo4gDNQdYleZGDJ/W5aoEZnsWS/CKUr4A91/bE5y84QOhQBiRXO2CUU/oBb2M7QUyI=
X-Received: by 2002:a05:6512:304f:b0:542:91a5:2478 with SMTP id
 2adb3069b0e04-54ad64ef057mr2786069e87.32.1742659743092; Sat, 22 Mar 2025
 09:09:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250314131053.23360-1-alexandru.gagniuc@hp.com>
In-Reply-To: <20250314131053.23360-1-alexandru.gagniuc@hp.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 23 Mar 2025 01:08:26 +0900
X-Gmail-Original-Message-ID: <CAK7LNASL=t4Lm5kdTqiLeBnB8dsZ81EK52Nw7=sHOvPdpW7r5A@mail.gmail.com>
X-Gm-Features: AQ5f1JpFKM1999iqmiY1vCfrOJKxjfEvsR-BTXIsQnOoZXOP4gjqQX9TgEfFZqk
Message-ID: <CAK7LNASL=t4Lm5kdTqiLeBnB8dsZ81EK52Nw7=sHOvPdpW7r5A@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: deb-pkg: don't set KBUILD_BUILD_VERSION unconditionally
To: Alexandru Gagniuc <alexandru.gagniuc@hp.com>
Cc: nathan@kernel.org, linux-kbuild@vger.kernel.org, nicolas@fjasle.eu, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 18, 2025 at 7:42=E2=80=AFAM Alexandru Gagniuc
<alexandru.gagniuc@hp.com> wrote:
>
> In ThinPro, we use the convention <upstream_ver>+hp<patchlevel> for
> the kernel package. This does not have a dash in the name or version.
> This is built by editing ".version" before a build, and setting
> EXTRAVERSION=3D"+hp" and KDEB_PKGVERSION make variables:
>
>     echo 68 > .version
>     make -j<n> EXTRAVERSION=3D"+hp" bindeb-pkg KDEB_PKGVERSION=3D6.12.2+h=
p69
>
>     .deb name: linux-image-6.12.2+hp_6.12.2+hp69_amd64.deb
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
>     (now)      uname -a: version 6.12.2+hp ... #6.12.2+hp69
>     (expected) uname -a: version 6.12.2+hp ... #69
>
> Update the debian/rules logic to restore the original behavior.
>
> Cc: <stable@vger.kernel.org>
> Fixes: 7d4f07d5cb71 ("kbuild: deb-pkg: squash scripts/package/deb-build-o=
ption to debian/rules")
> Signed-off-by: Alexandru Gagniuc <alexandru.gagniuc@hp.com>
> Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>
> ---
> Changes since v1:
>  * Rework logic so that dpkg-parsechangelog is invoked just once
>  * Adjust commit message to reflect review feedback
>
>  scripts/package/debian/rules | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/package/debian/rules b/scripts/package/debian/rules
> index ca07243bd5cd..d1f400685682 100755
> --- a/scripts/package/debian/rules
> +++ b/scripts/package/debian/rules
> @@ -21,9 +21,11 @@ ifeq ($(origin KBUILD_VERBOSE),undefined)
>      endif
>  endif
>
> -revision =3D $(lastword $(subst -, ,$(shell dpkg-parsechangelog -S Versi=
on)))
> +revision =3D $(shell dpkg-parsechangelog -S Version | sed -n 's/.*-//p')
>  CROSS_COMPILE ?=3D $(filter-out $(DEB_BUILD_GNU_TYPE)-, $(DEB_HOST_GNU_T=
YPE)-)
> -make-opts =3D ARCH=3D$(ARCH) KERNELRELEASE=3D$(KERNELRELEASE) KBUILD_BUI=
LD_VERSION=3D$(revision) $(addprefix CROSS_COMPILE=3D,$(CROSS_COMPILE))
> +make-opts =3D ARCH=3D$(ARCH) KERNELRELEASE=3D$(KERNELRELEASE) $(addprefi=
x \
> +               KBUILD_BUILD_VERSION=3D,$(revision)) $(addprefix \
> +               CROSS_COMPILE=3D,$(CROSS_COMPILE))



Applied to linux-kbuild.

I fixed the place for wrapping for readability.
(In my previous reply, the code was wrapped by Gmail
 in unintended places)

Thanks.






>  binary-targets :=3D $(addprefix binary-, image image-dbg headers libc-de=
v)
>
> --
> 2.48.1
>


--=20
Best Regards
Masahiro Yamada

