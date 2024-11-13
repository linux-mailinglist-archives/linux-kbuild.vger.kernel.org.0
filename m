Return-Path: <linux-kbuild+bounces-4666-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F94D9C7A54
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Nov 2024 18:54:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 027FD1F25903
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Nov 2024 17:54:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D23982022E2;
	Wed, 13 Nov 2024 17:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hAPk5E7i"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965FB2022ED
	for <linux-kbuild@vger.kernel.org>; Wed, 13 Nov 2024 17:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731520462; cv=none; b=bu0yIkB4GsP4XK42WOXCJ37tihBi8j2J2VSl21k74+mBgrWlUmPwj4VqgbpiC9f097/4AHf2JdwqEw3jb/T2BON8MldtGEM4smSxxpctAfz21k78YdOPP6LCoykFHhoSbOUwjL0+Ga/BAlniQobo8FjLVxnzHXpfDZZWSM4uPyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731520462; c=relaxed/simple;
	bh=GLNEdJnIJ8LZnbahpw3kB6Ri67YbLsla73/1yEoh83E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H1zVxkI0mlLaCs8H1vDnZ6Jd6hivxFQyBI8iO/XCKrIO2Uzhhg8i0TzP6iAXP7apruoepdDZ8U+KccpcaRklQVcwQNqrkAmdwfCSAMd5MZfYVF4kZrlqtsY6UPXJw2+lEQlHgeC3diqHv0FDb8pZOs1lokeWVGxVXbm2+52daM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hAPk5E7i; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5c932b47552so9268a12.0
        for <linux-kbuild@vger.kernel.org>; Wed, 13 Nov 2024 09:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731520458; x=1732125258; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OY7wBsUbdQcWggybLDq37KJ8DaxAj5d11PMFbvDEhAw=;
        b=hAPk5E7iPdRGDjWTmDRRHcxYpnDfw+d86PJtJkK9kPXpYgcAGWBnOh5J8LTQf3juXK
         ncOnA0KbRXw2OMxatjtWQRRfg7RR3fZM5YgHCzIWPVXgrn+Ba4UYr5hnmXc3E8ShBshL
         jRe9+PUp0g9kTFXkEt31FcOpGFxqZRUakp+0LwiyrlM0ycmpMUkzGZJHf3ANlpr3PMGh
         8l0scIbHmGUsHR7q0EaOTd/FCxikK9xWs4X+m6T08czYuaJLpbDpKU4/C76yw0pxwEtp
         02EPuiyVLzOvKGSfGmEe4XePJgaF5OQCsgmzQketJJbIkvnyfn/sOAQmkfGfcAJxOBYV
         eu3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731520458; x=1732125258;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OY7wBsUbdQcWggybLDq37KJ8DaxAj5d11PMFbvDEhAw=;
        b=BLUCNJJrZJ5+ZhXtHgCiMUfUm6jlYWuFBI07fqoR5hRvFGP3oK2erQSU2zdbWaUqWe
         Aas0nQT7eBangnURk0tt4skrZxAgLnu95gysI9gS5ZYNSSi3LvSkhF6AaBdM3rLULwny
         7I0rkZy1hCB+EUNLrBd/czRstPu8D99+qBp37sSAYnzoKSLfFuLnluBRnjbUwy+FfQKE
         cSLsUwg51gw6IpjKuDGGcmG1heOvR2Vk38i/peHO/GVSCA0367mt+7tNsRzY5OAIF1In
         EC5EQGOqPp1GUfBU+s3vf8IiJt12c5L+CO9fc05OuLzREcA/stqTbIeSOU/Yk0UgqPzz
         eMUg==
X-Forwarded-Encrypted: i=1; AJvYcCUVNb6K+CM+qFzYaO0Yb91LFw4V6fhZx7NBW2LLgrjGxXBa+1zBFh5lImlviuLaxNcGlLQ7Qyy2OhWQaYA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTXl+6T62wwGDPWkf9PTyuMlTQ0wKKNEVs2sy29NN1/blPkOgH
	PLnSm2ZLqJaPVUuqoagXENZYkDrq3E1Q4T39452RwxNuUkE+aNZw9WTgFLy4NJIAmW3gZl8HcZl
	rAiqP6R6ORMef3KaKcYoHwxAyL5R/WfHUO3Ki
X-Gm-Gg: ASbGncvv0ixJ6LS6PmkUXU6HlkhNxpLWFO0kF3hDaMVp1IVbo90NYKiMNlgbNPMqIV9
	1XhUbqkLZ3R6W3LcQb36cYRsveOeY
X-Google-Smtp-Source: AGHT+IFXLnHsfDYTpS01K6b79CsIuzgS6MULqvEjuFdWIkvmBmxgPffAF9QVNOOGzikrvjwjQEp2QY0dMQ2TSECyW3Q=
X-Received: by 2002:a05:6402:5308:b0:5cf:659c:abb9 with SMTP id
 4fb4d7f45d1cf-5cf659cadbfmr209409a12.6.1731520457717; Wed, 13 Nov 2024
 09:54:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241030170106.1501763-21-samitolvanen@google.com>
 <20241030170106.1501763-22-samitolvanen@google.com> <CAK7LNAShVzrE6uhXxZ7HepKhmOJYsZeigq6w19jRN3OH-T_Jyg@mail.gmail.com>
In-Reply-To: <CAK7LNAShVzrE6uhXxZ7HepKhmOJYsZeigq6w19jRN3OH-T_Jyg@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 13 Nov 2024 09:53:41 -0800
Message-ID: <CABCJKueVjP8V-=3Ehi4QvQzg1FZh2unyVMDzSJ_vJ_E5EE+gLg@mail.gmail.com>
Subject: Re: [PATCH v5 01/19] scripts: move genksyms crc32 implementation to a
 common include
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthew Maurer <mmaurer@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@samsung.com>, Neal Gompa <neal@gompa.dev>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, 
	Asahi Linux <asahi@lists.linux.dev>, Sedat Dilek <sedat.dilek@gmail.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Nov 11, 2024 at 8:06=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Thu, Oct 31, 2024 at 2:01=E2=80=AFAM Sami Tolvanen <samitolvanen@googl=
e.com> wrote:
> >
> > To avoid duplication between host programs, move the crc32 code to a
> > shared header file.
>
>
> Only the motivation to use this long table is to keep compatibility
> between genksyms and gendwarfksyms.
> I do not think this should be exposed to other programs.
>
>
> If you avoid the code duplication, you can do
>
> // scripts/gendwarfksyms/crc.c
> #include "../genksyms/crc.c"

Sure, that sounds reasonable. I'll change this in the next version.

> > Suggested-by: Petr Pavlu <petr.pavlu@suse.com>
> > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> > Acked-by: Neal Gompa <neal@gompa.dev>
>
> Does this Ack add any value?
>
> Acked-by is meaningful only when it is given by someone who
> maintains the relevant area or has established a reputation.
>
> $ git grep "Neal Gompa"
> $ git shortlog -n -s | grep "Neal Gompa"
>      2 Neal Gompa
>
> His Ack feels more like "I like it" rather than a qualified endorsement.

Like Neal explained, an Ack from a potential user of this feature
seemed relevant, but if you don't think it's meaningful, I can
certainly drop it.

Sami

