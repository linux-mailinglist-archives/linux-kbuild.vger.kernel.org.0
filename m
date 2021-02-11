Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37E9831930C
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Feb 2021 20:26:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229886AbhBKTYf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Feb 2021 14:24:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:42198 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229978AbhBKTY3 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Feb 2021 14:24:29 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5B82764DF3;
        Thu, 11 Feb 2021 19:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613071428;
        bh=q212lYt4ihrp76ADLXHJK6ZM1oxf7oDEPHFpC8j7mN8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=O8Tfs1pEG2o3QsWaAKYQ20RF7SOR9YTFw+ljpvuTbsla77w7Er5ET1eCmg1otpjSH
         omX+vbHYtajcHNYvObKGVNvSetIZDQs00avD2WA5VE556cGER6WMfy0gx/ExoH4P/P
         6JYGzuGcm/qrb8mEFLVcosH6dbwRkr02XQlxI+p2Xh6Xm7Ysxjch9zwmFwo8eV4V3q
         JcgXAkL1YkROEoOBbCkCnffHZKCPzFrmLnYnvLyHNDhJi+5kllYzreAQYy0s11KDdf
         7zVEJf3TUDOs7Vwdut5UVrls8V2O+sVo+1c2PQF9W/CX+jRKocX9zZ3wwQJWRKeDtH
         EHVRoPqc8wkNQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210126124540.3320214-9-lee.jones@linaro.org>
References: <20210126124540.3320214-1-lee.jones@linaro.org> <20210126124540.3320214-9-lee.jones@linaro.org>
Subject: Re: [PATCH 08/21] clk: clkdev: Ignore suggestion to use gnu_printf() as it's not appropriate here
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org
To:     lee.jones@linaro.org
Date:   Thu, 11 Feb 2021 11:23:47 -0800
Message-ID: <161307142704.1254594.1986201109191269158@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Quoting Lee Jones (2021-01-26 04:45:27)
> Fixes the following W=3D1 kernel build warning(s):
>=20
>  drivers/clk/clkdev.c: In function =E2=80=98vclkdev_alloc=E2=80=99:
>  drivers/clk/clkdev.c:173:3: warning: function =E2=80=98vclkdev_alloc=E2=
=80=99 might be a candidate for =E2=80=98gnu_printf=E2=80=99 format attribu=
te [-Wsuggest-attribute=3Dformat]
>=20
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/clk/clkdev.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/drivers/clk/clkdev.c b/drivers/clk/clkdev.c
> index 0f2e3fcf0f19f..5e5f25d568724 100644
> --- a/drivers/clk/clkdev.c
> +++ b/drivers/clk/clkdev.c
> @@ -153,6 +153,11 @@ struct clk_lookup_alloc {
>         char    con_id[MAX_CON_ID];
>  };
> =20
> +#pragma GCC diagnostic push
> +#ifndef __clang__
> +#pragma GCC diagnostic ignored "-Wsuggest-attribute=3Dformat"
> +#endif

Can this be some macro banished to compiler.h?

> +
>  static struct clk_lookup * __ref
>  vclkdev_alloc(struct clk_hw *hw, const char *con_id, const char *dev_fmt,
>         va_list ap)
> @@ -177,6 +182,8 @@ vclkdev_alloc(struct clk_hw *hw, const char *con_id, =
const char *dev_fmt,
>         return &cla->cl;
>  }
> =20
> +#pragma GCC diagnostic pop
> +
>  static struct clk_lookup *
>  vclkdev_create(struct clk_hw *hw, const char *con_id, const char *dev_fm=
t,
>         va_list ap)
> --=20
> 2.25.1
>
