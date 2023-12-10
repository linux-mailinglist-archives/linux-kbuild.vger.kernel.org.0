Return-Path: <linux-kbuild+bounces-311-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0319A80B94E
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 Dec 2023 07:36:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2EB1D1C20840
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 Dec 2023 06:36:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEDFB17CD;
	Sun, 10 Dec 2023 06:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GKiYYxXr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B477EC;
	Sun, 10 Dec 2023 06:36:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8D70C433CA;
	Sun, 10 Dec 2023 06:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702190178;
	bh=M/6wLn8z1v9OB3jE3O+3Xw9Y4HHJzGOqFn+iYKs91HA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GKiYYxXrm6vPl1EQLzPrXmKc0/zgzkZ+G3tf+mhbB4QXRQ5nxcdh8dGyjs8Gave0C
	 F13e1vLXumCfh6WVCNCVX2TpJK3i+2ZqpC1ozk0xlYR89vsUvjyKHJ9udBvYbeBUfS
	 2UDmDmjT/bGGjk2B953DCqdZtmZ+fmV00fNYwKFrTuwfwpAxN8NK7flqJw+iFyZDNO
	 SLMesqIOb1r5r8zOdvt9x8iUNi+vv/zj8YBg18Gh5sZgqM2ETuik89c1msNCQK3iSg
	 xHmRk4HVnadQDIE8xn9oR0gS+C3ycGB5+A8XvPgMh/B+YFAwPSskTjXdpJatuDbbCB
	 O94jXj8BwLJkQ==
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-1f5bd86ceb3so2419516fac.2;
        Sat, 09 Dec 2023 22:36:18 -0800 (PST)
X-Gm-Message-State: AOJu0YxMz3B7XPLIzZBWl4b1XmCECutrCAQfVGDR7TnGERpUMOLpOakt
	ZFYDX2BCGNWBgf2j+/6d86xLpZju4+MPk70PK4A=
X-Google-Smtp-Source: AGHT+IFQVJUQFeEFHsTwAZp7ZhGHssvbi/i98rUeBk2zW/8DwIEsjKJtvHV8cUWi9hmXG7QpO369Mg+JsytoM+93b/0=
X-Received: by 2002:a05:6870:4201:b0:1fb:20ca:95df with SMTP id
 u1-20020a056870420100b001fb20ca95dfmr3248841oac.39.1702190178238; Sat, 09 Dec
 2023 22:36:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231203101418.1910661-1-masahiroy@kernel.org> <20231203191947.GA147536@ravnborg.org>
In-Reply-To: <20231203191947.GA147536@ravnborg.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 10 Dec 2023 15:35:41 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ5E2T0oitxniLhCAjf4e7QRPfyVpV8SU5P60_j1oF=uA@mail.gmail.com>
Message-ID: <CAK7LNAQ5E2T0oitxniLhCAjf4e7QRPfyVpV8SU5P60_j1oF=uA@mail.gmail.com>
Subject: Re: [PATCH 1/3] sparc: vdso: clean up build artifacts in arch/sparc/vdso/
To: sparclinux@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, 
	Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 4, 2023 at 4:21=E2=80=AFAM Sam Ravnborg <sam@ravnborg.org> wrot=
e:
>
> Hi Masahiro.
>
> On Sun, Dec 03, 2023 at 07:14:16PM +0900, Masahiro Yamada wrote:
> > Currently, vdso-image-*.c, vdso*.so, vdso*.so.dbg are not cleaned
> > because 'make clean' does not include include/config/auto.conf,
> > resulting in $(vdso_img-y) being empty.
> >
> > Add the build artifacts to 'targets' unconditionally.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>
> Nice small fix/clean-ups.
>
> This and the following two patches are:
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
>
> > ---
> >


Series, applied to linux-kbuild.


--=20
Best Regards
Masahiro Yamada

