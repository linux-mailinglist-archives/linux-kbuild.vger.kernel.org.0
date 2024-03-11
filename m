Return-Path: <linux-kbuild+bounces-1211-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 342FD877BD2
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Mar 2024 09:42:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1C7C2811A2
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Mar 2024 08:42:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24D591173F;
	Mon, 11 Mar 2024 08:42:13 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4912E1118B;
	Mon, 11 Mar 2024 08:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710146533; cv=none; b=DGFYzxyAAcfMPMig0PTB03QkAiXl008SKganAFsRGa0QPl00nU9kNuKZh+LrlhUlh7CBqbTobG6itIaJlMVE0Scf8NIyd9sQ0YlA0PLw+kruY9ky4HNrXdomZ4pf1sHrhtWarFGwvZcnrQWXdgXGrcSK9GKIvB2otHPskGDBM3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710146533; c=relaxed/simple;
	bh=CVcpSQEowmQSM9t8/GfJCKCgL/YYmkegZpNkLQK9IlA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a9HVtpWeXQc9Wgl/YF9iO0chfNfsrbhrS0fURsjAZQzeAi9UZ2m1rlK2FniuRWbqv3lgCXmjGZOgTWx+7m5QdAQjSJ0YjhOxkQzfCLBsrKH68iqduvCZdvQtMw/zqcHsWt6RmYUXcabzVNriXG6PkbITSnqPcBTwWYC7wPb9tBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dc25e12cc63so4712090276.0;
        Mon, 11 Mar 2024 01:42:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710146529; x=1710751329;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TgHOKxgDd5agwFdYIamY3hBfpfSIfbA2P0oFSiagzbA=;
        b=lQOL04NszMvWfx57k3yAmYl839GNllo5dtjgbSMAUGnIoRTa2u+5BkUoMxKI54/ios
         i8VsvrQCZyygkb4BB69ML9gzKTbTrKrIDMQknWul+WkkNrgYZ6MEKlPrEEhMSuyRvy0B
         RDdNCJyUYlbTKglFvsATy/iRhr2sPkLS9Iy7ZizEpUFwqkvesHH3Wc8xTnr8gXWTlHeQ
         63NQAb2k5H9bzN+h5mB1MAVbbF0t6bQblUcz5NU6Y7Lyr8ZKE0chtebQlxoIgkULpdb/
         hONbyVIWbRsSyYjay1hN2tGfT1O26qHC3nq2kvlMQddqB25MgTe2YTIxB/uJcKvogKhq
         OI0w==
X-Forwarded-Encrypted: i=1; AJvYcCXMs20XRoLRCF3P4bD5wkSUkfNZsQLTZRrMmK4fKI+q381NSBvBmy/6YaDucccX0ETzaea8x62WAE+D+fl9DPOHKJ/e3WrBxxMKIDBG3AlrthvygNFyP1Thvhi7dOs2rV6G915E8jBrMbU=
X-Gm-Message-State: AOJu0YzMikBJgHYRYuBvXnVLsAa/VviWDUgI45SirYIrOZufczCxN8Hu
	peW6fAZcADVdd8VN2eeRXaXrm3qwdAiVcQMo/8GF2ZT9RYKAwPkCeZw4p1IK3Fg=
X-Google-Smtp-Source: AGHT+IEAexAj9L8CdAOz2RRTCuCiOg6bbZC4YflYeRtxjd1DdieZAAtIQDMGF2Ott3AknWjbS6xnUg==
X-Received: by 2002:a25:a1c1:0:b0:dc6:cf8e:8f97 with SMTP id a59-20020a25a1c1000000b00dc6cf8e8f97mr3462313ybi.27.1710146528928;
        Mon, 11 Mar 2024 01:42:08 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id g1-20020a25db01000000b00dc6c58ae000sm1080856ybf.16.2024.03.11.01.42.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Mar 2024 01:42:08 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-609eb87a847so30269647b3.0;
        Mon, 11 Mar 2024 01:42:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWcd9PYniGZys/lkR3AC7/t6zuC4A4HlLcG0fP1Mx4yaul5wCbRntCTC/GOmD1IdsOPACNxvreNrg3P0Wy+3fLJbulUp7tSLCCc19WLzWlumYbtMOmcUls7zTZo2Dr3Li/fAI7um86C20g=
X-Received: by 2002:a0d:d90e:0:b0:609:7699:dc63 with SMTP id
 b14-20020a0dd90e000000b006097699dc63mr4623835ywe.9.1710146528457; Mon, 11 Mar
 2024 01:42:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240310143852.397212-2-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20240310143852.397212-2-u.kleine-koenig@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 Mar 2024 09:41:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXAxus+Y9w9e_A03MHhcBSzj4xREw1YwN9d331o+6=zhA@mail.gmail.com>
Message-ID: <CAMuHMdXAxus+Y9w9e_A03MHhcBSzj4xREw1YwN9d331o+6=zhA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: tlv320adc3xxx: Don't strip remove function when
 driver is builtin
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org, 
	linux-sound@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 10, 2024 at 3:39=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> Using __exit for the remove function results in the remove callback
> being discarded with SND_SOC_TLV320ADC3XXX=3Dy. When such a device gets
> unbound (e.g. using sysfs or hotplug), the driver is just removed
> without the cleanup being performed. This results in resource leaks. Fix
> it by compiling in the remove callback unconditionally.
>
> This also fixes a W=3D1 modpost warning:
>
>         WARNING: modpost: sound/soc/codecs/snd-soc-tlv320adc3xxx: section=
 mismatch in reference: adc3xxx_i2c_driver+0x10 (section: .data) -> adc3xxx=
_i2c_remove (section: .exit.text)
>
> (which only happens with SND_SOC_TLV320ADC3XXX=3Dm).
>
> Fixes: e9a3b57efd28 ("ASoC: codec: tlv320adc3xxx: New codec driver")
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
>
> note that this patch only applies as is after commit 4e8ff3587868 ("ASoC:
> codecs: tlv320adc3xxx: Wrap adc3xxx_i2c_remove() in __exit_p()") which wa=
s the
> wrong approach to fix the build error.

Sorry, my bad...
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

