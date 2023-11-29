Return-Path: <linux-kbuild+bounces-205-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1147FE069
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Nov 2023 20:44:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D66811C208FF
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Nov 2023 19:44:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C2C55E0C5;
	Wed, 29 Nov 2023 19:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="klBCYmmt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 358EA194
	for <linux-kbuild@vger.kernel.org>; Wed, 29 Nov 2023 11:44:43 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a002562bd8bso30088366b.0
        for <linux-kbuild@vger.kernel.org>; Wed, 29 Nov 2023 11:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701287081; x=1701891881; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qnqDzHz4INacq1KvdtyKE0oHpbQHSFD4sKrps3p8dnw=;
        b=klBCYmmttvMbB7FzFto8DDcJB0W3AFoMOyRDjLkyqMMPCAcmUj/PCiDKX+rR7brFXo
         tWpWxDqv0qmLRc8z0YbQ/CBze9Cyuz3laR1utPtpRbRcTCLTq1UyIhAdsnLxXg+c8b2Y
         ffvXfvMn59Py8rkIpgT/RNjrwWRSxrQVJKFKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701287081; x=1701891881;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qnqDzHz4INacq1KvdtyKE0oHpbQHSFD4sKrps3p8dnw=;
        b=AstWoZfq2qP4N5mVDfdUH3Wytb1oiUXchgypNlcwW1a55RDjqE2guk9BsuS63jHJlb
         TgDTA1OrDQrzrw+3YNBBHltIbpcMMEqG3fpxDGBvejh+72dx0hpkBaQkyfH2nYc/5KfS
         GFUe/qnX6TxkFIqjRgNvGXguFZA7wbav4dA8qe1hhgzH41ErDVb2be6GqCPUqQ+fBFxq
         znS49RseKWf3febMNZH3D8hJ5IoPYVhWiDIgLJXxFvxkijyYtAeo/7xnqOJzTrw5MyUU
         td4FeccjFIH4ICiUJC2DDpLbeUW6Gl1BuNpHmkML5SWESd7nCucfarHhB8nbe32sV8ao
         uQsQ==
X-Gm-Message-State: AOJu0YyzBVmXnJeFCvVbNNOEXM5PRx03661SWTxXUtkxdk2X03vkNxv/
	pHFyf+g1ESoKv3BofZrZqey0gCZN3cfTJZ5vMpdYgg==
X-Google-Smtp-Source: AGHT+IE6/sJe2xAn+cU+B0tf6CKENoUuHsXD0ZZK1FLCMTWZCVk2aryXnmPQVK+Mqb2N+AK5h9Dj5uGpcs1SpVI/Rug=
X-Received: by 2002:a17:906:105c:b0:9ae:659f:4d2f with SMTP id
 j28-20020a170906105c00b009ae659f4d2fmr18732284ejj.26.1701287081372; Wed, 29
 Nov 2023 11:44:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231129172200.430674-1-sjg@chromium.org> <20231129172200.430674-3-sjg@chromium.org>
 <30f32467-51ea-47de-a272-38e074f4060b@pengutronix.de> <CAPnjgZ25xoXsi74XYY0E8ucQiowQqPdZgUHrfVNAYWKZEYODHg@mail.gmail.com>
 <875f0dbc-1d78-4901-91b2-6ad152bcea5a@pengutronix.de> <CAPnjgZ0UCkm5QCx+JXe1ggSshozPnOLB6cN=UoJyMn6S4wfFkg@mail.gmail.com>
 <06281f7c-e0f2-405c-95a9-0f7e9e84a7f6@pengutronix.de>
In-Reply-To: <06281f7c-e0f2-405c-95a9-0f7e9e84a7f6@pengutronix.de>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 29 Nov 2023 12:44:25 -0700
Message-ID: <CAPnjgZ2TT+0BvbjwfnGLQ3EPEXnLW6f1epiFdaBHRYaSAn5xsA@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] arm64: boot: Support Flat Image Tree
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, 
	Masahiro Yamada <masahiroy@kernel.org>, Tom Rini <trini@konsulko.com>, 
	lkml <linux-kernel@vger.kernel.org>, U-Boot Mailing List <u-boot@lists.denx.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Terrell <terrelln@fb.com>, Nicolas Schier <nicolas@fjasle.eu>, Will Deacon <will@kernel.org>, 
	linux-kbuild@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"

Hi Ahmad,

On Wed, 29 Nov 2023 at 12:33, Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
>
> On 29.11.23 20:27, Simon Glass wrote:
> > On Wed, 29 Nov 2023 at 12:15, Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
> >> On 29.11.23 20:02, Simon Glass wrote:
> >>> On Wed, 29 Nov 2023 at 11:59, Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
> >>>> The specification says that this is the root U-Boot compatible,
> >>>> which I presume to mean the top-level compatible, which makes sense to me.
> >>>>
> >>>> The code here though adds all compatible strings from the device tree though,
> >>>> is this intended?
> >>>
> >>> Yes, since it saves needing to read in each DT just to get the
> >>> compatible stringlist.
> >>
> >> The spec reads as if only one string (root) is supposed to be in the list.
> >> The script adds all compatibles though. This is not really useful as a bootloader
> >> that's compatible with e.g. fsl,imx8mm would just take the first device tree
> >> with that SoC, which is most likely to be wrong. It would be better to just
> >> specify the top-level compatible, so the bootloader fails instead of taking
> >> the first DT it finds.
> >
> > We do need to have a list, since we have to support different board revs, etc.
>
> Can you give me an example? The way I see it, a bootloader with
> compatible "vendor,board" and a FIT with configuration with compatibles:
>
>   "vendor,board-rev-a", "vendor,board"
>   "vendor,board-rev-b", "vendor,board"
>
> would just result in the bootloader booting the first configuration, even if
> the device is actually rev-b.

You need to find the best match, not just any match. This is
documented in the function comment for fit_conf_find_compat().

>
>
> >>>>> +        fsw.property_string('description', model)
> >>>>> +        fsw.property_string('type', 'flat_dt')
> >>>>> +        fsw.property_string('arch', arch)
> >>>>> +        fsw.property_string('compression', compress)
> >>>>> +        fsw.property('compatible', bytes(compat))
> >>>>
> >>>> I think I've never seen a compatible for a fdt node before.
> >>>> What use does this serve?
> >>>
> >>> It indicates the machine that the DT is for.
> >>
> >> Who makes use of this information?
> >
> > U-Boot uses it, I believe. There is an optimisation to use this
> > instead of reading the DT itself.
>
> The configuration already has a compatible entry. What extra use is the compatible
> entry in the FDT node?

It allows seeing the compatible stringlist without having to read the
FDT itself. I don't believe it is necessary though, so long as we are
scanning the configurations and not the FDT nodes.

Regards,
Simon

