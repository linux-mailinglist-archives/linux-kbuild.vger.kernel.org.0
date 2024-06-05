Return-Path: <linux-kbuild+bounces-2003-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C9EEC8FCF5A
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Jun 2024 15:33:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C839B1C21C25
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Jun 2024 13:33:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE902194082;
	Wed,  5 Jun 2024 13:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iSJpc1dv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97FE192B83
	for <linux-kbuild@vger.kernel.org>; Wed,  5 Jun 2024 13:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717592760; cv=none; b=nN4Mwi674DpyhVKGsx8t181iXhRmTt8Roi2zF7nrZqKNFTSo5vzubnipnN+x3/VWa289vl+l63uTP3ck1iZ44QrIKnOYShSq9f3ri6JL/BnKIFDeDy2zT31JlOymyPGFb2l55MGuRRCyc4xqJJbptVoDZyV7k1HOHnzhj1+5BbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717592760; c=relaxed/simple;
	bh=+RugKghC5ikdg6L5c8XRNvD7x+Jy5Cco+gyiKo0mQxU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E3gmunW4nCbeyHFdI6BcTB4bIXz28NU58cHnE1BJm0J+t3R8DD+JfuwT2rOjSEMmZp8dPyGSDgE4TTMV9HzUM//8sRWwUZ5CaERi3ZoDbd2nSqcRkFa98L6rcMF1P7QD4ei7f0pCnoHSJXxGo7y6LbaqDhAwgx8bn3Ov8i3XuIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iSJpc1dv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DC63C32782
	for <linux-kbuild@vger.kernel.org>; Wed,  5 Jun 2024 13:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717592760;
	bh=+RugKghC5ikdg6L5c8XRNvD7x+Jy5Cco+gyiKo0mQxU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iSJpc1dvb29UsIEqOV7mkthKSEJsrNA2sA5Qjt7CgEQXfr9BAWWcfx/WgG35uIk+G
	 E0hYCUICrVys01aNwgW7GOCjhGbj9SdNMfv+kmhirDdySi4GU3lCTS61bGLNg7YHkm
	 KNUB6eTvpdQBeFyJOcD5DtXoSvGi4tIFtfXHp0v3QO9I09IY5BhG61PYHvJ0PN0XmF
	 TUHhhZM/qE/AZNSr+TaeavQYKTXLYmfN5xXCE9Z+SVwiRSQp8QA/kTFuR8EwuGA6Xf
	 cG6GFEGoa5S7K1bpmVYSfWKbxRdQWKj8bbQN4HQb88uWaQ7PmaZQ+oStZu61cIPl+J
	 XOSNYS8SsUInw==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2eabd22d441so29929471fa.2
        for <linux-kbuild@vger.kernel.org>; Wed, 05 Jun 2024 06:06:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXaO69zggfHw/2/xvVKgGE9t4hvJwfrLoTgUZrT4wMgU4SlrdV0D5ThuK145mGTHvz2KHyE+zHliAwCI0dYESIxu2eG5KbXrfCopT5J
X-Gm-Message-State: AOJu0Yzv+d6IeSLJjKIAMsmYJpCQuH7+TMObFKEO+F4nYCS5P+jfKWl7
	GplXPy4r8KUcaB5pFbmUz3eumSQYH2TK7tLghUwkWkv7TaV9rvaXWdegpsFkx2Xv2GSP8Y997G5
	XGFT0rbQjjyegoVX9GHHS4RyMUzk=
X-Google-Smtp-Source: AGHT+IEMUYO/z2Hn1qi0ETqZ4kLv4dpw9ZzmZsFOhKpdLXIPPNBAQm1Clrju28Ai7h4D652KLKQAYCGVxhPHuIBMQyM=
X-Received: by 2002:a05:651c:1069:b0:2e5:4c78:1227 with SMTP id
 38308e7fff4ca-2eac79ed811mr16806971fa.31.1717592758839; Wed, 05 Jun 2024
 06:05:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240605034903.373617-2-mailingradian@gmail.com>
In-Reply-To: <20240605034903.373617-2-mailingradian@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 5 Jun 2024 22:05:22 +0900
X-Gmail-Original-Message-ID: <CAK7LNASjUesga5pwtaV9aRd_MG7infjistFTsSWbvMpytggaEg@mail.gmail.com>
Message-ID: <CAK7LNASjUesga5pwtaV9aRd_MG7infjistFTsSWbvMpytggaEg@mail.gmail.com>
Subject: Re: [PATCH -next] kbuild: explicitly run mksysmap as sed script from link-vmlinux.sh
To: Richard Acayan <mailingradian@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Kent Overstreet <kent.overstreet@linux.dev>, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 5, 2024 at 12:49=E2=80=AFPM Richard Acayan <mailingradian@gmail=
.com> wrote:
>
> In commit b18b047002b7 ("kbuild: change scripts/mksysmap into sed
> script"), the mksysmap script was transformed into a sed script,
> made directly executable with "#!/bin/sed -f". Apparently, the path to
> sed is different on NixOS, fixed by using the env command.
>
> To accommodate the number of arguments above the normal maximum for
> hashbangs, the -S flag of env was used (as in
> "#!/usr/bin/env -S sed -f"). However, env -S is a GNU extension.
> Explicitly use sed instead of relying on the executable shebang to keep
> compatibility with build environments using Busybox.


I am fine with the code.

Kent will drop his local commit, so please reword the commit description
without 973eca8db557 in mind.



> Fixes: 973eca8db557 ("kbuild: mksysmap now works on nixos")


Please replace this tag with:

Fixes: b18b047002b7 ("kbuild: change scripts/mksysmap into sed script")



Thanks.







> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  scripts/link-vmlinux.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index 46ce5d04dbeb..518c70b8db50 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -193,7 +193,7 @@ kallsyms_step()
>  mksysmap()
>  {
>         info NM ${2}
> -       ${NM} -n "${1}" | "${srctree}/scripts/mksysmap" > "${2}"
> +       ${NM} -n "${1}" | sed -f "${srctree}/scripts/mksysmap" > "${2}"
>  }
>
>  sorttable()
> --
> 2.45.2
>


--=20
Best Regards
Masahiro Yamada

