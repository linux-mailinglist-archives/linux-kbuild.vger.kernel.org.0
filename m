Return-Path: <linux-kbuild+bounces-255-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EC0803C25
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Dec 2023 18:59:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73AFC281110
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Dec 2023 17:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1460728694;
	Mon,  4 Dec 2023 17:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CVDTlFPa"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBAACFA
	for <linux-kbuild@vger.kernel.org>; Mon,  4 Dec 2023 09:58:54 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-54c671acd2eso3913707a12.1
        for <linux-kbuild@vger.kernel.org>; Mon, 04 Dec 2023 09:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701712733; x=1702317533; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5o4kl72J4dnliAxYr60gM/uEi8xxxJtEIon7STyN2k4=;
        b=CVDTlFPa2UtwJHvVgR/l13h9Ina6KiDj/aCyRjEyftyMq46OAFGWRtWSp3t6JjwWe6
         0IZ9Ag5hzSFgjkV+cCiAxC05DdPCucbw+GWYoxa1hYJnw/pRZu/lkvpUud1/GUrhrJso
         Y0xtgaKzkN4zwpTeWr2pX5lrLjHHPHbyjj9Vw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701712733; x=1702317533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5o4kl72J4dnliAxYr60gM/uEi8xxxJtEIon7STyN2k4=;
        b=C9Me2ejz1j9L3BXjPzo4GFNyi+NxV0qrDMAbwWh6MHbeG1AexDD8PtynxV7H5wKySZ
         97jz3ate5uCnYK5846+jWwftEpjNXGvrJNTVYw4hcqZqlap9jSYTiljqm61AoSpyJdSo
         w+ixYSKisOVrleCnHARaEaswWKT3tuGMlC84Yr1fsidWhaCnfPwei3orRcWs5Jny0Qrf
         Go0vdkOtR7g3zepzrSZPQxMousa870TATJq1S6pAJ285OttsBCQaR38QZ24eXjePfU+P
         sXWBlUVuJqkCj4dVcFTufO0v81gF/KrU54MvOrykGK3d+mdoiq0j1I+IEwxpQSOEpz9Q
         ShqA==
X-Gm-Message-State: AOJu0YyM8yFEaBXgKYUxWPLjEGX4sDAww2LX6G41aWAl1t0SUuh+Fegs
	xZEU6owZIeVRFWKWe/V3yk3kin+csmrlOXgjSx3d4M7z
X-Google-Smtp-Source: AGHT+IGtijfKArdoEXu02y6fWfAqLGLprlFDQogZZEN4COKP/0wrgBBPRQ7BVwy7A95JHYxZ0/JMdg==
X-Received: by 2002:a17:906:5953:b0:a19:a19b:c717 with SMTP id g19-20020a170906595300b00a19a19bc717mr3644648ejr.103.1701712733090;
        Mon, 04 Dec 2023 09:58:53 -0800 (PST)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com. [209.85.128.49])
        by smtp.gmail.com with ESMTPSA id hj4-20020a170906874400b009a193a5acffsm449126ejb.121.2023.12.04.09.58.52
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Dec 2023 09:58:52 -0800 (PST)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40b367a0a12so935e9.1
        for <linux-kbuild@vger.kernel.org>; Mon, 04 Dec 2023 09:58:52 -0800 (PST)
X-Received: by 2002:a05:600c:4507:b0:40a:483f:f828 with SMTP id
 t7-20020a05600c450700b0040a483ff828mr458557wmo.4.1701712392461; Mon, 04 Dec
 2023 09:53:12 -0800 (PST)
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
In-Reply-To: <CAPnjgZ2RjNzqJTRZSWvuscQhs+f8CG=fDcEO=qKXNeQLP53LnQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 4 Dec 2023 09:52:56 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WXQrbnjeVOLp--vmLzScvW9VLFRu+apSY4WnL9JFk-AQ@mail.gmail.com>
Message-ID: <CAD=FV=WXQrbnjeVOLp--vmLzScvW9VLFRu+apSY4WnL9JFk-AQ@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] arm64: boot: Support Flat Image Tree
To: Simon Glass <sjg@chromium.org>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>, linux-arm-kernel@lists.infradead.org, 
	Masahiro Yamada <masahiroy@kernel.org>, Tom Rini <trini@konsulko.com>, 
	lkml <linux-kernel@vger.kernel.org>, U-Boot Mailing List <u-boot@lists.denx.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Terrell <terrelln@fb.com>, Nicolas Schier <nicolas@fjasle.eu>, Will Deacon <will@kernel.org>, 
	linux-kbuild@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Dec 2, 2023 at 8:37=E2=80=AFAM Simon Glass <sjg@chromium.org> wrote=
:
>
> Hi Ahmad,
>
> On Thu, 30 Nov 2023 at 19:04, Ahmad Fatoum <a.fatoum@pengutronix.de> wrot=
e:
> >
> > Hello Simon,
> >
> > On 30.11.23 21:30, Simon Glass wrote:
> > > On Wed, 29 Nov 2023 at 12:54, Ahmad Fatoum <a.fatoum@pengutronix.de> =
wrote:
> > >> On 29.11.23 20:44, Simon Glass wrote:
> > >>> On Wed, 29 Nov 2023 at 12:33, Ahmad Fatoum <a.fatoum@pengutronix.de=
> wrote:
> > >>>>
> > >>>> On 29.11.23 20:27, Simon Glass wrote:
> > >>>>> On Wed, 29 Nov 2023 at 12:15, Ahmad Fatoum <a.fatoum@pengutronix.=
de> wrote:
> > >>>>>> On 29.11.23 20:02, Simon Glass wrote:
> > >>>>>>> On Wed, 29 Nov 2023 at 11:59, Ahmad Fatoum <a.fatoum@pengutroni=
x.de> wrote:
> > >>>>>>>> The specification says that this is the root U-Boot compatible=
,
> > >>>>>>>> which I presume to mean the top-level compatible, which makes =
sense to me.
> > >>>>>>>>
> > >>>>>>>> The code here though adds all compatible strings from the devi=
ce tree though,
> > >>>>>>>> is this intended?
> > >>>>>>>
> > >>>>>>> Yes, since it saves needing to read in each DT just to get the
> > >>>>>>> compatible stringlist.
> > >>>>>>
> > >>>>>> The spec reads as if only one string (root) is supposed to be in=
 the list.
> > >>>>>> The script adds all compatibles though. This is not really usefu=
l as a bootloader
> > >>>>>> that's compatible with e.g. fsl,imx8mm would just take the first=
 device tree
> > >>>>>> with that SoC, which is most likely to be wrong. It would be bet=
ter to just
> > >>>>>> specify the top-level compatible, so the bootloader fails instea=
d of taking
> > >>>>>> the first DT it finds.
> > >>>>>
> > >>>>> We do need to have a list, since we have to support different boa=
rd revs, etc.
> > >>>>
> > >>>> Can you give me an example? The way I see it, a bootloader with
> > >>>> compatible "vendor,board" and a FIT with configuration with compat=
ibles:
> > >>>>
> > >>>>   "vendor,board-rev-a", "vendor,board"
> > >>>>   "vendor,board-rev-b", "vendor,board"
> > >>>>
> > >>>> would just result in the bootloader booting the first configuratio=
n, even if
> > >>>> the device is actually rev-b.
> > >>>
> > >>> You need to find the best match, not just any match. This is
> > >>> documented in the function comment for fit_conf_find_compat().
> > >>
> > >> In my above example, both configuration are equally good.
> > >> Can you give me an example where it makes sense to have multiple
> > >> compatibles automatically extracted from the device tree compatible?
> > >>
> > >> The way I see it having more than one compatible here just has
> > >> downsides.
> > >
> > > I don't have an example to hand, but this is the required mechanism o=
f
> > > FIT. This feature has been in place for many years and is used by
> > > ChromeOS, at least.
> >
> > I see the utility of a FIT configuration with
> >
> >     compatible =3D "vendor,board-rev-a", "vendor,board-rev-b";
> >
> > I fail to see a utility for a configuration with
> >
> >     compatible =3D "vendor,board", "vendor,SoM", "vendor,SoC";
> >
> > Any configuration that ends up being booted because "vendor,SoC" was ma=
tched is
> > most likely doomed to fail. Therefore, I would suggest that only the to=
p level
> > configuration is written into the FIT configurations automatically.
>
> Firstly, I am not an expert on this.
>
> Say you have a board with variants. The compatible string in U-Boot
> may be something like:
>
> "google,veyron-brain-rev1", "google,veyron-brain", "google,veyron",
> "rockchip,rk3288";
>
> If you then have several FIT configurations, they may be something like:
>
> "google,veyron-brain-rev0", "google,veyron-brain", "google,veyron",
> "rockchip,rk3288";
> "google,veyron-brain-rev1", "google,veyron-brain", "google,veyron",
> "rockchip,rk3288";
> "google,veyron-brain-rev2", "google,veyron-brain", "google,veyron",
> "rockchip,rk3288";
>
> You want to choose the second one, since it is a better match than the ot=
hers.
>
> +Doug Anderson who knows a lot more about this than me.

Hopefully this is all explained by:

https://docs.kernel.org/arch/arm/google/chromebook-boot-flow.html

