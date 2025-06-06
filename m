Return-Path: <linux-kbuild+bounces-7381-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACC6ACFC1C
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Jun 2025 07:11:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65AB1188AA89
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Jun 2025 05:11:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 648AA1DD0F6;
	Fri,  6 Jun 2025 05:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i47aHbIE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B921FAA;
	Fri,  6 Jun 2025 05:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749186691; cv=none; b=kwQC32ZsMnWuxkR7mEEdUUXwX00fTiJz7/kVykrXFwcwmvsxYfdtLjqUfkN/QrkSvIho0lsgF+zw5IH3BaaROm1awZYX9gv+fBMfQ4ZplhdvJhsuTjw4YzGACAqbmG81uO3KBpM+g5ZqiM0RlgjTZU1Wr8IuiH79V89B7GhW8Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749186691; c=relaxed/simple;
	bh=XixpG3h2Wfm5UDQlbos6g3WPhSDeiac38pX+QViuNuo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dA5L3+Z8N9BtRRVceq7mFAiLkEw8YiJ0FDwx9jS7vz/MDemnXhfmSJ3g/NocrNcwYxYFfpPWwNvfSJCWuk9KBEVHnoOrEB+WhNYLhqDo99NpjOyR5I+evhZAaBEUiQfbB04kC04rqaF904qU1L7Tg9+vwQDmKP9VL7KNmQjD3ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i47aHbIE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2FA1C4CEEF;
	Fri,  6 Jun 2025 05:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749186691;
	bh=XixpG3h2Wfm5UDQlbos6g3WPhSDeiac38pX+QViuNuo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=i47aHbIE/md9B3QILm/pBim6tKIY6baTGQnrOPu2Ktuow/Vuw9M0BDriposuRIweY
	 9GM0J6xjTVVtIPOXGxkaOkgjbTPCDXpOb8+TXhBrWXihYw/1lbxy2j8gQDGqlWFJWc
	 6IlY5DZmFEq7q3XICoXthPZmA6ZTWfV/4vXW53fGKERFu7B6U9Il7M966U6zjMzd9y
	 YK+572jlJk88cjypZuGLv/TNZDgzlUfiR8/Psab4BwpINLfvMNK8U715O6ojmngwPO
	 EU5uxq7JrvPVt4LaPWJrLj8MCq1CAot8zYedf+N0MQTdIakPMpqK/wqsbznjq239AM
	 KNH+A97NoRfPQ==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5536b9be5f6so11217e87.1;
        Thu, 05 Jun 2025 22:11:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUQTb85imh2306pWTavFp38uMPpi6lbgCV7ETUhi+WxFM79GaZ9EYfji+1eqfJPWOhfZg8PTqJhR4XxLM42Gg==@vger.kernel.org, AJvYcCW7nBCHQjiT3xlU5uku+CB13VDsVv4FQXr/dSkNavIhwC7NN6l7XA3KDBemRZfupM0S+06mWZz9AcuPmoQ=@vger.kernel.org, AJvYcCWKW/hMCTWwY3p9iP1+OhQbF3DTEnIzMXwMGYNRZvKayTf5Eh92bRjvjD/rhjo+mnM96nnNDKWrMqE4sR/U@vger.kernel.org
X-Gm-Message-State: AOJu0YxM19HmGn5/HCyCp66mS3jpSZFQdCvlgfBtoA6/iH2UaZmswkTh
	BEz2irT72pSHnLwzRccog5Sk0wC5DAmjL87pbZpGil+KrK6Zqh80TIgIHJewlSCnjwDN5gc1sD9
	d3U6GePUTJWahyMhSU9Mhw1giTvu/9zo=
X-Google-Smtp-Source: AGHT+IGMXo2NEhj8FlmTIEc+rxCbxoEeSBy3AOAfXa1c6eOPvWCTeF0b9uF+quE9Sep6kbuOeVePQYvVmzVVgW2WbGo=
X-Received: by 2002:a05:6512:3b2a:b0:553:35c4:db08 with SMTP id
 2adb3069b0e04-55366c03d87mr399969e87.30.1749186689675; Thu, 05 Jun 2025
 22:11:29 -0700 (PDT)
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
 <aEAtUc6OTyvu-ThM@example.org>
In-Reply-To: <aEAtUc6OTyvu-ThM@example.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 6 Jun 2025 14:10:53 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQhnA50EyccG2hVqnNHjfFk-JC6zYTkqzUR4Pibg2mzWA@mail.gmail.com>
X-Gm-Features: AX0GCFu3QC7v8MWJ1FLZ_BqajU0kTfxdzWlG-4VhaB69EP5AfxzSq5x_9TOqDA0
Message-ID: <CAK7LNAQhnA50EyccG2hVqnNHjfFk-JC6zYTkqzUR4Pibg2mzWA@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] modpost: Make mod_device_table aliases more unique
To: Alexey Gladkov <legion@kernel.org>
Cc: Petr Pavlu <petr.pavlu@suse.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 4, 2025 at 8:26=E2=80=AFPM Alexey Gladkov <legion@kernel.org> w=
rote:
>
> On Tue, Jun 03, 2025 at 01:18:25AM +0900, Masahiro Yamada wrote:
> > > > > Before these patches this was not a problem as non-unique charact=
ers are
> > > > > in separate object files when the module is compiled separately.
> > > > >
> > > > > But when the modules are compiled into the kernel, there is a sym=
bol
> > > > > conflict when linking vmlinuz. We have modules that export multip=
le device
> > > > > tables from different object files.
> > > >
> > > > This is because the __mod_device_table__* symbols are global, but
> > > > I suspect they do not need to be.
> > > >
> > > > Let's test this
> > > > https://lore.kernel.org/lkml/20250602105539.392362-1-masahiroy@kern=
el.org/T/#u
> > >
> > > I tested this patch with the config:
> > >
> > > make allmodconfig
> > > make mod2yesconfig
> > >
> > > and it works.
> >
> > Good.
> > Then, __COUNTER__ is unnecessary.
>
> I didn't immediately notice. The patch you suggested works, but these
> symbols remain in System.map and it seems in vmlinuz.
>

Ah, yes, if your patch set is applied.

Currently, MODULE_DEVICE_TABLE() is no-op in vmlinux.

This makes me realize that your v3 4/6
increased the vmlinux image, as MODULE_DEVICE_TABLE()
is kept for modpost.


--=20
Best Regards
Masahiro Yamada

