Return-Path: <linux-kbuild+bounces-4748-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A39249D323D
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Nov 2024 03:38:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B3BD1F24730
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Nov 2024 02:38:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85F434A3E;
	Wed, 20 Nov 2024 02:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cjgw9tgh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523DD20EB;
	Wed, 20 Nov 2024 02:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732070280; cv=none; b=uzysvjLFmfKr3EG5C9kbf2cHatdtA5Jhtezg4rSttGfYqWo3y8p2DQu71sfaUgAJjUaEVVd8MEtAlLHZM/HlbCFT2Uf/ndg8uxAh1q+kWejx+8RMTNMnsd7HWUxJ5liCZ+zKDpHCBgue6qVTfpHpjDNt4qaJbMzswDpXKqLyN+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732070280; c=relaxed/simple;
	bh=M1Aj/fgd7SSu3unEYYX5UP/0fa9kLLLmecNn0wqaY8g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vm+JzKDDm84si7n0GoIj0lSzJF4mB4KtjldjenjvXSQMsyKOSkj4XtQt8NQ/JY4PtGHpBhqpC7YjiL+O8DPDYmaZoiE/bWbCDiPKWLJbz6n3Xcah+G/5liWtD9sTeKy9dPQsND8Sydrx6L90F+s1e3UfWU/LJPYb/YoDmcI5zYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cjgw9tgh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDC5CC4CED1;
	Wed, 20 Nov 2024 02:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732070280;
	bh=M1Aj/fgd7SSu3unEYYX5UP/0fa9kLLLmecNn0wqaY8g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cjgw9tghlBCdGoSOXC37p56rwhI7ekvKRlP8lcu77NGmVBnbTKDpdn1uJajVl/hd7
	 w9OGHe2LfY+2z43VZ71/saMe3ewvQr1TeptbgK/u7xHBApVDhyb7yCcdUfHnu+E75U
	 JimgK1QbaIlOZtkSq4Ycd4GNfPTYhbgpd/zGwaWIEx7sWus5nit7kFh2uXiM9a1sv6
	 cR06b9zEusmjNH6jT97IsmGa7F7tuxGle8XtLdlJS5C3rGsmqbKFoRDgpr0wQcmJq/
	 ac3N5hlfJ5BANURXNO26nzrDPAarsuDo6x7m3r61WvCK/zScdnHq3bJ+Bq761NqQwf
	 v8ev3cBNXKpMg==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539e4b7409fso464246e87.0;
        Tue, 19 Nov 2024 18:37:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV5Ac9firMYN8HJipbg0mV+PhnRV2TSlrdDE6OvM8C2yeD7UqaSLBa7RYLTv8O/lZZnRNXYq7LFMftBhak=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwyyTomJKxZgBK2/T6XtCQ19ZZuMyBiBeGTAJ+lh9YE8PPb/+E
	7OisRp0Dls35Kt/3FJempOZZH9rqkIH804h2tnI3p0p0onJ4L4j9oGIHVtazY+gbKl1Qux2cJwm
	SaGSdrR6quoG1PGiIKARO4zNm+iE=
X-Google-Smtp-Source: AGHT+IG2idTvYvfVo0+fTiTAiDkxoO8GtuATz9rXh1NjmjTV6nOKBPsuacDm8kfm5f8d53B/mVtG63OHUM/TEfc8axg=
X-Received: by 2002:ac2:4c54:0:b0:53d:ab3c:87ca with SMTP id
 2adb3069b0e04-53dc0f89cc1mr319395e87.5.1732070278560; Tue, 19 Nov 2024
 18:37:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241119235705.1576946-1-masahiroy@kernel.org> <20241119235705.1576946-3-masahiroy@kernel.org>
In-Reply-To: <20241119235705.1576946-3-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 20 Nov 2024 11:37:22 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ2APK-4T+9wmS=ELT11hqCYgh9w=tcMpaPFxttKMOsBQ@mail.gmail.com>
Message-ID: <CAK7LNAQ2APK-4T+9wmS=ELT11hqCYgh9w=tcMpaPFxttKMOsBQ@mail.gmail.com>
Subject: Re: [PATCH 03/15] modpost: introduce module_alias_printf() helper
To: linux-kbuild@vger.kernel.org
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 20, 2024 at 8:57=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> The generic ->do_entry() handler is currently limited to returning
> a single alias string.
>
> However, this is not flexible enough for several subsystems, which
> currently require their own implementations:
>
>  - do_usb_table()
>  - do_of_table()
>  - do_pnp_device_entry()
>  - do_pnp_card_entries()
>
> This commit introduces a helper function so that these special cases can
> add multiple MODULE_ALIAS() and then migrate to the generic framework.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  scripts/mod/file2alias.c | 89 +++++++++++++++++++++++++++++-----------
>  scripts/mod/modpost.c    | 11 ++++-
>  scripts/mod/modpost.h    | 19 ++++++++-
>  3 files changed, 91 insertions(+), 28 deletions(-)
>
> diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
> index 34678ed40fdb..e31619cee05e 100644
> --- a/scripts/mod/file2alias.c
> +++ b/scripts/mod/file2alias.c
> @@ -10,6 +10,12 @@
>   * of the GNU General Public License, incorporated herein by reference.
>   */
>
> +#include <stdarg.h>
> +#include <stdio.h>
> +
> +#include "list.h"
> +#include "xalloc.h"
> +
>  #include "modpost.h"
>  #include "devicetable-offsets.h"
>
> @@ -31,6 +37,56 @@ typedef Elf64_Addr   kernel_ulong_t;
>  #include <ctype.h>
>  #include <stdbool.h>
>
> +/**
> + * module_alias_printf - add auto-generated MODULE_ALIAS()
> + *
> + * @mod: module
> + * @append_wildcard: append '*' for future extension if not exist yet
> + * @fmt: printf(3)-like format
> + */
> +static void __attribute__((format (printf, 3, 4)))
> +module_alias_printf(struct module *mod, bool append_wildcard,
> +                   const char *fmt, ...)
> +{
> +       struct module_alias *new;
> +       size_t len, n;
> +       va_list ap;
> +
> +       /* Determine required size. */
> +       va_start(ap, fmt);
> +       n =3D vsnprintf(NULL, 0, fmt, ap);
> +       va_end(ap);
> +
> +       if (n < 0) {
> +               error("vsnprintf failed\n");
> +               return;
> +       }
> +
> +       len =3D n + 1;    /* extra byte for '\0' */
> +
> +       if (append_wildcard)
> +               len++;  /* extra byte for '*' */
> +
> +       new =3D xmalloc(sizeof(*new) + len);
> +
> +       /* Now, really print it to the allocated buffer */
> +       va_start(ap, fmt);
> +       n =3D vsnprintf(new->str, len, fmt, ap);
> +       va_end(ap);
> +
> +       if (n < 0) {
> +               error("vsnprintf failed\n");
> +               return;


This is a memory leak bug.
I will add free() here.

        if (n < 0) {
                error("vsnprintf failed\n");
+               free(new);
                return;
        }




--=20
Best Regards
Masahiro Yamada

