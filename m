Return-Path: <linux-kbuild+bounces-2111-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9C29067AD
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Jun 2024 10:52:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 611101F25D55
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Jun 2024 08:52:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C527143875;
	Thu, 13 Jun 2024 08:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RuXZWM4F"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A5414374F
	for <linux-kbuild@vger.kernel.org>; Thu, 13 Jun 2024 08:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718268558; cv=none; b=QJtvurKd82QlsN2yDGNTy2aca1msx3r24psRYxQ0ZfYmzN90bcAdolVvE91c3tOAqSakrpzjWMMoMCaBfo0Zns2OGGDFVZ7xptiyD+LLg9jmorwjT6pxWQ/mvc4KUChzqzUffLKp2h51qgd/njroki+9Eb4DXWvfyIPJkynLdbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718268558; c=relaxed/simple;
	bh=HE8xq91tSeitAZbGRTpkR3ieVargSUmg1O1NMAOP4SI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I+bqvh5j7SyO1c0GxdUSVxCCA3/0spVyyspFaoAleJkiPBuJn2lmY/hr5YCYZRrt6jHjWH0/hbsJkKWIDw8aqa0js9Pk3h8s8ecB0WjhQACPntZYz3MPiZCQLdGdlUUaPEnmjgJBfuOX60u36dWO6TyVRDR6GfW4GPOzfoYVhUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RuXZWM4F; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2ebe3fb5d4dso7050711fa.0
        for <linux-kbuild@vger.kernel.org>; Thu, 13 Jun 2024 01:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718268553; x=1718873353; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rTr/MAONVIXOW/ed2j1Y4JPjByHCaZY5bO3fhQlc/FI=;
        b=RuXZWM4FHz8WH3PWVFQ+y18iIZk1St0oOpeuzo52nnLtbPZBkITizD+O83c2pqR9L4
         yrKwI4RT8/5QCNG1JgjarrBXzLgcDmxMX4xLiBLBdtADUWiGdlIpmss/L3H3jBbb41Lf
         IET7OtoH8JAyddCSP9u++tnYYickyQiguPqWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718268553; x=1718873353;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rTr/MAONVIXOW/ed2j1Y4JPjByHCaZY5bO3fhQlc/FI=;
        b=ATnL2ZYKjzwr0FbS4w3VZ8DS7MtSDEiMY6ezGoa0Q6dnqoA3I3oBJIJE6oVGMdEDp1
         0hY6cbozSSe50u3Pc7+FhBNTWOIrFriowRzq5sv3WNkicyxcudh9S6yLSf/Aijkfcm32
         fiGggZwFFH/u2qEJ7SYkFxuQtMQ+ZlO1w+Hst6BJimx8txbwEFWAwZgL52rFzokvdw8r
         f1NkNi2Y4IUKxB+IDP3DJ42YitVNNUXX+9LlJyKyFQsf1bYM28i1CfsiEGD5yU/wlz4G
         jiRkJkd30wc1utaGN+zRo40KNtu3EqskzLHjKoMGYh4Y2jXp637iSFmj7PsaSoZhLied
         TNwg==
X-Forwarded-Encrypted: i=1; AJvYcCVPcF1KaRuW3PtI3iaCC11DbLaTADlpjhIh6p/V6QtQsk6csykhOv+yCuIt2SEGDfzd7j1SpCB4wPmn2TFcPzzO0oSvmyaiplsbOlbJ
X-Gm-Message-State: AOJu0Yy8minTWzc0M1VpzI7mtPHcndXSsRLotqhGdsDBWqUaAmh7TKYr
	9w3//dnQhLT8wPMvNMCSgOZpuPmgz72hZBOLO3gl4rEzgMTU18+j5PdfURiKksTCIfcWOLq78HX
	cwT4NSZFIjryl1/gMmv5T/vECeDBOhB5YPrSf
X-Google-Smtp-Source: AGHT+IE+r3Kqc9JyW9uVxa3CaFi4XFZ1lH1muZ8FT3YtffeqhpYi+YqDSnfERIqbeOv4xeS1JwHZdfibzglw2fkkhtw=
X-Received: by 2002:a2e:7206:0:b0:2ec:2fb:de43 with SMTP id
 38308e7fff4ca-2ec02fbdee7mr5173871fa.3.1718268553552; Thu, 13 Jun 2024
 01:49:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240605094843.4141730-1-wenst@chromium.org> <CAFLszTjX=ixC3pRRGJeaP=ie_yc+KcCRyQ06MBFeSZnBepaXaw@mail.gmail.com>
 <CAGXv+5EcEYGqXq2C1OCK4J4t1NusV7nWp16zb74P6_tCeLnSGw@mail.gmail.com> <CAK7LNAQ7XAGgzhBXQWPFVgqJwdBcO3mF5pmQ3mSsmdrZ0EBL9Q@mail.gmail.com>
In-Reply-To: <CAK7LNAQ7XAGgzhBXQWPFVgqJwdBcO3mF5pmQ3mSsmdrZ0EBL9Q@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 13 Jun 2024 16:49:02 +0800
Message-ID: <CAGXv+5FpHkiJaNa=XRdnrmPJN01AdxsOYpTBur8zqM8tU=hFKQ@mail.gmail.com>
Subject: Re: [PATCH] scripts/make_fit: Support decomposing DTBs
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Simon Glass <sjg@chromium.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Elliot Berman <quic_eberman@quicinc.com>, Devicetree List <devicetree@vger.kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2024 at 10:45=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.=
org> wrote:
>
> On Tue, Jun 11, 2024 at 5:52=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org>=
 wrote:
> >
> > On Mon, Jun 10, 2024 at 11:16=E2=80=AFPM Simon Glass <sjg@chromium.org>=
 wrote:
> > >
> > > Hi Chen-Yu,
> > >
> > > On Wed, 5 Jun 2024 at 03:48, Chen-Yu Tsai <wenst@chromium.org> wrote:
> > > >
> > > > The kernel tree builds some "composite" DTBs, where the final DTB i=
s the
> > > > result of applying one or more DTB overlays on top of a base DTB wi=
th
> > > > fdtoverlay.
> > > >
> > > > The FIT image specification already supports configurations having =
one
> > > > base DTB and overlays applied on top. It is then up to the bootload=
er to
> > > > apply said overlays and either use or pass on the final result. Thi=
s
> > > > allows the FIT image builder to reuse the same FDT images for multi=
ple
> > > > configurations, if such cases exist.
> > > >
> > > > The decomposition function depends on the kernel build system, read=
ing
> > > > back the .cmd files for the to-be-packaged DTB files to check for t=
he
> > > > fdtoverlay command being called. This will not work outside the ker=
nel
> > > > tree. The function is off by default to keep compatibility with pos=
sible
> > > > existing users.
> > > >
> > > > To facilitate the decomposition and keep the code clean, the model =
and
> > > > compatitble string extraction have been moved out of the output_dtb
> > > > function. The FDT image description is replaced with the base file =
name
> > > > of the included image.
> > > >
> > > > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > > > ---
> > > > This is a feature I alluded to in my replies to Simon's original
> > > > submission of the make_fit.py script [1].
> > > >
> > > > This is again made a runtime argument as not all firmware out there
> > > > that boot FIT images support applying overlays. Like my previous
> > > > submission for disabling compression for included FDT images, the
> > > > bootloader found in RK3399 and MT8173 Chromebooks do not support
> > > > applying overlays. Another case of this is U-boot shipped by develo=
pment
> > > > board vendors in binary form (without upstream) in an image or in
> > > > SPI flash on the board that were built with OF_LIBFDT_OVERLAY=3Dn.
> > > > These would fail to boot FIT images with DT overlays. One such
> > > > example is my Hummingboard Pulse. In these cases the firmware is
> > > > either not upgradable or very hard to upgrade.
> > > >
> > > > I believe there is value in supporting these cases. A common script
> > > > shipped with the kernel source that can be shared by distros means
> > > > the distro people don't have to reimplement this in their downstrea=
m
> > > > repos or meta-packages. For ChromeOS this means reducing the amount
> > > > of package code we have in shell script.
> > > >
> > > > [1] https://lore.kernel.org/linux-kbuild/20231207142723.GA3187877@g=
oogle.com/
> > > > [2]
> > > >
> > > >  scripts/Makefile.lib |  1 +
> > > >  scripts/make_fit.py  | 70 ++++++++++++++++++++++++++++++----------=
----
> > > >  2 files changed, 49 insertions(+), 22 deletions(-)
> > >
> > > This is a clever way to discover the included files. Does it need to
> > > rely on the Linux build information, or could this information someho=
w
> > > be in the .dtb files? I had expected some sort of overlay scheme in
> >
> > (+CC DT folks and mailing list)
> >
> > I suppose we could make the `fdtoverlay` program embed this data during
> > the kernel build. That would keep the information together, while also
> > having one source of truth (the kernel Makefiles). Whether it belongs
> > in the DTB or not is a separate matter.
>
>
> Some time ago, I asked a similar question
> with a similar motivation.
>
> https://lore.kernel.org/devicetree-compiler/CAK7LNARV8Bo-tBXMdOu55Wg9uZRX=
vNiRdkDJ4LH8PwVMnMp4cA@mail.gmail.com/

I think this discussion was geared towards "unapplying" overlays. What
we would like is for metadata to be available, and preferably not tied
to the kernel build system generated metadata file, so that with the same
bunch of DTB + DTBO files, we could figure out how to decompose them and
just bundle the components.

If the metadata is embedded within the composite DTB, then given a DTB
bundle (such as installed with `make dtbs_install`) the make_fit.py
script could go and do the decomposition without the *.cmd files
from the kernel build. This is assuming all the component parts are
installed together.

ChenYu

> >
> > > the source, but perhaps people have given up on that?
> >
> > I wouldn't say given up, since we haven't agreed on anything either.
> > Elliot had some concerns when I brought this up earlier [1] though.
> >
> > ChenYu
> >
> > [1] https://lore.kernel.org/linux-mediatek/20240314113908471-0700.eberm=
an@hu-eberman-lv.qualcomm.com/
> >
>
> --
> Best Regards
> Masahiro Yamada

