Return-Path: <linux-kbuild+bounces-8245-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 31325B14ED4
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Jul 2025 15:55:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 689F51711B1
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Jul 2025 13:55:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C574119D08F;
	Tue, 29 Jul 2025 13:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zai6zLgq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DA7259C;
	Tue, 29 Jul 2025 13:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753797329; cv=none; b=ppWJ5chKDgVZXC5RzdOTsuifCwHdBMuHtoyNjPgGpVMjtujr3UuidiQz2sCSFNwsUiXM5mRM/siEzztgQ+oR0m6oOHf7F/5WyGYzGQHBEy7x+OxpJffUudsgm3HY+P22biltwZYmQxQoWAKQlnL39lWmaYZrAUetJE2xevTBv5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753797329; c=relaxed/simple;
	bh=9Bs7gWX3m1fUxd2JR9Hkg7b1PveOTV9gXKlIgcyPXVw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fJQA4MyWVgZR4fLIlv+KJSJAe8tqL2nIijgq72EmdWiAJ//ngTAKgXXVtcnfg/6selwis2HMIXd8FyyJDB8cC+VtblBW17ZHI3PI6wV2g2MLuPTDXnlSbN8GCDvKqcyu8bGyzid7kY8P/GhE4anqAvhQrWsEP8kkY1ENjWQRLtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zai6zLgq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C377C4CEF4;
	Tue, 29 Jul 2025 13:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753797329;
	bh=9Bs7gWX3m1fUxd2JR9Hkg7b1PveOTV9gXKlIgcyPXVw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Zai6zLgq8C3ht1HaR41/cc9slmu1NEmmld6uOovPkofkY7miolOoI9/nqjxhpTrc3
	 xpLDb5Ul1uS4DGlN08x6pj2iqhXs7TFkTiMnyrreCNnzvO4vENBoAOIEM/S7XcExVT
	 YiQu0KD4Im84KyarRrPxNxeYv2i5Vz/hGqvke7I2yaAHpwQH7jrPy9HDpQlPr98Zfk
	 byhLKOczBAsO7hAp7mhLw4jRk0Fh0ergcc9ZTE/1jvPjt0DZMMZGXE9t3QpnuVVipE
	 2a1enJiVx5f2KaKN1ZQ+5VABLp7vkJL7rGKUJQk4pD/ZPbiGQjRBk87xHZ6qtZBIIp
	 1TfD1uZXamI+w==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-553b3316160so5978812e87.2;
        Tue, 29 Jul 2025 06:55:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVyzaHP2O8//gMxH083XYPbvSLjo/fGw3pZqW7MvETDEHmAyp089S6NCfLARwD3zD8TN1Xmpvc652qMPKO5+A==@vger.kernel.org, AJvYcCW0YQlSAqaoQXoxxBR63nO5pm2yfEwUBzVQa15kVhrbs8fQIn/IowIWRADemvSHBSF+MjXqGGRxVbjrX/Q=@vger.kernel.org, AJvYcCWMd2pM4Qs0Al1ez1lI75REtGMmlSuw3vLJTueUOheV63GDRx3hG+nQ0MfcXdaLpgjLm4q1g1t11udPIWMO@vger.kernel.org
X-Gm-Message-State: AOJu0YyYpYpA7/L0vHqV1c/iVarsaUhwDOTCHlyRTNwt+axP94stzft+
	UZttkRfYndtDRoc0h6vxDq7DV2ilBfH8MXFEYyd9k3ub3U+Omk3BbWMdNtAStS8+FkFFzmmstWU
	EFjP5uhIeIxqrP+1Y+ozMoUYRCDFxaZ8=
X-Google-Smtp-Source: AGHT+IH7Ql2ntZtK4DCE5E2IAeeWFFhm2AjhOvfQW483xzxfQHWQx2er1f4opadjNooiknx1YL+ccpM+VzxJZCBBxII=
X-Received: by 2002:a05:6512:2393:b0:55b:57af:201c with SMTP id
 2adb3069b0e04-55b5f4c76cfmr4169949e87.55.1753797327317; Tue, 29 Jul 2025
 06:55:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1753354215.git.legion@kernel.org> <d44055fc22d4a53b7f87758d31cb4d640c8f8cca.1753354215.git.legion@kernel.org>
 <20250728135753.432695A72-agordeev@linux.ibm.com>
In-Reply-To: <20250728135753.432695A72-agordeev@linux.ibm.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 29 Jul 2025 22:54:51 +0900
X-Gmail-Original-Message-ID: <CAK7LNARQvydrykp=4tf3w4aymTt-pBYnVnekWsOrVjHbTj3x8w@mail.gmail.com>
X-Gm-Features: Ac12FXwzgVm3YmyXfw1LpobYYGCaoxiAZnubiRILYsWYB7lqX08AkLCX_KvPzF8
Message-ID: <CAK7LNARQvydrykp=4tf3w4aymTt-pBYnVnekWsOrVjHbTj3x8w@mail.gmail.com>
Subject: Re: [PATCH v5 03/10] kbuild: keep .modinfo section in vmlinux.unstripped
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Alexey Gladkov <legion@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Luis Chamberlain <mcgrof@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 28, 2025 at 10:58=E2=80=AFPM Alexander Gordeev
<agordeev@linux.ibm.com> wrote:
>
> On Thu, Jul 24, 2025 at 03:49:40PM +0200, Alexey Gladkov wrote:
>
> Hi Alexey, Masahiro,
>
> > From: Masahiro Yamada <masahiroy@kernel.org>
> >
> > Keep the .modinfo section during linking, but strip it from the final
> > vmlinux.
> >
> > Adjust scripts/mksysmap to exclude modinfo symbols from kallsyms.
> >
> > This change will allow the next commit to extract the .modinfo section
> > from the vmlinux.unstripped intermediate.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >  include/asm-generic/vmlinux.lds.h | 2 +-
> >  scripts/Makefile.vmlinux          | 2 +-
> >  scripts/mksysmap                  | 3 +++
> >  3 files changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vm=
linux.lds.h
> > index fa5f19b8d53a..1791665006f9 100644
> > --- a/include/asm-generic/vmlinux.lds.h
> > +++ b/include/asm-generic/vmlinux.lds.h
> > @@ -831,6 +831,7 @@ defined(CONFIG_AUTOFDO_CLANG) || defined(CONFIG_PRO=
PELLER_CLANG)
> >
> >  /* Required sections not related to debugging. */
> >  #define ELF_DETAILS                                                  \
> > +             .modinfo : { *(.modinfo) }                              \
>
> FWIW, to me .modinfo logically does not quite belong to ELF_DETAILS,
> since it is not about ELF.
>
> I would guess, that you want to make a minimal code impact to the
> linker scripts, but with that you turn .modinfo the only section
> among ones that do not make it to the final image:
>
>         STABS_DEBUG
>         DWARF_DEBUG
>         ELF_DETAILS
>
> That immediately breaks s390, but also is a call for trouble in
> the future, as far as I am concerned.
>
> Would it makes sense to introduce e.g MODINFO instead?

I am open to MODINFO addition, if Alexey is happy about
modifying linker scripts for all arches.
Yeah, it is tedious, though...




>
> >               .comment 0 : { *(.comment) }                            \
> >               .symtab 0 : { *(.symtab) }                              \
> >               .strtab 0 : { *(.strtab) }                              \
> > @@ -1044,7 +1045,6 @@ defined(CONFIG_AUTOFDO_CLANG) || defined(CONFIG_P=
ROPELLER_CLANG)
> >       *(.discard.*)                                                   \
> >       *(.export_symbol)                                               \
> >       *(.no_trim_symbol)                                              \
> > -     *(.modinfo)                                                     \
> >       /* ld.bfd warns about .gnu.version* even when not emitted */    \
> >       *(.gnu.version*)                                                \
>
> Thanks!



--=20
Best Regards
Masahiro Yamada

