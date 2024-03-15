Return-Path: <linux-kbuild+bounces-1260-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E425287D4CA
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Mar 2024 21:02:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13B051C21854
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Mar 2024 20:02:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42BDB53381;
	Fri, 15 Mar 2024 20:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z84j4GsJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014601F19A;
	Fri, 15 Mar 2024 20:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710532931; cv=none; b=ohWLZWqZadu8YYdPYOPtoQXsXAqkdZaUSk8MuwCDd3lEJXVcBZv0wLgUMuljXB72ILzrl2O1fdvdk4l2ZQhEFeiQ8dv4/scPNPLDDJNKXAVUzoHlq/dMAzvPNu0ZmT3XgtjiDUdmzCm1PU0O+DRbIAkhdE5uW8UEQ0xsSpxDrYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710532931; c=relaxed/simple;
	bh=aGrVTWitAhogQD5XumZ6583Dwe14StC04W0SSKoGZh4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P2HEqSgcA+Pk4vANByMFQmpqXStgb9+kxPYWi9ESiAaYv8LAWqA9h/V5txrNlgpjN55Aq7GNVjaNA058h9uvuTCB5d/WcCtOyU3M7JdtSKGXuM+rzxftm0wx/QIpSv1CbTPZ60cAY/yyEIMZOcSOrLy0o690E7XwJC7p/bVcORM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z84j4GsJ; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-563c403719cso3232994a12.2;
        Fri, 15 Mar 2024 13:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710532926; x=1711137726; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/YYAb4etLz4rCTfoR4YKT4WIcWb2hUEXXqGho2kxvLA=;
        b=Z84j4GsJ3inxkqaIUPLzokAdcY4IKofT5AWAZeFaMVe7KJHL3VzyYhgjYpjljsMxNS
         uAz5aOTil1TiFUMvtUGMHUgk/76Fi+o9MwP0SrfaeXp27zKDdeWp5AFrYT6N6XZ5BB4Z
         FHwZBi0KRs/XZ8UT3t0kn0CS31qoIY3DbOumh9hJPRaCUCK3wOYlsrwAGV4GSxc4ZePW
         khgGbuBIz0X0l2L6wIomZZ4nriuy+2zlRq2I9aC+uFHwG4q5VgcX1G1M5vcEXKd2ySQ2
         L/qT/yIAXPGBoJTQCCrdwUuxly7qllHr9SEvWq1Np1sluyegIILWaHHRCGDMgFeAT4Qu
         GQZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710532926; x=1711137726;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/YYAb4etLz4rCTfoR4YKT4WIcWb2hUEXXqGho2kxvLA=;
        b=nl9lm7qk+bkm8yPd6A+QR9fQyUB+PiEEJUIG9fEi3wYL4TRELQzMkCE0+nHQhMH5Og
         h4tiJ/bgY5Hb5TrrJqSY/eP02gREPTD4UZZgJbZDtmnS+BFgNs/oNu7Zs1vHdViVzBEJ
         OhsilsS8BtkgAXRpUPjEymhlDxMZPp+mWWjqpCdLIgw4QLMkJm8AgjRatEom88YUfPf0
         i8DA7seOtn1+VHnF+L4QjpG3ib8MHPkM2vF051Ruc49S9PYXHbaU/oN+vtJMUr1L/Oo6
         7I0MwiW5K4pB8F7MyLy4NWlxUmH+dTC9MamXXL8sDd2x/KjKLmYPPOZsR/BpTfoSngyI
         Vaog==
X-Forwarded-Encrypted: i=1; AJvYcCVrhaQMSdh4r5gR1mjmK+CUnxEjgoURGKVrkbzh2mMUG3l+pctBGoyjpO6QZZjVHeK0q3S5rH8bpo/7MP4dPXh2sDltt697JBKOboOCaNGEWendI8+pXqjfECVj2zEdb/CL+G+FQHrTQ/PgAA==
X-Gm-Message-State: AOJu0YyrYcDCqfZqwl2n/NjYF+hpsqecVSAjyr62LdZvtTynhubbxtOh
	XIYareso1MoxKKWywWCK/MJIg7NFAHJt/3PkWPhev+E4R2/imkek2CQhMLpftq0BWwnnJGI61HU
	prXLUmISUjqLdJ54P9KIg/y2OABw=
X-Google-Smtp-Source: AGHT+IGNiEX+KvIuK+2zgES9ZbZBeWUk3t1ZiDKNwUyIzDDeNdWSwtV/1hXvoCPUp+xFTA06sIdvaC4OjWNqTwIhSb0=
X-Received: by 2002:a05:6402:1f07:b0:568:b490:7d80 with SMTP id
 b7-20020a0564021f0700b00568b4907d80mr1600464edb.18.1710532925895; Fri, 15 Mar
 2024 13:02:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240315-fd-xml-shipped-v3-0-0fc122e36c53@linaro.org>
In-Reply-To: <20240315-fd-xml-shipped-v3-0-0fc122e36c53@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 15 Mar 2024 13:01:53 -0700
Message-ID: <CAF6AEGuc-xu_Ji5fOXCFFudos1Ah4tgFxjRs0neHVujtNdXB+A@mail.gmail.com>
Subject: Re: [PATCH RFC v3 00/12] drm/msm: generate register header files
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, linux-kbuild@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 15, 2024 at 4:46=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Currently display-related register headers are generated from XML files
> shipped withing Mesa source tree. This is not fully optimal: it requires
> multi-stage process of the changes first being landed to Mesa and only
> then synced to the kernel tree.

I think we'd more or less need to continue following this process for
the gpu .xml so that the kernel and mesa are not diverging.  I guess
we could drop the display related .xml from mesa.  (But it would be
nice to have a decoder tool for display devcoredumps, like we do for
gpu..)

BR,
-R

> Move original XML files to the kernel tree and generate header files
> when required.
>
> NOTE: the gen_header.py script is based on the non-merged Mesa MR [1].
> Once that MR lands, I will update the script and commit messages and
> send the next iteration.
>
> [1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/28193
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Changes in v3:
> - Split XML and git rm patches in hope to pass ML limitations
> - Link to v2: https://lore.kernel.org/r/20240315-fd-xml-shipped-v2-0-7cd6=
8ecc4320@linaro.org
>
> Changes in v2:
> - Removed the _shipped files, always generating the headers (Masahiro
>   Yamada)
> - Replaced headergen2 with gen_headers.py
> - Simplify Makefile rules, making all Adreno objects depend on Adreno
>   headers and all displau objects depend on all display headers
> - Also handle Adreno registers
> - Link to v1: https://lore.kernel.org/r/20240226-fd-xml-shipped-v1-0-86bb=
6c3346d2@linaro.org
>
> ---
> Dmitry Baryshkov (12):
>       drm/msm/mdp5: add writeback block bases
>       drm/msm/hdmi: drop qfprom.xml.h
>       drm/msm/dsi: drop mmss_cc.xml.h
>       drm/msm: move msm_gpummu.c to adreno/a2xx_gpummu.c
>       drm/msm: import XML display registers database
>       drm/msm: import A2xx-A4xx XML display registers database
>       drm/msm: import A5xx-A7xx XML display registers database
>       drm/msm: import gen_header.py script from Mesa
>       drm/msm: generate headers on the fly
>       drm/msm: drop display-related headers
>       drm/msm: drop A5xx, A6xx headers
>       drm/msm: drop A2xx-A4xx headers
>
>  drivers/gpu/drm/msm/.gitignore                     |     6 +
>  drivers/gpu/drm/msm/Makefile                       |    97 +-
>  drivers/gpu/drm/msm/adreno/a2xx.xml.h              |  3251 -----
>  drivers/gpu/drm/msm/adreno/a2xx_gpu.c              |     4 +-
>  drivers/gpu/drm/msm/adreno/a2xx_gpu.h              |     4 +
>  .../drm/msm/{msm_gpummu.c =3D> adreno/a2xx_gpummu.c} |    45 +-
>  drivers/gpu/drm/msm/adreno/a3xx.xml.h              |  3268 -----
>  drivers/gpu/drm/msm/adreno/a4xx.xml.h              |  4379 -------
>  drivers/gpu/drm/msm/adreno/a5xx.xml.h              |  5572 ---------
>  drivers/gpu/drm/msm/adreno/a6xx.xml.h              | 11858 -------------=
------
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h          |   422 -
>  drivers/gpu/drm/msm/adreno/adreno_common.xml.h     |   539 -
>  drivers/gpu/drm/msm/adreno/adreno_pm4.xml.h        |  2803 -----
>  drivers/gpu/drm/msm/disp/mdp4/mdp4.xml.h           |  1181 --
>  drivers/gpu/drm/msm/disp/mdp5/mdp5.xml.h           |  1979 ----
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h           |    11 +
>  drivers/gpu/drm/msm/disp/mdp_common.xml.h          |   111 -
>  drivers/gpu/drm/msm/dsi/dsi.xml.h                  |   790 --
>  drivers/gpu/drm/msm/dsi/dsi_phy_10nm.xml.h         |   227 -
>  drivers/gpu/drm/msm/dsi/dsi_phy_14nm.xml.h         |   309 -
>  drivers/gpu/drm/msm/dsi/dsi_phy_20nm.xml.h         |   237 -
>  drivers/gpu/drm/msm/dsi/dsi_phy_28nm.xml.h         |   384 -
>  drivers/gpu/drm/msm/dsi/dsi_phy_28nm_8960.xml.h    |   286 -
>  drivers/gpu/drm/msm/dsi/dsi_phy_7nm.xml.h          |   483 -
>  drivers/gpu/drm/msm/dsi/mmss_cc.xml.h              |   131 -
>  drivers/gpu/drm/msm/dsi/sfpb.xml.h                 |    70 -
>  drivers/gpu/drm/msm/hdmi/hdmi.xml.h                |  1399 ---
>  drivers/gpu/drm/msm/hdmi/qfprom.xml.h              |    61 -
>  drivers/gpu/drm/msm/msm_drv.c                      |     3 +-
>  drivers/gpu/drm/msm/msm_gpu.c                      |     2 +-
>  drivers/gpu/drm/msm/msm_mmu.h                      |     5 -
>  drivers/gpu/drm/msm/registers/adreno/a2xx.xml      |  1865 +++
>  drivers/gpu/drm/msm/registers/adreno/a3xx.xml      |  1751 +++
>  drivers/gpu/drm/msm/registers/adreno/a4xx.xml      |  2409 ++++
>  drivers/gpu/drm/msm/registers/adreno/a5xx.xml      |  3039 +++++
>  drivers/gpu/drm/msm/registers/adreno/a6xx.xml      |  4969 ++++++++
>  drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml  |   228 +
>  .../gpu/drm/msm/registers/adreno/adreno_common.xml |   399 +
>  .../gpu/drm/msm/registers/adreno/adreno_pm4.xml    |  2267 ++++
>  drivers/gpu/drm/msm/registers/display/dsi.xml      |   390 +
>  .../gpu/drm/msm/registers/display/dsi_phy_10nm.xml |   102 +
>  .../gpu/drm/msm/registers/display/dsi_phy_14nm.xml |   135 +
>  .../gpu/drm/msm/registers/display/dsi_phy_20nm.xml |   100 +
>  .../gpu/drm/msm/registers/display/dsi_phy_28nm.xml |   180 +
>  .../msm/registers/display/dsi_phy_28nm_8960.xml    |   134 +
>  .../gpu/drm/msm/registers/display/dsi_phy_7nm.xml  |   230 +
>  drivers/gpu/drm/msm/registers/display/edp.xml      |   239 +
>  drivers/gpu/drm/msm/registers/display/hdmi.xml     |  1015 ++
>  drivers/gpu/drm/msm/registers/display/mdp4.xml     |   504 +
>  drivers/gpu/drm/msm/registers/display/mdp5.xml     |   806 ++
>  .../gpu/drm/msm/registers/display/mdp_common.xml   |    89 +
>  drivers/gpu/drm/msm/registers/display/msm.xml      |    32 +
>  drivers/gpu/drm/msm/registers/display/sfpb.xml     |    17 +
>  .../gpu/drm/msm/registers/freedreno_copyright.xml  |    40 +
>  drivers/gpu/drm/msm/registers/gen_header.py        |   958 ++
>  drivers/gpu/drm/msm/registers/rules-ng.xsd         |   457 +
>  56 files changed, 22480 insertions(+), 39792 deletions(-)
> ---
> base-commit: 8ffc8b1bbd505e27e2c8439d326b6059c906c9dd
> change-id: 20240225-fd-xml-shipped-ba9a321cdedf
>
> Best regards,
> --
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>

