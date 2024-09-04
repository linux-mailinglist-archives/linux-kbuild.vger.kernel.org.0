Return-Path: <linux-kbuild+bounces-3355-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CB296AE36
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Sep 2024 04:05:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 37FFA1C23173
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Sep 2024 02:04:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2604A10A0D;
	Wed,  4 Sep 2024 02:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jcfB2oFo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F13FBF0;
	Wed,  4 Sep 2024 02:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725415496; cv=none; b=C+56r0AZswqHN+BOOB7Owe4A37Wm7HO4bvyMIwwzNhRGOp/b/zOfp05MH2dyCIbaCsEGBTjF+PS2ZnUgQyigmMcKvTVoFW0hUA5W0hsyxG0i9qSBOG+6IiFSUqwyAidlUfl09eFpa2VANdiQebpnnIj54vsxZxBhtWuxwNMf0nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725415496; c=relaxed/simple;
	bh=gjDEYDEGYaab6iQMQIrG64hkt0UrkZJho2SHEiVlOE8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GyT5guQxvBcbPIkDGcIGBgB1h8rzsdMJ8E+Z0xMC0h9ot5JXN5BGmzkCqi+ZoTY006G0n8FPAk0NAQCjDpmQpahMH23deYBaMmRMsojm8u9LLmpC6C9s7S526llWWFA1NlY2gtUY0s4Chtt48jdax+3ALPqFtUBllXlltvQucw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jcfB2oFo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CFDDC4CEC7;
	Wed,  4 Sep 2024 02:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725415495;
	bh=gjDEYDEGYaab6iQMQIrG64hkt0UrkZJho2SHEiVlOE8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jcfB2oFoMCW5rj3TTpTsKnTR6FZU90Jd8SA0/cB5YWREbPDLIRJYskZ+i5n5TBgeo
	 qCgon0JC02NBSmhXKbbmvoUaYAFJStGrt9yr3dKt0wOGD6+TjHoANaRXiyDxdpLZUJ
	 NvNbkMOp6fN3miFP/G5eo/HW5Ff2tu/dnSXJ6KPuq3PX+Se2togXOBXw2EFOBthe0l
	 6XGJVZ99ABeuR2tfqG5JpaLiYZUhQvWEWJ6+/6STemGaXlMzdeViMFzy9bwUtHyRGJ
	 nUkEfqM0GQ3WZJhR+qn4mOguhqZxAS0usVljzHI1pWRLCbb6lxWXbub6UW725pFEVf
	 +dDEMg2WNvV+A==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2f4f24263acso90480891fa.0;
        Tue, 03 Sep 2024 19:04:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX/Ctkr77soFGYrZBtZw59QlAaBTQT3CGPpd9HcpO1N7Wo1A80NNJkmPwYk/iI6/Ar+ID+TZcN2liZSVeo=@vger.kernel.org, AJvYcCXVwU1fJ9ewBX+JS/qjzxEAKfR1/mv47z9ctVrCluF2EN6pXWD9EA9Uh22+Z5pCIxkRG9IfIvaOWFxtG2Wn@vger.kernel.org
X-Gm-Message-State: AOJu0YzwZSZLEbfVCZ32MSDqUltB9oDMFLhwTdkJY4Xr6E1y60/gJz7l
	EPal7z4CHkHLFbbfCGZiXoUTSUnnbQThhz4t+YQ1U3xqmrQT2FSSWUA/CuEnh/VYsmHzzYvoVe1
	ltIuRx9e1oZ6yBqn7qx/0TatvLQw=
X-Google-Smtp-Source: AGHT+IEw0wupQ6/0yZccqEPItnn4emPRy32JyqKzgm8XDKw0z7NfvjUafWDNFEN/qAkSgOgNFSEgTWzW1WFw9AmGWoc=
X-Received: by 2002:a2e:612:0:b0:2f3:f9f1:4799 with SMTP id
 38308e7fff4ca-2f61089390cmr127357461fa.31.1725415494239; Tue, 03 Sep 2024
 19:04:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240902160828.1092891-1-ojeda@kernel.org>
In-Reply-To: <20240902160828.1092891-1-ojeda@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 4 Sep 2024 11:04:18 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQf4xpnypbBNA0PJqeBnHqCn7YnAg8kcay6dyYYSSLDmg@mail.gmail.com>
Message-ID: <CAK7LNAQf4xpnypbBNA0PJqeBnHqCn7YnAg8kcay6dyYYSSLDmg@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: pahole-version: improve overall checking and
 error messages
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 3, 2024 at 1:09=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wrot=
e:
>
> Like patch "rust: suppress error messages from
> CONFIG_{RUSTC,BINDGEN}_VERSION_TEXT" [1],

Better to point the commit instead of the patch in ML.


Like commit 5ce86c6c8613 ("rust: suppress error messages
from CONFIG_{RUSTC,BINDGEN}_VERSION_TEXT"),









> do not assume the file existing
> and being executable implies executing it will succeed.
>
> Instead, bail out if executing it fails for any reason, as well as if
> the program does not print to standard output what we are expecting from
> `pahole --version`. The script needs to ensure that it always returns
> an integer, since its output will go into a Kconfig `int`-type symbol.
>
> In addition, check whether the program exists first, and provide
> error messages for each error condition, similar to how it is done in
> e.g. `scripts/rust_is_available.sh`.
>
> For instance, currently `pahole` may be built for another architecture
> or may be a program we do not expect that fails:
>
>     $ echo 'bad' > bad-pahole
>     $ chmod u+x bad-pahole
>     $ make PAHOLE=3D./bad-pahole defconfig
>     ...
>     ./bad-pahole: 1: bad: not found
>     init/Kconfig:112: syntax error
>     init/Kconfig:112: invalid statement
>
> With this applied, we get instead:
>
>     ***
>     *** Running './bad-pahole' to check the pahole version failed with
>     *** code 127. pahole will not be used.
>     ***
>     ...
>     $ grep CONFIG_PAHOLE_VERSION .config
>     CONFIG_PAHOLE_VERSION=3D0
>
> Similarly, `pahole` currently may be a program that returns successfully,
> but that does not print the version that we would expect:
>
>     $ echo 'echo' > bad-pahole
>     $ chmod u+x bad-pahole
>     $ make PAHOLE=3D./bad-pahole defconfig
>     ...
>     init/Kconfig:114: syntax error
>     init/Kconfig:114: invalid statement
>
> With this applied, we get instead:
>
>     ***
>     *** pahole './bad-pahole' returned an unexpected version output.
>     *** pahole will not be used.
>     ***
>     ...
>     $ grep CONFIG_PAHOLE_VERSION .config
>     CONFIG_PAHOLE_VERSION=3D0
>
> Finally, with this applied, if the program does not exist, we get:
>
>     $ make PAHOLE=3D./bad-pahole defconfig
>     ...
>     ***
>     *** pahole './bad-pahole' could not be found. pahole will not be used=
.
>     ***
>     ...
>     $ grep CONFIG_PAHOLE_VERSION .config
>     CONFIG_PAHOLE_VERSION=3D0
>
> Link: https://lore.kernel.org/rust-for-linux/20240727140302.1806011-1-mas=
ahiroy@kernel.org/ [1]
> Co-developed-by: Nicolas Schier <nicolas@fjasle.eu>
> Signed-off-by: Nicolas Schier <nicolas@fjasle.eu>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
> v1: https://lore.kernel.org/all/20240728125527.690726-1-ojeda@kernel.org/
> v2:
>
> Reworked to catch successful programs that may not output what we expect =
from
> pahole as well as to do the checking step-by-step (for better error messa=
ges).
>
> I didn't change the regular expression to reduce the changes (except addi=
ng
> `p`) -- it can be improved separately.
>
> Also, please note that I added Nicolas as co-author since he proposed par=
t of
> the solution, but he has not formally signed off yet.
>
>  scripts/pahole-version.sh | 30 +++++++++++++++++++++++++++---
>  1 file changed, 27 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/pahole-version.sh b/scripts/pahole-version.sh
> index f8a32ab93ad1..cdb80a3d6e4f 100755
> --- a/scripts/pahole-version.sh
> +++ b/scripts/pahole-version.sh
> @@ -5,9 +5,33 @@
>  #
>  # Prints pahole's version in a 3-digit form, such as 119 for v1.19.
>
> -if [ ! -x "$(command -v "$@")" ]; then
> -       echo 0
> +set -e
> +trap "echo 0; exit 1" EXIT
> +
> +if ! command -v "$@" >/dev/null; then
> +       echo >&2 "***"
> +       echo >&2 "*** pahole '$@' could not be found. pahole will not be =
used."
> +       echo >&2 "***"
> +       exit 1
> +fi
> +
> +output=3D$("$@" --version 2>/dev/null) || code=3D$?
> +if [ -n "$code" ]; then
> +       echo >&2 "***"
> +       echo >&2 "*** Running '$@' to check the pahole version failed wit=
h"
> +       echo >&2 "*** code $code. pahole will not be used."
> +       echo >&2 "***"
> +       exit 1
> +fi
> +
> +output=3D$(echo "$output" | sed -nE 's/v([0-9]+)\.([0-9]+)/\1\2/p')
> +if [ -z "${output}" ]; then
> +       echo >&2 "***"
> +       echo >&2 "*** pahole '$@' returned an unexpected version output."
> +       echo >&2 "*** pahole will not be used."
> +       echo >&2 "***"
>         exit 1
>  fi
>
> -"$@" --version | sed -E 's/v([0-9]+)\.([0-9]+)/\1\2/'
> +echo "${output}"
> +trap EXIT
>
> base-commit: 431c1646e1f86b949fa3685efc50b660a364c2b6
> --
> 2.46.0



--=20
Best Regards
Masahiro Yamada

