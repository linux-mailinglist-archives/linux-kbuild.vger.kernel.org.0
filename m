Return-Path: <linux-kbuild+bounces-4752-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCF49D4239
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Nov 2024 19:51:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 74A9D1F20F9D
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Nov 2024 18:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3081115539A;
	Wed, 20 Nov 2024 18:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lE6zDckI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A737013C83D;
	Wed, 20 Nov 2024 18:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732128672; cv=none; b=G+o6+nuGWe7UrCvDbcVxDar/LpqZi+W89rX6rEhSAFJ20zh2Dz0HsglznuCogURdx3N/bAA/ga3Fw/KZmgZ8CxI1Ji254/OyZMLQe3lF0cOpep1mRPUyXdCW0EgQrF7VlGhQN+xANJqoa6603c6xWQWQDdstOwdhDVp/bDygUxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732128672; c=relaxed/simple;
	bh=It6fx44B2idzzO0pwF5tHaq97aT5Qkwbmvid/og7b8Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AKcNti0i1zpZ8G3H6OlKN19XYUgVIqD4C4ajIylgUcbTQf1v/9o04cP7x1t7iPnugI8VlLW6ASpEvcOxMDlaxx45swF01FZOiDG7nWtjuXdXCThTC1BOVGQT0WChfYrEmY18U/UPqz9O7un+vOWxEZV8sjohfMo3MRNeW3i6zxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lE6zDckI; arc=none smtp.client-ip=209.85.166.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-83aba65556cso3339939f.3;
        Wed, 20 Nov 2024 10:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732128670; x=1732733470; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F+Cd26FOvgLlRGwlmWQpeEkQVjz0XsHua3Mq3Xu6fWM=;
        b=lE6zDckId2vgUN410bUgWl1S4v/0bpaPUFQpyuzXorFJpv75Eza7GCaWIM5GCnPGsu
         lQDUBUGjap7pjoJFOzNl2cPwsDLFB/DA0OamR+RsJka+/3Lns9IGZTgAzym2lFt07Kch
         aI9p5WBvBdOzCmcmEUh1pT0/aNQlARThdGcCOlmH0K4gYFmn/eFa/8zqhr8sOT8dqsOe
         y1Yg+2UIxl8HsDrDC4+oA1G2uUpeERSrbUX6uTRiWgDBb8dV/8dp/Ctkbfv0XoFVg7m/
         /V8iBaAZFT0Af+Zx9qGnPH6kKzEgO90RUr6RRivbYT5hpvVumrA5wYZuNpcpLMBhIJrC
         s3/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732128670; x=1732733470;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F+Cd26FOvgLlRGwlmWQpeEkQVjz0XsHua3Mq3Xu6fWM=;
        b=cKhAJdMmKloEnOPZoBomHVJ/QMO19DwNMBbis2WRWmUbASLjohzJhzWw8EQ06gDkaZ
         +uIzXKN8iJLpQCrOhUBJdwWSLAqZPZpWcSTfVLWwnUAeYw9+yXYqAYPM7AETbtIAo53S
         +At6BuoTCLv5RGphomMGN4jrz3sdK+ZuXm+N5ZTaLgx2DRTg2E1aVjItNyFVmisGTCRf
         Bk95zcznqvg3R1qpm0NVvewt+KA4kdnR4vNupPDVWp+984ITjqsSXVRCbxyQrl9mR8Bc
         IKMvc/kFarLwwsQ8J4uolspwr4b9lS3hHm2AD/kqH+47nC5ox2W5XJxUQVT0oWTUEXxe
         9djw==
X-Forwarded-Encrypted: i=1; AJvYcCWfG0tDyTFpRxMjjbzdLnK0syUVAEnsBq1cjr19bdr7zVDOyZQT7DQjS9VuYzxpZQ7Qr1HoTYc3iXg/C9E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzia23XbqJFTD7RgVgK6tAgUTSUYXPmroNxKnzDlLGG7ucIUP2o
	DLTLz5G4VFkv49Re1TqruK9hwC4Tnsh9oc5rfnkPL0IzBcIs/PGT4lyVmgS2PdzEm/GYbDY+n7d
	flTOM3aM+2R7PpOvdgisK3kk9FBI=
X-Google-Smtp-Source: AGHT+IEsgAE+Ui00r62dF3CVBG/0pDLJRkIWjlY0vwqwXvv02noBqS1qDHqCRVOUcSbt7XdBIOi9icRNOyIEzSO7KVI=
X-Received: by 2002:a05:6602:340e:b0:83a:a96b:8825 with SMTP id
 ca18e2360f4ac-83eb5e387a2mr456030939f.0.1732128669794; Wed, 20 Nov 2024
 10:51:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241120154919.814593-1-pvorel@suse.cz>
In-Reply-To: <20241120154919.814593-1-pvorel@suse.cz>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 20 Nov 2024 10:50:58 -0800
Message-ID: <CAF6AEGshZMEHYT6X3fG0vYPpfa4i_o8gxOareHNggYWtkn=2Yg@mail.gmail.com>
Subject: Re: [RFC][PATCH 1/1] drm/msm: require python3 and xml.parsers.expat module
To: Petr Vorel <pvorel@suse.cz>
Cc: linux-arm-msm@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-kbuild@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	Rob Clark <robdclark@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 20, 2024 at 7:49=E2=80=AFAM Petr Vorel <pvorel@suse.cz> wrote:
>
> 0fddd045f88e introduced python3 dependency, require it to quick early.
>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> Hi all,
>
> RFC because I'm not sure if previous failed build wasn't better:
>
>         GENHDR  drivers/gpu/drm/msm/generated/a2xx.xml.h
>         /bin/sh: python3: not found
>
> This way it's documented, but CONFIG_DRM_MSM just silently disappears
> from .config. Also because depends on $(success ..) is not evaluated
> (understand, some expressions can be really long) one see only:
> Depends on: n [=3Dn].
>
> I was thinking about testing via $(PYTHON3) -m "xml.parsers.expat",
> but because expat parser (and other modules) should be part the official
> python3 and are installed even on minimal python3 installations (e.g.
> python3-minimal on Debian). Therefore depending on "$(PYTHON3) -V"
> should be enough.
>

Would it be more clear to do something like:

config HAS_PYTHON3
      dev_bool $(success ...)

(in init/Kconfig or somewhere central) and then use 'depends on
HAS_PYTHON3'?  That might make the dependency easier to see in
menuconfig/etc

BR,
-R

> Kind regards,
> Petr
>
>  drivers/gpu/drm/msm/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> index 90c68106b63b..2cf4573a2ff1 100644
> --- a/drivers/gpu/drm/msm/Kconfig
> +++ b/drivers/gpu/drm/msm/Kconfig
> @@ -11,6 +11,7 @@ config DRM_MSM
>         depends on QCOM_LLCC || QCOM_LLCC=3Dn
>         depends on QCOM_COMMAND_DB || QCOM_COMMAND_DB=3Dn
>         depends on PM
> +       depends on $(success,$(PYTHON3) -V)
>         select IOMMU_IO_PGTABLE
>         select QCOM_MDT_LOADER if ARCH_QCOM
>         select REGULATOR
> @@ -36,7 +37,7 @@ config DRM_MSM
>         select PM_GENERIC_DOMAINS
>         select TRACE_GPU_MEM
>         help
> -         DRM/KMS driver for MSM/snapdragon.
> +         DRM/KMS driver for MSM/snapdragon.  Requires python3.
>
>  config DRM_MSM_GPU_STATE
>         bool
> --
> 2.47.0
>
>

