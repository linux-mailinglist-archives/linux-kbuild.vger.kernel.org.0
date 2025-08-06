Return-Path: <linux-kbuild+bounces-8301-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C5176B1BE5B
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Aug 2025 03:35:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94B5C1888296
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Aug 2025 01:35:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B36D86337;
	Wed,  6 Aug 2025 01:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F3bbRZZP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721241FB3;
	Wed,  6 Aug 2025 01:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754444134; cv=none; b=Os8b6C6FHo5UXUQKVrfd9qqBU5A8WIxCQ3MhULZHn+1h1q610MWDiGh6jSyQIkbj1R1eypgvMS/R+8XaNXeBbPU14eYtzOe03pOzXvw45hlzW43dhHAR9o1Qux3QxFouGUuj4sXKpG5LQMPvnN6bonFK6tXt1aCB46m7S8XxE4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754444134; c=relaxed/simple;
	bh=S0/Q0IlR9eUVyEWCqzvwaIlRAqwzsp28Z/YHbS6D+W4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fUUiikcm/mE3f/USeNX2RXNd1gU8z3nLoIvuNsoLse6R2FjHoj3jBzjKJA9y4Abwe91IANjELx2Ghlbcv9sbUwFx/dd8nQkmJ8/5ogHl2fwllYYgEjNOBcYWIbS1+6VRjyILEO671WXgYH4zmMIPrFazX9W0Z6x8sn1I9xdE9pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F3bbRZZP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0467EC4CEF0;
	Wed,  6 Aug 2025 01:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754444134;
	bh=S0/Q0IlR9eUVyEWCqzvwaIlRAqwzsp28Z/YHbS6D+W4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=F3bbRZZPoK8TGaBX8LYwqyM77ZpF6DwRjKuOdzFiwL5gMb8ewEzHN2ebeALFsAya0
	 OK9YG84rIg+1Cept31iE+9lEYdi6P0hvifh+Qd5qun7eSEzgQmP5qOgcC1X7Kbrx9C
	 xV7iAhxB4RCW/N6Yu1lpOzSkhmRNyn3FzaE/w1w0gZbEQXvRguDPWioRPpyRxz0ELh
	 TNN9Qyx4XZgFsyb57hqLQvxRIxrsIfCUCsz4kpD+qISiFs5/wGKOG/LLx58bIdYC/b
	 98kaT76RVJkhEcnJcL9nIuasZjmk+xX2HEXKDEmz098SvVSOTXgZ4mkD7SPPB2WMge
	 3J+b/vfGayaSg==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-556fd896c99so4728164e87.3;
        Tue, 05 Aug 2025 18:35:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUB9+y3QR3Y3Rj4DNHNTLCqCVBTZCkETT49P3IGFb9D9rE7MPwB3kUpyHaHPWUiPRf1T6A2A2nGJybsb3M=@vger.kernel.org, AJvYcCVketHqby0MBJVDrE6QmZWTlszWAG7WxIp3F9S10wNGU3jdmyG+2UbTRU91pMQEd0AY9CBqf/bYKtcrJK1h@vger.kernel.org
X-Gm-Message-State: AOJu0YxbNWBALv/qjj/VS75harrqkM+BLt0xyIEYRiQPjF9Py1FR8lPo
	hZb71ravz1/Arcu9mZ4+GlMiABaAgi83mhVxfOeFfqNROHcYCeTS/QBtpRkL+Efxk7P8tvmnFMS
	a+WwIqsEAkIkLY4gF+/X+D0QuvcOhkDo=
X-Google-Smtp-Source: AGHT+IEhkhmVmNXJP2DOtXhEWWslpzJw5isCGVkw2c3jsijIhBpQzGUXioTX4fIshU2UCeRAXs2QI/QMAaz5JVoBR4k=
X-Received: by 2002:a05:6512:3ba6:b0:55c:ad9d:5c10 with SMTP id
 2adb3069b0e04-55caf5fa670mr210591e87.52.1754444132689; Tue, 05 Aug 2025
 18:35:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAK7LNAQW8b_HEQhWBzaQSPy=qDmKkqz6URtpJ+BYG8eq-sWRwA@mail.gmail.com>
 <20250806030434.10663c09@canb.auug.org.au> <CAK7LNARZivfd7=vU_vD4dtuLVXecYNyMv+TS+O99YGv1E0qR_Q@mail.gmail.com>
 <20250806104814.73fa19b9@canb.auug.org.au>
In-Reply-To: <20250806104814.73fa19b9@canb.auug.org.au>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 6 Aug 2025 10:34:55 +0900
X-Gmail-Original-Message-ID: <CAK7LNASw5G1oHb85XSFGhSBUrBq4iDxiX+9rRfgHWOmPj=_ALg@mail.gmail.com>
X-Gm-Features: Ac12FXzJ1cVtNalU4ztr8F7JdJfzbnq2nNWw12DxR4Cwps0KZ8J4h__mIIIqX2E
Message-ID: <CAK7LNASw5G1oHb85XSFGhSBUrBq4iDxiX+9rRfgHWOmPj=_ALg@mail.gmail.com>
Subject: Re: [GIT PULL] Kbuild updates for v6.17-rc1
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 6, 2025 at 9:48=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
>
> Hi Masahiro,
>
> On Wed, 6 Aug 2025 09:34:04 +0900 Masahiro Yamada <masahiroy@kernel.org> =
wrote:
> >
> > Sorry, I missed that, because it was not sent to kbuild ML.
>
> Maybe I had better add the kbuild ML (linux-kbuild@vger.kernel.org?) to
> my contacts for that tree.
>
> > I will pick up and send a pull request take 2.
>

I ended up dropping Alexey's series entirely
because I also observed the following warning.
It is too late to fix up the code in the second week
of the merge window.

https://lore.kernel.org/all/20250730164047.7c4a731a@canb.auug.org.au/




--=20
Best Regards
Masahiro Yamada

