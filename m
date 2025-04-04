Return-Path: <linux-kbuild+bounces-6431-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8304EA7C07E
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Apr 2025 17:25:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E06A23BB451
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Apr 2025 15:25:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 980851F3BA8;
	Fri,  4 Apr 2025 15:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MqSdlYDy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E25F3D6F;
	Fri,  4 Apr 2025 15:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743780336; cv=none; b=tKvRZfUrfXueHbdIExTHYo4MTsRAFxdvzPtbJz5jl8FZ3oWOBEi8H9OQ4vO4t1f01REdB3aXVbhFXF+j7T3drVgElQnIzWAbiUjNq0yP3KZiTdYARc833yfSCGVSkgVDyZpevnRUadRMj7AtfaeOaRcn9zO+LDB6WRTBvTlyBpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743780336; c=relaxed/simple;
	bh=nK6IXtqAJZLLyw0GWtzRaeO5dpR8mdeA56ldyu1ncbo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P9b6cW4jUFe23XFC1owaJkK7vwYQL2a7/Kl4XVr+zChCe8AcrnFe68EZitKUVlx+2XtgK03X8gDp4ip1lpBSKXz0ibCR1t0MlkPsOG/yLv4lLbZook++qt4s3trreV5gwfllwQ4yNWNf8GN31/y7sB6+yiscgM+lW+h1tWaDKRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MqSdlYDy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5119C4CEE8;
	Fri,  4 Apr 2025 15:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743780335;
	bh=nK6IXtqAJZLLyw0GWtzRaeO5dpR8mdeA56ldyu1ncbo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MqSdlYDypLBGkooMf84Fafs/nnBUjhwYVSpVR4cNTxTWYWm7+c+EgttWBRNgQA3za
	 jn3oheX3bhnsb4w2j/rZ2ZJqqilpqlgfv25vFcMYFTYVtbWCCiWHKRchhbhSISQQcl
	 BFb/p9gOGiMPPe9n94zPSwY682425LjBZnl6bgRwGUnPNVfZv8HjMLpYgdu8cuMtir
	 +n6bmFLjV5U3B6Qw3BC+YtY9mxzTuZK22V7hGod2qV0s7QPZaWm/orhTIgcTcn+va+
	 SN8PdEdHgki4xuf5o+KHdxLXNiO4P0hmW+N8ACiCqwD2i4qvQU50ANLwKGu10tWVoj
	 vDDMKaTkl/mGg==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30c461a45f8so20636131fa.1;
        Fri, 04 Apr 2025 08:25:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVCbDhkhc5xBmR/Dnov2FzZtQizpQiVxhcw4O77YZZ6mAWM5LKrxfdnR1XoSsyPR93tgs5r+EDibW+GGD8=@vger.kernel.org, AJvYcCWEV/K/lBrbP8045ChHWHwFoM9XhxgA5JZLdDd+04a1bEGpJm9q27Og72mxDkrz/NZIMOb52+bjs+xvuBxu@vger.kernel.org
X-Gm-Message-State: AOJu0YwfiGNgOlwzwnTwBF0QOHEIoiQEoQ8nYINNai2+/i/hN/MRJrLx
	7e+K1jV8y4VBG+HEWjgpXE2Si0DCLILdce1uoLSJlA/UMOhEt7n65QSuodTqewB4PdvGZawqgjM
	Fb0SnpeTWYrcPpHxZ8rg5s7to+Vw=
X-Google-Smtp-Source: AGHT+IHm9oLp2VNs6gVeqyQoqXKbHof+ipk+8pg/ZnlGiMrdli/D4QrtcDONAkA1jcay3in9eUiUE/zUq6fh7pGxa2c=
X-Received: by 2002:a2e:ab19:0:b0:30c:7a7:e874 with SMTP id
 38308e7fff4ca-30f0bf1e9b3mr11238561fa.11.1743780334401; Fri, 04 Apr 2025
 08:25:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403134200.385077-1-alexghiti@rivosinc.com>
 <CAMj1kXGzrn6i20LvUBnz_mGi946=GCogNHHUL=mNsv513qYv7A@mail.gmail.com> <2874fc20-9135-4b13-b825-43fb350ce552@ghiti.fr>
In-Reply-To: <2874fc20-9135-4b13-b825-43fb350ce552@ghiti.fr>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 5 Apr 2025 00:24:56 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT5sDhh1v3U2xUuVnrbhNXp3SJ_ngxSqAgwmZL0E2QGpA@mail.gmail.com>
X-Gm-Features: ATxdqUGGrznrJ02mnRz79MwDnvO85yAln5KDtwraC_VKsuL1jogPgQbWExeTD0E
Message-ID: <CAK7LNAT5sDhh1v3U2xUuVnrbhNXp3SJ_ngxSqAgwmZL0E2QGpA@mail.gmail.com>
Subject: Re: [PATCH v2] scripts: Do not strip .rela.dyn section
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Ard Biesheuvel <ardb@kernel.org>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Charlie Jenkins <charlie@rivosinc.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 4, 2025 at 12:45=E2=80=AFAM Alexandre Ghiti <alex@ghiti.fr> wro=
te:
>
> Hi Ard,
>
> On 03/04/2025 17:11, Ard Biesheuvel wrote:
> > On Thu, 3 Apr 2025 at 16:42, Alexandre Ghiti <alexghiti@rivosinc.com> w=
rote:
> >> riscv uses the .rela.dyn section to relocate the kernel at runtime but
> >> that section is stripped from vmlinux. That prevents kexec to
> >> successfully load vmlinux since it does not contain the relocations in=
fo
> >> needed.
> >>
> > Maybe explain that .rela.dyn contains runtime relocations, which are
> > only emitted if they are actually needed - as opposed to the static
> > relocations that are not emitted as SHF_ALLOC sections, and are not
> > considered to be part of the runtime image in the first place.
>
>
> Ok I'll do.
>
>
> > It
> > would be nice if we could use --remove-relocations=3D here, which only
> > removes static relocations, but unfortunately, llvm-objcopy does not
> > support this.
> >
> > Also, I wonder if this should apply to all of .rel.dyn, .rela.dyn and
> > .relr.dyn, as they all carry runtime relocations.
>
>
> Ok, I'll add them to the next version.
>
>
> >
> > Finally, I'd be curious to know why RISC-V relies on --emit-relocs in
> > the first place? Is the relocs check really needed? If not, it would
> > be a nice opportunity to get rid of Makefile.postlink entirely.
>
>
> So I had to check and it happens that this was an issue with the
> toolchain, I should check if that still happens with newer ones.
>
> commit 559d1e45a16dcf1542e430ea3dce9ab625be98d0
> Author: Alexandre Ghiti <alexghiti@rivosinc.com>
> Date:   Wed Mar 29 06:53:29 2023 +0200
>
>      riscv: Use --emit-relocs in order to move .rela.dyn in init




So,

Fixes: 559d1e45a16d ("riscv: Use --emit-relocs in order to move
.rela.dyn in init")

Is this the correct tag?





--=20
Best Regards
Masahiro Yamada

