Return-Path: <linux-kbuild+bounces-4906-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7A09DB13C
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Nov 2024 02:50:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26B2016511A
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Nov 2024 01:50:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85BCB54648;
	Thu, 28 Nov 2024 01:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SLlsxz1f"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1BC52F88
	for <linux-kbuild@vger.kernel.org>; Thu, 28 Nov 2024 01:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732757959; cv=none; b=f66OBYcss7f882na/Th5bPAqQyAWa7KcLWUjALW1TelEFfqf84eoG6oTn9l6oQkdCHF8efNDLTb3DfAQJMvYuAFVPpu/22hWWbZ8HOsIrSkkssqB7x+gQZsjqKm1UosqXIvVZan2Am/8jkne1gNormjqQzUjcN0nkvq8b61Q5VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732757959; c=relaxed/simple;
	bh=X/KUFBLnccIpkCAwQxuiZuYyoWGwtRh12fCUodtu/tQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l2HU3AT3RMJbSyNHh3leVUHWZaE+sB6DgoyRGmDFnZqjGFbRtB2hgFrfP5+Y34j9n/McpjUWVNrchAH37leM/DF5JsEKafeIJSLn8IQVa/l9PttfIHwAyhA0ZG9DowtQExNmHxGCzySfXL6BSfAaY2/CzBYWf28RtfKbW3GpWCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SLlsxz1f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6985C4CECC
	for <linux-kbuild@vger.kernel.org>; Thu, 28 Nov 2024 01:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732757957;
	bh=X/KUFBLnccIpkCAwQxuiZuYyoWGwtRh12fCUodtu/tQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SLlsxz1fKJCu/SlNd1QR883tBjNcVMSKc0wgbOleTzqaIGHsyPyVhcjOtyT6kRIxo
	 PjMmaHF80P0OYmQk41c1HCU7nh2sRu0kyo5nmvvAE/2886KmjLc4cxDGPviR+WtFQ2
	 SDz1xMTdzuY6VTbwl3wkf93uxm4dW0XR4A6muMpk06J2/r6Vtg6sO8x/puugkj4WNj
	 Fhi4ESib4/JBuKjWUUcg3deJ5Xda4Tzq1pO5BWa75pZsi6Oa7qxeo25bbk34lvrNu3
	 X1vDnAKyOOn2wb9IUD8Sv0CC1Mgo0tDyZaXnw6Y9sOGiLwGBDCvGPpP0YHOKgcLcsm
	 NaA4f31+AuwCA==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53de92be287so406778e87.1
        for <linux-kbuild@vger.kernel.org>; Wed, 27 Nov 2024 17:39:17 -0800 (PST)
X-Gm-Message-State: AOJu0Yyq0h4vl8bwbHTTxXBbUD79qxhyR5d+3LK2jQzRrx+xFPbSjBh9
	4aTa0WwmVje24wZkSR1KnYoHrPNK5lkdYYzIUNi6VBBQuW/HMsQV98bsw6XbTcyZHzag0z91Uqi
	nfFAOLRqK1qD4XO09ZKitNBvVAMo=
X-Google-Smtp-Source: AGHT+IGnwuyVEo6hoqTRbSNPEqZUDzAJFr5cjLrFpNe90VTKgYEexMNmTfCTpjrRdCiI1y1ZEPDVUSrT7oVKCICWWqs=
X-Received: by 2002:a05:6512:3ee:b0:53d:f50f:c3d4 with SMTP id
 2adb3069b0e04-53df50fc526mr872176e87.9.1732757956475; Wed, 27 Nov 2024
 17:39:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241127105851.1590405-1-josch@mister-muffin.de> <20241127105851.1590405-2-josch@mister-muffin.de>
In-Reply-To: <20241127105851.1590405-2-josch@mister-muffin.de>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 28 Nov 2024 10:38:40 +0900
X-Gmail-Original-Message-ID: <CAK7LNARMBTf8usS0UxZ06gVZDbTTrhXt73mpVaGZRby-Zcdtsw@mail.gmail.com>
Message-ID: <CAK7LNARMBTf8usS0UxZ06gVZDbTTrhXt73mpVaGZRby-Zcdtsw@mail.gmail.com>
Subject: Re: [PATCH 1/1] scripts/package/builddeb: allow hooks also in /usr/share/kernel
To: Johannes Schauer Marin Rodrigues <josch@mister-muffin.de>
Cc: linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2024 at 7:59=E2=80=AFPM Johannes Schauer Marin Rodrigues
<josch@mister-muffin.de> wrote:
>
> By passing an additional directory to run-parts, allow Debian and its
> derivatives an easy way to ship maintainer scripts in /usr while at the
> same time allowing the local admin to easily override or disable them by
> placing hooks of the same name in /etc. This adds support for the
> mechanism described in the UAPI Configuration Files Specification for
> kernel hooks:
> https://uapi-group.org/specifications/specs/configuration_files_specifica=
tion/
>
> This functionality relies on run-parts 5.21 or later. If run-parts is
> lacking support, only scripts in /etc/kernel will be considered. It is
> the responsibility of packages installing hooks into /usr/share/kernel
> to also declare a Depends: debianutils (>=3D 5.21).


Signed-off-by: is required for any kernel patch.



> ---
>  scripts/package/builddeb | 39 ++++++++++++++++++++++++++++++++++-----
>  1 file changed, 34 insertions(+), 5 deletions(-)
>
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index 441b0bb66e0d..1fa5228eed0b 100755
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -5,10 +5,14 @@
>  #
>  # Simple script to generate a deb package for a Linux kernel. All the
>  # complexity of what to do with a kernel after it is installed or remove=
d
> -# is left to other scripts and packages: they can install scripts in the
> -# /etc/kernel/{pre,post}{inst,rm}.d/ directories (or an alternative loca=
tion
> -# specified in KDEB_HOOKDIR) that will be called on package install and
> -# removal.
> +# is left to other scripts and packages. Scripts can be placed into
> +# the preinst, postinst, prerm and postrm directories in /etc/kernel
> +# (override with KDEB_HOOKDIR) or /usr/share/kernel (override with
> +# KDEB_DISTRO_HOOKDIR). Hooks of the same name in KDEB_HOOKDIR will over=
ride
> +# hooks in KDEB_DISTRO_HOOKDIR. This, the former directory (usually in /=
etc)
> +# can be used by the local admin while the latter directory (usually in =
/usr)
> +# can be used by packages shipped by the distribution. The preinst, post=
inst,
> +# prerm and postrm will then be called on package installation and remov=
al.
>
>  set -eu
>
> @@ -69,8 +73,10 @@ install_linux_image () {
>         # make-kpkg sets $INITRD to indicate whether an initramfs is want=
ed, and
>         # so do we; recent versions of dracut and initramfs-tools will ob=
ey this.
>         debhookdir=3D${KDEB_HOOKDIR:-/etc/kernel}
> +       debdistrohookdir=3D${KDEB_DISTRO_HOOKDIR:-/usr/share/kernel}
>         for script in postinst postrm preinst prerm; do
>                 mkdir -p "${pdir}${debhookdir}/${script}.d"
> +               mkdir -p "${pdir}${debdistrohookdir}/${script}.d"
>
>                 mkdir -p "${pdir}/DEBIAN"
>                 cat <<-EOF > "${pdir}/DEBIAN/${script}"
> @@ -84,7 +90,30 @@ install_linux_image () {
>                 # Tell initramfs builder whether it's wanted
>                 export INITRD=3D$(if_enabled_echo CONFIG_BLK_DEV_INITRD Y=
es No)
>
> -               test -d ${debhookdir}/${script}.d && run-parts --arg=3D"$=
{KERNELRELEASE}" --arg=3D"/${installed_image_path}" ${debhookdir}/${script}=
.d
> +               if test -d "${debhookdir}/${script}.d" && test -d "${debd=
istrohookdir}/${script}.d"; then
> +                       if test -n "$(find "${debhookdir}/${script}.d" -m=
axdepth 0 -empty)" ; then


This must be escaped like "\$(find ...)"
because the 'find' command must be evaluated on the
installed system instead of on the build machine.

However, the added complexities look skeptical to me.

If /usr/share/kernel/postinst.d/ exists on the installed system,
we can assume run-parts>=3D5.21 exists there.


One more thing, do we need a new env variable
for the second search path?

If a user wants to add more search paths for custom hooks,
they can pass multiple words to KDEB_HOOKDIR.

export KDEB_HOOKDIR=3D"
/home/masahiro/etc/kernel
/etc/kernel
/usr/local/share/kernel
/usr/share/kernel
"


This is compatible with the current "single path for KDEB_HOOKDIR"
usage, and flexible enough for the new extension.








> +                               # KDEB_HOOKDIR is empty, execute run-part=
s on KDEB_DISTRO_HOOKDIR only
> +                               run-parts --arg=3D"${KERNELRELEASE}" --ar=
g=3D"/${installed_image_path}" "${debdistrohookdir}/${script}.d"
> +                       elif test -n "$(find "${debdistrohookdir}/${scrip=
t}.d" -maxdepth 0 -empty)" ; then
> +                               # KDEB_DISTROHOOKDIR is empty, execute ru=
n-parts on KDEB_HOOKDIR only
> +                               run-parts --arg=3D"${KERNELRELEASE}" --ar=
g=3D"/${installed_image_path}" "${debhookdir}/${script}.d"
> +                       else
> +                               # Both KDEB_HOOKDIR and KDEB_DISTROHOOKDI=
R contain files. It is the
> +                               # responsibility of the distribution pack=
age that placed files into
> +                               # KDEB_DISTROHOOKDIR to add a Depends: de=
bianutils (>=3D 5.21)
> +                               if run-parts --help 2>&1 | grep -Fxq "Usa=
ge: run-parts [OPTION]... DIRECTORY [DIRECTORY ...]"; then
> +                                       run-parts --arg=3D"${KERNELRELEAS=
E}" --arg=3D"/${installed_image_path}" "${debhookdir}/${script}.d" "${debdi=
strohookdir}/${script}.d"
> +                               else
> +                                       echo "E: Ignoring maintainer scri=
pts in ${debdistrohookdir} because run-parts is too old (5.21 required)" >&=
2
> +                                       run-parts --arg=3D"${KERNELRELEAS=
E}" --arg=3D"/${installed_image_path}" "${debhookdir}/${script}.d"
> +                               fi
> +                       fi
> +               elif test -d "${debhookdir}/${script}.d"; then
> +                       run-parts --arg=3D"${KERNELRELEASE}" --arg=3D"/${=
installed_image_path}" "${debhookdir}/${script}.d"
> +               elif test -d "${debdistrohookdir}/${script}.d"; then
> +                       run-parts --arg=3D"${KERNELRELEASE}" --arg=3D"/${=
installed_image_path}" "${debdistrohookdir}/${script}.d"
> +               fi
> +
>                 exit 0
>                 EOF
>                 chmod 755 "${pdir}/DEBIAN/${script}"
> --
> 2.39.2
>
>


--=20
Best Regards
Masahiro Yamada

