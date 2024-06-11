Return-Path: <linux-kbuild+bounces-2056-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C86E903716
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Jun 2024 10:52:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4C221C23146
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Jun 2024 08:52:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65A6317557E;
	Tue, 11 Jun 2024 08:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZxDRYcU2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907F617556B
	for <linux-kbuild@vger.kernel.org>; Tue, 11 Jun 2024 08:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718095927; cv=none; b=pPUiHNHrEzxJKaBjt6LyIzH6E7UkqrOhuHr5Yk5Q7pA5AQyVqoIe4CcqeTSjF8cmeyTyS12jTAdqgb4f44bfoLEMsbzM2vZn4zoydxmJwa94VoR7/0hJBmb73bZT8z9VnbJODt85BGtjvNcNFSVNQGelJgrojYxbvzIBCen3bag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718095927; c=relaxed/simple;
	bh=UjgjmN27tt3nv48wIRQoWCn7PMmqaFPrHmBXuiyw5aY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tVzE3jIQx1bWVsFUbKFm5j+chOlvkhiSjLzEShqQ8x9oaDpFx/okRPbXKEUuhBGjV6Y/SJ4HpbY4aWnYX4IMdaCfGcGGoZQSYOm/WGrqMcd7o0mvFNJ08EMeKahFtydYtIXOhZADOVvN+4weBidcqR7lMhqJzu37neR+F8fXWc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZxDRYcU2; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2ebdfe261f9so33899771fa.1
        for <linux-kbuild@vger.kernel.org>; Tue, 11 Jun 2024 01:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718095924; x=1718700724; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vXby5sEGwA50yL3eB9wTqqKrctF2MCwrds0R1QAOu3M=;
        b=ZxDRYcU2CkNzT40Zdb4slamu0BLit6AUEuExyhcJevVrynilKB250GKUyOmMrJ2ced
         oaGa2ic9eucO02HDGBeJ6HnRxWDjm8ovj+rGR9Q5jxmztaqbx9rLQCz6hD9FdyitzWiQ
         0JtZhn2xo8PYa7UHIiEk/Q4qWZC2ErbxVGVOI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718095924; x=1718700724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vXby5sEGwA50yL3eB9wTqqKrctF2MCwrds0R1QAOu3M=;
        b=FwcDr6op9k7aOZYbAFfntOT6JkNpGB2pdwS/dBrGSmFhDRyxtpGd0ozCvCIVQYnZnh
         cUy3H8ktp2gyiwZ9Gm6YNOOp4t/s6AQlpG68ao5oEj3VyqNyXNVxHvlwX5f+6lejwk7X
         8T5c7Vti1OiV06XmOhmvMt7q1Awl9gN/XcYKs2j/h1BRzGnnz9U8Oz0L9rGSpUTrVhuh
         l9ZBhV2vwIqmVRpUSQpSV0nYArrdbODIrPmSJgW6v7c8/eYbjuROVWT6WoWjGJfhGlGz
         9CdXgQSvLhf+Ki3zGOdTjaSMDJiBfqOEUSytDazTp+1cmF93yWM6sWuGSXcOb3Yx7Xvg
         ENVg==
X-Forwarded-Encrypted: i=1; AJvYcCXsztgWXPdluMs/BSjn3mI5VrNJjwzKeBkVj6xBi3Fn2yg9XoAPazaHxkxwyOxBsveQbJqEU7aQcK3pAoASPM9PtAkDKv/R6zMqhz8Y
X-Gm-Message-State: AOJu0YxqMSjipfLspnB/BHf0EGxw8PJoavn/DXWi+RP3YNLczdISa6QJ
	9fpWK9EAFSsqeul4+b5hx9zI39YFHfQ6gmgBh5mI9kV+fGHaf7dB5IHQGeVl0gkHlNBMNzUKp0U
	La/wfYC6Kc3L8vaS1qA9Bv5yciblYfPvceKlR
X-Google-Smtp-Source: AGHT+IFYphUGlrZqZKQrrag+fVIY0jtcRvcW+sNPtwLMe/Wn88bbM8NqjFo1Hi5FWlCxfkg3SgG5E80CLD1Jx+yy7nw=
X-Received: by 2002:ac2:4a69:0:b0:52b:bfa7:66a1 with SMTP id
 2adb3069b0e04-52bbfa766f7mr7667867e87.5.1718095923707; Tue, 11 Jun 2024
 01:52:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240605094843.4141730-1-wenst@chromium.org> <CAFLszTjX=ixC3pRRGJeaP=ie_yc+KcCRyQ06MBFeSZnBepaXaw@mail.gmail.com>
In-Reply-To: <CAFLszTjX=ixC3pRRGJeaP=ie_yc+KcCRyQ06MBFeSZnBepaXaw@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 11 Jun 2024 16:51:52 +0800
Message-ID: <CAGXv+5EcEYGqXq2C1OCK4J4t1NusV7nWp16zb74P6_tCeLnSGw@mail.gmail.com>
Subject: Re: [PATCH] scripts/make_fit: Support decomposing DTBs
To: Simon Glass <sjg@chromium.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Elliot Berman <quic_eberman@quicinc.com>, Devicetree List <devicetree@vger.kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 10, 2024 at 11:16=E2=80=AFPM Simon Glass <sjg@chromium.org> wro=
te:
>
> Hi Chen-Yu,
>
> On Wed, 5 Jun 2024 at 03:48, Chen-Yu Tsai <wenst@chromium.org> wrote:
> >
> > The kernel tree builds some "composite" DTBs, where the final DTB is th=
e
> > result of applying one or more DTB overlays on top of a base DTB with
> > fdtoverlay.
> >
> > The FIT image specification already supports configurations having one
> > base DTB and overlays applied on top. It is then up to the bootloader t=
o
> > apply said overlays and either use or pass on the final result. This
> > allows the FIT image builder to reuse the same FDT images for multiple
> > configurations, if such cases exist.
> >
> > The decomposition function depends on the kernel build system, reading
> > back the .cmd files for the to-be-packaged DTB files to check for the
> > fdtoverlay command being called. This will not work outside the kernel
> > tree. The function is off by default to keep compatibility with possibl=
e
> > existing users.
> >
> > To facilitate the decomposition and keep the code clean, the model and
> > compatitble string extraction have been moved out of the output_dtb
> > function. The FDT image description is replaced with the base file name
> > of the included image.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> > This is a feature I alluded to in my replies to Simon's original
> > submission of the make_fit.py script [1].
> >
> > This is again made a runtime argument as not all firmware out there
> > that boot FIT images support applying overlays. Like my previous
> > submission for disabling compression for included FDT images, the
> > bootloader found in RK3399 and MT8173 Chromebooks do not support
> > applying overlays. Another case of this is U-boot shipped by developmen=
t
> > board vendors in binary form (without upstream) in an image or in
> > SPI flash on the board that were built with OF_LIBFDT_OVERLAY=3Dn.
> > These would fail to boot FIT images with DT overlays. One such
> > example is my Hummingboard Pulse. In these cases the firmware is
> > either not upgradable or very hard to upgrade.
> >
> > I believe there is value in supporting these cases. A common script
> > shipped with the kernel source that can be shared by distros means
> > the distro people don't have to reimplement this in their downstream
> > repos or meta-packages. For ChromeOS this means reducing the amount
> > of package code we have in shell script.
> >
> > [1] https://lore.kernel.org/linux-kbuild/20231207142723.GA3187877@googl=
e.com/
> > [2]
> >
> >  scripts/Makefile.lib |  1 +
> >  scripts/make_fit.py  | 70 ++++++++++++++++++++++++++++++--------------
> >  2 files changed, 49 insertions(+), 22 deletions(-)
>
> This is a clever way to discover the included files. Does it need to
> rely on the Linux build information, or could this information somehow
> be in the .dtb files? I had expected some sort of overlay scheme in

(+CC DT folks and mailing list)

I suppose we could make the `fdtoverlay` program embed this data during
the kernel build. That would keep the information together, while also
having one source of truth (the kernel Makefiles). Whether it belongs
in the DTB or not is a separate matter.

> the source, but perhaps people have given up on that?

I wouldn't say given up, since we haven't agreed on anything either.
Elliot had some concerns when I brought this up earlier [1] though.

ChenYu

[1] https://lore.kernel.org/linux-mediatek/20240314113908471-0700.eberman@h=
u-eberman-lv.qualcomm.com/

