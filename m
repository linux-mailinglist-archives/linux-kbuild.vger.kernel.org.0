Return-Path: <linux-kbuild+bounces-8490-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF0FB29310
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 Aug 2025 14:36:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 935051B22FB1
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 Aug 2025 12:35:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 466851B0F33;
	Sun, 17 Aug 2025 12:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bWaiiTxS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1749D4C79;
	Sun, 17 Aug 2025 12:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755434131; cv=none; b=jQ/RiDrpvv0nh9xoLJZzqw+kEaJuh8csvDFi55o/DkoclLUA+oIiMOLZPl0zaovLhOYTW8duW9ikMc0+gZIKFsr6328IQmm8dEgPx2agmfPeuEilhOdqSf64xHLr0umQJ5OYBsWmQlExb2eX+Uo3VIyXMDEwwGJIl3t7aJOC6uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755434131; c=relaxed/simple;
	bh=K0t5OPbOPORr4rji244Ag4FSpGCV0+ef9z/I6IMNEoY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bCr3Tp/KZInqhM7VikaSj8jW1kKiqwE5V0jZslDO8NImM5M3qQwzB6SMKmV71MzUjKPBHyriL55zLeMl+ePkfISovIxxnYd1BZdQn4wEcgUIoj6LczQTi3OY03K9A2JxMizzQkIDb9t4+ZaOYeZ+69L+jXfsdz1ocloAUGKUDJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bWaiiTxS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99A1CC116B1;
	Sun, 17 Aug 2025 12:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755434130;
	bh=K0t5OPbOPORr4rji244Ag4FSpGCV0+ef9z/I6IMNEoY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bWaiiTxSrwUWzo7iYIalvS39eP5V3VLvHg63HiSnWB6MNQ12TvBlukIqSizhYHqVQ
	 JHP9zltdSgRpKGRv0axVLnYoSMesevxpyC3gCvqGb7WRhaLFbWa8FN+KU/EgwyP9lJ
	 quSRhDPn4fyKtiPx78d5XUhU8XgZAzISe8uSKGfeIr61xHUzsrz657emwYavde7l5Z
	 w1KhM1ravdmgGG6wTNfUzvbEikM3xnL++iYF+WOA7t3OJtUZPWPZ/1KS/fIlui5A37
	 9xDQWr3dJkK+655NCF46hpYEa5fvEYzqwjYkj9SsvXW7VNFShvQa7ENolUbVYFlGhO
	 p16FRxP9kRq7A==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-55ce5097493so3233660e87.0;
        Sun, 17 Aug 2025 05:35:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUvhMVP6HToVpe/2sF3Hp03CYbF9p4KlaiIvc7WJ5fuqmBO5xA3ZvzSqT0EWbca5q6+jbnH/s+v+4MsiQih@vger.kernel.org, AJvYcCVe1sqKHSE87bWsyQ7umzNRF2IHllLtns9kXpw4rqOh7dq+PAqLHVqtBIrVDeSuF6TSpr1PAK+SahjULcWmmw==@vger.kernel.org, AJvYcCWgwLNSEr+jjnZfaOlaxtMsVnFITJSsO4JhADZACPkgNHNFqgprO5lgieLZfr2WGKM4YjXt4677GRpw3G4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmpqreKRbjf2YNyh+82nLTwiE+XdlkhO+P+fUUWHzkrvzbtrAe
	WxV7PkghstgzD6G7G9gOTpFZkqQthpoMS8Ftv/PzdEqwm/Z+JgCHu3YStiHkWl3tE+7h8k4kNJ/
	5lCdgwx2KJv0Zw+61BvgPLkbxFnQO/CI=
X-Google-Smtp-Source: AGHT+IEPB5YTyXzt316aSK85kOBdufClIwWskx0/hHqRDM4HKllLcRik3kJjEj8fZXSs9YJw/F/A8lBoNocQMhms/4A=
X-Received: by 2002:a05:651c:54a:b0:332:4fb8:6660 with SMTP id
 38308e7fff4ca-3340990d3e1mr22418291fa.25.1755434129234; Sun, 17 Aug 2025
 05:35:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1755170493.git.legion@kernel.org> <16859d94a2c8e4b1bb305defdb8b7be238499c66.1755170493.git.legion@kernel.org>
In-Reply-To: <16859d94a2c8e4b1bb305defdb8b7be238499c66.1755170493.git.legion@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 17 Aug 2025 21:34:52 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR-gD2H6Kk-rZjo0R3weTHCGTm0a=u2tRH1WWW6Sx6=RQ@mail.gmail.com>
X-Gm-Features: Ac12FXxkTKEgNqtaBcd378dlBDyBGHyc3QJQrRzBberLfw3aeA0Ajt18nma14iY
Message-ID: <CAK7LNAR-gD2H6Kk-rZjo0R3weTHCGTm0a=u2tRH1WWW6Sx6=RQ@mail.gmail.com>
Subject: Re: [PATCH v6 3/9] kbuild: extract modules.builtin.modinfo from vmlinux.unstripped
To: Alexey Gladkov <legion@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Petr Pavlu <petr.pavlu@suse.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 14, 2025 at 10:08=E2=80=AFPM Alexey Gladkov <legion@kernel.org>=
 wrote:
>
> From: Masahiro Yamada <masahiroy@kernel.org>
>
> Currently, we assume all the data for modules.builtin.modinfo are
> available in vmlinux.o.
>
> This makes it impossible for modpost, which is invoked after vmlinux.o,
> to add additional module info.
>
> This commit moves the modules.builtin.modinfo rule after modpost.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> Signed-off-by: Alexey Gladkov <legion@kernel.org>

I got this report from Stephen
https://lore.kernel.org/lkml/20250730164047.7c4a731a@canb.auug.org.au/

Please make sure to have no regression.
If this is difficult to solve, please discard this patch,
and consider a different approach.


> ---
>  scripts/Makefile.vmlinux   | 26 ++++++++++++++++++++++++++
>  scripts/Makefile.vmlinux_o | 26 +-------------------------
>  2 files changed, 27 insertions(+), 25 deletions(-)
>
> diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
> index e2ceeb9e168d..fdab5aa90215 100644
> --- a/scripts/Makefile.vmlinux
> +++ b/scripts/Makefile.vmlinux
> @@ -96,6 +96,32 @@ targets +=3D vmlinux
>  vmlinux: vmlinux.unstripped FORCE
>         $(call if_changed,strip_relocs)
>
> +# modules.builtin.modinfo
> +# ----------------------------------------------------------------------=
-----
> +
> +OBJCOPYFLAGS_modules.builtin.modinfo :=3D -j .modinfo -O binary
> +
> +targets +=3D modules.builtin.modinfo
> +modules.builtin.modinfo: vmlinux.unstripped FORCE
> +       $(call if_changed,objcopy)
> +
> +# modules.builtin
> +# ----------------------------------------------------------------------=
-----
> +
> +__default: modules.builtin
> +
> +# The second line aids cases where multiple modules share the same objec=
t.
> +
> +quiet_cmd_modules_builtin =3D GEN     $@
> +      cmd_modules_builtin =3D \
> +       tr '\0' '\n' < $< | \
> +       sed -n 's/^[[:alnum:]:_]*\.file=3D//p' | \
> +       tr ' ' '\n' | uniq | sed -e 's:^:kernel/:' -e 's/$$/.ko/' > $@
> +
> +targets +=3D modules.builtin
> +modules.builtin: modules.builtin.modinfo FORCE
> +       $(call if_changed,modules_builtin)
> +
>  # modules.builtin.ranges
>  # ----------------------------------------------------------------------=
-----
>  ifdef CONFIG_BUILTIN_MODULE_RANGES
> diff --git a/scripts/Makefile.vmlinux_o b/scripts/Makefile.vmlinux_o
> index b024ffb3e201..23c8751285d7 100644
> --- a/scripts/Makefile.vmlinux_o
> +++ b/scripts/Makefile.vmlinux_o
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>
>  PHONY :=3D __default
> -__default: vmlinux.o modules.builtin.modinfo modules.builtin
> +__default: vmlinux.o
>
>  include include/config/auto.conf
>  include $(srctree)/scripts/Kbuild.include
> @@ -73,30 +73,6 @@ vmlinux.o: $(initcalls-lds) vmlinux.a $(KBUILD_VMLINUX=
_LIBS) FORCE
>
>  targets +=3D vmlinux.o
>
> -# modules.builtin.modinfo
> -# ----------------------------------------------------------------------=
-----
> -
> -OBJCOPYFLAGS_modules.builtin.modinfo :=3D -j .modinfo -O binary
> -
> -targets +=3D modules.builtin.modinfo
> -modules.builtin.modinfo: vmlinux.o FORCE
> -       $(call if_changed,objcopy)
> -
> -# modules.builtin
> -# ----------------------------------------------------------------------=
-----
> -
> -# The second line aids cases where multiple modules share the same objec=
t.
> -
> -quiet_cmd_modules_builtin =3D GEN     $@
> -      cmd_modules_builtin =3D \
> -       tr '\0' '\n' < $< | \
> -       sed -n 's/^[[:alnum:]:_]*\.file=3D//p' | \
> -       tr ' ' '\n' | uniq | sed -e 's:^:kernel/:' -e 's/$$/.ko/' > $@
> -
> -targets +=3D modules.builtin
> -modules.builtin: modules.builtin.modinfo FORCE
> -       $(call if_changed,modules_builtin)
> -
>  # Add FORCE to the prerequisites of a target to force it to be always re=
built.
>  # ----------------------------------------------------------------------=
-----
>
> --
> 2.50.1
>


--=20
Best Regards
Masahiro Yamada

