Return-Path: <linux-kbuild+bounces-8190-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09431B12937
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Jul 2025 08:31:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 33A8B5677CB
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Jul 2025 06:31:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02EBC1EDA0E;
	Sat, 26 Jul 2025 06:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Car/4Y/X"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF20E7263B;
	Sat, 26 Jul 2025 06:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753511497; cv=none; b=XdOR1MR9ksAi/1ExNzoR4yuwtyt+sXzS9Yy22/BeXScfVtTSaYuCDqwZhtXzYWpoMZD4Kw0+BeLeVsVn2HyXVRuWtl7UiVCwMTQ/xVyeva8s7IDy7B5SfeaSFHyiI/3rVjR+9VOdMLN0gF93R18hvQiNriJO3L6swoGnD0MLxLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753511497; c=relaxed/simple;
	bh=b5+fxTz5qohXuey/CLN6VvyqwtywdFhpDGxjBOjxsFE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QzImfYRtMvcehY56q/HsTn6sHitfNO1VPTfh3qkQ0MzWCeOUDJMKKwwky/CIIRshGKZCcZiUVmNGQj6aW2oFkgt4ygYecgqdLUVth/y6ZiYiV20ytwv0j/tPMzed767pLq9+Mrh+pZNVdoC5ra4ocq9xrCF8ikmmDkuKiE7I9h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Car/4Y/X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DA65C4CEEF;
	Sat, 26 Jul 2025 06:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753511497;
	bh=b5+fxTz5qohXuey/CLN6VvyqwtywdFhpDGxjBOjxsFE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Car/4Y/XedvzMTgNEjWgCbGSWQrtF3lgwQcfuwBxTir9K7eCs1wAM/JJuW5uZCo2P
	 W/R8SHDOxp0oRZa9jZjxbMyoOV9v+xxsPCb1nNV98rRigcENI6C2L7BaWw3EKVTauU
	 nBRbLMlQucvEHykfJC3SgsNj7yhw/OD9W1mqnUHFhrTsQ7PFZ+UejiKuHZdI4y8hTo
	 qnrwgN1wL3VsjZ8gj6hpMc3yeJ9iNgT/VzY6yU5YNVrrpk2oBZBLnwd7YNd73Ywwn1
	 3kOOSUZ/NRUo3Jris6IFSURjeISQj4+JL8Q/OTHp1QoS2pdlVQR2H88XVJ4FCXqLLK
	 3pvtguvJtYQuw==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5550dca1241so2493860e87.0;
        Fri, 25 Jul 2025 23:31:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWpwLVOQKVfXLHtIXDx/be6BE0LFqNDKXSzEWLXRFXL4OJxzcpoOl0H5EEMBaSK0vrnm/dGtstPAGEvq0k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCONaebf147PtyDBJgaUubtOvReOia+LHasmuSRcMg32MJvuKS
	qIGwC2xQP9Zu83Kp7GxvG9tqU4A36ArjtyBCX1Fql39JXNHM1TocOdjlMTd3akR7KfeBiMmt5sz
	3xo3h/C9aOsGwILq8ELPuylMmkoZcwGI=
X-Google-Smtp-Source: AGHT+IFTbcZjgr4oeFACAPJbR+enOqtckRmSr31/D0PmOp/JaC3aA/j4/zW1vJOMqAYhJrNeWBS+g0B3fRrLTFCzrpc=
X-Received: by 2002:ac2:4e11:0:b0:553:d17a:d01d with SMTP id
 2adb3069b0e04-55b5f4441femr1286768e87.14.1753511496050; Fri, 25 Jul 2025
 23:31:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250722172837.140328-1-shankari.ak0208@gmail.com>
In-Reply-To: <20250722172837.140328-1-shankari.ak0208@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 26 Jul 2025 15:30:59 +0900
X-Gmail-Original-Message-ID: <CAK7LNAReN1-xh-1hcGHbRx401eJrxEoCrzMpe2b0nwoKxcJN8w@mail.gmail.com>
X-Gm-Features: Ac12FXwMHSs_CyVfiYMNjnqN6Tgu-eOOksfRr-1Zm-v6hJ3TjvtOnMBABsx9A-U
Message-ID: <CAK7LNAReN1-xh-1hcGHbRx401eJrxEoCrzMpe2b0nwoKxcJN8w@mail.gmail.com>
Subject: Re: [PATCH v2] kconfig: nconf: Fix uncleared lines on help screens
To: Shankari Anand <shankari.ak0208@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 23, 2025 at 2:29=E2=80=AFAM Shankari Anand
<shankari.ak0208@gmail.com> wrote:
>
> Commit 1b92b18ec419 ("kconfig: nconf: Ensure null termination where
> strncpy is used") introduced a regression where
> help screens (F1, F2, F3) no longer properly clear short lines of text,
> resulting in duplicated or trailing content when lines are overwritten.
>
> Revert the null-termination change to match
> the actual length of the copied string.
>
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Closes: https://lore.kernel.org/lkml/CAK7LNAT54nvwYmTy20Ep8U2kr4thn68yYWX=
i9R-d3Yx3iXs=3DBg@mail.gmail.com/T/#
> Fixes: 1b92b18ec419 ("kconfig: nconf: Ensure null termination where strnc=
py is used")
> Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
> Tested-by: Randy Dunlap <rdunlap@infradead.org>

Squashed to 1b92b18.
Thanks.


> ---
> v1 -> v2: Add closes tag to the report.
> Carry-forwarded acked-by and tested-by from previous version
> ---
>  scripts/kconfig/nconf.gui.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/kconfig/nconf.gui.c b/scripts/kconfig/nconf.gui.c
> index 475a403ab8ba..7206437e784a 100644
> --- a/scripts/kconfig/nconf.gui.c
> +++ b/scripts/kconfig/nconf.gui.c
> @@ -177,7 +177,7 @@ void fill_window(WINDOW *win, const char *text)
>                 const char *line =3D get_line(text, i);
>                 int len =3D get_line_length(line);
>                 strncpy(tmp, line, min(len, x));
> -               tmp[sizeof(tmp) - 1] =3D '\0';
> +               tmp[len] =3D '\0';
>                 mvwprintw(win, i, 0, "%s", tmp);
>         }
>  }
>
> base-commit: 05adbee3ad528100ab0285c15c91100e19e10138
> --
> 2.34.1
>


--=20
Best Regards
Masahiro Yamada

