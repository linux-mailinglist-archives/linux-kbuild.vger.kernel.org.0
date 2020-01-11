Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67DAA137C05
	for <lists+linux-kbuild@lfdr.de>; Sat, 11 Jan 2020 08:16:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728493AbgAKHQx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 11 Jan 2020 02:16:53 -0500
Received: from conssluserg-05.nifty.com ([210.131.2.90]:54266 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728441AbgAKHQx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 11 Jan 2020 02:16:53 -0500
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 00B7GRUl015214;
        Sat, 11 Jan 2020 16:16:28 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 00B7GRUl015214
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1578726988;
        bh=IvZfS9DeJZajc+wxWo/yLxgBuC+n3MDy/OBtsSizkkg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=zAvIjxArSV1JbiqMaW1P6pYULSxYYvvTFSJuVGhXcbkGE7C1Pk39rBn3Z7AvU/jKZ
         Nwt4gOsv/z+GsPBO6mlbktFX/trqTKrZ0dF/sAbPTWIk0o5eFUHptuOdZaoA/agmLB
         l8y/xIYOriGmwPfiZ7GYmDcWe0IWAlL2Ov+Rh9f4OaHlo8ueX7Qlfsgo6c19XRWt+v
         h8+ViULoi9FPWgZABGKgAvR2MEmub0C/R8FGsdtXq7Fua4+PBTz8W6Y9T68Zzq77Lf
         cplG5qgv3UmQfU92ZuxVr/VDXsd5QNdfq89a7hgT9zlJE2+/9r8Qpt37ZsKpVMyS+c
         7L8Nl6IZYXQAg==
X-Nifty-SrcIP: [209.85.217.44]
Received: by mail-vs1-f44.google.com with SMTP id s16so2732174vsc.10;
        Fri, 10 Jan 2020 23:16:28 -0800 (PST)
X-Gm-Message-State: APjAAAWg86mmnJSwE/UzG2saSTe+sAKe2ES83Fypy+QreygssHa8eSS/
        U6M7Z2TMj6iCuN3Lh4rtQrjuNQ8JEOZi8ZQ+00E=
X-Google-Smtp-Source: APXvYqxLgR6NQoIKFGvmbBbZKQvV9GD2gLOLM2pdBpOZOzrXhCEWossqRhvEDekh73aWQEImX5FJhTigvEEh/om+LIc=
X-Received: by 2002:a05:6102:190:: with SMTP id r16mr1305915vsq.215.1578726987419;
 Fri, 10 Jan 2020 23:16:27 -0800 (PST)
MIME-Version: 1.0
References: <20200109161636.9362-1-brgl@bgdev.pl>
In-Reply-To: <20200109161636.9362-1-brgl@bgdev.pl>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 11 Jan 2020 16:15:51 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT34K7OcpXYhsAemd5Jd7px8P1+DyS=7s76pW2h6d663A@mail.gmail.com>
Message-ID: <CAK7LNAT34K7OcpXYhsAemd5Jd7px8P1+DyS=7s76pW2h6d663A@mail.gmail.com>
Subject: Re: [PATCH v2] kconfig: fix an "implicit declaration of function" warning
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jan 10, 2020 at 1:16 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> strncasecmp() & strcasecmp() functions are declared in strings.h, not
> string.h. On most environments the former is implicitly included by
> the latter but on some setups, building menuconfig results in the
> following warning:
>
>   HOSTCC  scripts/kconfig/mconf.o
> scripts/kconfig/mconf.c: In function =E2=80=98search_conf=E2=80=99:
> scripts/kconfig/mconf.c:423:6: warning: implicit declaration of function =
=E2=80=98strncasecmp=E2=80=99 [-Wimplicit-function-declaration]
>   if (strncasecmp(dialog_input_result, CONFIG_, strlen(CONFIG_)) =3D=3D 0=
)
>       ^~~~~~~~~~~
> scripts/kconfig/mconf.c: In function =E2=80=98main=E2=80=99:
> scripts/kconfig/mconf.c:1021:8: warning: implicit declaration of function=
 =E2=80=98strcasecmp=E2=80=99 [-Wimplicit-function-declaration]
>    if (!strcasecmp(mode, "single_menu"))
>         ^~~~~~~~~~
>
> Fix it by explicitly including strings.h.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Applied to linux-kbuild.
Thanks.


--=20
Best Regards
Masahiro Yamada
