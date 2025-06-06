Return-Path: <linux-kbuild+bounces-7383-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 676D5AD0128
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Jun 2025 13:20:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 208CB7A9BAE
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Jun 2025 11:19:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E2352882B4;
	Fri,  6 Jun 2025 11:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fMroN5Hd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDF32882A6;
	Fri,  6 Jun 2025 11:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749208845; cv=none; b=L2O1kI4nzBn8hHLaQM8Ir6iHnNHg9pn7Fg0548DNtLOqsfuO+tIX2drVAr9YR0gQhF7LlXXHODA5550YudM9xx6B454qRMW2vLz1XY4qwO8Dx2UlMazJO6n4zsDskRbToAP5BRWiH0k662y6oQutk5/6PejgvUvdhR7BWBlm0vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749208845; c=relaxed/simple;
	bh=ti9oOmqvMGZUuTjapj1Ojl85o/P6e6+srSzCZvIrPug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qy7JRyCLWPSiiXJfc+ee/wbyZX+d09yGnaGtqroma8n9rAUP4ne/Ds2QTxcM5007rMiPiQzu/Tl2vVtPjhuSi5sS/bRG5IxXCosikYW1mLcaBZssPQAgZyC2G77dMwCqGETkgfy8GwmYIrivP3zeQAczL8xAwa3ghf6tSsi6yoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fMroN5Hd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6215C4CEEE;
	Fri,  6 Jun 2025 11:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749208843;
	bh=ti9oOmqvMGZUuTjapj1Ojl85o/P6e6+srSzCZvIrPug=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fMroN5Hdeoj2fXFeiuFwDDjk29HJ9r8Y7fJlr2wZfQAoznnCRxu5oOIm1CHqdGdOp
	 FKVj028MKePTDNPvPOdDct0TvUwm568Qn1Y7mLUhHgtdMPECFSLdHbjgz02Lyht6mT
	 QB0db8ECRW70WsDiQFxoUhEeZwaEvo2uGHWJlL7/OWN6on2aLwaopBOnyBk5aQ9tMy
	 f81dczgn4CJ3onCGWovbuVpjdO996Fa2ANMyAaxaxvKJpZz5gSwPfxpzPp0tfNBy/T
	 chQz4FEfkjt/rHtJRfpsMaxi4e9+FpWcVw8dNLfwr2mtI2m8Q/Bd14jKDs356yVBeQ
	 VqXVlo0jTX6kw==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5533c562608so1936637e87.3;
        Fri, 06 Jun 2025 04:20:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU2qzND37PXL78bSalAej4hSnJKFApTZn98EWaT8R87EDJt3zWeM5gpEkLSC0qCTSKcXjFExwksQAie6E+v@vger.kernel.org, AJvYcCVHeCQ3DZru0fUGHlwkLaDzVma7Jv4HxpGNSie1WN2qQlELvE5wJvMBksFue8XoQVX9r+skFOBDXUhmjEU=@vger.kernel.org, AJvYcCWxqUhrLSfq20KP8LCu4Rvrud9ZSDt3YaxHl8QBmZyGwovQMGB6QJbUzHa/AxlxrF2eGf40BEJpOElslMizJw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb2bOSzh4TsNKPHBIbf445LI72zf85jxYDLrpVHmy7Zyu66qaQ
	5lO0KQUnr7S/T2lSXUI2mIv/Aq23wSvXVEJVpzMCERWkuabfVT6AZqszA9ibxSLQ4lDcJh1AHsG
	NpKzTAaBdDkOw28JFY4ZTqVd/KUc7CwM=
X-Google-Smtp-Source: AGHT+IGotelMifHvfI0kxQU1GKWrH79dTAXyh8hKDUGCX9NIBElz/uLWQ5uFvZmiHGQprCmA6Xpe6plpyrH+73inxxE=
X-Received: by 2002:a05:6512:234e:b0:553:3621:efee with SMTP id
 2adb3069b0e04-55366c433e2mr755126e87.50.1749208842441; Fri, 06 Jun 2025
 04:20:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1748335606.git.legion@kernel.org> <ecf0ebdda5bcf82464ed1cebbf50afdcd8b5b23a.1748335606.git.legion@kernel.org>
 <CAK7LNARkhc40UfrmmqsqmqkCn60=7zHc=pDFGR4o=k2p7CsABA@mail.gmail.com>
 <aD1bozP0l67f_wbs@example.org> <CAK7LNAQmQtvB4PfmH4MkRM123wySON6cF6TG79fi0WER1sz4Gw@mail.gmail.com>
 <aD2vSnZhofEPilcL@example.org> <CAK7LNATfUzCXmCb5kKOJOKOw=CJvk7viGgYtrGLwbSAkq7VtyA@mail.gmail.com>
 <aEAtUc6OTyvu-ThM@example.org> <CAK7LNAQhnA50EyccG2hVqnNHjfFk-JC6zYTkqzUR4Pibg2mzWA@mail.gmail.com>
In-Reply-To: <CAK7LNAQhnA50EyccG2hVqnNHjfFk-JC6zYTkqzUR4Pibg2mzWA@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 6 Jun 2025 20:20:06 +0900
X-Gmail-Original-Message-ID: <CAK7LNATY+11zvrpfGnnxFENKyXjKC2qfmt3-i5tjVjHs9wiZKg@mail.gmail.com>
X-Gm-Features: AX0GCFu68IzIGUZHtnHJayFYfspqR6O5akw101n6HxgF3TEX6o0MmWVsTfedvHs
Message-ID: <CAK7LNATY+11zvrpfGnnxFENKyXjKC2qfmt3-i5tjVjHs9wiZKg@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] modpost: Make mod_device_table aliases more unique
To: Alexey Gladkov <legion@kernel.org>
Cc: Petr Pavlu <petr.pavlu@suse.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 6, 2025 at 2:10=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.or=
g> wrote:
>
> On Wed, Jun 4, 2025 at 8:26=E2=80=AFPM Alexey Gladkov <legion@kernel.org>=
 wrote:
> >
> > On Tue, Jun 03, 2025 at 01:18:25AM +0900, Masahiro Yamada wrote:
> > > > > > Before these patches this was not a problem as non-unique chara=
cters are
> > > > > > in separate object files when the module is compiled separately=
.
> > > > > >
> > > > > > But when the modules are compiled into the kernel, there is a s=
ymbol
> > > > > > conflict when linking vmlinuz. We have modules that export mult=
iple device
> > > > > > tables from different object files.
> > > > >
> > > > > This is because the __mod_device_table__* symbols are global, but
> > > > > I suspect they do not need to be.
> > > > >
> > > > > Let's test this
> > > > > https://lore.kernel.org/lkml/20250602105539.392362-1-masahiroy@ke=
rnel.org/T/#u
> > > >
> > > > I tested this patch with the config:
> > > >
> > > > make allmodconfig
> > > > make mod2yesconfig
> > > >
> > > > and it works.
> > >
> > > Good.
> > > Then, __COUNTER__ is unnecessary.
> >
> > I didn't immediately notice. The patch you suggested works, but these
> > symbols remain in System.map and it seems in vmlinuz.
> >
>
> Ah, yes, if your patch set is applied.
>
> Currently, MODULE_DEVICE_TABLE() is no-op in vmlinux.
>
> This makes me realize that your v3 4/6
> increased the vmlinux image, as MODULE_DEVICE_TABLE()
> is kept for modpost.


With your patch set, __mod_device_table_* will be
included in vmlinux.

My patch changes them from global to local  ('D' is changed to 'd'),
but there is no difference in the fact that v3 4/6 will grow
the symbol table in vmlinux.




(1) Your patch set

$ arm-linux-gnueabihf-nm  vmlinux | grep __mod_device | head -n 10
c0527678 D __mod_device_table__164__kmod_clk_scmi__scmi__scmi_id_table
c053f458 D __mod_device_table__164__kmod_reset_scmi__scmi__scmi_id_table
c05421bc D __mod_device_table__164__kmod_reset_uniphier_glue__of__uniphier_=
glue_reset_match
c05334ac D __mod_device_table__164__kmod_scmi_pm_domain__scmi__scmi_id_tabl=
e
c054cbd0 D __mod_device_table__164__kmod_twl4030_power__of__twl4030_power_o=
f_match
c0548e8c D __mod_device_table__165__kmod_omap3_rom_rng__of__omap_rom_rng_ma=
tch
c05124a0 D __mod_device_table__165__kmod_simple_pm_bus__of__simple_pm_bus_o=
f_match
c05559ac D __mod_device_table__165__kmod_timer_ti_dm__of__omap_timer_match
c0528a68 D __mod_device_table__166__kmod_adpll__of__ti_adpll_match
c0520a68 D __mod_device_table__166__kmod_gpio_en7523__of__airoha_gpio_of_ma=
tch

(2) Your patch set + my one (extern -> static)

$ arm-linux-gnueabihf-nm  vmlinux | grep __mod_device | head -n 10
c0527678 d __mod_device_table__164__kmod_clk_scmi__scmi__scmi_id_table
c053f458 d __mod_device_table__164__kmod_reset_scmi__scmi__scmi_id_table
c05421bc d __mod_device_table__164__kmod_reset_uniphier_glue__of__uniphier_=
glue_reset_match
c05334ac d __mod_device_table__164__kmod_scmi_pm_domain__scmi__scmi_id_tabl=
e
c054cbd0 d __mod_device_table__164__kmod_twl4030_power__of__twl4030_power_o=
f_match
c0548e8c d __mod_device_table__165__kmod_omap3_rom_rng__of__omap_rom_rng_ma=
tch
c05124a0 d __mod_device_table__165__kmod_simple_pm_bus__of__simple_pm_bus_o=
f_match
c05559ac d __mod_device_table__165__kmod_timer_ti_dm__of__omap_timer_match
c0528a68 d __mod_device_table__166__kmod_adpll__of__ti_adpll_match
c0520a68 d __mod_device_table__166__kmod_gpio_en7523__of__airoha_gpio_of_ma=
tch












--=20
Best Regards
Masahiro Yamada

