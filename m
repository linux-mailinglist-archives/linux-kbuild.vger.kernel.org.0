Return-Path: <linux-kbuild+bounces-5438-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 39451A0A032
	for <lists+linux-kbuild@lfdr.de>; Sat, 11 Jan 2025 03:03:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF73F188D9BA
	for <lists+linux-kbuild@lfdr.de>; Sat, 11 Jan 2025 02:03:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90CCE4C83;
	Sat, 11 Jan 2025 02:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VlcCw0xh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBF8EAFA;
	Sat, 11 Jan 2025 02:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736561020; cv=none; b=r06Vb9bDjdjV7GutvUqYm+ShdPFzoNNpCYRWmehgvI9oCihgg+NtOr7OOV9TPdrHLN0/WK3HVRy0fQ3NVmE/mm2KuykhnEmSIrFVbPq/RB04M5dqcSl6N4H2kN2pubKFa5N4LcPlZrz2yO4woCSL+LSGtAXZd0BCt+BSWxeMHRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736561020; c=relaxed/simple;
	bh=zrMqxieUAVjEnm1/l0WnttQr7ZTV7jvQ0HQxj0ou+Fk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BrHNCeJBS7BMewE/Zs8QWo4TK6MCdSQBIvd5+IX99kvFJpj3it0h1x1/9egIqMJygkzVPlE+izRASJ78BDznWlDb53k4f3oTt1Bl9wgZE48hXmTJP1LpkU6XfEm0Itcf899OGKomH5cCjITMs9YEgJUJ1k7X8JVnHUw9G90hom8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VlcCw0xh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2160C4CEE0;
	Sat, 11 Jan 2025 02:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736561019;
	bh=zrMqxieUAVjEnm1/l0WnttQr7ZTV7jvQ0HQxj0ou+Fk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VlcCw0xh2HLF7XLNSnRdRxsmUYLAkSvdEQ/g633zZyYtMwnIEhdS+TG4lKQspT5eo
	 YpiWAr4L96TEsJYUChuwc1sAHE14ZC1dGYuVapDlo3xNq5QzjASAYeDSKa/oA+nOs1
	 ycp9g1iOrOWjZHKJRpeW4z3YoAZuHBwEwG++Da79oBanCdfJhz0LxVYRnnU40j3m16
	 7Xae6R3NBO+sVktwqTe3e1P52kYJnd1v1P/gVOlwflsfophvwiQBkkV+uL18d6pxKe
	 vMwraWoZb+hPOscifMQ0rEWtgzYp7m27NVmKWCwS02MdWN7gk1eIS8P3GesOqgAO0M
	 MmXiUoKnU0XcQ==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30034ad2ca3so18397041fa.1;
        Fri, 10 Jan 2025 18:03:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUWX3ngOl4+cWfT7mp0FP/S7FmvD1pBcxw7y4abO691YvnDP1CdwOs5ZBguiEnb6DYb3OWfVeVsMJvzS0lF@vger.kernel.org, AJvYcCUkmt1AQMeKx1jQi6L7Pf1uy0bHFX0839seNQw4hFf51Ud9eIngPAi3eakwthKrBiaFULtrwIjNrphV5w==@vger.kernel.org, AJvYcCWheJCqKY4SHto1gs5LfZeGmRw40XbRWB/v8xh6k1e5kGiNUasGbzyXcbqZJMRv99n6QKX0asOg22FJZ+M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPJ6LydLTN5jC1ixGbAN8VO38Fn8xpgIA3RWy4OEbJt7UnYmtW
	4siYYVLTnFIj2BvnNetbnqsLR96XCZ+7vMjiprMTu0kzMwAVpxKyde6b/PDFcQEhSZ/XWP6GShe
	k9sd4k9KNq2U7cV9b4DDoH37flPM=
X-Google-Smtp-Source: AGHT+IHhgYYQ+eaUG/6J1vIQ2gCVQ/X8DlPgIpyb6Fr8nk6blZECzuoppcYovwX2mQzobcO9Mv4mEt0JKOOpHJAl6TQ=
X-Received: by 2002:a05:6512:1382:b0:542:2388:3f0d with SMTP id
 2adb3069b0e04-54284815c9emr3952112e87.45.1736561018515; Fri, 10 Jan 2025
 18:03:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250110082744.457067-2-ardb+git@google.com> <CAK7LNASygf5gRdYOOa3KsKbz8mny9nnn5RduuGtP5WoWgXDTQA@mail.gmail.com>
 <CAMj1kXEPq6VU19qzmW9DNVG=nzoGbnCMt7dE5nXeZCqk2JPE3A@mail.gmail.com>
 <CAHk-=wiGfhxb4q4T2=W=Vg=sHwZwwMTN2EaDYbmS0VG1Srdb-w@mail.gmail.com> <CAK7LNASrzZnoLeRQz9FH6EUEz1rSPY_-GHvmS=8JA2R8eCjSKg@mail.gmail.com>
In-Reply-To: <CAK7LNASrzZnoLeRQz9FH6EUEz1rSPY_-GHvmS=8JA2R8eCjSKg@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 11 Jan 2025 11:03:02 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR4RTfQ5R3VsuXeZ9i0EbR0v0tYiVmGxcX2U_pjM=TtDA@mail.gmail.com>
X-Gm-Features: AbW1kva8YJXXpo1T_EG8d0P_EqdhvniTZ_sa2T7clRl8min3uMR81XFLgv7UjPs
Message-ID: <CAK7LNAR4RTfQ5R3VsuXeZ9i0EbR0v0tYiVmGxcX2U_pjM=TtDA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Strip runtime const RELA sections correctly
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, Ard Biesheuvel <ardb+git@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 11, 2025 at 10:13=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.=
org> wrote:
>
> On Sat, Jan 11, 2025 at 3:33=E2=80=AFAM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > On Fri, 10 Jan 2025 at 10:11, Ard Biesheuvel <ardb@kernel.org> wrote:
> > >
> > > I suppose this is a consequence of 8962b6b475bddc ("kbuild: print
> > > short log in addition to the whole command with V=3D1") which introdu=
ced
> > > an $(if ) where the else branch is simply ':' and so it always
> > > succeeds.
> >
> > Hmm. Odd. I don't see why that part of the commit exists, and you're
> > right, that seems like a bad idea.
> >
> > And removing that odd $(if..) and making it just do
> >
> >    cmd =3D @set -e; $($(quiet)log_print) $(delete-on-interrupt) $(cmd_$=
(1))
> >
> > doesn't seem to have any obvious negative effects.
>
> When cmd_foo is not defined, $(call if_changed,foo) will fail with this c=
hange,
> but $(call cmd,foo) will succeed regardless.
>
> In Makefile, the variable expansion works like the latter.
> When X is not defined, $(X) is expanded to an empty string successfully.
> This is useful.
>
>
> > I'm probably missing some obvious reason why that $(if..) was added,
> > it's been that way for two years now.
>
> We do not need to guard both a definition and its callsite.
>
> For example, the current code in arch/powerpc/Makefile.postlink:
>
> vmlinux: FORCE
>         @true
> ifdef CONFIG_PPC64
>         $(call cmd,head_check)
> endif
> ifdef CONFIG_RELOCATABLE
>         $(call if_changed,relocs_check)
> endif
> ifdef CONFIG_FUNCTION_TRACER
> ifndef CONFIG_PPC64_ELF_ABI_V1
>         $(call cmd,ftrace_check)
> endif
> endif
>
>
> ... can be simplified into:
>
> vmlinux: FORCE
>         $(call cmd,head_check)
>         $(call if_changed,relocs_check)
>         $(call cmd,ftrace_check)
>

arch/riscv/Makefile.postlink is a better example.
CONFIG_RELOCATABLE for the callsite is redundant.


--=20
Best Regards
Masahiro Yamada

