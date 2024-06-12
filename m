Return-Path: <linux-kbuild+bounces-2096-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFA8904F02
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Jun 2024 11:19:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C44EC1C21CE2
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Jun 2024 09:19:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD5EB16DEA0;
	Wed, 12 Jun 2024 09:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YhuAIrns"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AACF16D9B4;
	Wed, 12 Jun 2024 09:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718183984; cv=none; b=iMWyeosn+8HJA0+Y691MUQZHhJ7ayi3+hYyChzGOR4srFxbCO7xVCFbCBSKjpa+ONGMi2NBQfgQcUiKqhMVYrC1dx0kzGQFrS3qe8dd4WWLCfQSrvAHzqNLG3YXcLB+x6wWIBgZDhcjiJB7BlYwmWAgU9UaYz5ELGD/oFrWJV6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718183984; c=relaxed/simple;
	bh=bmMkBybVdlRXuSL4XA9lo8lnC6svSFGItaKVuLcJkF0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hWf+iIWa4hvSwIXqBY5CfZKCQLgE68s73XS2okLm21d/FC+fgV0BJT961rEq+2pXzmv9OBSEjfDKWPQPeKo3r45Hz3NhlUASFunprxeGZ7XUyhZuj9wxaJlDMcRKbyJAEilwonGXJDbltTnxPwOrIz2pHB2qq2krUwI11xyMJ7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YhuAIrns; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2c315b569c8so1834758a91.0;
        Wed, 12 Jun 2024 02:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718183982; x=1718788782; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EGUBPInBcqjkJDTSlAH7Iyv9YVrpwaUSLJ3S332pvLs=;
        b=YhuAIrnsk7iMdOJ8AQYu/7YpVRgIDJJKEmdojVPcoj5H167/GGPyB8kQroi9iQ4ORM
         Fd0+B+yBGRSJZXRj5r3hSIngAmWLLloK65Jl4meC3ZAaPb03vVMphnXc94eKh04HTASf
         8WCSTr0J4LUhK7AAs6A3EgGMHsjpoZNW7kx1yHTVReQToz7LAIzSu6k9lJ9Zuj9fGzyl
         +b03KrZTgglj260xl4pWUBC4Qr+uaPVmFQpuI2MXTQ8E/EiKANiq2by2drkFFjJEeZrj
         VFLNl8InWZ4689qgz+eOuegWhRcp+EvRfS+5M/dMdA+aXh1B1WttE70I22cmLtAI0MRe
         Kjsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718183982; x=1718788782;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EGUBPInBcqjkJDTSlAH7Iyv9YVrpwaUSLJ3S332pvLs=;
        b=aPyQC49fBLcXYrAazAKvXBCsw+hW3PkDPb1rWe/fHhzUklALDfXcNMSSmX/DyNgAE1
         iznMOpY2G9Zwjypnt4noo9/8Q7eypQ3bgD8t1oLvxcqZePPmZDxC5YKTlG3Sz+6IcxvS
         S4kOBPx9pGnq5nQuwUtXHshR/0rCj2JHdWFr0qVxSEWxrDUpZg6N/SzNHuPqV3j/RJew
         +n41jE7JUeMoIODrlbr7dMSAnhLoeDEqrc8l3srYaVga4U7KLE0Wk7C0bv3XPhH2PHBu
         o7nzOhB7Ubsgc6dbYAoyx2BTQU7vZelvm+oAWHHOcB3YOpbw1Sjg6xALwEXMLAmX4mlV
         DRNA==
X-Forwarded-Encrypted: i=1; AJvYcCWGt4DCeH6bzuqiNCz82QsEuo1Mwh/Qvmne/PWvEJCAuYBzDly+nN+IcZNemEtdjpEsbsbyW+HsWZwDqV1b1iMW41HotqhWlY4DuCnj
X-Gm-Message-State: AOJu0Yxc1vpUaUShbEB5Hmm36duB5e78Vrrgo+b8vRFOgL5mqZyd8TqB
	xrG0bKs2NAfi2WH1y6pdbZRum3w6IAnNMfyKQgK4U5xb4WikYIhytmzVodkJajyZ4s6yh0U04pP
	6c6R8OZPYNrCp9zqaWkIWXEfZ/Gc=
X-Google-Smtp-Source: AGHT+IH1q0ktXxgThj72o0e7vp911jiO97cSgDTVrklASa+YOAu6YTcwrZ/pCIBoSOQauCdF7gt5YWbp7LU0ofqjrIo=
X-Received: by 2002:a17:90b:2250:b0:2c4:b300:1b4c with SMTP id
 98e67ed59e1d1-2c4b3001d74mr279112a91.24.1718183982484; Wed, 12 Jun 2024
 02:19:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240612050257.3670768-1-masahiroy@kernel.org>
In-Reply-To: <20240612050257.3670768-1-masahiroy@kernel.org>
From: Dmitry Safonov <0x7f454c46@gmail.com>
Date: Wed, 12 Jun 2024 10:19:30 +0100
Message-ID: <CAJwJo6YzYWiCcHCVstA5V9rtgJWYsGzb+97eGP0hF+FwfRAdiA@mail.gmail.com>
Subject: Re: [PATCH] x86/kconfig: add as-instr64 macro to properly evaluate AS_WRUSS
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, "Mike Rapoport (IBM)" <rppt@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Yu-cheng Yu <yu-cheng.yu@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 12 Jun 2024 at 06:03, Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Some instructions are only available on the 64-bit architecture.
>
> Bi-arch compilers that default to -m32 need the explicit -m64 option
> to evaluate them properly.
>
> Fixes: 18e66b695e78 ("x86/shstk: Add Kconfig option for shadow stack")
> Reported-by: Dmitry Safonov <0x7f454c46@gmail.com>
> Closes: https://lore.kernel.org/all/20240612-as-instr-opt-wrussq-v2-1-bd950f7eead7@gmail.com/
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Thank you Masahiro, this works as well!
I guess I went on too generic path without an actual requirement for that.

Tested-by: Dmitry Safonov <0x7f454c46@gmail.com>

> ---
>
>  arch/x86/Kconfig.assembler | 2 +-
>  scripts/Kconfig.include    | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/arch/x86/Kconfig.assembler b/arch/x86/Kconfig.assembler
> index 59aedf32c4ea..6d20a6ce0507 100644
> --- a/arch/x86/Kconfig.assembler
> +++ b/arch/x86/Kconfig.assembler
> @@ -36,6 +36,6 @@ config AS_VPCLMULQDQ
>           Supported by binutils >= 2.30 and LLVM integrated assembler
>
>  config AS_WRUSS
> -       def_bool $(as-instr,wrussq %rax$(comma)(%rbx))
> +       def_bool $(as-instr64,wrussq %rax$(comma)(%rbx))
>         help
>           Supported by binutils >= 2.31 and LLVM integrated assembler
> diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
> index 3ee8ecfb8c04..3500a3d62f0d 100644
> --- a/scripts/Kconfig.include
> +++ b/scripts/Kconfig.include
> @@ -33,7 +33,8 @@ ld-option = $(success,$(LD) -v $(1))
>
>  # $(as-instr,<instr>)
>  # Return y if the assembler supports <instr>, n otherwise
> -as-instr = $(success,printf "%b\n" "$(1)" | $(CC) $(CLANG_FLAGS) -Wa$(comma)--fatal-warnings -c -x assembler-with-cpp -o /dev/null -)
> +as-instr = $(success,printf "%b\n" "$(1)" | $(CC) $(CLANG_FLAGS) $(2) -Wa$(comma)--fatal-warnings -c -x assembler-with-cpp -o /dev/null -)
> +as-instr64 = $(as-instr,$(1),$(m64-flag))
>
>  # check if $(CC) and $(LD) exist
>  $(error-if,$(failure,command -v $(CC)),C compiler '$(CC)' not found)
> --
> 2.43.0
>
-- 
             Dmitry

