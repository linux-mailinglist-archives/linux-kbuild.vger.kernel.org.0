Return-Path: <linux-kbuild+bounces-9879-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 9282BC8C34B
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Nov 2025 23:25:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 01426344D28
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Nov 2025 22:25:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94D6C319875;
	Wed, 26 Nov 2025 22:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cXAKUNg+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9012FB99D
	for <linux-kbuild@vger.kernel.org>; Wed, 26 Nov 2025 22:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764195937; cv=none; b=P6NOolOJtzgjw3GbzF9V9F5sfh5Q+LIVPEqxhkI1AfsswXpMubd6UxehIBH6BvS0y9cFhhC+xUGo+X8MjAACuX6QTDN+87X1x8e3nZePnbK7fF7/X1lxdtaHSWebIyyZ3Tc9Gt5xR8SEXeSxG9HeAjcZM9i6w80LfPAyJjacYrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764195937; c=relaxed/simple;
	bh=HOT4Gu96WDg1GNjhCNSzX+3zkGtP/7lynXOjNF7OuuM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J0VrNvuSGZPPiM8HSw7oissPOU7mH1Loilm4uRT8sCcr3Ut0AbdFbMX7kcJcIkZt+AshAokOw9YyoY1CJSYQNjjz3CXiFVd/FVXo5V6z6hzDEBlOlcfZe/iTtiQ3xvZvEERSFOA4JL5sRRF9wFImynUrV3Dwl6vRMYNKDQaXA2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cXAKUNg+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D96BC116D0
	for <linux-kbuild@vger.kernel.org>; Wed, 26 Nov 2025 22:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764195937;
	bh=HOT4Gu96WDg1GNjhCNSzX+3zkGtP/7lynXOjNF7OuuM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cXAKUNg+Gr8x07WTRiiU27RCxnDcBPNJEQH0PrsXtXeV4hichLIKK9JX39Tcu7qOj
	 gCP/Z8fbtLS14P9Bzq0M9qy5YWymCuckR9cxtRIsD+DWH4IXT+j5xwl1JfLvNqL1M4
	 SJNvuX2rFtk3svrxRFoAtwEsw0o+dL2uUl38HohDryoTgbxqCMYrFZtYPmHHG48fkW
	 vIU31Udm/3/klGJ4v9iGMYNm2meHipJtl0kksh0dmhxFG0+nwcdT2L6qfgBOlHm0xL
	 I+8ISJG1nHx/WIhRv50EYn7Q702gQaFY7MvqGy59VI7DgSGZAd0Epup65YVQAiIZtA
	 XYrbv/FGcGc4g==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-64074f01a6eso510707a12.2
        for <linux-kbuild@vger.kernel.org>; Wed, 26 Nov 2025 14:25:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWX/nfCmp9rRb0NUbXGsG5XItE9pGXmA4oB/x3zThv2RK1CYrQT6FlVpNypVZczHjzt44uplFFSajN7Ck8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYoPRXRqLPDnIhCelO3KFeRBvJ9ifX+LYrtPVrdr/4ZYEN4S69
	ZKYh+IVl+f2H6AOePzOyeegkYMjRgrjn3N673WYYZ6IIkVdesn0/APauvZHPGBQDrOaHuBPHYjV
	hWl6/NiusmdJKBcknMw7Mg4nkVV/6LQ==
X-Google-Smtp-Source: AGHT+IE8t9dgqpkksbjPh6GcMq0WGLROg6+4afEUls7q/K2hXXYpvpEA6HkyAjhC1SY4duWi9xNeDPU4OhqOOxqyumE=
X-Received: by 2002:a05:6402:274e:b0:641:8644:f87f with SMTP id
 4fb4d7f45d1cf-64555cd9bd8mr20042023a12.17.1764195935712; Wed, 26 Nov 2025
 14:25:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251114222759.4181152-1-robh@kernel.org> <aSDEC9D87nZB5RJp@derry.ads.avm.de>
In-Reply-To: <aSDEC9D87nZB5RJp@derry.ads.avm.de>
From: Rob Herring <robh@kernel.org>
Date: Wed, 26 Nov 2025 16:25:24 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKJEZodVSo-6bZBcUTc0TfNCs6bEGfvy9ZdZbmSbu=cSA@mail.gmail.com>
X-Gm-Features: AWmQ_blJXcfU7CfsdtSi-0_ppiE05WGbkk25QamtIsJcoqd1FjOKuZFah7ilsls
Message-ID: <CAL_JsqKJEZodVSo-6bZBcUTc0TfNCs6bEGfvy9ZdZbmSbu=cSA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Ensure .dtbo targets are applied to a base .dtb
To: Nicolas Schier <nsc@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, devicetree@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 26, 2025 at 2:49=E2=80=AFPM Nicolas Schier <nsc@kernel.org> wro=
te:
>
> On Fri, Nov 14, 2025 at 04:27:58PM -0600, Rob Herring (Arm) wrote:
> > It is a requirement that DT overlays in the kernel are applied at build
> > time to a base DTB in order to validate they can be applied and to
> > validate them against the DT schemas. DT overlays on their own may be
> > incomplete and can't be validated.
> >
> > Add a kbuild check so this doesn't have to be checked and fixed
> > periodically.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> >  scripts/Makefile.dtbs | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/scripts/Makefile.dtbs b/scripts/Makefile.dtbs
> > index 2d321b813600..15473edc2589 100644
> > --- a/scripts/Makefile.dtbs
> > +++ b/scripts/Makefile.dtbs
> > @@ -10,6 +10,13 @@ real-dtb-y :=3D $(call real-search, $(dtb-y), .dtb, =
-dtbs)
> >  # Base DTB that overlay is applied onto
> >  base-dtb-y :=3D $(filter %.dtb, $(call real-search, $(multi-dtb-y), .d=
tb, -dtbs))
> >
> > +# Ensure that any .dtbo is applied to at least one base .dtb. Otherwis=
e, it
> > +# does not get validated.
> > +applied-dtbo :=3D $(filter %.dtbo, \
> > +     $(call real-search, $(call multi-search, $(dtb-y) $(dtb-), .dtb, =
-dtbs), .dtb, -dtbs))
> > +unapplied-dtbo :=3D $(filter-out $(applied-dtbo),$(filter %.dtbo, $(dt=
b-y)))
> > +$(if $(unapplied-dtbo), $(warning .dtbo is not applied to any base: $(=
unapplied-dtbo)))
> > +
> >  dtb-y           :=3D $(addprefix $(obj)/, $(dtb-y))
> >  multi-dtb-y     :=3D $(addprefix $(obj)/, $(multi-dtb-y))
> >  real-dtb-y      :=3D $(addprefix $(obj)/, $(real-dtb-y))
> > --
> > 2.51.0
> >
>
> Acked-by: Nicolas Schier <nsc@kernel.org>

Thanks!

> Do you take this via DT tree?

Yes, I'll take it.

Rob

