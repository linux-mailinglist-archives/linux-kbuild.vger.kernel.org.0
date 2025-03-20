Return-Path: <linux-kbuild+bounces-6262-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96725A6A8CD
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Mar 2025 15:40:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 100AC16DC09
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Mar 2025 14:40:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2053E1C3BE0;
	Thu, 20 Mar 2025 14:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TexNtL/9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8BA19DF98;
	Thu, 20 Mar 2025 14:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742481652; cv=none; b=fAydwXFX85YPUHUWK74f6PqJk8M+FHyAi75knsETtxHFIzXaeuTSY3EW/N08Usx8vTouagp2K+PClczQpCsmPerxNKxVP2D4ffvAlfRMGC8DsfObIkwE5i5niJPdq0eDRqm8BhYbek8+80Tr8XWPmr9S62aaBmDTaD2SMWK0niE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742481652; c=relaxed/simple;
	bh=SxLgY5fAbCjw6FL4H+ZPmK742mD7bTanZKI86Rpa7lM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E28BSf9AIaZs6J+BVHNrn1/aD5TaVlc5XNMkoljpBLw80BQricmrp82pE44rXus0CezbzEFfIlU1Dvk+L6F7vymrKpBOL62MR679Ov4pN7HhlMLFuPkJuiK5P+ftcWnU9be/4/P5EH9/NIfhyiYezVGGrVjCxx0BaGPPowDymYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TexNtL/9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7228FC4CEDD;
	Thu, 20 Mar 2025 14:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742481651;
	bh=SxLgY5fAbCjw6FL4H+ZPmK742mD7bTanZKI86Rpa7lM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TexNtL/9pbD1MJB9Iqk/1Lw58NkZndFo8S4DvBTr2bkh5iaOT7oziWtN5aYwKu1eW
	 VS9JAhkdPmJRxRnm+ojTHO8wzn/e0bl7WM4MBS/2UphJfWrEtXmPLrklm3HGVU6SlI
	 7DCTIU2iBhRc50OwxCk60ZAPg1d4jkshCp5vxBzHDyUBqYSwXP2Nnq9bZzlE+zHARU
	 KKrNCuoCI4kOIk2SG+NWG6GNAz4utzdsvwcmmT6HmSWW21H9xzt1gBOMW3sjQDmIh4
	 zRUnmqZdEUZBTfmtEncaU1uft2lrPtsd2H6KpS07GV/X9zss2+LlG7Olmkp9juZm2b
	 DLTGSDfer73pw==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54ad1e75f49so674124e87.0;
        Thu, 20 Mar 2025 07:40:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWx/+bH+SwJGI8b8tQ48mkoyYsMHbfAt5eVTYZGKnctHTxuFEP+cy9FC3mPLQntLlM+kIG9S1k/zHsACWY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxBb3RNWajxLOOPvzPCPfRawC7lXMTwMriVddAyyvnC1H9wQq+
	jQlSJ3uBYTUW0La3IUfD/P7B1s6ov7MSbRYYmcvPkTeM+hmBdxMdXnw3T5FLyihHbbKzCIv6uFp
	2Spf0+5jLMbkFCdtH5FKdm6p9JKA=
X-Google-Smtp-Source: AGHT+IFaM8+KNfLhsACwx/I4vqJcdDat1GjQINb/JwhbXcNVqgZD5aXT6IVFupVUjJtu9YiTsIxIABrWylVutJhb3lw=
X-Received: by 2002:a05:6512:6c3:b0:545:e7f:cf33 with SMTP id
 2adb3069b0e04-54acb1d4ebdmr2804379e87.28.1742481650113; Thu, 20 Mar 2025
 07:40:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250320070746.101552-2-ardb+git@google.com>
In-Reply-To: <20250320070746.101552-2-ardb+git@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 20 Mar 2025 23:40:13 +0900
X-Gmail-Original-Message-ID: <CAK7LNARR+LZEUuYSe-TaWwsvA_knwUOoDxZsbucK8GkwBJxgmA@mail.gmail.com>
X-Gm-Features: AQ5f1JrWaSRk0Elj_j3MCjCzz_JisyGL4bkkM45qBouoYfCvvTmvyj6MBdxnmNc
Message-ID: <CAK7LNARR+LZEUuYSe-TaWwsvA_knwUOoDxZsbucK8GkwBJxgmA@mail.gmail.com>
Subject: Re: [PATCH] gendwarfksyms: define __GENKSYMS__ when processing asm-protoypes.h
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kbuild@vger.kernel.org, brgerst@gmail.com, x86@kernel.org, 
	nathan@kernel.org, linux-kernel@vger.kernel.org, nogikh@google.com, 
	Ard Biesheuvel <ardb@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	syzbot+06fd1a3613c50d36129e@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 20, 2025 at 4:08=E2=80=AFPM Ard Biesheuvel <ardb+git@google.com=
> wrote:
>
> From: Ard Biesheuvel <ardb@kernel.org>
>
> Ensure that __GENKSYMS__ is #define'd when passing asm/asm-prototypes.h
> through the compiler to capture the exported symbols. This ensures that
> exported symbols such as __ref_stack_chk_guard on x86, which is declared
> conditionally, is visible to the tool.


Why don't you make it unconditional, then?

diff --git a/arch/x86/include/asm/asm-prototypes.h
b/arch/x86/include/asm/asm-prototypes.h
index 3674006e3974..9fc6f2be663c 100644
--- a/arch/x86/include/asm/asm-prototypes.h
+++ b/arch/x86/include/asm/asm-prototypes.h
@@ -20,6 +20,4 @@
 extern void cmpxchg8b_emu(void);
 #endif

-#if defined(__GENKSYMS__) && defined(CONFIG_STACKPROTECTOR)
 extern unsigned long __ref_stack_chk_guard;
-#endif






>
> Otherwise, an error such as the below may be raised, breaking the build
> when CONFIG_GENDWARFKSYMS=3Dy
>
>   <stdin>:4:15: error: use of undeclared identifier '__ref_stack_chk_guar=
d'
>
> Cc: Sami Tolvanen <samitolvanen@google.com>
> Reported-by: syzbot+06fd1a3613c50d36129e@syzkaller.appspotmail.com
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  scripts/Makefile.build | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 993708d11874..7855cdc4e763 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -305,6 +305,7 @@ $(obj)/%.rs: $(obj)/%.rs.S FORCE
>  getasmexports =3D                                                       =
         \
>     { echo "\#include <linux/kernel.h>" ;                               \
>       echo "\#include <linux/string.h>" ;                               \
> +     echo "\#define  __GENKSYMS__" ;                                   \
>       echo "\#include <asm/asm-prototypes.h>" ;                         \
>       $(call getexportsymbols,EXPORT_SYMBOL(\1);) ; }
>
> --
> 2.49.0.rc1.451.g8f38331e32-goog
>


--=20
Best Regards
Masahiro Yamada

