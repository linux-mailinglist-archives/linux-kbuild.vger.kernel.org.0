Return-Path: <linux-kbuild+bounces-263-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 48675805AB8
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Dec 2023 18:06:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F22C91F219F0
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Dec 2023 17:06:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6F5B6928E;
	Tue,  5 Dec 2023 17:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AX2Ol0VD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6324883
	for <linux-kbuild@vger.kernel.org>; Tue,  5 Dec 2023 09:06:50 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-40c09f4814eso35541035e9.1
        for <linux-kbuild@vger.kernel.org>; Tue, 05 Dec 2023 09:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701796008; x=1702400808; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GogvKYbQyGOCRhiy1zkw59fx2NhkM53PaJQFqQ8453o=;
        b=AX2Ol0VDEAYoG9OqoErdokoie4AKw2CmWICy95IVyOQjnU23aeleQovAvcH3SpJvC4
         1VK3gMF9vDr07SR+NBo1KWXyIBjHdQgARprkDoJ0dyqHVI+ieCPsLQa5XVM2n3ILnsAY
         1fxh0M4tcqjhEnBHH/8CIfO6BPZcL6wGZm9t0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701796008; x=1702400808;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GogvKYbQyGOCRhiy1zkw59fx2NhkM53PaJQFqQ8453o=;
        b=rEFNmHCHzPsclE2TUnYnKUw2pgeaK6ZkExjP9ztt92kr2WQk56eqQvU73bY5aU0ZIF
         TbJ2quO+2FtElyHSRXSn81hz4eJkhvYgOlvk1WIyt7Im03aLZsjZBbb5MdkDpFgfaLM4
         LI7WKsueQIJBtU9PgnzyP6ILMC1MOm5+g5OR7SEVWSxXjwRJykJ0L6qXHDF0GlERfpGW
         L/R3GwirjV0xoxjthy8yhk+PacFXeO/Z4Um+IQwxoA9dyyfYbOPILBrtABRnirwX+9A6
         hp9OCimvfnCxF5YSZy/lctWhcbtGn0EuFViTmghavzx0q4rzVdwPi0DITfyj3cLEi9Kz
         +y9g==
X-Gm-Message-State: AOJu0YzU1SDblbKpiIeiav4z7Tm9aL5ioHn3oc48Wkp9gmIuA9yyAGB0
	tyOk9T0aGOHHHW2PQpKGsq1JSDhwFsk5As1Topz/nMR3
X-Google-Smtp-Source: AGHT+IGMDoWSHI9dfdBN0obvnZSNvwUau2vz3Y33hYwBTRc7cMWgemSJBr2FhUxXF/JBqfWqVbwIrg==
X-Received: by 2002:a05:600c:5120:b0:40b:5e21:dd39 with SMTP id o32-20020a05600c512000b0040b5e21dd39mr755975wms.103.1701796008251;
        Tue, 05 Dec 2023 09:06:48 -0800 (PST)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com. [209.85.128.44])
        by smtp.gmail.com with ESMTPSA id el1-20020a170907284100b00a1b8829597fsm2099061ejc.114.2023.12.05.09.06.47
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Dec 2023 09:06:47 -0800 (PST)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40b367a0a12so73275e9.1
        for <linux-kbuild@vger.kernel.org>; Tue, 05 Dec 2023 09:06:47 -0800 (PST)
X-Received: by 2002:a05:600c:54e7:b0:3f7:3e85:36a with SMTP id
 jb7-20020a05600c54e700b003f73e85036amr548585wmb.7.1701796006690; Tue, 05 Dec
 2023 09:06:46 -0800 (PST)
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
 <8fbc81b1-31ab-46b0-87f4-b8bd8e8e2b47@pengutronix.de> <CAPnjgZ1iyxk0bb56QR10N5aSphRYhLsw7Ly=z2i6rQCxP_AYPw@mail.gmail.com>
 <5e8f42f8-2b03-4033-b6d2-9b3139f081d5@pengutronix.de> <CAPnjgZ2RjNzqJTRZSWvuscQhs+f8CG=fDcEO=qKXNeQLP53LnQ@mail.gmail.com>
 <CAD=FV=WXQrbnjeVOLp--vmLzScvW9VLFRu+apSY4WnL9JFk-AQ@mail.gmail.com> <653b592b-bd6a-48f8-acca-c617c5c8c1a3@pengutronix.de>
In-Reply-To: <653b592b-bd6a-48f8-acca-c617c5c8c1a3@pengutronix.de>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 5 Dec 2023 09:06:29 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WXCqhKpWp9mCqW+Dxv8pAUv+K9_8i-YfNGmWW4yr5Ghw@mail.gmail.com>
Message-ID: <CAD=FV=WXCqhKpWp9mCqW+Dxv8pAUv+K9_8i-YfNGmWW4yr5Ghw@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] arm64: boot: Support Flat Image Tree
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Simon Glass <sjg@chromium.org>, linux-arm-kernel@lists.infradead.org, 
	Masahiro Yamada <masahiroy@kernel.org>, Tom Rini <trini@konsulko.com>, 
	lkml <linux-kernel@vger.kernel.org>, U-Boot Mailing List <u-boot@lists.denx.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Terrell <terrelln@fb.com>, Nicolas Schier <nicolas@fjasle.eu>, Will Deacon <will@kernel.org>, 
	linux-kbuild@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Dec 5, 2023 at 3:16=E2=80=AFAM Ahmad Fatoum <a.fatoum@pengutronix.d=
e> wrote:
>
> Hello,
>
> On 04.12.23 18:52, Doug Anderson wrote:> On Sat, Dec 2, 2023 at 8:37=E2=
=80=AFAM Simon Glass <sjg@chromium.org> wrote:
> >> On Thu, 30 Nov 2023 at 19:04, Ahmad Fatoum <a.fatoum@pengutronix.de> w=
rote:
> >>> On 30.11.23 21:30, Simon Glass wrote:
> >>>> On Wed, 29 Nov 2023 at 12:54, Ahmad Fatoum <a.fatoum@pengutronix.de>=
 wrote:
> >>>>> On 29.11.23 20:44, Simon Glass wrote:
> >>>> I don't have an example to hand, but this is the required mechanism =
of
> >>>> FIT. This feature has been in place for many years and is used by
> >>>> ChromeOS, at least.
> >>>
> >>> I see the utility of a FIT configuration with
> >>>
> >>>     compatible =3D "vendor,board-rev-a", "vendor,board-rev-b";
> >>>
> >>> I fail to see a utility for a configuration with
> >>>
> >>>     compatible =3D "vendor,board", "vendor,SoM", "vendor,SoC";
> >>>
> >>> Any configuration that ends up being booted because "vendor,SoC" was =
matched is
> >>> most likely doomed to fail. Therefore, I would suggest that only the =
top level
> >>> configuration is written into the FIT configurations automatically.
> >>
> >> Firstly, I am not an expert on this.
> >>
> >> Say you have a board with variants. The compatible string in U-Boot
> >> may be something like:
> >>
> >> "google,veyron-brain-rev1", "google,veyron-brain", "google,veyron",
> >> "rockchip,rk3288";
> >>
> >> If you then have several FIT configurations, they may be something lik=
e:
> >>
> >> "google,veyron-brain-rev0", "google,veyron-brain", "google,veyron",
> >> "rockchip,rk3288";
> >> "google,veyron-brain-rev1", "google,veyron-brain", "google,veyron",
> >> "rockchip,rk3288";
> >> "google,veyron-brain-rev2", "google,veyron-brain", "google,veyron",
> >> "rockchip,rk3288";
> >>
> >> You want to choose the second one, since it is a better match than the=
 others.
>
> Now imagine, you are building a kernel that has no DT support for the Vey=
ron,
> but instead has support for the Phytec RK3288 PCM-947:
>
>   phytec,rk3288-pcm-947", "phytec,rk3288-phycore-som", "rockchip,rk3288
>
> As far as I understand U-Boot code, A veyron U-Boot would boot the Phytec=
 DT
> if CONFIG_FIT_BEST_MATCH is set, although it's a bad match and a boot fai=
lure
> should rather have occurred.

On depthcharge the bootloader never matches on just a SoC name.


> >> +Doug Anderson who knows a lot more about this than me.
> >
> > Hopefully this is all explained by:
> >
> > https://docs.kernel.org/arch/arm/google/chromebook-boot-flow.html
>
> Thanks Doug, this was helpful. The missing information to me was that
> depthcharge only compares the top-level board compatible in addition
> to runtime generated board compatibles, unlike what U-Boot seems to do.
>
> barebox only compares its top-level compatible against the FIT configurat=
ion
> compatibles, so adding a full compatible list to the configuration nodes =
as done
> by this series should be ok there as well. I think U-Boot could run into
> issues though as described above.
>
> Out of curiosity: I only heard about Depthcharge before as exploitation t=
oolkit
> for U-Boot. Can you point me at some documentation on what the Depthcharg=
e bootloader
> does what U-Boot (which was presumably used before?) doesn't?

I can only assume that the depthcharge you're talking about is
different. The one used by Chromebooks is basically:

https://chromium.googlesource.com/chromiumos/platform/depthcharge/+/refs/he=
ads/main

I assume you're asking: why are we using depthcharge in ChromeOS
instead of U-Boot?

There was much discussion about this back in the day. From what I
recall, part of the reason was that folks wanted the boot flow to be a
bit more standard between x86 Chromebooks and ARM Chromebooks. x86
Chromebooks were using coreboot for the initial hardware booting and
then needed a 2nd stage to actually load Linux and ended up creating
depthcharge. ...and then we switched to the same model for ARM boards.

I didn't personally make that decision and I'm also not on the
firmware team, so that's about all I'll say on the topic. ;-)

Oh, hmmm. Searching found me:

https://www.chromium.org/chromium-os/developer-information-for-chrome-os-de=
vices/custom-firmware/

...which pointed at:

https://www.chromium.org/chromium-os/2014-firmware-summit/ChromeOS%20firmwa=
re%20summit%20-%20Depthcharge.pdf

-Doug

