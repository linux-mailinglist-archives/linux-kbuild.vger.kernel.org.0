Return-Path: <linux-kbuild+bounces-7568-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D25DAE05C1
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Jun 2025 14:29:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 12DCA7A508A
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Jun 2025 12:27:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6FA922F77A;
	Thu, 19 Jun 2025 12:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i50bJxBb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED8422F38E;
	Thu, 19 Jun 2025 12:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750336113; cv=none; b=n+3mQkFxLzHSB4VD/KoUwxseA7Y/pgY4u9ZDRWGvUZHMFr0SWkjC8LhFsBLVCQZIEmZnLECi2YlP4vz4H0ghbzG669JR4bbTOysC0bYHguM/8+W6jvl7BtkAM4edf5F7Ixr5EUa4pKBB/IhrCOUkYyqUHsHgYrFBN2DYPygEuTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750336113; c=relaxed/simple;
	bh=46GNTyt/nzDUI7W+MZywcocDplL/2kIr21WdO4Sv9f0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pZh57cuZJQAfbaVecOsc5URP4UzGg1UdUN/xqPawg8I2nizCe7BhngvE0QAkhIEkaJ4Bbi32LwJyMNFBtOEdjLyOcCaC4K4QlqvX9dDi5OJ92FmoxEwPNnED9Sv8pX+ouKxocU4bmP9lewY5zCCpndSV6SUm9V+RDp4IIneQk4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i50bJxBb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58566C4CEEA;
	Thu, 19 Jun 2025 12:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750336113;
	bh=46GNTyt/nzDUI7W+MZywcocDplL/2kIr21WdO4Sv9f0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=i50bJxBb3ciOFReU2hRo0Jm+1GasYM6SiUzjADPN//ef5khvo+Ge8snIjXAVbO4pB
	 7lPo7e8MeatoIo6IktyGT2hSB/4Wg2zFmdUqopGWOB3t4Q6DCE9O4lSedOSKjVQr8d
	 Y9UNVIQEldUq9OD26jRfhgW1wqVokR5FGzLB/GPZ6tTRIOMJuC0PuygmQoNBjR5gRV
	 UgHkLAArUmpIiofiq1pRTuwEXUpwzTipUXn8P6R7r9Bv4KapZN1b3MUFSmGuPR9NDw
	 zLRQ7qaA3z+j/XQHQgASuh5dNiH1WYczJYp5Ln5aBiWfYqbpEk0vhFGzxiotHVtuRF
	 FYM39ksGCawkw==
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-60780d74c85so1037647a12.2;
        Thu, 19 Jun 2025 05:28:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWDQzRXqIpYUMDCfM1ORDQcxVR/+aIu38frNN5QYalHtXulpx/8BjzMgTmG/eHUf2Zg9e/X80mhC2R0a/4=@vger.kernel.org, AJvYcCWeQ/DFCEGIviThTTOtaACHZkQgjsM8t96s4eEvglfIRy5kj3Q0uPbvbhEaZpsrttGCHBUrKpMefdl+SLUZ@vger.kernel.org
X-Gm-Message-State: AOJu0YygPYPiCGjvN/DjFvB9y4rcerkvnBQcGuxdHE7mkTmMJUsb0Zpm
	6oIa0GFY9aiFPbqzTGlmwtnIWVKc8zLxqe7xlLpZIn+9lCxElzJP7tC8l4l+l4Fr3d7F0/qG4+s
	flyLHD/WaWByMiaNOLgSF5IH1Xoortoc=
X-Google-Smtp-Source: AGHT+IF85I8sP9z6G7vD5ObsF0vTNB/bVlYvJOso17+d+NgDAyNvURfjJO/e9qF6e8tKh/UFnQNS+dLD883osXpQs5Y=
X-Received: by 2002:a05:6402:5186:b0:602:1216:fdde with SMTP id
 4fb4d7f45d1cf-608d08b6bc1mr18737168a12.14.1750336111892; Thu, 19 Jun 2025
 05:28:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250608141509.157300-1-chenhuacai@loongson.cn> <20250616185737.GA23807@google.com>
In-Reply-To: <20250616185737.GA23807@google.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 19 Jun 2025 20:28:21 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6z_56D-mcfqyD4-_TCZVvmjVb3ab0B8j_QF_Yy2X6FBw@mail.gmail.com>
X-Gm-Features: AX0GCFurjQs-cBGWxoCsgFhwNLZ8-8cvY9M4iIDvSP0-Mv6LkTl-cMO38sqU-Dg
Message-ID: <CAAhV-H6z_56D-mcfqyD4-_TCZVvmjVb3ab0B8j_QF_Yy2X6FBw@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Fix build warnings about export.h
To: Eric Biggers <ebiggers@kernel.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Masahiro Yamada <masahiroy@kernel.org>, 
	linux-kbuild@vger.kernel.org, loongarch@lists.linux.dev, 
	Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Eric,

On Tue, Jun 17, 2025 at 2:57=E2=80=AFAM Eric Biggers <ebiggers@kernel.org> =
wrote:
>
> On Sun, Jun 08, 2025 at 10:15:09PM +0800, Huacai Chen wrote:
> > diff --git a/arch/loongarch/lib/crc32-loongarch.c b/arch/loongarch/lib/=
crc32-loongarch.c
> > index b37cd8537b45..db22c2ec55e2 100644
> > --- a/arch/loongarch/lib/crc32-loongarch.c
> > +++ b/arch/loongarch/lib/crc32-loongarch.c
> > @@ -11,6 +11,7 @@
> >
> >  #include <asm/cpu-features.h>
> >  #include <linux/crc32.h>
> > +#include <linux/export.h>
> >  #include <linux/module.h>
> >  #include <linux/unaligned.h>
>
> You can drop the change to crc32-loongarch.c, as it would conflict with
> https://lore.kernel.org/r/20250601224441.778374-8-ebiggers@kernel.org/ an=
d
> https://lore.kernel.org/r/20250612183852.114878-1-ebiggers@kernel.org/ wh=
ich are
> in crc-next for 6.17 and already handle this issue.
Thank you for your suggestion. But I plan to merge this patch for
6.16, while your commits are for 6.17, I can only keep it as is.

However, the conflicts can be easily solved when Linus merges your
code, or there is an alternative solution (if you want): update your
patches when this one gets upstream.

Huacai

>
> - Eric

