Return-Path: <linux-kbuild+bounces-6404-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5611AA7B986
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Apr 2025 11:03:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9CEE87A6C34
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Apr 2025 09:02:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A9371A00FA;
	Fri,  4 Apr 2025 09:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WRpSeJbQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E9817A2FD;
	Fri,  4 Apr 2025 09:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743757366; cv=none; b=Ek5wfLwZEkBHfiAHaVuwjWAPDYGt4LOFkZyti31JIGGSZLxJ3x7+ZNVJoXMtoEqhPzDsO71oYqqGXh0my/P6qultH5mj0q1iXMdXZPa8VOVsaaH0nY647IfVX9BwUQWshrvrlbST1+Hn4PyyRxrt7KD1e+jCxsTBl52uyPf1+Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743757366; c=relaxed/simple;
	bh=ybEN/+MVdR+Z2PVAWEdlwJhHO/+OPFI6MPFsScL0VXE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TG5nhyklGWt013IJ8Q5Cod+Atu/Imjr/5WANrNYvcdyjxnUwpPjCDD2HL6LViE0q9KnRffsr0dfk9d1kiYcdMf8WwHI/2FEvY26B9LbSOt0LnEcHzQHnIwsZlYjeIzHtJdheWtTWVrkhy+vMRv2Wnzj6mbH3GOY/oSqGNtA6gbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WRpSeJbQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6413EC4CEDD;
	Fri,  4 Apr 2025 09:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743757365;
	bh=ybEN/+MVdR+Z2PVAWEdlwJhHO/+OPFI6MPFsScL0VXE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WRpSeJbQKyuUDx2u4/NBlEpMuDV/UdjF5FHUt3By62mCTZoxme/SHhrG6BbERJ0zx
	 Kof6f0CY1hxQaF/WesKXZtA5v+7A3j3iyDEHX8M0sXd2vqWLopQ4a/bY6Xt2Y4znkp
	 oJgMFe5EacASyH8B6OzUHtBKQDBonSdW9xKfnP/Wio/YQJRc46+ZnWca6/RZatvaRI
	 VG0OI4XVlqnP8XswbgdFQ17mO3nBlzS9wk398lkuvjacZseOtXUSZNv49TOwMIKuOU
	 WR8bBi9ICnN4KXmZqPaG0SgtO4BkI381g3caWZe9OpeTRPihcamc0kDvdAm3FqcvZk
	 DPeN4GJZhQW2A==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54b0d638e86so2067591e87.1;
        Fri, 04 Apr 2025 02:02:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVXSNjQ4EZ33y0z8jXWHkTaMujjAILTmA1xJNR3MeOeT6/aczLt8eF72Y0Hps84OMMwmbNR+QZcAEJ+NOg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrr6FS5dk6ht1tCd5NXeH9VrnKZLA919e/UuVVq9CHgwWxeTpP
	G5dh1dsDBil+zr+DuPfKCncXHAcl/AbKLPsdqUdUQAoUFt5wB5lWDBsaRsmxC1YjqX+JwWf36Bv
	cVMmkZvQFfw8XZMnpTt+pkhHBNlc=
X-Google-Smtp-Source: AGHT+IGRSm4+WIzfAJTm1OSKhZC/IeUbIYyKP9KJP535p52PaGbZjoxnmCrpbPjYHOjts4LtDqBtd/M8IfKquiiVqSE=
X-Received: by 2002:a05:6512:10d1:b0:54b:117c:8ef6 with SMTP id
 2adb3069b0e04-54c22801108mr538868e87.57.1743757364003; Fri, 04 Apr 2025
 02:02:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250328-fix-merge-config-v1-1-ee78797d1302@samsung.com>
In-Reply-To: <20250328-fix-merge-config-v1-1-ee78797d1302@samsung.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 4 Apr 2025 18:02:07 +0900
X-Gmail-Original-Message-ID: <CAK7LNASs5p0+YShD7HBFQmxEObr0px8gZmjLajAJrTLGc1uPkg@mail.gmail.com>
X-Gm-Features: AQ5f1JrC8YpOlyN2707XKMupNR7R4GAn2J78BuVec6mV6BfLKc6orPOh3gqzuU8
Message-ID: <CAK7LNASs5p0+YShD7HBFQmxEObr0px8gZmjLajAJrTLGc1uPkg@mail.gmail.com>
Subject: Re: [PATCH] kconfig: merge_config: use an empty file as initfile
To: Daniel Gomez <da.gomez@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Daniel Gomez <da.gomez@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 28, 2025 at 11:29=E2=80=AFPM Daniel Gomez <da.gomez@kernel.org>=
 wrote:
>
> From: Daniel Gomez <da.gomez@samsung.com>
>
> The scripts/kconfig/merge_config.sh script requires an existing
> $INITFILE (or the $1 argument) as a base file for merging Kconfig
> fragments. However, an empty $INITFILE can serve as an initial starting
> point, later referenced by the KCONFIG_ALLCONFIG Makefile variable
> if -m is not used. This variable can point to any configuration file
> containing preset config symbols (the merged output) as stated in
> Documentation/kbuild/kconfig.rst. When -m is used $INITFILE will
> contain just the merge output requiring the user to run make (i.e.
> KCONFIG_ALLCONFIG=3D<$INITFILE> make <allnoconfig/alldefconfig> or make
> olddefconfig).
>
> Instead of failing when `$INITFILE` is missing, create an empty file and
> use it as the starting point for merges.
>
> Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
> ---


You still could do 'touch .config' in advance, but
I do not have a strong option.

Applied to linux-kbuild. Thanks.

I quoted $INITFILE in order to fix a shellcheck warning.



diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config=
.sh
index ad35a60de350..79c09b378be8 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -113,7 +113,7 @@ shift;

 if [ ! -r "$INITFILE" ]; then
        echo "The base file '$INITFILE' does not exist. Creating one..." >&=
2
-       touch $INITFILE
+       touch "$INITFILE"
 fi

 MERGE_LIST=3D$*




> Commit b9fe99c5b994 ("kbuild: mergeconfig: move an error check
> to merge_config.sh") moves the check for .config to exist from
> scripts/kconfig/Makefile to the scripts/kconfig/merge_config.sh.
> But this is no longer necessary.
>
> This avoid having to run a make <target> to create a first .config file.
> Workflow:
>
> ./scripts/kconfig/merge_config.sh \
> -m .config \
> <fragment list>
>
> make olddefconfig
>
> Here the logs with upstream scripts/kconfig/merge_config.sh (to show
> .config is created with tinyconfig).
>
> make tinyconfig V=3D1
> {..}
> make -f ./scripts/Makefile.build obj=3Dscripts/kconfig tinyconfig
> KCONFIG_ALLCONFIG=3Dkernel/configs/tiny-base.config make -f ./Makefile al=
lnoconfig
> make -f ./scripts/Makefile.build obj=3Dscripts/basic
> make -f ./scripts/Makefile.build obj=3Dscripts/kconfig allnoconfig
> scripts/kconfig/conf  --allnoconfig Kconfig
>
> configuration written to .config
>
> make -f ./Makefile tiny.config
> make -f ./scripts/Makefile.build obj=3Dscripts/basic
> make -f ./scripts/Makefile.build obj=3Dscripts/kconfig tiny.config
> cmd_merge_fragments tiny.config
>   ./scripts/kconfig/merge_config.sh -m .config
> ./kernel/configs/tiny.config ./arch/x86/configs/tiny.config
> Using .config as base
> Merging ./kernel/configs/tiny.config
> Value of CONFIG_CC_OPTIMIZE_FOR_SIZE is redefined by fragment
> ./kernel/configs/tiny.config:
> Previous value: # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
> New value: CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy
>
> Value of CONFIG_KERNEL_XZ is redefined by fragment
> ./kernel/configs/tiny.config:
> Previous value: # CONFIG_KERNEL_XZ is not set
> New value: CONFIG_KERNEL_XZ=3Dy
>
> Value of CONFIG_SLUB_TINY is redefined by fragment
> ./kernel/configs/tiny.config:
> Previous value: # CONFIG_SLUB_TINY is not set
> New value: CONFIG_SLUB_TINY=3Dy
>
> Merging ./arch/x86/configs/tiny.config
> Value of CONFIG_UNWINDER_GUESS is redefined by fragment
> ./arch/x86/configs/tiny.config:
> Previous value: # CONFIG_UNWINDER_GUESS is not set
> New value: CONFIG_UNWINDER_GUESS=3Dy
>
> merged configuration written to .config (needs make)
>
> make -f ./Makefile olddefconfig
> make -f ./scripts/Makefile.build obj=3Dscripts/basic
> make -f ./scripts/Makefile.build obj=3Dscripts/kconfig olddefconfig
> scripts/kconfig/conf  --olddefconfig Kconfig
>
> configuration written to .config
> ---
>  scripts/kconfig/merge_config.sh | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_conf=
ig.sh
> index 0b7952471c18f6882b8978f839f3170bb41fb01f..ad35a60de350ae1c5b60d39bf=
752115d27276f52 100755
> --- a/scripts/kconfig/merge_config.sh
> +++ b/scripts/kconfig/merge_config.sh
> @@ -112,8 +112,8 @@ INITFILE=3D$1
>  shift;
>
>  if [ ! -r "$INITFILE" ]; then
> -       echo "The base file '$INITFILE' does not exist.  Exit." >&2
> -       exit 1
> +       echo "The base file '$INITFILE' does not exist. Creating one..." =
>&2
> +       touch $INITFILE
>  fi
>
>  MERGE_LIST=3D$*
>
> ---
> base-commit: e21edb1638e82460f126a6e49bcdd958d452929c
> change-id: 20250328-fix-merge-config-87fe109017e9
>
> Best regards,
> --
> Daniel Gomez <da.gomez@samsung.com>
>


--=20
Best Regards
Masahiro Yamada

