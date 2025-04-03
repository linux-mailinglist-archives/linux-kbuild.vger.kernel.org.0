Return-Path: <linux-kbuild+bounces-6398-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F84A7A602
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Apr 2025 17:11:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C50018955E5
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Apr 2025 15:11:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F334E2505B3;
	Thu,  3 Apr 2025 15:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rg+elceH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88CD2505AE;
	Thu,  3 Apr 2025 15:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743693086; cv=none; b=TmshCc+2mVdPsQ5c5jKoe0T0yr/JfBsh2oX0fSSaJwB4JHA2Lcte4zDaFE5x4sjdkbASbmNGDCDyzKUc6BdacQMIX9bEhzhuJ08ImOq9f9Ecn4PielfDIlDn6yoYL2/AaIg4FTdMNZFaGd0qPh9ip2x+ePBDR8MF2xh/obHCphY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743693086; c=relaxed/simple;
	bh=NIvLpPfAXrTuXtMOMB/pagZd8SPTLCI7I/aXMEmuZks=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ht9EBlgBLHeBD0Jy2qXQSAAFLAnOj4tQ5KywXxNOy3b1OfICkFtAviphZ0oqGOou3vkWb2jR0SS7zO0aGyAMIDKldgrL0C105hienGJKNRchi8pfiLCUMlwRxxigemKCnBXjmw7uAPgR0pUicZlHR/AU46BVZ7A4vmzB/7JRQ4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rg+elceH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 447E7C4CEEC;
	Thu,  3 Apr 2025 15:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743693086;
	bh=NIvLpPfAXrTuXtMOMB/pagZd8SPTLCI7I/aXMEmuZks=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rg+elceHnlADL1mNP5zqvH3MnNX1SQTBq0g1DCEixGhxkvzyh0bOPFJCkL0ALZKyt
	 +VCgmEkvQMtKdswZTk0K56LU+TDECxM85B1covP7XNz/If7qqhoT5TvDrn7HLoN9pz
	 Rl9qHuAxeZTqau7PVURw/Zhr6jlYiMbZFHuIQSXA7XwEXkvzOzZN8Bs4mvEwYi1P9h
	 JCZmfN1+807U9Eh1iCW6I1FgfnputbMkqPL5r4VEmr2pLWoLP5E32HPSY3oWk8JCW7
	 k/ven923jDB2Khmp8j0mO9NxvC06cxe1YwAFAJ+x7vwn3GtSsLLGjIG3Wr999oHAce
	 Bzw+vV9ZBS2qg==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5499c5d9691so1191795e87.2;
        Thu, 03 Apr 2025 08:11:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUbM1lb2geESVF6jeqF5aWwtQJNfEv1lewfzicwOYIXPXydGnyMK3BV10zWefbVvaHZALHdmDVyGHVHmsk=@vger.kernel.org, AJvYcCVBRffez3cfrTeTRPLU84N90/PQe8mKC1wmW6aHydn1Am7eFBdufIvVdWGsJd6t+MWyV77eYIHWqYxXbakV@vger.kernel.org
X-Gm-Message-State: AOJu0YxXs3c399O3E4NZg4Pp8azrR/fCRCC1cozJq1qhGIb0XnmFS5tK
	I2LUX0k21x7c61WBVKRVBveyYKPq50Cmfvq7qirMXJVauSSO3nGk9vIm2cqJy3GuCZAKj2VkIQf
	6xscxmbcI1YUGVEqaoOJ+f+KQrsQ=
X-Google-Smtp-Source: AGHT+IGHaE5sR5WjLPaAAsOgHiAcSbArxim9/nuGpNofJcAx2t/1OKmIKbXzElP29VwvJc0LcNAX9hLMl1nwdhodQks=
X-Received: by 2002:a05:6512:3b13:b0:549:5b54:2c5b with SMTP id
 2adb3069b0e04-54c1d8a6e03mr1065423e87.24.1743693084626; Thu, 03 Apr 2025
 08:11:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403134200.385077-1-alexghiti@rivosinc.com>
In-Reply-To: <20250403134200.385077-1-alexghiti@rivosinc.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 3 Apr 2025 18:11:13 +0300
X-Gmail-Original-Message-ID: <CAMj1kXGzrn6i20LvUBnz_mGi946=GCogNHHUL=mNsv513qYv7A@mail.gmail.com>
X-Gm-Features: AQ5f1JoKfhV3MERR1uNecpsdZk0_Zd-PQo949ieFdRrYe-B6KsP3bxkK_BwZ46w
Message-ID: <CAMj1kXGzrn6i20LvUBnz_mGi946=GCogNHHUL=mNsv513qYv7A@mail.gmail.com>
Subject: Re: [PATCH v2] scripts: Do not strip .rela.dyn section
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Charlie Jenkins <charlie@rivosinc.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Apr 2025 at 16:42, Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
>
> riscv uses the .rela.dyn section to relocate the kernel at runtime but
> that section is stripped from vmlinux. That prevents kexec to
> successfully load vmlinux since it does not contain the relocations info
> needed.
>

Maybe explain that .rela.dyn contains runtime relocations, which are
only emitted if they are actually needed - as opposed to the static
relocations that are not emitted as SHF_ALLOC sections, and are not
considered to be part of the runtime image in the first place. It
would be nice if we could use --remove-relocations= here, which only
removes static relocations, but unfortunately, llvm-objcopy does not
support this.

Also, I wonder if this should apply to all of .rel.dyn, .rela.dyn and
.relr.dyn, as they all carry runtime relocations.

Finally, I'd be curious to know why RISC-V relies on --emit-relocs in
the first place? Is the relocs check really needed? If not, it would
be a nice opportunity to get rid of Makefile.postlink entirely.

In any case, for this change, or a variation along the lines of what I
wrote above,

Acked-by: Ard Biesheuvel <ardb@kernel.org>


> Fixes: 71d815bf5dfd ("kbuild: Strip runtime const RELA sections correctly")
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  scripts/Makefile.lib | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index cad20f0e66ee..0a1f1e67a0ed 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -377,7 +377,7 @@ quiet_cmd_objcopy = OBJCOPY $@
>  cmd_objcopy = $(OBJCOPY) $(OBJCOPYFLAGS) $(OBJCOPYFLAGS_$(@F)) $< $@
>
>  quiet_cmd_strip_relocs = RSTRIP  $@
> -cmd_strip_relocs = $(OBJCOPY) --remove-section='.rel*' $@
> +cmd_strip_relocs = $(OBJCOPY) --remove-section='.rel*' --remove-section=!.rela.dyn $@
>
>  # Gzip
>  # ---------------------------------------------------------------------------
> --
> 2.39.2
>

