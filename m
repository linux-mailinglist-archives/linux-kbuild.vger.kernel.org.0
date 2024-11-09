Return-Path: <linux-kbuild+bounces-4596-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF339C2C23
	for <lists+linux-kbuild@lfdr.de>; Sat,  9 Nov 2024 12:22:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5308A282684
	for <lists+linux-kbuild@lfdr.de>; Sat,  9 Nov 2024 11:22:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0D70154C09;
	Sat,  9 Nov 2024 11:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XPx9DSw2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8640154BF5;
	Sat,  9 Nov 2024 11:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731151371; cv=none; b=O6Aqd6cGThxLqB2CKuVP+4ihfG88yWwL6mPYPY6+IXjzpgGLnSNfpCp6qyRzXTpQ7ZXv2+AMov1sFhEuke0RbapC8dU4FQrxtYUgHx0RT9W44iRfIL+hGISplcqzNYDBTSHzLbotPJxIpA1ZVue6+19S0dpS2xAjdaMCoiJi4Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731151371; c=relaxed/simple;
	bh=0vQvO3Tqj0HJ08XaZcwUPJplKk1OoO1ba0L7JKxXApk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=krB0qBbW9TbUjaz6XrWyXHjWmh16pDgfNjz8WhF/H4cExT+UGRrs3ubEh7BlmzQGSlAJ743I3GTTza+AL8Ckc4bBoUpnW7Eh/wK1XMLNwQCtqoSbO3jzv7KGT1+dqtLrgVy+sXUAJuw1sR+UTduwWf63umCph4fpoXU6rvy4CQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XPx9DSw2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 332C9C4CECF;
	Sat,  9 Nov 2024 11:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731151371;
	bh=0vQvO3Tqj0HJ08XaZcwUPJplKk1OoO1ba0L7JKxXApk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XPx9DSw2jPQ9zKWD4uxI5ypyG6JBbAf2FH9QO1gkUXgIK2FwgEKPjGEV36HkKf/2V
	 /RTs0wES378/yaYFA/7S0AcXiqPZQKCAzWPVMANs2WuiJEnlP0t+3uc52Spb8F5uOo
	 Clm42FoUKvolBIwVp38rHI2eMUw67SWDr4BcOGlRj+tpn17sD2YoAsPgy/G8qkszPJ
	 eam/nZ41MIfjrV+KzHUHlB8AQ8a/t6Mtw0O7hQDzBFstDRktAULAsAIw0N1DxGSBKz
	 xOUJ8rnipoz+QTwcvQ5prZ7YDrSZs4UNemwEKFdbJf7t2gDjT+IHKzLGyhPggXy99U
	 ahqbD/ji5/xzA==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2fb5111747cso25421891fa.2;
        Sat, 09 Nov 2024 03:22:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVmxKFytii2U6l9GUz4oNWhvyCZfhOJ9WGzCdFb6KpDYWJbgfVDO0d+joU7zgzZEAWJzs7iqY11YHS+NOHX@vger.kernel.org, AJvYcCWFKp+aAS49ON0GZSe33o6Vqh6Hhg4rcZuNqIVWArcmX+O/l0/wKDPlRGA3RKF/UzgguwdQ3pF+AWRzTv0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/JkXDPd589Uysjd9pit/RhMzQjzjwLGvzuZul9Z0rBpAkqYnz
	3dNEmW0z0IP6/jyuDQen8fiep5rLXLqZPpo1eaaJNPW7mU9z8EgGhu59syQIOrwu9R5+hGLbofW
	s4dZ0laHv8aqLqNE6MfM1hBZKljk=
X-Google-Smtp-Source: AGHT+IEmUEtfAVJUkSa5cIuswQlLezIgH5Buph6/rMA613evThU6avs7umAO7qoTvRNrXX0varRiaJiCT64sHeY7jLM=
X-Received: by 2002:a2e:bc1d:0:b0:2fb:5da7:47a1 with SMTP id
 38308e7fff4ca-2ff20244ebcmr36913121fa.16.1731151369716; Sat, 09 Nov 2024
 03:22:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241107150508.2835706-1-matt@readmodwrite.com>
In-Reply-To: <20241107150508.2835706-1-matt@readmodwrite.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 9 Nov 2024 20:22:13 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS06CGh-nN7Q-4=mWeuRhC2ug+Nc9oLME9D+TYe_WBTGg@mail.gmail.com>
Message-ID: <CAK7LNAS06CGh-nN7Q-4=mWeuRhC2ug+Nc9oLME9D+TYe_WBTGg@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: deb-pkg: Don't fail if modules.order is missing
To: Matt Fleming <matt@readmodwrite.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org, 
	kernel-team@cloudflare.com, Matt Fleming <mfleming@cloudflare.com>, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 8, 2024 at 12:05=E2=80=AFAM Matt Fleming <matt@readmodwrite.com=
> wrote:
>
> From: Matt Fleming <mfleming@cloudflare.com>
>
> Kernels built without CONFIG_MODULES might still want to create -dbg deb
> packages but install_linux_image_dbg() assumes modules.order always
> exists. This obviously isn't true if no modules were built, so we should
> skip reading modules.order in that case.
>
> Fixes: 16c36f8864e3 ("kbuild: deb-pkg: use build ID instead of debug link=
 for dbg package")
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: linux-kbuild@vger.kernel.org
> Signed-off-by: Matt Fleming <mfleming@cloudflare.com>


Applied to linux-kbuild.
Thanks!

> ---
>
> Changes in v3:
>  - Wrap modules.order logic in 'if is_enabled CONFIG_MODULES'
>
>  scripts/package/builddeb | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)
>
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index 441b0bb66e0d..fb686fd3266f 100755
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -96,16 +96,18 @@ install_linux_image_dbg () {
>
>         # Parse modules.order directly because 'make modules_install' may=
 sign,
>         # compress modules, and then run unneeded depmod.
> -       while read -r mod; do
> -               mod=3D"${mod%.o}.ko"
> -               dbg=3D"${pdir}/usr/lib/debug/lib/modules/${KERNELRELEASE}=
/kernel/${mod}"
> -               buildid=3D$("${READELF}" -n "${mod}" | sed -n 's@^.*Build=
 ID: \(..\)\(.*\)@\1/\2@p')
> -               link=3D"${pdir}/usr/lib/debug/.build-id/${buildid}.debug"
> -
> -               mkdir -p "${dbg%/*}" "${link%/*}"
> -               "${OBJCOPY}" --only-keep-debug "${mod}" "${dbg}"
> -               ln -sf --relative "${dbg}" "${link}"
> -       done < modules.order
> +       if is_enabled CONFIG_MODULES; then
> +               while read -r mod; do
> +                       mod=3D"${mod%.o}.ko"
> +                       dbg=3D"${pdir}/usr/lib/debug/lib/modules/${KERNEL=
RELEASE}/kernel/${mod}"
> +                       buildid=3D$("${READELF}" -n "${mod}" | sed -n 's@=
^.*Build ID: \(..\)\(.*\)@\1/\2@p')
> +                       link=3D"${pdir}/usr/lib/debug/.build-id/${buildid=
}.debug"
> +
> +                       mkdir -p "${dbg%/*}" "${link%/*}"
> +                       "${OBJCOPY}" --only-keep-debug "${mod}" "${dbg}"
> +                       ln -sf --relative "${dbg}" "${link}"
> +               done < modules.order
> +       fi
>
>         # Build debug package
>         # Different tools want the image in different locations
> --
> 2.34.1
>


--=20
Best Regards
Masahiro Yamada

