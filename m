Return-Path: <linux-kbuild+bounces-5437-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0BFA09FE1
	for <lists+linux-kbuild@lfdr.de>; Sat, 11 Jan 2025 02:14:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA13016ADBA
	for <lists+linux-kbuild@lfdr.de>; Sat, 11 Jan 2025 01:14:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0915184E;
	Sat, 11 Jan 2025 01:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d7pch/5A"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894BF3D96A;
	Sat, 11 Jan 2025 01:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736558062; cv=none; b=PqMru/DbxEclf/qIn8khHkRc67BmzLHcPOjpFkoWM6nUF78NVu3I4G+soiJJjF9txYk2ZJ/0WOMd8qoTpR5loSaIea0N6vVvvF965lknaPDKLs8mmp6ZlD4W6yR2M4tqeNkylOyqJw6zwEuv46dDyL6BkG7cme1d8V7Hr9RcJ6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736558062; c=relaxed/simple;
	bh=n+iRm2VaEJvvCCHmY+X42mIpAqGf52//qef9C9sjFzQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WM+/7BJiJXjIR0nXHJtTjRoDOCkXLvuRRebQRYUQCyDGaPPkMWVsq6tGSjYWbxUkcfnOWfBvssdCODjC6Y+r/44ImhAIKyf52ox7iAaaHhikFPdfTdhrRVyBHhLdDy0B39xdV3q/LYBhWTLGM3szMkqUFL9JX3g0yqgOtFzbp8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d7pch/5A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14C0BC4CED6;
	Sat, 11 Jan 2025 01:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736558062;
	bh=n+iRm2VaEJvvCCHmY+X42mIpAqGf52//qef9C9sjFzQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=d7pch/5Ai3D88+mYzxr4tKRXyYeEsstHsz/AP6jZ82xJ0g8upbBSoEyBI1db98t7t
	 0F7GdQO9QmYnkCBfdeM0TsLHrK2pqjQv8cI8X0FiuY2Ms4o3JBAMlNVMJ1Aj4rtUZx
	 n7EsOzPpwFwaSZMVErvoOh4P2tCVro1wy0UTSjeopvuM+99b64WltPIgDZ0rfVXozl
	 z1QPZbXeyS/eIDR2uhGW+RsGUDEUUmSXBzKyJB+V/JGWCSARSemS6DVeMnPLj+u/vt
	 YU02Cea6ay5x5waHfpsNge0+ud9mpJXhHYConhWsavxvveg4Qj4GGZjhEhUWGfROT7
	 axdJtyrH0Lr1Q==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-540201cfedbso2340396e87.3;
        Fri, 10 Jan 2025 17:14:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVG4onrzamEUBli/0/kKFWsXl6LBmnIIe5XhmZQTp8uaGGn5tDIznfg2rMPDhHtGg1/XYWfGSH/hZJyDg==@vger.kernel.org, AJvYcCX2N6DrFHyo6PqlUOUtro0OI/QF7Kjnl2Gy/SfqsR8OTNBidAECyLDdHBUGuaJpC69y7jLeRXX1RhJMLmAL@vger.kernel.org, AJvYcCXjYxS45VJAKikMYlzfQEAh7R2Jry5Zl6HP8K1OD9GOU2b9zGA7fowfusU5uNpgnA5XY+G2Ul7vcm59i/4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKhsA71ziL1Kl7XiZQv4OK2TD6TAyVVbAmSCtvP4B76wPWVlg9
	6C3D+QrqHfKRKs7VKxvnkdKZFepO7I+Z5Ng/jXAbGoANusS9Y6pu9Q+NPKuQl3WqY0XN7OoUm9A
	anIM+PDICt2Wkfx3iXkTKYYzEILA=
X-Google-Smtp-Source: AGHT+IHY04Sligz279mJ22kXB8Zjf/y7VUC/N6Z6gUTMrSAcA4W4uor1DT6HPAp0b14YuYtRYWDA7k5jcE8WiamKzAc=
X-Received: by 2002:a05:6512:6cc:b0:53e:350a:729e with SMTP id
 2adb3069b0e04-542845b94d0mr4507675e87.35.1736558060770; Fri, 10 Jan 2025
 17:14:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250110082744.457067-2-ardb+git@google.com> <CAK7LNASygf5gRdYOOa3KsKbz8mny9nnn5RduuGtP5WoWgXDTQA@mail.gmail.com>
 <CAMj1kXEPq6VU19qzmW9DNVG=nzoGbnCMt7dE5nXeZCqk2JPE3A@mail.gmail.com> <CAHk-=wiGfhxb4q4T2=W=Vg=sHwZwwMTN2EaDYbmS0VG1Srdb-w@mail.gmail.com>
In-Reply-To: <CAHk-=wiGfhxb4q4T2=W=Vg=sHwZwwMTN2EaDYbmS0VG1Srdb-w@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 11 Jan 2025 10:13:44 +0900
X-Gmail-Original-Message-ID: <CAK7LNASrzZnoLeRQz9FH6EUEz1rSPY_-GHvmS=8JA2R8eCjSKg@mail.gmail.com>
X-Gm-Features: AbW1kvYUzM6oy1WA3iNunnG5Otg_1tGF6QyaJF7fe05aRP67ws8j4txIP2SJldQ
Message-ID: <CAK7LNASrzZnoLeRQz9FH6EUEz1rSPY_-GHvmS=8JA2R8eCjSKg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Strip runtime const RELA sections correctly
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, Ard Biesheuvel <ardb+git@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 11, 2025 at 3:33=E2=80=AFAM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Fri, 10 Jan 2025 at 10:11, Ard Biesheuvel <ardb@kernel.org> wrote:
> >
> > I suppose this is a consequence of 8962b6b475bddc ("kbuild: print
> > short log in addition to the whole command with V=3D1") which introduce=
d
> > an $(if ) where the else branch is simply ':' and so it always
> > succeeds.
>
> Hmm. Odd. I don't see why that part of the commit exists, and you're
> right, that seems like a bad idea.
>
> And removing that odd $(if..) and making it just do
>
>    cmd =3D @set -e; $($(quiet)log_print) $(delete-on-interrupt) $(cmd_$(1=
))
>
> doesn't seem to have any obvious negative effects.

When cmd_foo is not defined, $(call if_changed,foo) will fail with this cha=
nge,
but $(call cmd,foo) will succeed regardless.

In Makefile, the variable expansion works like the latter.
When X is not defined, $(X) is expanded to an empty string successfully.
This is useful.


> I'm probably missing some obvious reason why that $(if..) was added,
> it's been that way for two years now.

We do not need to guard both a definition and its callsite.

For example, the current code in arch/powerpc/Makefile.postlink:

vmlinux: FORCE
        @true
ifdef CONFIG_PPC64
        $(call cmd,head_check)
endif
ifdef CONFIG_RELOCATABLE
        $(call if_changed,relocs_check)
endif
ifdef CONFIG_FUNCTION_TRACER
ifndef CONFIG_PPC64_ELF_ABI_V1
        $(call cmd,ftrace_check)
endif
endif


... can be simplified into:

vmlinux: FORCE
        $(call cmd,head_check)
        $(call if_changed,relocs_check)
        $(call cmd,ftrace_check)






--=20
Best Regards
Masahiro Yamada

