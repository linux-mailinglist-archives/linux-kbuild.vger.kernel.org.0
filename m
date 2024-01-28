Return-Path: <linux-kbuild+bounces-696-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE5D83F361
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jan 2024 03:57:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D89C1F220E0
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jan 2024 02:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49DD0440C;
	Sun, 28 Jan 2024 02:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="F7iEJmKS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544E13C35
	for <linux-kbuild@vger.kernel.org>; Sun, 28 Jan 2024 02:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706410660; cv=none; b=Wn/MY2qncCFbtPjnqkrwyhqKCx+kktL8A7GHSyYfax/vQ/EIUOANDw3fu576C1Ko23PUuiynsXQfS4aKs9Iro+//tc5Wnd9g0hccdPDfOscRy5NKDVmOcSmNowPWqsw901g9WrNdxng+3G1e7yAkd9TB2LJWZnz5pGNPFRnqy+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706410660; c=relaxed/simple;
	bh=0Ljyz9aN5fI8hdU4LP4IKaxXlOnZcbkEh0t788GhUf8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cfRxWVu+mWDsLxM34sCRkY4YANZipXmWTyhlzr5kHmgVoUDjKgODlclEtzgQC0GoM0v9h331FKWXk6H/LUemHTdz33ZgwQDnDIf5/s060jY6GNl1GUq7JiSYgTjuef1a3iMCTLF9lyHOrX+yFY6izLxTzosV0QhItNbtpRc9+bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=F7iEJmKS; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5110c166d70so144116e87.1
        for <linux-kbuild@vger.kernel.org>; Sat, 27 Jan 2024 18:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1706410656; x=1707015456; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tUPe8kS/dYQxcvPbyImR2zb7xWJbztZ0Yj4HdTeCp4I=;
        b=F7iEJmKS3dc9yegruNfpg2IKaWJ535A4l07YyviCrLvIst5Lnd5r1lTPL738+9g2+/
         HBaw4JQL5/xhgs2oDrgiQJBEsVVkpn6Q+xSOVhcYYD4sDDctOJ2webOGoqiv+ub8tTQX
         mf59kdgluItHMJv3xXE2ph1JTC+u/Ek7E/1Lqh71isNsCQQmsLPCYtIsJQAPzU8SMaSw
         b7dO237A/tZFmKK4bWXiLpGpNotPBFLNNlRoXHUSkkCfXibapW87Cl2AvM+dY2Ydo2SI
         VLkAXKaB7OxPJ6Kw0cN1goqod8zChhV3+P+qZj42BWqqRJjzpCZTkThUZMSCmSERWqc6
         bwtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706410656; x=1707015456;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tUPe8kS/dYQxcvPbyImR2zb7xWJbztZ0Yj4HdTeCp4I=;
        b=TzxBqQbezqVoyB+3fFOBjGqB5r8x/9mBwSLSpKqxFUFlfS6NnYivEKpV62lF2dA44o
         xkYCnNBS8G0Mor5Xb+/hpkHSQ3qP9RWtjDI1uNcRT7i5F1ClILCphqAKOlqJ5BeDjS3D
         dKeaBAVymmVK9/vxr6iK6Eag3AUD9hV9oPwI4Pgqt14F2oOOOZ/WrP3kBI5RufL6XwAE
         UBn/l2FcuNOHq3MHQz+fYKxWD3yt5SeK2vOURsvDrKUhVjjEbHd0Wrq8GZibLKaWZ6yU
         9ld0Iylme5ed1LcORXlFuaxMH75WlzWeJLolLoxddY8f23hrGyTiWUUO34qt5FcugW4/
         pa1Q==
X-Gm-Message-State: AOJu0YwT+ls56fCqI6vE3Dyp99gKTZ1vDwi0zOc2kCZFlNeYdTf996Bo
	v+K1T6m2tSDbIjidrPXRPVZB5wq6kbrlUgJJLXqRenBs8LWt8pcUYrFOp69bYcvgqNhR+tORxTZ
	20t7VKgkvSOg8v2zTlzVoUCmQmyYxA07DfRhRKA==
X-Google-Smtp-Source: AGHT+IH9hs8nV3EIySrlhWIGxmnGMq22449h+fsNcRpbxaYZsJKDaLHJx2IgCnzvK9tg/L1sdXMDyhVz1NejyYUort8=
X-Received: by 2002:ac2:4893:0:b0:50e:630d:7364 with SMTP id
 x19-20020ac24893000000b0050e630d7364mr1500830lfc.28.1706410655622; Sat, 27
 Jan 2024 18:57:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240125-fix-riscv-option-arch-llvm-18-v1-0-390ac9cc3cd0@kernel.org>
 <20240127090310.GF11935@sol.localdomain>
In-Reply-To: <20240127090310.GF11935@sol.localdomain>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Sun, 28 Jan 2024 10:57:24 +0800
Message-ID: <CABgGipVMv-+AJkGMPzFhimaPCUVATk3gjUDG0P4btRJWtXcMxw@mail.gmail.com>
Subject: Re: [PATCH 0/2] RISC-V: Fix CONFIG_AS_HAS_OPTION_ARCH with tip of
 tree LLVM
To: Eric Biggers <ebiggers@kernel.org>, Nathan Chancellor <nathan@kernel.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	masahiroy@kernel.org, nicolas@fjasle.eu, conor.dooley@microchip.com, 
	linux-riscv@lists.infradead.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev, patches@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 27, 2024 at 5:03=E2=80=AFPM Eric Biggers <ebiggers@kernel.org> =
wrote:
>
> On Thu, Jan 25, 2024 at 10:32:10AM -0700, Nathan Chancellor wrote:
> > Hi all,
> >
> > Eric reported that builds of LLVM with [1] (close to tip of tree) have
> > CONFIG_AS_HAS_OPTION_ARCH=3Dn because the test for expected failure on
> > invalid input has started succeeding.
> >
> > This Kconfig test was added because '.option arch' only causes an
> > assembler warning when it is unsupported, rather than a hard error,
> > which is what users of as-instr expect when something is unsupported.
> >
> > This can be resolved by turning assembler warnings into errors with
> > '-Wa,--fatal-warnings' like we do with the compiler with '-Werror',
> > which is what the first patch does. The second patch removes the invali=
d
> > test, as the valid test is good enough with fatal warnings.
> >
> > I have diffed several configurations for the different architectures
> > that use as-instr and I have found no issues.
> >
> > I think this could go in through either the kbuild or RISC-V tree with
> > sufficient acks but I will let them fight over who takes it :)
> >
> > [1]: https://github.com/llvm/llvm-project/commit/3ac9fe69f70a2b3541266d=
aedbaaa7dc9c007a2a
> >
> > ---
> > Nathan Chancellor (2):
> >       kbuild: Add -Wa,--fatal-warnings to as-instr invocation
> >       RISC-V: Drop invalid test from CONFIG_AS_HAS_OPTION_ARCH
> >
> >  arch/riscv/Kconfig        | 1 -
> >  scripts/Kconfig.include   | 2 +-
> >  scripts/Makefile.compiler | 2 +-
> >  3 files changed, 2 insertions(+), 3 deletions(-)
>
> Looks good,
>
> Tested-by: Eric Biggers <ebiggers@google.com>
>
> Unfortunately another LLVM commit just broke TOOLCHAIN_HAS_VECTOR_CRYPTO,=
 so
> I've sent out a patch to fix that too...
>
> But with all the fixes applied it works again.
>
> - Eric

For this series

Tested-by: Andy Chiu <andybnac@gmail.com>
Reviewed-by: Andy Chiu <andybnac@gmail.com>

Thanks,
Andy

