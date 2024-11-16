Return-Path: <linux-kbuild+bounces-4696-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 789219CFD6B
	for <lists+linux-kbuild@lfdr.de>; Sat, 16 Nov 2024 10:09:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B258E1F22BE0
	for <lists+linux-kbuild@lfdr.de>; Sat, 16 Nov 2024 09:09:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEB83190462;
	Sat, 16 Nov 2024 09:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fDL2mFiq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A90115381A;
	Sat, 16 Nov 2024 09:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731748141; cv=none; b=FRJZGuaFVEskHBs0BQ2ODJJOKo6c61fHrnK6V4dbRfuIYQY8jKM3x0SaVQJehTunZ7d8Hv+ATP3GTqdPJMpA7UYoSMdxy2qL4qyIY627gk+IAAe6rYBthTqHTaANjzc8jh21WAhb2VhpuVdwNRnL0yZ3XJi6mWzNPJ9Z1zzHhMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731748141; c=relaxed/simple;
	bh=vR2V+V2QxqcQECfOUvT+5A1KplyfZDEMEObd7HFAmoA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BjLj/hUwu656cbC8LTmYHH8hptYbpApYSS//iyGyHDSmnkm1yOQQvhqqaQ5fpyECbZwRh5X7bWOAzXpfhToRZDaI8t0RmwAzn0mOJwyh3okf/Qpj89L5Ypx9xj69x1hoQdhbfxmKGcHqBhUER3r36VAxccZCDBOXHpk1Z/Hnmg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fDL2mFiq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ADE9C4CEC3;
	Sat, 16 Nov 2024 09:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731748141;
	bh=vR2V+V2QxqcQECfOUvT+5A1KplyfZDEMEObd7HFAmoA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fDL2mFiq2jNynLhRPE6JTTBqZQaY/SWRFVMrn4Sx1RYpe4j99Lo53dJmP9pHDsEms
	 Tyegx6moZ6nF2SKwXPT5WnwFJFfxn0Sohyw3rC8hlnSeZP26rrySKKtUx/mruIT980
	 /kZDvxQb+RxAYju6zxetisy59I+ldPEUv1MDsN1ovNx9qT456VP95uCH5O0XP5PNbl
	 p2uxu8WSl5jhehDaCLezX5ldIgnU65GtYOmn0K6UKigAZ/z3hisX/GjlniQiAdXr4Y
	 utA9XbZUR+QSxbYc6BWAowo9U1SxwzhVXXMHewkV/81PNfu6bTdiH/QLuTvHKw6CYl
	 ZCx2uN1dxk6yA==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53a007743e7so1672607e87.1;
        Sat, 16 Nov 2024 01:09:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV0/GxAIlrUA518jTXm8GsBSweBAAOsY0hLksW/DBoXK1yEVk72jLG1e4yylZ+DFW+L5momKPNGj0q5EKXJHA==@vger.kernel.org, AJvYcCWg9EzoKX+nK1246AKXlDCi6wXQEaU4guwSid5bA+Bf+4zEvuqFd0NeKRpuCgJ7C/lyRCBHZGcy8lqxENH1YQw=@vger.kernel.org, AJvYcCWpTy/IqRJuuYi5JpwFgrtq5YS8SRbDIPLjuoclOMiwpvgsz13a4ZwDdiynEWI+RULoTH5M12qi7inkFAig@vger.kernel.org, AJvYcCWyQ+j4MnvjV6JEqf73iSo37FqTOwgh5WNxKIzFR6DA/qXOaTzChxoJ3DebNuD5uecAHoL2/rVPrz4UGqM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzipiViB5/n7poAuJb4F9ih+QyC7/6i3tqlxEiLcIl5zeYjMotR
	5PcJE0ZgTIzXKpc4hyqonMPOYFzM+5YxdyNbmCD+jdtvI5A6BNf9n6nQCj79qegJcRTUmVIDUL8
	q1Z1oIGA5fn65gcVLP4F2hcCz4kQ=
X-Google-Smtp-Source: AGHT+IHpl8ZAglZvngz5xm6ocic+KgEC+INX3t93NnViVbyMnAzYKh2RUbWNfOuCYlzJQ1LoVk0VBgZmNkdKrSdV/4s=
X-Received: by 2002:ac2:5b1c:0:b0:53d:abc3:82a9 with SMTP id
 2adb3069b0e04-53dabc382f0mr1869248e87.19.1731748139824; Sat, 16 Nov 2024
 01:08:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241030170106.1501763-21-samitolvanen@google.com>
 <20241030170106.1501763-22-samitolvanen@google.com> <CAK7LNAShVzrE6uhXxZ7HepKhmOJYsZeigq6w19jRN3OH-T_Jyg@mail.gmail.com>
 <CABCJKueVjP8V-=3Ehi4QvQzg1FZh2unyVMDzSJ_vJ_E5EE+gLg@mail.gmail.com>
In-Reply-To: <CABCJKueVjP8V-=3Ehi4QvQzg1FZh2unyVMDzSJ_vJ_E5EE+gLg@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 16 Nov 2024 18:08:23 +0900
X-Gmail-Original-Message-ID: <CAK7LNARVK1ZpGXZVTAynuo7CDjgB4uT5bQzcGiWseZfaEu7Tvw@mail.gmail.com>
Message-ID: <CAK7LNARVK1ZpGXZVTAynuo7CDjgB4uT5bQzcGiWseZfaEu7Tvw@mail.gmail.com>
Subject: Re: [PATCH v5 01/19] scripts: move genksyms crc32 implementation to a
 common include
To: Sami Tolvanen <samitolvanen@google.com>
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

On Thu, Nov 14, 2024 at 2:54=E2=80=AFAM Sami Tolvanen <samitolvanen@google.=
com> wrote:
>
> Hi,
>
> On Mon, Nov 11, 2024 at 8:06=E2=80=AFPM Masahiro Yamada <masahiroy@kernel=
.org> wrote:
> >
> > On Thu, Oct 31, 2024 at 2:01=E2=80=AFAM Sami Tolvanen <samitolvanen@goo=
gle.com> wrote:
> > >
> > > To avoid duplication between host programs, move the crc32 code to a
> > > shared header file.
> >
> >
> > Only the motivation to use this long table is to keep compatibility
> > between genksyms and gendwarfksyms.
> > I do not think this should be exposed to other programs.
> >
> >
> > If you avoid the code duplication, you can do
> >
> > // scripts/gendwarfksyms/crc.c
> > #include "../genksyms/crc.c"
>
> Sure, that sounds reasonable. I'll change this in the next version.


BTW, is it necessary to share the same crc function
between genksyms and gendwarfksyms?

If CONFIG_GENKSYMS and CONFIG_GENDWARFKSYMS
were able to produce the same CRC, it would be a good motivation
to share the same function.
However, as far as I tested, gendwarfksyms generates different CRC values.

When a distro migrates to CONFIG_GENDWARFKSYMS,
the new kernel cannot load old modules built with CONFIG_GENKSYMS.

So, there is no need to share the old code.
Another solution might be to use crc32() provided by zlib, for example.
It requires another external library, but this already depends on
libdw and libelf.










>
> > > Suggested-by: Petr Pavlu <petr.pavlu@suse.com>
> > > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> > > Acked-by: Neal Gompa <neal@gompa.dev>
> >
> > Does this Ack add any value?
> >
> > Acked-by is meaningful only when it is given by someone who
> > maintains the relevant area or has established a reputation.
> >
> > $ git grep "Neal Gompa"
> > $ git shortlog -n -s | grep "Neal Gompa"
> >      2 Neal Gompa
> >
> > His Ack feels more like "I like it" rather than a qualified endorsement=
.
>
> Like Neal explained, an Ack from a potential user of this feature
> seemed relevant, but if you don't think it's meaningful, I can
> certainly drop it.

Tested-by is more suitable if he wants to leave something.




--
Best Regards
Masahiro Yamada

