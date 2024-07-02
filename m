Return-Path: <linux-kbuild+bounces-2317-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A39EA924631
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Jul 2024 19:32:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B48A1F217BE
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Jul 2024 17:32:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E41C1BD00C;
	Tue,  2 Jul 2024 17:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G7B+ZKL6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C6363D;
	Tue,  2 Jul 2024 17:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719941531; cv=none; b=A1OSuQoBEV/AsMIR1wNT+bYwNmVQadLOUa5v8D6DUYIdfsdnxKVYdsM8DvB93RC9x3cqUbZNUHneSIr/SH+SLjlsN5NThy2rxmOjkfYiPmaR0NhxEzFzDGJXUjwXU77XJrqhYL+4QtQDqPoy06P8MNbJ6Ygdub4tSobrzdNBt6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719941531; c=relaxed/simple;
	bh=t3HIDVDXEqNoB5mkt4w5bUByKXNZ3qQOdwiL9G/B48Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qWUDh8wc+SF6Ylpcdd8y+wrXZgx6xwP4mpyClkmK+DNE3un0eOlpHGEWp4fdMRhEfxl7irrdfWejt/JALQ8x+JdwRDMHeBfULSa6WiIAjQ01JFOazBNr20dGzE6uL0aI5SiDZdHMm1wgQiLAvAHQfiIoPUzPD29AhylDstjggI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G7B+ZKL6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDA01C4AF07;
	Tue,  2 Jul 2024 17:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719941531;
	bh=t3HIDVDXEqNoB5mkt4w5bUByKXNZ3qQOdwiL9G/B48Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=G7B+ZKL6XHM6S56YL7MHV9ZO6DpY7P+xqh+C75A2F9zbo1ozXvTK3yGT9EHPwQi86
	 Gb4FumTqSrfNld5oltuqDCIY1Y+6J3UZLSmGPXo8IDDsC1b+T05V3C92ay+CkG8dl4
	 8p8Puf6hcFvy7bueNSD+8GHx+451rI642HxoB3RqFrEZAz2i3UTZ5Q0fnR2rsTCcoD
	 5W94YYPmCK0QwY385aKz9ArXF5SEH3tY0S0aepUwkpA7jE3WcXPNkoUXHu3wwe/dPE
	 i5oGDyGoMYpTs+ANIqOXCIuFyxNj8uZPlOAg/Q6VpmnB5sK/B2wLNkq/dSpZGzDe3g
	 WDhhcCXS0qd7A==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ebec2f11b7so50899261fa.2;
        Tue, 02 Jul 2024 10:32:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVQszmmqCUW45BWtvANjwMzOQJVmUSxNMje9+97USPSZF4aIZG3Mk5ND1cY7pnArrC7jT3f7VmSf9hotSQ2XhcZskTJe/k+k3JuF/dLGJdPsnIMb6j3wFzpkOo4nnUyakkUbSzv/TEhJO3H
X-Gm-Message-State: AOJu0Ywwsw5HwVHSm/pq5ENyeCmxlFDKtmYs2xYoXA/LWRFd2Z9x+F/z
	hJpfKelMsNx9JG5QlnluEnCsRUSdbZeKg8uaVO155MRlJB0Uh6LkhetdmatD4RXWzsyBucU84YA
	JtZ7UzTAr6o0cdDFu2oVqePgDd30=
X-Google-Smtp-Source: AGHT+IFvnAjEHAejnpwHKoTAFmR7dm14Q4hDOyrN+iuQ6xhb77eTs0VuSTWv8wYtoC42qpafg1V23gP8EWtEf0nSdSc=
X-Received: by 2002:a05:651c:4d2:b0:2ec:5467:dcb6 with SMTP id
 38308e7fff4ca-2ee5e6bd1cfmr56385411fa.52.1719941529629; Tue, 02 Jul 2024
 10:32:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240625-mkdebian-check-if-optional-vars-are-defined-v1-1-53f196b9f83a@avm.de>
In-Reply-To: <20240625-mkdebian-check-if-optional-vars-are-defined-v1-1-53f196b9f83a@avm.de>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 3 Jul 2024 02:31:33 +0900
X-Gmail-Original-Message-ID: <CAK7LNASRgcmSBTMj=wq3uo441hRceEJ19ga_mFDf5DCEPvh8LQ@mail.gmail.com>
Message-ID: <CAK7LNASRgcmSBTMj=wq3uo441hRceEJ19ga_mFDf5DCEPvh8LQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: deb-dpkg: Check optional env variables before use
To: Nicolas Schier <n.schier@avm.de>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2024 at 9:46=E2=80=AFPM Nicolas Schier <n.schier@avm.de> wr=
ote:
>
> Add checks to mkdebian for undefined optional environment variables
> before evaluating them.
>
> Some variables used by scripts/package/mkdebian are fully optional and
> not set by kbuild.  In order to allow enabling 'set -u' (shell script
> exits on dereference of undefined variables), introduce the explicit
> checking.


This patch is not enough for enabling -u.



email=3D${DEBEMAIL-$EMAIL}

causes an error.


$ unset DEBEMAIL; unset EMAIL; make deb-pkg
  GEN     debian
./scripts/package/mkdebian: 128: EMAIL: parameter not set




I can do this work myself.









>
> Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
> Signed-off-by: Nicolas Schier <n.schier@avm.de>
> ---
> This allows application of the original patch
>    [PATCH 1/2] kconfig: add -e and -u options to *conf-cfg.sh scripts
>    [PATCH 2/2] kbuild: package: add -e and -u options to shell scripts
> as sent https://lore.kernel.org/linux-kbuild/20240611160938.3511096-1-mas=
ahiroy@kernel.org/
> ---
>  scripts/package/mkdebian | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
> index b9a5b789c655..2a7bb05c7f60 100755
> --- a/scripts/package/mkdebian
> +++ b/scripts/package/mkdebian
> @@ -19,7 +19,7 @@ if_enabled_echo() {
>  }
>
>  set_debarch() {
> -       if [ -n "$KBUILD_DEBARCH" ] ; then
> +       if [ "${KBUILD_DEBARCH:+set}" ] ; then
>                 debarch=3D"$KBUILD_DEBARCH"
>                 return
>         fi
> @@ -147,7 +147,7 @@ fi
>
>  # Some variables and settings used throughout the script
>  version=3D$KERNELRELEASE
> -if [ -n "$KDEB_PKGVERSION" ]; then
> +if [ "${KDEB_PKGVERSION:+set}" ]; then
>         packageversion=3D$KDEB_PKGVERSION
>  else
>         packageversion=3D$(${srctree}/scripts/setlocalversion --no-local =
${srctree})-$($srctree/scripts/build-version)
> @@ -164,7 +164,7 @@ debarch=3D
>  set_debarch
>
>  # Try to determine distribution
> -if [ -n "$KDEB_CHANGELOG_DIST" ]; then
> +if [ "${KDEB_CHANGELOG_DIST:+set}" ]; then
>          distribution=3D$KDEB_CHANGELOG_DIST
>  # In some cases lsb_release returns the codename as n/a, which breaks dp=
kg-parsechangelog
>  elif distribution=3D$(lsb_release -cs 2>/dev/null) && [ -n "$distributio=
n" ] && [ "$distribution" !=3D "n/a" ]; then
>
> ---
> base-commit: 3893a22a160edd1c15b483deb3dee36b36ee4226
> change-id: 20240625-mkdebian-check-if-optional-vars-are-defined-a46cf0524=
e4e
>
> Best regards,
> --
> Nicolas Schier
>


--
Best Regards
Masahiro Yamada

