Return-Path: <linux-kbuild+bounces-5223-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1622F9F9E1D
	for <lists+linux-kbuild@lfdr.de>; Sat, 21 Dec 2024 04:46:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E96E188E598
	for <lists+linux-kbuild@lfdr.de>; Sat, 21 Dec 2024 03:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A4041D9A70;
	Sat, 21 Dec 2024 03:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k+E6Z0aE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3F513A244;
	Sat, 21 Dec 2024 03:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734752794; cv=none; b=eDodaVbt8FoC7wBMADNP0uuLUuPCap8HN5CT+InH/xvQ8CTi7TK6vufoHSWGZChPC8+FphDoJYX0ss5hlk/+n+dMEppYRh3XpQnFvv3AFeggkEOEc8FvFPGQt/VksDHJGnmPzbHx0QUppmfrqLKspSij7dI0FlPCjc5IFhH+NGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734752794; c=relaxed/simple;
	bh=3Gsuuv4hWPVqGIW3skh+e3zUKvTwAHxQMouPxyV753Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VDnnJoaBRM8+g2vlyHrlpNUjh47gTKLHHYzsYu4+YGGi3jUYcEB3cR9X1o2xYQB22l7dN6bi205IcZO9BkANbX1hnaCKp8B7Ab5hyEGn4hDTSXXm5BR5dbUwfoguME2KVApEd1sGVn+X2wgrBk7/48am0w7IMTAFqxKWwFZsrXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k+E6Z0aE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 021E8C4CED7;
	Sat, 21 Dec 2024 03:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734752794;
	bh=3Gsuuv4hWPVqGIW3skh+e3zUKvTwAHxQMouPxyV753Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=k+E6Z0aEq7uCoWKUEiSlZPSGu50BFSZIA4EDlVfIvzAvmyjVuXV6WeqhQKRkHwbqf
	 eferVOkNpPf8k4V5hEjWkchGilzAmQ3EOYx9FlJWci6dr6Oyz69B0ivGRYhe00FEYz
	 FZkd2UhAwQraaSPCX3ucTox/p0dnXUJZWxGHansnXjRVeEUDln7WHF2L04e5vEmhDH
	 73hp51Zmr+FA+2vvzogg86zCiXoixE85FyrDFh2x8rHI4MNo7BpWXk7FbiZQSSUgH1
	 906y09P9ieYVK+Xawp945Zq0+7XE61Raw7pOZLDGeTkfjVUCMgP4DpY6MUNDiH0RzB
	 SRwQb0So+z/Nw==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53e399e3310so2733894e87.1;
        Fri, 20 Dec 2024 19:46:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUBdZQoTPEV73/E7snT9ROWCvsQ5IGTYoddTnmBjWbnqz2eRS7gczkGxm+D2OKS5WV3vjlRqDnnkGccLWY=@vger.kernel.org, AJvYcCXvsNpEtLA27ufCJ1iMuNPNwnlFyL3ggkXJC5BpUCuuBa3diz78IQ4RdlCm6shd5HbZwrlPd8NYKjvQirSz@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6e6ByNfUxM+e/3J1sMj4T01I2wCeBkQJK+MaykE7Mw0Q1Dyam
	5bMtvrxJoJCWqVScb0k/2zAyZckrty2kKzXu3uelJYU1S3HUu3pPtu3MU0toZ6OFeOysNIipKu0
	9OVdvu0IKg3t8luQjm3NScSw9St8=
X-Google-Smtp-Source: AGHT+IE9z6TdwulX1LoBkH9L2doqhcaB0Lo3EHYDI1bcNaOb4B9pgBstuYt3WIyVYUixW6+63qnQihZz5cR1OxEUl28=
X-Received: by 2002:a05:6512:68e:b0:540:3566:5397 with SMTP id
 2adb3069b0e04-54229530300mr1764685e87.22.1734752792648; Fri, 20 Dec 2024
 19:46:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241212-kbuild-deb-pkg-no-maint-scripts-for-um-v1-1-45db61e3272a@fjasle.eu>
In-Reply-To: <20241212-kbuild-deb-pkg-no-maint-scripts-for-um-v1-1-45db61e3272a@fjasle.eu>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 21 Dec 2024 12:45:56 +0900
X-Gmail-Original-Message-ID: <CAK7LNATP05jzniF8QbQERbY43K7nmis045nFK6s-8u+ca=6xYw@mail.gmail.com>
Message-ID: <CAK7LNATP05jzniF8QbQERbY43K7nmis045nFK6s-8u+ca=6xYw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: deb-pkg: Do not install maint scripts for arch 'um'
To: Nicolas Schier <nicolas@fjasle.eu>
Cc: Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 12, 2024 at 10:06=E2=80=AFPM Nicolas Schier <nicolas@fjasle.eu>=
 wrote:
>
> Stop installing Debian maintainer scripts when building a
> user-mode-linux Debian package.
>
> Debian maintainer scripts are used for e.g. requesting rebuilds of
> initrd, rebuilding DKMS modules and updating of grub configuration.  As
> all of this is not relevant for UML but also may lead to failures while
> processing the kernel hooks, do no more install maintainer scripts for
> the UML package.
>
> Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
> Signed-off-by: Nicolas Schier <nicolas@fjasle.eu>
> ---
> Misleaded predecessor patch:
> https://lore.kernel.org/linux-kbuild/20241212-kbuild-deb-pkg-no-initrd-fo=
r-um-v1-1-23243b5c7093@fjasle.eu/


Applied to linux-kbuild. Thanks.



> ---
>  scripts/package/builddeb | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index b497b933901013b1b8b82c2c340a88c9257c6193..3627ca227e5a5db520958e6eb=
0128512dca083bc 100755
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -65,6 +65,12 @@ install_linux_image () {
>         esac
>         cp "$(${MAKE} -s -f ${srctree}/Makefile image_name)" "${pdir}/${i=
nstalled_image_path}"
>
> +       if [ "${ARCH}" !=3D um ]; then
> +               install_maint_scripts "${pdir}"
> +       fi
> +}
> +
> +install_maint_scripts () {
>         # Install the maintainer scripts
>         # Note: hook scripts under /etc/kernel are also executed by offic=
ial Debian
>         # kernel packages, as well as kernel packages built using make-kp=
kg.
>
> ---
> base-commit: 8f2db654f79c7fa579c64eda2b5db44553d6e513
> change-id: 20241212-kbuild-deb-pkg-no-maint-scripts-for-um-2261ffdfb903
>
> Best regards,
> --
> Nicolas
>
>


--=20
Best Regards
Masahiro Yamada

