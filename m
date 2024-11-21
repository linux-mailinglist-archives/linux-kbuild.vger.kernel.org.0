Return-Path: <linux-kbuild+bounces-4789-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7AD9D554D
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Nov 2024 23:17:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B70DE1F211FC
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Nov 2024 22:17:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F9541885B0;
	Thu, 21 Nov 2024 22:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oGFOQGfg"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE2870801;
	Thu, 21 Nov 2024 22:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732227449; cv=none; b=nh+TRLLAk5iMQy923IjCQfNcuQqWhezotqwIewW2iM3jkyHb8K4xSaVd8NdzS1aZJi0ICfEXY/PdKkKrvHIuJNpVdPAdg0/Bxa7fixFclmUmXlri2Y8ajeo80moQTLOYdbNopJQ7tQpVP4/xB6LT8KlheE0kCvhAtWj8i0kFRGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732227449; c=relaxed/simple;
	bh=MLlq8+M+tw64hFOX9c9IBrDEY8JRJbyJBDIrXXaqd+k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kct2eDS37hE1o3nnD0OLphtGPR5PCQIL8QANAUxGMxycoCS7sVDBy2xcia5MyD46Trahr2r06KKuwFtTOIEm2Y8wy9nmydYlX2C4yFPMIJrDCGrwPysix1lfOXeBboK6YpyfLGd5xNHCANnj1dNYPs0wfe2pU9xxoHwgK/gJSoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oGFOQGfg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87F75C4CECD;
	Thu, 21 Nov 2024 22:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732227447;
	bh=MLlq8+M+tw64hFOX9c9IBrDEY8JRJbyJBDIrXXaqd+k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oGFOQGfggCJy5L2K6kG9BCE2IChc89FYc/HSCB1upfT0yICiKWAW+pm4UZ+LJox6+
	 vVZTsriZv4j1zYIBm0Or/lC1CZV+BI3ZWTAUDdzL0rqgrxyzwSHvPZEE/+LYYx48Bo
	 ee6kjUyic+rqdCeAQbrwV0+dtmpORSs87xA0dgXbHgwgZAu9hNL/wXghccHbG8IjtN
	 eHJ3e5SzGgjUK5MQkUSLotDpg1VH+CjeR8DGCD5l1iPuDY2aWlEn37V7b2VwOtmKqN
	 g+yWDlskxerZYOg2dCSITNsVja2OhqLhY7hkX0Yf4KuQop4pTS2y9rFKwGX4nRvaA7
	 aP47c1kzR5gFQ==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53d9ff92edaso1586265e87.1;
        Thu, 21 Nov 2024 14:17:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV/DqywRGx9GmsZCG84M53izHDc/51Yh1wk/NqOV6X8m3szrnpn/aSvj/Nfy1Tjd9qA5ieoBpBRx/xErjef@vger.kernel.org, AJvYcCXKrAZ4K9t3sw9sJL70jH6gtyuLTUa/s29hSEE6M3yLyu0Z0UGEmJyECFNiTjO/5YUFhdtkTX8dvt6/1MI=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv4ZbmfJt4LXUZy3hUBjaljYNu2caCV+1+7eMcMjOQy5fNs9nl
	/SKpXBU/3Ky14cirqvTLS1oX3wEE94zdAmx7FhEneMn/HAzkGnpfPQHV0D1QVDoHAw18UPwe0fs
	5EiIWXxDrt3oNGoy+7rtnHTXrgEQ=
X-Google-Smtp-Source: AGHT+IEDF/pd/Sz3sl47bUiAWd6bAMOR+fWYehca9LHB3zJLcbn10+vWnVIxV5UhcwMI+r07eJGD8MGL4Aptk38j+GA=
X-Received: by 2002:a05:6512:31ce:b0:53d:d125:c26b with SMTP id
 2adb3069b0e04-53dd35a55edmr201881e87.9.1732227446129; Thu, 21 Nov 2024
 14:17:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241120204125.52644-1-pvorel@suse.cz> <CAK7LNASYr+pjUs-W40d_Gc+vP67nX7NHXyE0AnOpXxXgxrCtqQ@mail.gmail.com>
 <20241121011720.GA69389@pevik>
In-Reply-To: <20241121011720.GA69389@pevik>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 22 Nov 2024 07:16:49 +0900
X-Gmail-Original-Message-ID: <CAK7LNARc4Cp1a8G9p0KiCGyu0WL3BNEd0BY0COMPL4U8bLr8gA@mail.gmail.com>
Message-ID: <CAK7LNARc4Cp1a8G9p0KiCGyu0WL3BNEd0BY0COMPL4U8bLr8gA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] init/Kconfig: add python3 availability config
To: Petr Vorel <pvorel@suse.cz>
Cc: linux-arm-msm@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kbuild@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 21, 2024 at 10:17=E2=80=AFAM Petr Vorel <pvorel@suse.cz> wrote:
>
> > On Thu, Nov 21, 2024 at 5:41=E2=80=AFAM Petr Vorel <pvorel@suse.cz> wro=
te:
>
> > > It will be used in the next commit for DRM_MSM.
>
> > > Suggested-by: Rob Clark <robdclark@gmail.com>
> > > Signed-off-by: Petr Vorel <pvorel@suse.cz>
> > > ---
> > > Changes v3->v4:
> > > * Move definition to the end of the file
>
>
> > I prefer to not check the tool.
>
> Ack.
>
> > Why don't you install python3?
>
> Everybody installs it when it's required, the question is how to inform a=
bout
> the dependency.
>
> There build environments are minimal environments:
> * chroot (e.g. cross compilation)
> * container
>
> These are used by both developers and distros.


Documentation/process/changes.rst
documents basic tools necessary for building the kernel.

Python3 is listed as "optional" because it is required
only for some CONFIG options.

If the exact dependency is unclear, it is better to install
all tools listed in that table.




> Kind regards,
> Petr
>
> > >  init/Kconfig | 3 +++
> > >  1 file changed, 3 insertions(+)
>
> > > diff --git a/init/Kconfig b/init/Kconfig
> > > index fbd0cb06a50a..c77e45484e81 100644
> > > --- a/init/Kconfig
> > > +++ b/init/Kconfig
> > > @@ -2047,3 +2047,6 @@ config ARCH_HAS_SYNC_CORE_BEFORE_USERMODE
> > >  # <asm/syscall_wrapper.h>.
> > >  config ARCH_HAS_SYSCALL_WRAPPER
> > >         def_bool n
> > > +
> > > +config HAVE_PYTHON3
> > > +       def_bool $(success,$(PYTHON3) -V)
> > > --
> > > 2.45.2



--=20
Best Regards
Masahiro Yamada

