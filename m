Return-Path: <linux-kbuild+bounces-2713-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 03EAC93ED26
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Jul 2024 08:07:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B3AD281FEB
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Jul 2024 06:07:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ED4E82877;
	Mon, 29 Jul 2024 06:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SLMqeTDB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D1210E4;
	Mon, 29 Jul 2024 06:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722233227; cv=none; b=azt2TZ43NMm8Ml/QJjXWxGVt2/GVxfVZ49XuD2O2v9hsmLw9+aLfACm5tRHCDb/PU7utBqDtoTzSw74rmDvx9vYoMAbf2NQAvohgvukjI+jmMqeZLdJHNGf8nUNuf1P8iMSjXIh9dEBmgBm1wKEETX/6errjfd7GNdH2MqzPsBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722233227; c=relaxed/simple;
	bh=mdXaX/I7zsamo8g6v05bVQ+OjFV8uJNOfkizzRlWC1Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oU0TKALZhhUvxB0BmtyZWmsaEmvBBaS2TqTDf+sq1acaMn5hD0NIMT0nkfPFUcHTkpEF/PY+aH5LfWP9GkxJ4VVz78TyRGXXict70EUVkXGF4VdeAq2OET3nnIvoJLC2NpWzHLn112u0uWpN6XTnvGREqf7N4weVJlbKe5Maazk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SLMqeTDB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F132FC32786;
	Mon, 29 Jul 2024 06:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722233227;
	bh=mdXaX/I7zsamo8g6v05bVQ+OjFV8uJNOfkizzRlWC1Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SLMqeTDB5gxiMEF3SIwrn5MTMNE9118DvsK/knoKn8/KJLiKZfQWhS3tHBQ4+V5GZ
	 7ZpxQN1jFQO7pVSZL+PRbY2peWX6HtONV93nZ7e8GD7hzqOoF3vrJpOfrPFDWG32hw
	 ++jn24ZUClMw+xX/zWsKFXOz6OPEPux7OV1hkKMvKOtecezKwL+aquJ9YLIR/TXAIS
	 xe7NMZ7bu/oDOg5gSUaTBLBi/g5uDrL7yQMj+Q1r3DHrx4Kp6du41UmSpE7pt7rfmf
	 qkQkF/2MO+Nsqj8r3nm+wA8jDUO3AHTC1jl2+NWWL/nOFyzA9cbrKnuzc0sO+eme5V
	 9AuZdawXbWGXA==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52f04b4abdcso4868803e87.2;
        Sun, 28 Jul 2024 23:07:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWRJcm0qjiZntZFEzFLOzWi9QlnH5Y2oIELoaXDkqfeZIc98rm6Lew6rTcDsCnH//bGRplJA1O/O/RYCLs0ivTcptRNXspHq7dLxdpK
X-Gm-Message-State: AOJu0YyTckDv8KBx/USyLZazkuaogvBnI2SE3/uPgor9ZowvTOcu+iYd
	2cvRGaT1OlSfPkq2XD4MKOT2qGf/AGXhO4/Jvhgq1TmDDTFr+cGCUPKKCfMVX25kwFK88Q4Yplu
	MYfFqAKgogoW29Fvp9ZgYSx6jbdQ=
X-Google-Smtp-Source: AGHT+IEaUUPAFEIfx+aS3dP+tnOlmjGmVlPdnXmPHa0w+1pwDJCKqdX9Y4kC5wXE8VDyCJO8HgBfFV6GLpqTc8+y9+Y=
X-Received: by 2002:a19:7404:0:b0:52c:d80e:55a5 with SMTP id
 2adb3069b0e04-5309b2c3071mr3725189e87.41.1722233225661; Sun, 28 Jul 2024
 23:07:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240606133615.986035-1-masahiroy@kernel.org>
In-Reply-To: <20240606133615.986035-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 29 Jul 2024 15:06:29 +0900
X-Gmail-Original-Message-ID: <CAK7LNARnBDXm0fsVaeHdvst_XqH35K5+LeBdBAZa15brOKEyfw@mail.gmail.com>
Message-ID: <CAK7LNARnBDXm0fsVaeHdvst_XqH35K5+LeBdBAZa15brOKEyfw@mail.gmail.com>
Subject: Re: [PATCH] slimbus: generate MODULE_ALIAS() from MODULE_DEVICE_TABLE()
To: alsa-devel@alsa-project.org, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Srinivas,


Any comments?



On Thu, Jun 6, 2024 at 10:36=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> Commit 9e663f4811c6 ("slimbus: core: add support to uevent") added the
> MODALIAS=3Dslim:* uevent variable, but modpost does not generate the
> corresponding MODULE_ALIAS().
>
> To support automatic module loading, slimbus drivers still need to
> manually add MODULE_ALIAS("slim:<manf_id>:<prod_code>:*"), as seen in
> sound/soc/codecs/wcd9335.c.
>
> To automate this, make modpost generate the proper MODULE_ALIAS() from
> MODULE_DEVICE_TABLE(slim, ).
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  scripts/mod/devicetable-offsets.c |  4 ++++
>  scripts/mod/file2alias.c          | 11 +++++++++++
>  2 files changed, 15 insertions(+)
>
> diff --git a/scripts/mod/devicetable-offsets.c b/scripts/mod/devicetable-=
offsets.c
> index 518200813d4e..9c7b404defbd 100644
> --- a/scripts/mod/devicetable-offsets.c
> +++ b/scripts/mod/devicetable-offsets.c
> @@ -153,6 +153,10 @@ int main(void)
>         DEVID_FIELD(i3c_device_id, part_id);
>         DEVID_FIELD(i3c_device_id, extra_info);
>
> +       DEVID(slim_device_id);
> +       DEVID_FIELD(slim_device_id, manf_id);
> +       DEVID_FIELD(slim_device_id, prod_code);
> +
>         DEVID(spi_device_id);
>         DEVID_FIELD(spi_device_id, name);
>
> diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
> index 5d1c61fa5a55..99dce93a4188 100644
> --- a/scripts/mod/file2alias.c
> +++ b/scripts/mod/file2alias.c
> @@ -960,6 +960,16 @@ static int do_i3c_entry(const char *filename, void *=
symval,
>         return 1;
>  }
>
> +static int do_slim_entry(const char *filename, void *symval, char *alias=
)
> +{
> +       DEF_FIELD(symval, slim_device_id, manf_id);
> +       DEF_FIELD(symval, slim_device_id, prod_code);
> +
> +       sprintf(alias, "slim:%x:%x:*", manf_id, prod_code);
> +
> +       return 1;
> +}
> +
>  /* Looks like: spi:S */
>  static int do_spi_entry(const char *filename, void *symval,
>                         char *alias)
> @@ -1555,6 +1565,7 @@ static const struct devtable devtable[] =3D {
>         {"rpmsg", SIZE_rpmsg_device_id, do_rpmsg_entry},
>         {"i2c", SIZE_i2c_device_id, do_i2c_entry},
>         {"i3c", SIZE_i3c_device_id, do_i3c_entry},
> +       {"slim", SIZE_slim_device_id, do_slim_entry},
>         {"spi", SIZE_spi_device_id, do_spi_entry},
>         {"dmi", SIZE_dmi_system_id, do_dmi_entry},
>         {"platform", SIZE_platform_device_id, do_platform_entry},
> --
> 2.43.0
>


--=20
Best Regards
Masahiro Yamada

