Return-Path: <linux-kbuild+bounces-4953-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACC89E1785
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Dec 2024 10:29:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4E71165265
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Dec 2024 09:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 332841E0DFF;
	Tue,  3 Dec 2024 09:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HMr4UJWX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4E91E0DFB
	for <linux-kbuild@vger.kernel.org>; Tue,  3 Dec 2024 09:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733218070; cv=none; b=hehmMLBYOJkMk+3+i7OhuJGHNrI1oj1XdrRRURZdQ6Pj4GcXyIvzsu821oNiY+qXHnOCrCVNaz0rnH9g+plEQ0bKGzd3m3eeGtd/f7PXjM7tsI2Q7Y2TbuJ16iNtt6Ztbq5EtfOyzBPZGFzYCRV2eKSTXX7D4OIb7O3SRtDgq4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733218070; c=relaxed/simple;
	bh=xuUqHv9lUpoVlNTsKuMcLi/B3h8fiQt7KkEesgW1YTw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N7OfKH1YAn2F6wu2uN6XBF1VvwYLq6z57LgTzAzNm+kkPKZ14ImaPS58X68M/9pBJhA3SZVYO0aOEzN2o1X2f+gAB7/J1zlns/loyaAkOUiue6wKIC0Tr/6I00PmK4RD4gIjAweNbuh6rCvKrXwIXq7FzrgNI3TfYn2rt/UuHwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HMr4UJWX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91BCDC4CECF
	for <linux-kbuild@vger.kernel.org>; Tue,  3 Dec 2024 09:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733218069;
	bh=xuUqHv9lUpoVlNTsKuMcLi/B3h8fiQt7KkEesgW1YTw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HMr4UJWXOcGJeCGVNoqGj7PKF03pslLkHEFXAPcZNdpn9RxbUF37Msis8mi9OB2bj
	 Ma4qUIq2GjuCwcN0KL35XCrZCI7kgLwnIbExlgDWbfMhzPsdw21MqL3/T7kWj4yphq
	 T+rbO2qrvh63Tf5FN14WWmXg6sWDr/xsat4vL5RurjeDOh7MRIDaKk3SnCD1m1+4ZG
	 Hjov/B3kpUeXm2sqegdfbaq33phispHAQqh9VLLkaTEZX/aIjKS6TpcaxZ/LsPmFuW
	 +b+PtvMVwGYCtyjMQQFPd/z0hptiF43hHhLJDsK7ASAO/O1u9pQDAiLLmffdFPGw85
	 4lleKcl/setLg==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53de771c5ebso6144666e87.2
        for <linux-kbuild@vger.kernel.org>; Tue, 03 Dec 2024 01:27:49 -0800 (PST)
X-Gm-Message-State: AOJu0YzFg9/Cv4jFAT6V9JGAk+nvZRhc+LVp4XeOQBJAn4aWobrF9bH7
	4kcPtb9saLfO7VrX37XRFzFPBoD3oeIVWcdZGN2FT5Su2Q+ddHA46Q9L1joqZmmzHue52828nav
	UeprGCxBvR7UdrC0wPndKfHnR4hE=
X-Google-Smtp-Source: AGHT+IFzD1f9DDFmqOWkgrkRZiCeHPo3BY9O9blnpWj9HPDfv+u1Wlci4nRy4AkBXF+4+u+7F5v/u8V6Ux8pNXI+isM=
X-Received: by 2002:a05:6512:128b:b0:539:8a9a:4e63 with SMTP id
 2adb3069b0e04-53e12a21812mr912341e87.42.1733218068244; Tue, 03 Dec 2024
 01:27:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAK7LNARarqG2Okacbp4TKJAFz9OagB2NF=qs-Cq2rzOW4CA2Bg@mail.gmail.com>
 <20241203065441.2341579-1-josch@mister-muffin.de> <20241203065441.2341579-2-josch@mister-muffin.de>
In-Reply-To: <20241203065441.2341579-2-josch@mister-muffin.de>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 3 Dec 2024 18:27:11 +0900
X-Gmail-Original-Message-ID: <CAK7LNASiENba_7O2-6utUaWCad=rsFkD5ZMeSheqG64MGhZGQg@mail.gmail.com>
Message-ID: <CAK7LNASiENba_7O2-6utUaWCad=rsFkD5ZMeSheqG64MGhZGQg@mail.gmail.com>
Subject: Re: [PATCH 1/1] scripts/package/builddeb: allow hooks also in /usr/share/kernel
To: Johannes Schauer Marin Rodrigues <josch@mister-muffin.de>
Cc: linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 3, 2024 at 3:55=E2=80=AFPM Johannes Schauer Marin Rodrigues
<josch@mister-muffin.de> wrote:
>
> By passing an additional directory to run-parts, allow Debian and its
> derivatives to ship maintainer scripts in /usr while at the same time
> allowing the local admin to override or disable them by placing hooks of
> the same name in /etc. This adds support for the mechanism described in
> the UAPI Configuration Files Specification for kernel hooks. The same
> idea is also used by udev, systemd or modprobe for their config files.
> https://uapi-group.org/specifications/specs/configuration_files_specifica=
tion/
>
> This functionality relies on run-parts 5.21 or later.  It is the
> responsibility of packages installing hooks into /usr/share/kernel to
> also declare a Depends: debianutils (>=3D 5.21).
>
> KDEB_HOOKDIR can be used to change the list of directories that is
> searched. By default, /etc/kernel and /usr/share/kernel are hook
> directories.
>
> Signed-off-by: Johannes Schauer Marin Rodrigues <josch@mister-muffin.de>
> ---
>  scripts/package/builddeb | 33 +++++++++++++++++++++++++--------
>  1 file changed, 25 insertions(+), 8 deletions(-)
>
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index 441b0bb66e0d..6e83f6f3ec6d 100755
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -5,10 +5,12 @@
>  #
>  # Simple script to generate a deb package for a Linux kernel. All the
>  # complexity of what to do with a kernel after it is installed or remove=
d
> -# is left to other scripts and packages: they can install scripts in the
> -# /etc/kernel/{pre,post}{inst,rm}.d/ directories (or an alternative loca=
tion
> -# specified in KDEB_HOOKDIR) that will be called on package install and
> -# removal.
> +# is left to other scripts and packages. Scripts can be placed into the
> +# preinst, postinst, prerm and postrm directories in /etc/kernel or
> +# /usr/share/kernel. A different list of search directories can be given
> +# via KDEB_HOOKDIR. Scripts in directories earlier in the list will
> +# override scripts of the same name in later directories.  The script wi=
ll
> +# be called on package installation and removal.
>
>  set -eu
>
> @@ -68,11 +70,18 @@ install_linux_image () {
>         # kernel packages, as well as kernel packages built using make-kp=
kg.
>         # make-kpkg sets $INITRD to indicate whether an initramfs is want=
ed, and
>         # so do we; recent versions of dracut and initramfs-tools will ob=
ey this.
> -       debhookdir=3D${KDEB_HOOKDIR:-/etc/kernel}
> +       debhookdir=3D${KDEB_HOOKDIR:-/etc/kernel /usr/share/kernel}
> +
> +       # Only pre-create the first hook directory. Support for more than=
 one hook
> +       # directory requires run-parts 5.21 and it is the responsibility =
of packages
> +       # creating additional hook directories to declare that dependency=
.
> +       firsthookdir=3D${debhookdir%% *}
>         for script in postinst postrm preinst prerm; do
> -               mkdir -p "${pdir}${debhookdir}/${script}.d"
> +               mkdir -p "${pdir}${firsthookdir}/${script}.d"


I still do not understand why this 'mkdir' is needed.

linux-image package does not install any script into the hook directory.
In general, there exist some scripts (e.g. initramfs-tools) already
under /etc/kernel/*.d/  (and under /usr/share/kernel/*.d/ once the
new location is used broader).
If nothing exists under the hook directory, there is no point to
execute run-parts.




> +       done
>
> -               mkdir -p "${pdir}/DEBIAN"
> +       mkdir -p "${pdir}/DEBIAN"

Please drop this noise change.

If you want to optimize this, please split it into a separate patch like
"kbuild: deb-pkg: create DEBIAN directory just once" etc.




> +       for script in postinst postrm preinst prerm; do
>                 cat <<-EOF > "${pdir}/DEBIAN/${script}"
>                 #!/bin/sh
>
> @@ -84,7 +93,15 @@ install_linux_image () {
>                 # Tell initramfs builder whether it's wanted
>                 export INITRD=3D$(if_enabled_echo CONFIG_BLK_DEV_INITRD Y=
es No)
>
> -               test -d ${debhookdir}/${script}.d && run-parts --arg=3D"$=
{KERNELRELEASE}" --arg=3D"/${installed_image_path}" ${debhookdir}/${script}=
.d
> +               # run-parts will error out if one of its directory argume=
nts does not
> +               # exist, so filter the list of hook directories according=
ly.
> +               hookdirs=3D
> +               for dir in ${debhookdir}; do
> +                       test -d "\$dir/${script}.d" || continue
> +                       hookdirs=3D"\$hookdirs \$dir/${script}.d"
> +               done
> +               hookdirs=3D"\${hookdirs# }"
> +               test -n "\$hookdirs" && run-parts --arg=3D"${KERNELRELEAS=
E}" --arg=3D"/${installed_image_path}" \$hookdirs
>                 exit 0
>                 EOF
>                 chmod 755 "${pdir}/DEBIAN/${script}"
> --
> 2.39.2
>
>
--
Best Regards
Masahiro Yamada

