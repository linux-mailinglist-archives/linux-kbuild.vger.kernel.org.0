Return-Path: <linux-kbuild+bounces-5089-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E31D89EE668
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Dec 2024 13:13:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF3F618840A2
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Dec 2024 12:13:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2571220B7FA;
	Thu, 12 Dec 2024 12:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cz1+rHtX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14C41E9B27;
	Thu, 12 Dec 2024 12:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734005617; cv=none; b=DvcaLW26+VTw/D63yq7rDsa6obhM9jyyOhEUzT8Ieg/CKSXhX1/TGWAFiT/pxQl2S05FHTuf43041f+sIG5HiF42h5nU2LMD+RJWB6xT73s1yO3V6MJR+XEGaJ+eZ/eDuun8f12Dn/HfsjjWA9Mgnif+d4By4bYOV4y5qz1RMoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734005617; c=relaxed/simple;
	bh=JrRoZ3Bj4jVk5JI4vagLdfxZGDdordreF1CIqnBXzhU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uPbbyPKieR1G7TKbR3IaJG3Xf0+NNWtBEC6dq22VwKDWGxHrFy3dW+PoaJmP/I7cmj45WwpBH+LquA/HEyATiDTp6vDrKYDo+sFG74FjLvplE4KrA2m95YGgaL8j81qnE6riEmNA2GcauXLG8xC+q2hGWu5Vtrryxo4+jLGb7Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cz1+rHtX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8904AC4AF09;
	Thu, 12 Dec 2024 12:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734005616;
	bh=JrRoZ3Bj4jVk5JI4vagLdfxZGDdordreF1CIqnBXzhU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Cz1+rHtXBRqAdSUCUXSXHk5P6Cu9Nl4Ysydz2D/8P44dphiQZWAUoSsuGlQNnLtsP
	 hZbVdQoRLtVfRabVLL+KNSCQTfzm3CsThTQ+t5/lVD/uqRnFkIkNUq1pLXSoVutKkr
	 QYmmeS1rOmYNajmZWrvMv8A+ji2548BpNj3Q+jzej6VtNRFFebvVAypYswvaQixj8D
	 GTTmANz0F2llbRtFd6mLfQ07v8NvnyeoODkCMnbBXM5YQTRXwdd4Yl70r6dsmYfEEQ
	 KRqQMw4HyfJhlONlb1AD8XcZ1ae9zHJQDj3RRYP08GtRw5IxsoSsTy3S3WuOQD50hJ
	 ZQApb3Z9tqhEw==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53e3a90336eso581419e87.3;
        Thu, 12 Dec 2024 04:13:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUOAPuUDXtu/eITJLd6aEHdDEkwklp0IoEH1gIvXElbvcbGvBlEQp4qY0Rx9zNmp3n4oqIZ7/UaxpjTDEOY@vger.kernel.org, AJvYcCX7hbDOyJ+WZJp4ec5mf0PeW8fqbO/eFu74taAxLfpnmdKjwfoobhig265iG3T8M983IUfX2A6mH+RP+lo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTY411bSVn8Hr9nNPsllSFBdbdY52xRv/eU0WUNa9p0Hb5PVDv
	AHsKYStGM+Rz5AloHnOIWIbsTWZnX23WGvoHA67Y7aPopjfKqugYWM/f8JUxkGv+QF6rffLXHgx
	IvHzanibKovtDgJ5d16JMLdOeSmw=
X-Google-Smtp-Source: AGHT+IELqxcLEVYqsvY9lSBEOjEghH5AzkNOqm4z0DtpeUxOXhh4CHRbOiK7Z+Fku3u/o2S3zIVO4ZJZV+U1F7Z+zsY=
X-Received: by 2002:a05:6512:ba0:b0:53e:39c2:f027 with SMTP id
 2adb3069b0e04-54034101d0amr87548e87.11.1734005615202; Thu, 12 Dec 2024
 04:13:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241212-kbuild-deb-pkg-no-initrd-for-um-v1-1-23243b5c7093@fjasle.eu>
In-Reply-To: <20241212-kbuild-deb-pkg-no-initrd-for-um-v1-1-23243b5c7093@fjasle.eu>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 12 Dec 2024 21:12:58 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT6pNpnytGpzf0NTS+VbohJNF-CCj6dUGW=xHVdkOT74g@mail.gmail.com>
Message-ID: <CAK7LNAT6pNpnytGpzf0NTS+VbohJNF-CCj6dUGW=xHVdkOT74g@mail.gmail.com>
Subject: Re: [PATCH] kbuild: deb-pkg: Do request initrd for user-mode-linux
To: Nicolas Schier <nicolas@fjasle.eu>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Terrell <terrelln@fb.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 12, 2024 at 6:25=E2=80=AFPM Nicolas Schier <nicolas@fjasle.eu> =
wrote:
>
> Do not request initramfs-tools to build an initrd image for
> user-mode-linux.
>
> Building and installing a user-mode-linux Debian package with
>
>     make bindeb-pkg ARCH=3Dum
>     apt install ./user-mode-linux-*.deb
>
> fails reasonable due to missing kernel config in /boot
> (KVER=3D6.13.0-rc2-00006-g8f2db654f79c):
>
>     update-initramfs: Generating /usr/bin/initrd.img-${KVER}
>     grep: /boot/config-${KVER}: No such file or directory
>     W: zstd compression (CONFIG_RD_ZSTD) not supported by kernel, using
>      gzip
>     grep: /boot/config-${KVER}: No such file or directory
>     E: gzip compression (CONFIG_RD_GZIP) not supported by kernel
>     update-initramfs: failed for /usr/bin/initrd.img-${KVER} with 1.
>     run-parts: /etc/kernel/postinst.d/initramfs-tools exited with return
>      code 1
>     ...
>     dpkg: error processing package user-mode-linux-${KVER} (--configure):
>      installed user-mode-linux-${KVER} package post-installation script
>      subprocess returned error exit status 1
>     Errors were encountered while processing:
>      user-mode-linux-${KVER}
>     E: Sub-process /usr/bin/dpkg returned an error code (1)
>
> There is no need to build initrd for user-mode-linux, so stop requesting
> it.
>
> Signed-off-by: Nicolas Schier <nicolas@fjasle.eu>
> ---

I think this change is wrong.

maint scripts do not make sense for user-mode-linux.





>  scripts/package/builddeb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index b497b933901013b1b8b82c2c340a88c9257c6193..d88ee487a1f2cfa3365350abe=
5b2203f48980d36 100755
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -46,10 +46,12 @@ install_linux_image () {
>                 cp System.map "${pdir}/usr/lib/uml/modules/${KERNELRELEAS=
E}/System.map"
>                 cp ${KCONFIG_CONFIG} "${pdir}/usr/share/doc/${pname}/conf=
ig"
>                 gzip "${pdir}/usr/share/doc/${pname}/config"
> +               initrd_wanted=3DNo
>         else
>                 mkdir -p "${pdir}/boot"
>                 cp System.map "${pdir}/boot/System.map-${KERNELRELEASE}"
>                 cp ${KCONFIG_CONFIG} "${pdir}/boot/config-${KERNELRELEASE=
}"
> +               initrd_wanted=3D$(if_enabled_echo CONFIG_BLK_DEV_INITRD Y=
es No)
>         fi
>
>         # Not all arches have the same installed path in debian
> @@ -82,7 +84,7 @@ install_linux_image () {
>                 export DEB_MAINT_PARAMS=3D"\$*"
>
>                 # Tell initramfs builder whether it's wanted
> -               export INITRD=3D$(if_enabled_echo CONFIG_BLK_DEV_INITRD Y=
es No)
> +               export INITRD=3D${initrd_wanted}
>
>                 # run-parts will error out if one of its directory argume=
nts does not
>                 # exist, so filter the list of hook directories according=
ly.
>
> ---
> base-commit: 8f2db654f79c7fa579c64eda2b5db44553d6e513
> change-id: 20241212-kbuild-deb-pkg-no-initrd-for-um-1c7b9ab2f264
>
> Best regards,
> --
> Nicolas
>


--=20
Best Regards
Masahiro Yamada

