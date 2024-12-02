Return-Path: <linux-kbuild+bounces-4937-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 663759E0B4F
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Dec 2024 19:50:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4DD66B2733D
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Dec 2024 15:42:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05884209681;
	Mon,  2 Dec 2024 15:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rtPI4Xl7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24F81F943D
	for <linux-kbuild@vger.kernel.org>; Mon,  2 Dec 2024 15:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733154162; cv=none; b=P4dn6I9yzq6RkyD3ch8ARv22dsvbo4qAOsvnYbu3YypXxfEqe8qcMkBS8xmOT3/WDCkcy/Z7nn8TdF6GpTNEjMOJWXLm1fKa/91FSZqoTA6T3JcEjbiRaWt4HkxpjG4irAxS3ijV4c+HKIWBcVQ41x7hvS0wjzeFsGcy2VPsBXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733154162; c=relaxed/simple;
	bh=JFUwK2FbHnRfQYNufi6mHGY/idpaDVbQjY93yTPdrgw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AiMYFp8HbvCdH4psFFV99qOinmFB3dWg70a1tzWMH5tnErZd2rZO755AIh6r1XEFrLHvHmCfsyLT6Gkm4TBwQzcsrjLUBV8edGAeKUJIiOOFjA6/Of1ON8rQtHoX3lYpbFDgBh7Ay6sRDM6Kyi0+yID6VzSDKTkmD0Wwj/9uyOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rtPI4Xl7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27B3EC4CEE1
	for <linux-kbuild@vger.kernel.org>; Mon,  2 Dec 2024 15:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733154162;
	bh=JFUwK2FbHnRfQYNufi6mHGY/idpaDVbQjY93yTPdrgw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rtPI4Xl7pt3gpWt450K/IkY9ZuDwfwPHPb/zxIozNhLcV0WqB88rYW6xarGiNiaih
	 m28WNx3z+4suoEyRxO3HtxtNSZr4RdA3o4EIUGYvlcIvtikeSLwurfQZ01vCNh6BdN
	 qdaDvI3EX6bdPV+fvuDJKAqkJ06FX/J6FIuNI8/Otex4RN4uv7m2Cc5em9w4S7apBI
	 C0gbtoelmQqVQMA/Fly+VnZG7C2roSZoWx31RPVTws0TEo2Sf4Sp1ut43xi/nNjZaX
	 H06GhA4Osn3TjvkUOOCpFlHiA3Qwk8c8WAJkUFDzR2sOodiy3D5To33UwQS724oNmp
	 bnEWdsL7GVZ5g==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53df6322ea7so7441854e87.0
        for <linux-kbuild@vger.kernel.org>; Mon, 02 Dec 2024 07:42:41 -0800 (PST)
X-Gm-Message-State: AOJu0YzANeexzFja4w0xGKaUJjT1bRQOdTvB3KNkWFPSni4pwkWeJslO
	zSDD+w7HV1onSC34z3eSkMV+jWVSOlKtOpkJyjXMjAMGrWkeGN6I0UCw+iYbz5iEXNQcLQMpmPo
	GuXqok7pmmb52z4V5pgPoRQaT6j8=
X-Google-Smtp-Source: AGHT+IFjIGh6UV+Kc+7Bbd0SRNL9HPrnY3JiGy/jac3sltAq2yTuQHzKEvHfLGoMVdwX8SUfZMkWq5dU6A1S+EB2lns=
X-Received: by 2002:a05:6512:3d05:b0:53d:edf6:6fc1 with SMTP id
 2adb3069b0e04-53df0016101mr17365042e87.0.1733154160412; Mon, 02 Dec 2024
 07:42:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAK7LNARMBTf8usS0UxZ06gVZDbTTrhXt73mpVaGZRby-Zcdtsw@mail.gmail.com>
 <20241128062940.1708257-1-josch@mister-muffin.de> <20241128062940.1708257-2-josch@mister-muffin.de>
In-Reply-To: <20241128062940.1708257-2-josch@mister-muffin.de>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 3 Dec 2024 00:42:02 +0900
X-Gmail-Original-Message-ID: <CAK7LNATyvVGt8j7bcwsWKaophdBU3x53=_UnPajKjtSMtoS9iA@mail.gmail.com>
Message-ID: <CAK7LNATyvVGt8j7bcwsWKaophdBU3x53=_UnPajKjtSMtoS9iA@mail.gmail.com>
Subject: Re: [PATCH 1/1] scripts/package/builddeb: allow hooks also in /usr/share/kernel
To: Johannes Schauer Marin Rodrigues <josch@mister-muffin.de>
Cc: linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 28, 2024 at 3:29=E2=80=AFPM Johannes Schauer Marin Rodrigues
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
>  scripts/package/builddeb | 44 ++++++++++++++++++++++++++++++++--------
>  1 file changed, 36 insertions(+), 8 deletions(-)
>
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index 441b0bb66e0d..2772146a76ce 100755
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
> +       done
>
> -               mkdir -p "${pdir}/DEBIAN"
> +       mkdir -p "${pdir}/DEBIAN"
> +       for script in postinst postrm preinst prerm; do
>                 cat <<-EOF > "${pdir}/DEBIAN/${script}"
>                 #!/bin/sh
>
> @@ -84,7 +93,26 @@ install_linux_image () {
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
> +               test -n "\$hookdirs" || exit 0
> +
> +               # If more than one hook directory remained, check version=
 of run-parts. If
> +               # run-parts is too old, fall back to only processing the =
first.
> +               case \$hookdirs in *" "*) if ! run-parts --help 2>&1 \
> +                               | grep -Fxq "Usage: run-parts [OPTION]...=
 DIRECTORY [DIRECTORY ...]"; then
> +                               echo "E: run-parts >=3D5.21 is required f=
or multiple hook directories, falling back to $firsthookdir" >&2

Same comment as in the previous version.
If both /etc/kernel/postinst.d/ and /usr/share/kernel/postinst.d/ exist,
can we assume the run-parts>=3D5.12 on that system?

Do we need to check the help message and offer the fallback mechanism?






> +                               test -d "${firsthookdir}/${script}.d" || =
exit 0
> +                               hookdirs=3D"${firsthookdir}/${script}.d"
> +                       fi
> +               esac
> +               run-parts --arg=3D"${KERNELRELEASE}" --arg=3D"/${installe=
d_image_path}" \$hookdirs
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

