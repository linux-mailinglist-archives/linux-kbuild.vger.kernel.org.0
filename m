Return-Path: <linux-kbuild+bounces-1314-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB2288A7B5
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Mar 2024 16:53:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD2B61F67F4B
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Mar 2024 15:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84F5B174967;
	Mon, 25 Mar 2024 13:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jCvYVi4y"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FDB174951
	for <linux-kbuild@vger.kernel.org>; Mon, 25 Mar 2024 13:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711372792; cv=none; b=VxgKQsAAtqASF5UUcYq2noGDFhAADDpLwSD8zkiVrZizjOGyf/19wljL9SeFHk25r+RZy30pHqLi3j4NRgL7d/lmwgWSPcZeo5OAxNQ/rpNzdCvRAy4BqJubwn6d1QtVpgUYIIgPQAfHNslCsRLVGpRAyNIRszRZoBVUHOu2Zlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711372792; c=relaxed/simple;
	bh=6U0usObrly34Br1A2i1J5xtvAeOTtoPhriMbvHNM3sA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ev1PDwMnicUY++C8lWZIAMZPJEZKa92ZPBu/GTUfG/eef/gEeW/3RkewHA+mX7hX4bVVBt/tZkyCWB/QxeydXbA1V+KHEhegbaNYI34Pb8wa4j3FTXIBAH6+AbilFKUJ9d0MZv71FzkFiuJeuPHY4CTJ0WrJgcHaMqyHNKQuLRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jCvYVi4y; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dd161eb03afso3607061276.0
        for <linux-kbuild@vger.kernel.org>; Mon, 25 Mar 2024 06:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711372790; x=1711977590; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S40U5XpE5e+tWnCzJS15XcSV9C7o9+kj8MqbVXjyTG8=;
        b=jCvYVi4yO6pZ2QgO5nDo9fCj03Z/TINViJZIuvTJnjjG1+AW/q/HOeBLw40nblR3fi
         ezqmggdTQhZ25RNcGlWBEFnknxvY5/Z7O/V8CpNxYrD0KohvQyX3po4SyzVq69NTHu+x
         ttN1lgWBLPAdVVafjmVKPPHBCxq/hfPaWZjzEhfSD17vRhniP+6QMR6jEO07KsVV1h/g
         rx4qYmInrCe5d5UT0wphD5OeLIIwheQQcXD5xBur1aDMn9aIuKjW5ypBSZPz5433ChdK
         ouu9nosy4Ug9w/PFTBqaz13xkQpyHSNdso2gWK5WaHZbD4qLj3jZ3pLDCCIaVTdkqoIK
         gBbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711372790; x=1711977590;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S40U5XpE5e+tWnCzJS15XcSV9C7o9+kj8MqbVXjyTG8=;
        b=cuNBAJ4n0I95bPSdH+YmyYDNpW7uRYyMtcJfnayv4XTE/T6jvcqXb8nivyWrJUz/Xq
         8WuH4bKxmC4QG3sJ41OjZ8+eKmz16zpvGQZZ/odBK5gv4lPlwm0UZzXUSfNyu5xsxDZg
         ewmitqmHnMG1X8AcUaXpA0Jw/roWWmL6+acJH+m4PbAw45dkP/cOJIrUj2WkE50kOtMb
         PlQSbq1a/uORVoE6O0IN5WfZ0GI9+ia7+I381eAa3j36rBQbmkvXtq+rP/jjQoW72Ylj
         yzEXE7AT1oaICnFCpF7xcuzGv0WobjVtv04+s6hXYTDUykYRVcu6pcDVgeXiP7i6LyN8
         1dIw==
X-Forwarded-Encrypted: i=1; AJvYcCUC3AauppkRzL9fKGaRGLHg8hWV89hSY96hQrnsBWYL5I25hKM9B3hOpUMsEFU1Mke4NFFKP+r9sa6i/xF6Aj5N9NUuRA6seLZy2bsV
X-Gm-Message-State: AOJu0YwGF1II5IMxp0AtuOw+8tmE9tZSsjeb+geLAD2EF+kY/NM240cl
	YbMfBPobsmaQDT8G1K9a0KSg+KQHSYvkkDidOEli+ajXsCRJ3oNH1J0MSnPxiDXA2FwKCbJ82F5
	ke10/7Hfkg+TBW+f4O+t2dL8nImnwywsZ7ZJKrg==
X-Google-Smtp-Source: AGHT+IGG/7/pUr8ycONWdS+EDFipNdpQb+5K6+jBwlbEkrGfGrU6iF0fdmcw9WS+RAU/chmOIbJQjoEutettmwm2sUE=
X-Received: by 2002:a25:e08a:0:b0:dc6:8534:bb06 with SMTP id
 x132-20020a25e08a000000b00dc68534bb06mr5191321ybg.17.1711372789892; Mon, 25
 Mar 2024 06:19:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240324114017.231936-2-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20240324114017.231936-2-u.kleine-koenig@pengutronix.de>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 25 Mar 2024 14:19:14 +0100
Message-ID: <CAPDyKFrdTLZjz=dysrz073c0_r=TnRz-D=sq-xkLHkwKfPndhw@mail.gmail.com>
Subject: Re: [PATCH] mmc: davinci: Don't strip remove function when driver is builtin
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-mmc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 24 Mar 2024 at 12:40, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> Using __exit for the remove function results in the remove callback
> being discarded with CONFIG_MMC_DAVINCI=3Dy. When such a device gets
> unbound (e.g. using sysfs or hotplug), the driver is just removed
> without the cleanup being performed. This results in resource leaks. Fix
> it by compiling in the remove callback unconditionally.
>
> This also fixes a W=3D1 modpost warning:
>
>         WARNING: modpost: drivers/mmc/host/davinci_mmc: section mismatch =
in reference: davinci_mmcsd_driver+0x10 (section: .data) -> davinci_mmcsd_r=
emove (section: .exit.text)
>
> Fixes: b4cff4549b7a ("DaVinci: MMC: MMC/SD controller driver for DaVinci =
family")
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Applied for next and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/davinci_mmc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/davinci_mmc.c b/drivers/mmc/host/davinci_mm=
c.c
> index 8bd938919687..d7427894e0bc 100644
> --- a/drivers/mmc/host/davinci_mmc.c
> +++ b/drivers/mmc/host/davinci_mmc.c
> @@ -1337,7 +1337,7 @@ static int davinci_mmcsd_probe(struct platform_devi=
ce *pdev)
>         return ret;
>  }
>
> -static void __exit davinci_mmcsd_remove(struct platform_device *pdev)
> +static void davinci_mmcsd_remove(struct platform_device *pdev)
>  {
>         struct mmc_davinci_host *host =3D platform_get_drvdata(pdev);
>
> @@ -1392,7 +1392,7 @@ static struct platform_driver davinci_mmcsd_driver =
=3D {
>                 .of_match_table =3D davinci_mmc_dt_ids,
>         },
>         .probe          =3D davinci_mmcsd_probe,
> -       .remove_new     =3D __exit_p(davinci_mmcsd_remove),
> +       .remove_new     =3D davinci_mmcsd_remove,
>         .id_table       =3D davinci_mmc_devtype,
>  };
>
>
> base-commit: 70293240c5ce675a67bfc48f419b093023b862b3
> --
> 2.43.0
>

