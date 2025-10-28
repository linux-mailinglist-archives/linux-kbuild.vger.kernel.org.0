Return-Path: <linux-kbuild+bounces-9296-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6F5C16159
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Oct 2025 18:14:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98451421277
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Oct 2025 17:07:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 510AB288C3D;
	Tue, 28 Oct 2025 17:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sFtFGqja"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28645347BD1
	for <linux-kbuild@vger.kernel.org>; Tue, 28 Oct 2025 17:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761671271; cv=none; b=B32uvj+QuLcmnkVeFxhrDsrMsWEUEDjv1HKPTw9Tbidg/dx1FecuxD8AuK5cGxhYfxLfqtKenSLtA+I83IMYOLBCZEoQq/OCuuXne81bqV2xNnzgPJpqMCmchvhA9piqM1Ok+6zNSHW9USkvL8VbiK7M/heT4xTnmL7soFTzkYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761671271; c=relaxed/simple;
	bh=Tkq/5dhl0C1EAwayK8NcDVl7wbCLG7vllV38MaSxRjQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WLhdy0f3gRaSXBsBBqHYThbw5pLl336JfvVeNlmgREBtzqMIp1PESOjf1bHylGA1o2HoPdPPFesuuSHqGazCF4Fq8MIzt4F2PvzqmRa0VD1A0KI/f7TYcMRBde6BgV+KKcpg0JLhpskKdcL9KlbZnfkBUOiWAS4m5DLOmbje5S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sFtFGqja; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4eccff716f4so16711cf.0
        for <linux-kbuild@vger.kernel.org>; Tue, 28 Oct 2025 10:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761671267; x=1762276067; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vlYRN294fgCC2VAZY8tAv4lYbAWWl+5+yhrp8qWvOQM=;
        b=sFtFGqjaEwoUyBe5nMWJ62D4cF+B7xNs23cZI4AQauf8Nzs7KaBhBmAdy08gkjuJ/B
         TOpN6tX40MGRCv9UPzb1v4C0MVltnrxVHarK5QAABBujlJMUwj7VPTu+HoLj0gie8erb
         N7GnifiCHOZk/m1OtTBKSwcjbAfGYPwhHCvT0waebca0QsV4CGb+EftokQA8h/6vGgwP
         E+k9p2kJj/gpC5dgYvGHzH1k+eVLyRrXbBQN+Ey6JfsLxt084fJKvKiSbvSpJjhiBSQd
         0Pv3IiNR76anDGmvHFVwhHJbB3CS3Cvox0j9ChcQaIlozujXRmtmdr5eaoAbd3Uf+XXy
         TPow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761671267; x=1762276067;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vlYRN294fgCC2VAZY8tAv4lYbAWWl+5+yhrp8qWvOQM=;
        b=BMXdB+yft+U1c2pWVMQMztRa4whmo0iUshgobKbzn47/1HwmFcjO+bPortjM/2mwcd
         YN24XSn4lnFAU4jzSqPhjLaeyPWlD1nfvqPnm5F5SBX6LKPCs1yDOVbS9RbS0JWW1EYF
         vw6OrExguOapdXaYF/w8Af4uvfbxPP91UnGyUexxF2+BqrroqVOpCaRU0uB/FuJg+okH
         hYtgdXDM259ex9+6lt/XTrgLbxxl2Egp7mCWqCaWNeQRl63bmsd9S6vP2z2sBcR+0u94
         nEs3SMhWhlfHTpzgln0umvWAkiztc8WUwB3qkJ7hmmEAE7Dgu5TAtRrTeI0y26jswKu8
         hpVA==
X-Forwarded-Encrypted: i=1; AJvYcCXbSTJLGBLbt/8JLG/RwbL1c0jgHnCW8CY76RgduNDKsvR33wcRwGE12EcS/vf0jxdOh5eNiVEXKiI3PzQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzQyZsSzpRCT7E/bp6qltK+KGWLH54oMVlub2ZN6XiwID3VmGc
	NMvXp7y0tNloJSVxJXNT816Sng1aCGqmcAdPlfV76NCBPV3cN74hBsJqQS8B+gcYBYe9ymIipqt
	eMTKO2QCyI0PyMFAp6z4QIHsY4+aFEBZZVCTGy1wm
X-Gm-Gg: ASbGncsNhFYJRGyoZoREwDDt7RHtM/1D3xVBEkfC/n3OxwadoUNZ4NJv8sLmtT1bF7n
	rUpaDLPdtp+qg4E3qPCmvLPWvOOzL53qmNhXsn39ChQ8nMzSsKivmmDG9gWIrXOd24FN+Eahvju
	+hfIYoI3aq3fsSQEJau7BVunh36IigakJ3bQqcGaEO726ZYQTZMAPH61gWhOWq/10qoVKJ34NEI
	NoU7/kRZBE8S4Tgs8kDdaj4LYZmjeRtIaJoj0MLX5YovEOeeoTDzte4YO9Vx9qslF0MHeonZvoK
	TVUXdTfw60lHxg==
X-Google-Smtp-Source: AGHT+IEH8agpQadoFcoRQ/2MeIJtx9Vpo7xkxV0Ddwgdw1gUNOo7yRYt4+8OXghuG6MI4C1mNRU+jAVu3QS3Eg88QDo=
X-Received: by 2002:a05:622a:1654:b0:4e4:f2b9:55aa with SMTP id
 d75a77b69052e-4ed15946e3amr6841cf.17.1761671266361; Tue, 28 Oct 2025 10:07:46
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251027220914.2665978-1-xur@google.com> <b1e13b0b-19fa-4177-8ae1-0fcbf6d076c6@cachyos.org>
In-Reply-To: <b1e13b0b-19fa-4177-8ae1-0fcbf6d076c6@cachyos.org>
From: Rong Xu <xur@google.com>
Date: Tue, 28 Oct 2025 10:07:31 -0700
X-Gm-Features: AWmQ_bmMAkhivM1KCn6RbeGX2tX36dDFl8J5mkr59voL9h-OSoodOBVJDzKptCA
Message-ID: <CAF1bQ=Q-97ovXXQgtXq75zZUL_FtXo4LHoATHHYLgL-cPi5CdQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] kbuild: distributed build support for Clang ThinLTO
To: Piotr Gorski <piotrgorski@cachyos.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Alice Ryhl <aliceryhl@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Rafael Aquini <aquini@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Stafford Horne <shorne@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Teresa Johnson <tejohnson@google.com>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for testing this!

The culprit was the string -D'pr_fmt(fmt)=3DKBUILD_MODNAME ": " fmt'.

The previous patch parsed c_flags and removed -D% and a bunch of other
FE flags. Masahiro suggested using _c_flags instead.
I erroneously assumed there were no -D% in _c_flags. But this is
wrong. It seems that we do need to filter out -D% even using _c_flags.

I'll send an updated patch shortly.

Best regards,

-Rong


On Tue, Oct 28, 2025 at 3:43=E2=80=AFAM Piotr Gorski <piotrgorski@cachyos.o=
rg> wrote:
>
> I tried using this on kernel 6.17.5, but unfortunately I get this error.
> I previously tested the version in CachyOS:
> https://github.com/CachyOS/linux/commit/68984063b5e27854272241549e47cb293=
0ef9710
> and https://github.com/CachyOS/linux/
> commit/00a3ff73a566b7e27b4ced46af4ce27177d9fc37 and everything works fine=
.
>
> /bin/sh: -c: line 1: syntax error near unexpected token `('
> /bin/sh: -c: line 1: `set -e;    trap 'rm -f
> drivers/net/wireguard/main.o; trap - HUP; kill -s HUP $$' HUP; trap 'rm
> -f drivers/net/wireguard/main.o; trap - INT; kill -s INT $$' INT;  trap
> 'rm -f drivers/net/wireguard/main.o
> ; trap - QUIT; kill -s QUIT $$' QUIT;  trap 'rm -f
> drivers/net/wireguard/main.o; trap - TERM; kill -s TERM $$' TERM; trap
> 'rm -f drivers/net/wireguard/main.o; trap - PIPE; kill -s PIPE $$' PIPE;
> printf '\n%s\n' 'saved_c_flag
> s_drivers/net/wireguard/main.o :=3D -D__KERNEL__ --target=3Dx86_64-linux-=
gnu
> -fintegrated-as -Werror=3Dignored-optimization-argument
> -Werror=3Doption-ignored -std=3Dgnu11 -fshort-wchar -funsigned-char
> -fno-common -fno-PIE -fno-strict-a
> liasing -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx
> -fcf-protection=3Dbranch -fno-jump-tables -m64 -falign-loops=3D1 -mno-803=
87
> -mno-fp-ret-in-387 -mstack-alignment=3D8 -mskip-rax-setup -march=3Dznver4
> -mno-red-zone -mcmodel=3Dkern
> el -mstack-protector-guard-reg=3Dgs
> -mstack-protector-guard-symbol=3D__ref_stack_chk_guard -Wno-sign-compare
> -fno-asynchronous-unwind-tables -mretpoline-external-thunk
> -mindirect-branch-cs-prefix -mfunction-return=3Dthunk-extern -m
> harden-sls=3Dall -fpatchable-function-entry=3D16,16
> -fno-delete-null-pointer-checks -O3 -fstack-protector-strong
> -ftrivial-auto-var-init=3Dzero -fno-stack-clash-protection -pg -mfentry
> -DCC_USING_NOP_MCOUNT -DCC_USING_FENTRY -fno-l
> to -flto=3Dthin -fsplit-lto-unit -fvisibility=3Dhidden -falign-functions=
=3D16
> -fstrict-flex-arrays=3D3 -fno-strict-overflow -fno-stack-check
> -fno-builtin-wcslen -Wall -Wextra -Wundef
> -Werror=3Dimplicit-function-declaration -Werror=3Dimpl
> icit-int -Werror=3Dreturn-type -Wno-format-security -Wno-trigraphs
> -Wno-frame-address -Wno-address-of-packed-member -Wmissing-declarations
> -Wmissing-prototypes -Wframe-larger-than=3D2048 -Wno-gnu
> -Wno-format-overflow-non-kprintf
> -Wno-format-truncation-non-kprintf -Wno-default-const-init-unsafe
> -Wno-pointer-sign -Wcast-function-type
> -Wno-unterminated-string-initialization -Wimplicit-fallthrough
> -Werror=3Ddate-time -Wenum-conversion -Wunused -Wno-unused-
> but-set-variable -Wno-unused-const-variable -Wno-format-overflow
> -Wno-override-init -Wno-pointer-to-enum-cast
> -Wno-tautological-constant-out-of-range-compare -Wno-unaligned-access
> -Wno-enum-compare-conditional -Wno-missing-fi
> eld-initializers -Wno-type-limits -Wno-shift-negative-value
> -Wno-enum-enum-conversion -Wno-sign-compare -Wno-unused-parameter -g
> -gdwarf-5 -D'pr_fmt(fmt)=3DKBUILD_MODNAME ": " fmt'' >>
> drivers/net/wireguard/.main.o.cmd'
> make[5]: *** [scripts/Makefile.build:287: drivers/net/wireguard/main.o]
> Error 2
> make[5]: *** Deleting file 'drivers/net/wireguard/main.o'
> make[4]: *** [scripts/Makefile.build:556: drivers/net/wireguard] Error 2
>
> LLVM/CLANG: 21.1.4
>
> If necessary, I can send more logs.
>
> Best regards,
>
> Piotr
>
> W dniu 27.10.2025 o 23:09, xur@google.com pisze:
> > From: Rong Xu <xur@google.com>
> >
> > This V4 is based on the reimplementation provided by Masahiro Yamada
> > on May 26. The difference is that this version now saves the compiler
> > flags (_c_flags) from the Front-End (FE) compilation and re-uses them
> > for the subsequent Back-End (BE) compilation.
> >
> > Rong Xu (2):
> >    kbuild: move vmlinux.a build rule to scripts/Makefile.vmlinux_a
> >    kbuild: distributed build support for Clang ThinLTO
> >
> >   .gitignore                 |  2 +
> >   Makefile                   | 25 +++++-------
> >   arch/Kconfig               | 19 +++++++++
> >   scripts/Makefile.lib       |  7 ++++
> >   scripts/Makefile.thinlto   | 40 ++++++++++++++++++
> >   scripts/Makefile.vmlinux_a | 83 +++++++++++++++++++++++++++++++++++++=
+
> >   scripts/mod/modpost.c      | 15 +++++--
> >   7 files changed, 174 insertions(+), 17 deletions(-)
> >   create mode 100644 scripts/Makefile.thinlto
> >   create mode 100644 scripts/Makefile.vmlinux_a
> >
> >
> > base-commit: dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa

