Return-Path: <linux-kbuild+bounces-1341-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC12588CF30
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Mar 2024 21:42:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E01501C66EEF
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Mar 2024 20:42:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0755118059;
	Tue, 26 Mar 2024 20:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AQ9F7CAy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC06FC0E
	for <linux-kbuild@vger.kernel.org>; Tue, 26 Mar 2024 20:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711485751; cv=none; b=Uz+PYHlE+gtX17cmtdkEsssRinXQI8RCzSjo7ivoJxw78n/w3QhkdhAnyMNsm1EgJuN3Z8WUKv43mRMcEJMD3yz0KmyYYNKIpxmHilLl27/Ay/eAl2SITWWiA3ME45w/0KtHUEQcOVHMuCj68IKAf6SFoxDVZq71tGj61Yz2xUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711485751; c=relaxed/simple;
	bh=pLHWzs987kbANZLhWn+OVDYNz1mbnSNZ0ZnNwiv7Qs4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A2pSRc1Gp6oDoBBXw4LSFTws5fb3wFFmBbR8hvXsaYp5jn8xGKs10OoxhyQ3sA1kgiaYfMiXnE4igLpXkXo4wcGQQ+KyeWN1brFPNk+o3vM8bWa7M2y3nZ1CYSa39jXoCxyGdFlYwwpn6kYWfkdNHk+dIzg1ftfJ4n61KOWjp9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AQ9F7CAy; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-4d86ef290e0so105100e0c.1
        for <linux-kbuild@vger.kernel.org>; Tue, 26 Mar 2024 13:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711485749; x=1712090549; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WXbMV//iCVDcmmeY0RArWtkZ2QeUzFh9TWNfWy7C9Pk=;
        b=AQ9F7CAyYu031wbKs1aGnu9bXs392xQBUMzvA2w60O7IGoAQyjJ0PUzN6j8QKyNi8L
         3mE2HQSCx7+icQ/359I52RxjMKy4cgxedF+WZeyTpD1ZaUjM3gJQ1On75CNUl5xJ8Nnl
         EeCFTfFICgcPD3tngZicsaJZLhYfOEnygZeWJFQZkl8u3h53ZKvWdi12Kzs7AuKY1w66
         OCOJHsIUaBZZod3TCCEoFrnuZ8po0nZaW9NjiRzdrXWWvj6EZaSU/e9HzKzsnjGdWTf5
         f2hwY6UZz8zwzBFhGHSyRpcM/YuDfGNCfiABAz4idshPyq+z4zN/dkoBXjImak3o3Ws3
         2lpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711485749; x=1712090549;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WXbMV//iCVDcmmeY0RArWtkZ2QeUzFh9TWNfWy7C9Pk=;
        b=ddnTUeKTAg86Y8MVFi4uR+SbOEhZDj4m22LR6iszRRWLERUiKqMieEXQU6NHwauMYG
         mfQ2/CCP5hHHIqE3f4clByA2rMk341LPvAs9+ug8mBcFCYFHmm8vPaptjV4Ig4K/uB1p
         NauW1AagMx9cAWATz75qkdbMGPcBXGZxAzd49jjVhNbTLtvcgirKWXGjOOeflU1PKEzK
         vOpJX3CNP12i7Pj6yOEtiVhWN9/yF82IDcfM+IPydDpQd6UCJlds38dUD7ZZluoxVWLl
         WlAPiEJK6kOo6LHj6MTaGe1cCmX929Npxk+xBLFIHJ3p61WdKIOoL4f8wGIieSsuYggv
         4myw==
X-Forwarded-Encrypted: i=1; AJvYcCWP7ErbE2tdi9GkzdydHZapmBBPCeRpLoXM5g7YbQk3Oh1eO7fh47NQ1EgKT7fXm0xTNFQEwvSdvJ7dqcFDLey+qEsEv3v6iOHVuP6G
X-Gm-Message-State: AOJu0YwS4nms5xcA2zal0b5lyv9TTcr5jf1J99F47gCJBcY+PRjDr77F
	+mSXK4oETvnakFtqTaZNXUUnCJQTKcXaLXIfBsOfJUtFatOE+XEUT5oqiuMDTxnqM2fu9qtveF0
	nsDe1vbsoUjeAbKapITaa719LbGoTV3+RahzO
X-Google-Smtp-Source: AGHT+IEEPd7cbBYNSs6jDBcU4yy5IaPB7/HfMZQ44tBZJVln+87cjP8JeA/iYHT88HbKfAHsVw8BjLKn2q9CrpQ8eQg=
X-Received: by 2002:a05:6122:181c:b0:4d4:4ff8:c367 with SMTP id
 ay28-20020a056122181c00b004d44ff8c367mr2307752vkb.6.1711485748894; Tue, 26
 Mar 2024 13:42:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0851a207-7143-417e-be31-8bf2b3afb57d@molgen.mpg.de>
 <47e032a0-c9a0-4639-867b-cb3d67076eaf@suse.com> <20240326155247.GJZgLvT_AZi3XPPpBM@fat_crate.local>
 <80582244-8c1c-4eb4-8881-db68a1428817@suse.com> <20240326191211.GKZgMeC21uxi7H16o_@fat_crate.local>
 <CANpmjNOcKzEvLHoGGeL-boWDHJobwfwyVxUqMq2kWeka3N4tXA@mail.gmail.com> <20240326202548.GLZgMvTGpPfQcs2cQ_@fat_crate.local>
In-Reply-To: <20240326202548.GLZgMvTGpPfQcs2cQ_@fat_crate.local>
From: Marco Elver <elver@google.com>
Date: Tue, 26 Mar 2024 21:41:50 +0100
Message-ID: <CANpmjNM0fnqDJHZYxvy6dfTHE3jeCv-rXmaJiD5XXx+bodF1-A@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Disable KCSAN for autogenerated *.mod.c intermediaries
To: Borislav Petkov <bp@alien8.de>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	Nikolay Borisov <nik.borisov@suse.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Paul Menzel <pmenzel@molgen.mpg.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, kasan-dev@googlegroups.com, 
	David Kaplan <David.Kaplan@amd.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 26 Mar 2024 at 21:26, Borislav Petkov <bp@alien8.de> wrote:
>
> On Tue, Mar 26, 2024 at 08:33:31PM +0100, Marco Elver wrote:
> > I think just removing instrumentation from the mod.c files is very reasonable.
>
> Thanks!
>
> @Masahiro: pls send this to Linus now as the commit which adds the
> warning is in 6.9 so we should make sure we release it with all issues
> fixed.
>
> Thx.
>
> ---
> From: "Borislav Petkov (AMD)" <bp@alien8.de>
> Date: Tue, 26 Mar 2024 21:11:01 +0100
>
> When KCSAN and CONSTRUCTORS are enabled, one can trigger the
>
>   "Unpatched return thunk in use. This should not happen!"
>
> catch-all warning.
>
> Usually, when objtool runs on the .o objects, it does generate a section
> .return_sites which contains all offsets in the objects to the return
> thunks of the functions present there. Those return thunks then get
> patched at runtime by the alternatives.
>
> KCSAN and CONSTRUCTORS add this to the the object file's .text.startup
> section:
>
>   -------------------
>   Disassembly of section .text.startup:
>
>   ...
>
>   0000000000000010 <_sub_I_00099_0>:
>     10:   f3 0f 1e fa             endbr64
>     14:   e8 00 00 00 00          call   19 <_sub_I_00099_0+0x9>
>                           15: R_X86_64_PLT32      __tsan_init-0x4
>     19:   e9 00 00 00 00          jmp    1e <__UNIQUE_ID___addressable_cryptd_alloc_aead349+0x6>
>                           1a: R_X86_64_PLT32      __x86_return_thunk-0x4
>   -------------------
>
> which, if it is built as a module goes through the intermediary stage of
> creating a <module>.mod.c file which, when translated, receives a second
> constructor:
>
>   -------------------
>   Disassembly of section .text.startup:
>
>   0000000000000010 <_sub_I_00099_0>:
>     10:   f3 0f 1e fa             endbr64
>     14:   e8 00 00 00 00          call   19 <_sub_I_00099_0+0x9>
>                           15: R_X86_64_PLT32      __tsan_init-0x4
>     19:   e9 00 00 00 00          jmp    1e <_sub_I_00099_0+0xe>
>                           1a: R_X86_64_PLT32      __x86_return_thunk-0x4
>
>   ...
>
>   0000000000000030 <_sub_I_00099_0>:
>     30:   f3 0f 1e fa             endbr64
>     34:   e8 00 00 00 00          call   39 <_sub_I_00099_0+0x9>
>                           35: R_X86_64_PLT32      __tsan_init-0x4
>     39:   e9 00 00 00 00          jmp    3e <__ksymtab_cryptd_alloc_ahash+0x2>
>                           3a: R_X86_64_PLT32      __x86_return_thunk-0x4
>   -------------------
>
> in the .ko file.
>
> Objtool has run already so that second constructor's return thunk cannot
> be added to the .return_sites section and thus the return thunk remains
> unpatched and the warning rightfully fires.
>
> Drop KCSAN flags from the mod.c generation stage as those constructors
> do not contain data races one would be interested about.
>
> Debugged together with David Kaplan <David.Kaplan@amd.com> and Nikolay
> Borisov <nik.borisov@suse.com>.
>
> Reported-by: Paul Menzel <pmenzel@molgen.mpg.de>
> Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
> Link: https://lore.kernel.org/r/0851a207-7143-417e-be31-8bf2b3afb57d@molgen.mpg.de

Reviewed-by: Marco Elver <elver@google.com>

Thanks!

> ---
>  scripts/Makefile.modfinal | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
> index 8568d256d6fb..79fcf2731686 100644
> --- a/scripts/Makefile.modfinal
> +++ b/scripts/Makefile.modfinal
> @@ -23,7 +23,7 @@ modname = $(notdir $(@:.mod.o=))
>  part-of-module = y
>
>  quiet_cmd_cc_o_c = CC [M]  $@
> -      cmd_cc_o_c = $(CC) $(filter-out $(CC_FLAGS_CFI) $(CFLAGS_GCOV), $(c_flags)) -c -o $@ $<
> +      cmd_cc_o_c = $(CC) $(filter-out $(CC_FLAGS_CFI) $(CFLAGS_GCOV) $(CFLAGS_KCSAN), $(c_flags)) -c -o $@ $<
>
>  %.mod.o: %.mod.c FORCE
>         $(call if_changed_dep,cc_o_c)
> --
> 2.43.0
>
>
>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette

