Return-Path: <linux-kbuild+bounces-3057-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AD503955485
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Aug 2024 03:11:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40DAD1F22949
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Aug 2024 01:11:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3823D3D66;
	Sat, 17 Aug 2024 01:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hYv/bv5X"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38251FBA;
	Sat, 17 Aug 2024 01:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723857085; cv=none; b=fdLxDlWUgonciwIk2HBjpVh+NjnxMhjwX51Kc4tMhUH0ziHkx5T365+ZI1NHQA/UooYt8e6XHyZ54HTIi8/mrXL80zHbDRBrFCrNl5isoQrFiqHK4zXbKZTJSPdF3KBm8t9+dQECfoRvdCKEPLQNjG+P0vMbDwhejULdr+kBAjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723857085; c=relaxed/simple;
	bh=g8Geri2XNbL38pyOWzp7d2MgOy9oPpFutYakSLbV27M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RPS2hwXnXpnG0yi4B4aQ8mYcCQpP1xMdURL7UATKekAlHJtWK0Xk1Gbr4E88HwhG+HbsDWGr2DtJ9i0rSBo62FLtsKFFVGk3lB+Jl3fDyBiJvbM+bUQpDtYuJy1GgrNQdBtEYxYPfme+KAXQIE+UhO8dQdvGGxUE2S7UvfSxAY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hYv/bv5X; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e0ec934a1fdso2421481276.0;
        Fri, 16 Aug 2024 18:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723857082; x=1724461882; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ug8rihSZJE889SueAoqTX9ZWSfO/z3Gsu452Tq7F+6A=;
        b=hYv/bv5Xi2sco/dleOYF1v1u0282L5QSuvtFGPcv6+YQDWSaX32MnURGMD97DP95rH
         n+zdx68SRMkrny5c8zG9tCQNPdkgPYIe+COD9uN9n/eqhDI2hwjFiOqEqMKd2GDNqZKc
         tDPGIO2/dkv/PjugX7gwTsEXW8Ehik/LHXDalg0iifwufWIsP40UCjDCoxZoR30p5PxQ
         k4piSoCF4/WusUh5AFpE/1fXdwXFazg8rirltU2uO7Jg7//7P/s3Lth1ROiemjMq8nM1
         8uYcibNyYqcbBPE7G+MOOf290YSe6YxovoP5XZMwJfmAOrxTZmMX7Vg0hGVoZrQ8cICc
         WyxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723857082; x=1724461882;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ug8rihSZJE889SueAoqTX9ZWSfO/z3Gsu452Tq7F+6A=;
        b=sY2uDDB0UlCZE/6uZwBSoy+jOOGDQo7iWemmqpIyekM68T23wZJrTzbxezDKIi6ox5
         g60LAy1s8YzReI40lIzu7Ja5f3lIHhg07uQziMht0M99xTqAQbiSubz5kTfUBck1kSWl
         3eDita1DNaGEIHGXSXZDCHsyE1mH4q0imC1ExD9p7gCm7if73rqyuCSbgPBjYnHhFZc6
         8LyzEwY4tNsPNiqHNPd1XeXySzL1KLDDMVE6iothBt5UHFni/FyvZwcghUGK2+4Cfj2Z
         unk6TDnDecG7YdbVn+vV2nqZoNXq52y04LPYBKRafAxi7IgOnuRKhpMKEhlJFgU23hUc
         K7mA==
X-Forwarded-Encrypted: i=1; AJvYcCWBpJjqSzLFRoFVd6q6jY/uSkZNNaoREeIU1/5rblFwUdczqaG7LPAf1lkm8oAiIMv4mnjfJdStqyubXXEe/Y2o6PJo1zfUjbWTwi6s5V73SATStLW83DRJFTD+ZeC8l1/XkWDhPgqP7AEkPEvPmsThC0mqPhZ6NhOod0CcVt99Zekw+Q9RqD4XW0MCsTTFyRTQ3Ejlt1wgRiatqNR+fRNFww==
X-Gm-Message-State: AOJu0YxpvlFpmF/0fpk6449XAW3hZNNhfci7N6d/noWDk8we8YeOCoMI
	g/dTEECT5p13DG3LTZ+4FvoAUTj1U+KRKjjj/oKkhcuIshSj/jr8MufUG85wCgFpwitYartesNj
	FRC5RWLVLogTqq0N7ZxLx3oK/wJ8=
X-Google-Smtp-Source: AGHT+IEM2mdGVjOsGnMz8WXTnI9118qcDH2jUCIIbDZ4rPiQ10iGBBlTUuDxRR73hnxLfbHp9nYn32+CIgpvlrRB+hI=
X-Received: by 2002:a05:6902:701:b0:e08:5e73:cdf3 with SMTP id
 3f1490d57ef6-e1180e6c54emr4739180276.9.1723857082428; Fri, 16 Aug 2024
 18:11:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240807-macos-build-support-v1-0-4cd1ded85694@samsung.com>
 <CGME20240807110114eucas1p2e1ca4cbd352c6cd9d60688b1570df8d4@eucas1p2.samsung.com>
 <2024080753-debug-roulette-8cb1@gregkh> <3jnp6tnkjpvnisefomxagazu2u3uzzt7rcon3r5jssraxzwegb@gsxc7c5sfh7v>
 <2024080758-dedicator-smoky-44be@gregkh>
In-Reply-To: <2024080758-dedicator-smoky-44be@gregkh>
From: Barry Song <21cnbao@gmail.com>
Date: Sat, 17 Aug 2024 13:11:11 +1200
Message-ID: <CAGsJ_4zA6=ajoOgAm9kweeiBFKz4TJxxjYFGHHd3HQY8dxHpWA@mail.gmail.com>
Subject: Re: [PATCH 00/12] Enable build system on macOS hosts
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Daniel Gomez <da.gomez@samsung.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Lucas De Marchi <lucas.demarchi@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	William Hubbs <w.d.hubbs@gmail.com>, Chris Brannon <chris@the-brannons.com>, 
	Kirk Reiser <kirk@reisers.ca>, Samuel Thibault <samuel.thibault@ens-lyon.org>, 
	Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Ondrej Mosnacek <omosnace@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Jiri Slaby <jirislaby@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, 
	"intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"speakup@linux-speakup.org" <speakup@linux-speakup.org>, 
	"selinux@vger.kernel.org" <selinux@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, 
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>, Finn Behrens <me@kloenk.dev>, 
	"Daniel Gomez (Samsung)" <d+samsung@kruces.com>, "gost.dev@samsung.com" <gost.dev@samsung.com>, 
	Nick Desaulniers <nick.desaulniers@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 8, 2024 at 2:20=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Aug 07, 2024 at 01:56:38PM +0000, Daniel Gomez wrote:
> > On Wed, Aug 07, 2024 at 01:01:08PM GMT, Greg Kroah-Hartman wrote:
> > > On Wed, Aug 07, 2024 at 01:09:14AM +0200, Daniel Gomez via B4 Relay w=
rote:
> > > > This patch set allows for building the Linux kernel for arm64 in ma=
cOS with
> > > > LLVM.
> > >
> > > Is this a requirement somewhere that this must work?  It seems like a=
n
> > > odd request, what workflows require cross-operating-system builds lik=
e
> > > this?
> >
> > This isn't a requirement, but it would, for example, support workflows =
for QEMU
> > users and developers on macOS. They could build/compile the kernel nati=
vely and
> > use it to launch QEMU instances, simplifying their process.
>
> But that's not a real workload of anyone?  How often does this ever come
> up?  Who is going to maintain this cross-build functionality over time?

it is a real workload of me,  i was running qemu-system-aarch64 on x86
and it was
pretty slow. so got a M3 pro to accelerate my development. frequently chang=
ing
kernel's source code, i am using qemu-system-aarch64 to do quick verificati=
on.

>
> thanks,
>
> greg k-h
>

Thanks
Barry

