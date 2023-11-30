Return-Path: <linux-kbuild+bounces-219-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E5E7FFC7D
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Nov 2023 21:30:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5C49281874
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Nov 2023 20:30:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 355BE5917F;
	Thu, 30 Nov 2023 20:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jC6H/6so"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D61B71710
	for <linux-kbuild@vger.kernel.org>; Thu, 30 Nov 2023 12:30:40 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a18b0f69b33so175175466b.0
        for <linux-kbuild@vger.kernel.org>; Thu, 30 Nov 2023 12:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701376239; x=1701981039; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0ze3g+KbzqGj36cXK4KXcn2SJ1PO+nJAvkG+kKo7vKI=;
        b=jC6H/6so6qOVA6bgYqPjfJLzj+Aim0sr8Y5sFupXQetgmB2t8qhLKb0l3KtiKZ1w+H
         86COOvOmOGG8tT1IyEcl7GBcfxVNH/4YJVW6neK4m8BPuF6bGegrpAtGv0b1SD4gbea2
         sdn+aazvx3Hgm3AVZlwBYFTeyCVoigJS2XIDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701376239; x=1701981039;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0ze3g+KbzqGj36cXK4KXcn2SJ1PO+nJAvkG+kKo7vKI=;
        b=aCopj7r/CpKh7oxQe/+pP/3IIISkbjQMO4hZvA9Szdyorenqu+qgMhLn39xjJ1j1r/
         Sz9xvNsF1Rw0JonzGGLC0quaO+1Gq6Pis302OvTYWVPYSrbw3WfyD5HeSYNJOtb535FD
         7G8FKq6O9xvx50QcBhdReOiZ6uOXkvrVQfZgSLxFU+LFiJCT1xIgUFk26hM7C+Ved1Mc
         EnWvToXRdtWlev8DQWgHHrnmkDlvRy3LQqpmHW6+fAXluGRcmo4wFgy5u6GWPtRd5e47
         eAKraG/KlAUExhSVdRZvykt4xJ4x+17QPt1aP9qewUr5AmG70anA/yoCnij64bJDrTEr
         B6tQ==
X-Gm-Message-State: AOJu0Yyb6bchDcnRWIchflRRCk1w1c1Sdzs16lXt4aD4FdC24Tb89W4R
	s/t67zjsIK3WvPOSqBiSguKiWh732efSh/FY85s4RA==
X-Google-Smtp-Source: AGHT+IF7hBJgyxS2nGwZC6cEyBKE+/ypnjV3+LlsjScXh8z5XtFWXqn22t4Iova8UzN/R3amZDfO6UlKdgPktSBI1UI=
X-Received: by 2002:a17:906:20d7:b0:a19:a409:37e3 with SMTP id
 c23-20020a17090620d700b00a19a40937e3mr151524ejc.60.1701376238996; Thu, 30 Nov
 2023 12:30:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231129172200.430674-1-sjg@chromium.org> <20231129172200.430674-3-sjg@chromium.org>
 <30f32467-51ea-47de-a272-38e074f4060b@pengutronix.de> <CAPnjgZ25xoXsi74XYY0E8ucQiowQqPdZgUHrfVNAYWKZEYODHg@mail.gmail.com>
 <875f0dbc-1d78-4901-91b2-6ad152bcea5a@pengutronix.de> <CAPnjgZ0UCkm5QCx+JXe1ggSshozPnOLB6cN=UoJyMn6S4wfFkg@mail.gmail.com>
 <06281f7c-e0f2-405c-95a9-0f7e9e84a7f6@pengutronix.de> <CAPnjgZ2TT+0BvbjwfnGLQ3EPEXnLW6f1epiFdaBHRYaSAn5xsA@mail.gmail.com>
 <8fbc81b1-31ab-46b0-87f4-b8bd8e8e2b47@pengutronix.de>
In-Reply-To: <8fbc81b1-31ab-46b0-87f4-b8bd8e8e2b47@pengutronix.de>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 30 Nov 2023 13:30:21 -0700
Message-ID: <CAPnjgZ1iyxk0bb56QR10N5aSphRYhLsw7Ly=z2i6rQCxP_AYPw@mail.gmail.com>
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

On Wed, 29 Nov 2023 at 12:54, Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
>
> Hello Simon,
>
> On 29.11.23 20:44, Simon Glass wrote:
> > Hi Ahmad,
> >
> > On Wed, 29 Nov 2023 at 12:33, Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
> >>
> >> On 29.11.23 20:27, Simon Glass wrote:
> >>> On Wed, 29 Nov 2023 at 12:15, Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
> >>>> On 29.11.23 20:02, Simon Glass wrote:
> >>>>> On Wed, 29 Nov 2023 at 11:59, Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
> >>>>>> The specification says that this is the root U-Boot compatible,
> >>>>>> which I presume to mean the top-level compatible, which makes sense to me.
> >>>>>>
> >>>>>> The code here though adds all compatible strings from the device tree though,
> >>>>>> is this intended?
> >>>>>
> >>>>> Yes, since it saves needing to read in each DT just to get the
> >>>>> compatible stringlist.
> >>>>
> >>>> The spec reads as if only one string (root) is supposed to be in the list.
> >>>> The script adds all compatibles though. This is not really useful as a bootloader
> >>>> that's compatible with e.g. fsl,imx8mm would just take the first device tree
> >>>> with that SoC, which is most likely to be wrong. It would be better to just
> >>>> specify the top-level compatible, so the bootloader fails instead of taking
> >>>> the first DT it finds.
> >>>
> >>> We do need to have a list, since we have to support different board revs, etc.
> >>
> >> Can you give me an example? The way I see it, a bootloader with
> >> compatible "vendor,board" and a FIT with configuration with compatibles:
> >>
> >>   "vendor,board-rev-a", "vendor,board"
> >>   "vendor,board-rev-b", "vendor,board"
> >>
> >> would just result in the bootloader booting the first configuration, even if
> >> the device is actually rev-b.
> >
> > You need to find the best match, not just any match. This is
> > documented in the function comment for fit_conf_find_compat().
>
> In my above example, both configuration are equally good.
> Can you give me an example where it makes sense to have multiple
> compatibles automatically extracted from the device tree compatible?
>
> The way I see it having more than one compatible here just has
> downsides.

I don't have an example to hand, but this is the required mechanism of
FIT. This feature has been in place for many years and is used by
ChromeOS, at least.

>
> >> The configuration already has a compatible entry. What extra use is the compatible
> >> entry in the FDT node?
> >
> > It allows seeing the compatible stringlist without having to read the
> > FDT itself. I don't believe it is necessary though, so long as we are
> > scanning the configurations and not the FDT nodes.
>
> I think it's better to drop this if it has no use.

OK. I cannot think of a use for it.

Regards,
Simon

