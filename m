Return-Path: <linux-kbuild+bounces-4495-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9C29BA62E
	for <lists+linux-kbuild@lfdr.de>; Sun,  3 Nov 2024 16:01:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 73242B20943
	for <lists+linux-kbuild@lfdr.de>; Sun,  3 Nov 2024 15:01:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75CCB17C9E8;
	Sun,  3 Nov 2024 15:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F0XX4ozx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D89171E6E;
	Sun,  3 Nov 2024 15:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730646106; cv=none; b=MZ1Putv58w8ozHt6sT73Msd4zUJCGH6dkdSShw+dqybJoMY81IcScyeZUht3NZayfOc+WipRj6+vZv3Zby7Qrmkg+zS37BjgvKalBhf9/+XTquTjSsc3ae262FDELPrqjGm0re3XoIP6vDhGAs8QxJ/eU+xYtYZ48PMLMKCbLSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730646106; c=relaxed/simple;
	bh=ATqZN/kUTCmT9mOr3mnM789HutjM8B0bW3ICfRBWggs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hnOkYX/hi9Rhl1CkWEwSmG5rmCLlXWe8p7R6twz9qtslnD4q/xdXKoFap26prHmOGkqJY6MfnmW7bX1YbrxNSSrBEGjBagkziJMjsnFCKruL+kUlE3AomtBcfHBLGvb1MBZLmYLmHjKqnbcv4Kw/NWisxLT1080KbqWjhOFDc1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F0XX4ozx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0FF3C4AF0D;
	Sun,  3 Nov 2024 15:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730646105;
	bh=ATqZN/kUTCmT9mOr3mnM789HutjM8B0bW3ICfRBWggs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=F0XX4ozxB4gXQ2NnPdK6+MytrJNTNCH1WUAZ/0u2u3dC1mJ+7IqVcgxjHiI3wCun0
	 0tzEEr0y23zu6HwLMTKpoRdUFoFBqoScyjN8EsHsQI1+6+pPdEC4V4ATLD8NjcifB0
	 eXAjXc/w77G9Jvr6HAzn20xbKTc3MguR1cGa4XcuFO0U5R85gOHRFws43Z/L4KsemZ
	 Z/VOYL4rdkiQvGqIxA9y50TG0nO7dZsFo802n7ZwTSbE+logmqjIkyhEh/Lcj4Fs7Y
	 mFfp62sWWW0EEmzbFMlZ4oZGnsbVTcbFFYgSV5yGnZ0ReCCcWBzWilGStDWOI+HcVJ
	 b6oqw4nh2IC2A==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2fb3ce15172so43001911fa.0;
        Sun, 03 Nov 2024 07:01:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW7XtYErsQ5DYfSQ7myUII64RB5B4yZY0QZ8DMgX7Yfifo+ZYSTYGmN5YIRUysD/PZ5/QBAlOw01B03U0M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhptKGa3m6LKsPia8pk8XxllIIqW0VG8MEXSNgEckF7W44mbSn
	XRwIN9jcVpxnhPJPlKCROPJaHGTHCmE+XdgDyu5fVN+c+KZw4PNY4S+/JnNPESwwMhHjTnnvji0
	2O0J/XEZAretfNN0doD45c/llJZU=
X-Google-Smtp-Source: AGHT+IEmBDStAkKB9WMq27czYGT0oy8tg98TQOevCXh0nKTfBAYJKSLn9ohyJ4UmzbATKlndmaoIOrYsfR13Agh1PYU=
X-Received: by 2002:a2e:a983:0:b0:2fb:5d19:4689 with SMTP id
 38308e7fff4ca-2fedb3c5ff9mr30961691fa.1.1730646104481; Sun, 03 Nov 2024
 07:01:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241103124824.943659-1-masahiroy@kernel.org> <CAK7LNASW1jrO-hENgbZS1QGiZcGeAFwOwZY6M6cAx6tafOfhqQ@mail.gmail.com>
In-Reply-To: <CAK7LNASW1jrO-hENgbZS1QGiZcGeAFwOwZY6M6cAx6tafOfhqQ@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 4 Nov 2024 00:01:08 +0900
X-Gmail-Original-Message-ID: <CAK7LNATz0nOKoZFeFXGii=CcAJ=O+zMV44OYFe+D-CLSJ8GKew@mail.gmail.com>
Message-ID: <CAK7LNATz0nOKoZFeFXGii=CcAJ=O+zMV44OYFe+D-CLSJ8GKew@mail.gmail.com>
Subject: Re: [PATCH] modpost: fix acpi MODULE_DEVICE_TABLE built with
 mismatched endianness
To: linux-kbuild@vger.kernel.org
Cc: Hanjun Guo <guohanjun@huawei.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
	"Suthikulpanit, Suravee" <Suravee.Suthikulpanit@amd.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 3, 2024 at 9:56=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.or=
g> wrote:
>
> On Sun, Nov 3, 2024 at 9:48=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.=
org> wrote:
> >
> > When CONFIG_SATA_AHCI_PLATFORM=3Dm, modpost outputs incorect MODULE_ALI=
AS()
> > if the endianness of the target and the build machine do not match.
> >
> > When the endianness of the target kernel and the build machine match,
> > the output is correct:
> >
> >   $ grep 'MODULE_ALIAS("acpi' drivers/ata/ahci_platform.mod.c
> >   MODULE_ALIAS("acpi*:APMC0D33:*");
> >   MODULE_ALIAS("acpi*:010601:*");
> >
> > However, when building a little-endian kernel on a big-endian machine
> > (or vice versa), the output is incorrect:
> >
> >   $ grep 'MODULE_ALIAS("acpi' drivers/ata/ahci_platform.mod.c
> >   MODULE_ALIAS("acpi*:APMC0D33:*");
> >   MODULE_ALIAS("acpi*:0601??:*");
> >
> > The 'cls' and 'cls_msk' fields are 32-bit.
> >
> > DEF_FIELD() must be used instead of DEF_FIELD_ALIAS() to correctly hand=
le
>
> This is a typo:
>
>  DEF_FIELD_ALIAS() -> DEF_FIELD_ADDR()
>

Applied to linux-kbuild/fixes.



--=20
Best Regards
Masahiro Yamada

