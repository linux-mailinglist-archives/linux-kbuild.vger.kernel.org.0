Return-Path: <linux-kbuild+bounces-4566-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3E39C115C
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Nov 2024 22:54:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F5101C20F3A
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Nov 2024 21:54:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 045B721893F;
	Thu,  7 Nov 2024 21:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BQ0ookEI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDAA821893A
	for <linux-kbuild@vger.kernel.org>; Thu,  7 Nov 2024 21:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731016462; cv=none; b=N1B9Wk55pu4Wpw3w3JHUDipB4+zYk8Evb0Tkt+fvB8JLMM0GzAzKLvlNdPSiDkcQsTXWp6v5YMKQf79S1G3oPKxnf4FhZXt48cIjBLM9wqwtLhaOSvwLFhG+xOUbZHmIln+xHF4DYVe/Doc13nWZjYVFwAMrHe23dD7wY26pitM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731016462; c=relaxed/simple;
	bh=L2z5Im7eApEYnSF6VAAS12BUcltczp7EaP9nsBPNtgU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dshgbp8xtbWNjz7r06o9vhkljKRvvTDJsbr3Z6ljBC2Z9vp8Ex7EJMapsdugdsGXOKIP5PYV/hJ4YSShSF1M+k+orndlTgBo47cXmNqjdrg17hTCL67KWnS76LLvSZD6+LHHpNvG/IKjZ4k0maePzAYTudumDC8QuSU8DPozoLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BQ0ookEI; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-460b295b9eeso15331cf.1
        for <linux-kbuild@vger.kernel.org>; Thu, 07 Nov 2024 13:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731016459; x=1731621259; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PXyRMpyA+Wotd0AmuT5vj1vIpPFJGkQFHScvE/Azn4Q=;
        b=BQ0ookEIX3hz8qB0+WTx3crlIJ/BaR1qbqucW2T4SDddVR0ckxwtuNhYEXj563QkxY
         AGaHJRubLcHlSvCoZjPI6zHAOkUP3jhieIyKyjUFXgCqckT4ClEVBUSbQnMOxe+CGNCQ
         QO4esPxA09ImVMnrdQYrwiGQvtYXpWmy/sizV49Y5jo6lXIMIpApZiEPZJSrwOp74uLl
         mYjrV3H/NDDWfOijAUFu2ZjtJJVp0eNQ31Umrysqcupo30+AN4pd4rQXLTUCup+0WtVG
         AyTCph81uuGplCW2JqZftYaBnNksG2cQ03t9CGbDe5TYXxOYkNdQv+jtQYlne2TV0dUa
         3KIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731016459; x=1731621259;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PXyRMpyA+Wotd0AmuT5vj1vIpPFJGkQFHScvE/Azn4Q=;
        b=KeWXu+kBbO02Zi4WhDkMMytKsAdurG9xxaWmyucZZmkVQ78L+ghreTEOsrSORWvkog
         QltfdRsoXWgfqhsBuoGn+SQc5s0I3d5ULgSiNyEjsb+wkVWjAkHMlc6zKQ/0fwS9i0xD
         bUQ17StXn7gwFuPs9C90CmL87YwdmzQjLvvkyFMOCCTBQnMbeJ29SZXeOonwjwf7JEFS
         YrAT2E5dSB2H7DY2KlyuOZUxe6eeGWtxB3M3xmxey5/7QyUlwdbRhUCewzTu+KCd+efX
         ZeI91zP9elEC0zLIOXxnkoWFgilcSRo5FvfYwK8mux1yGy2OUZOCqU5hfxhG/szriQwU
         cVqA==
X-Forwarded-Encrypted: i=1; AJvYcCX8NGWDim9MUb2yVSvAFVBVPRQz+YxVZrLJR4KJBOFOMSYz/ATwH5niFd7d+NDRdXfcd55SuxxQS/MO0uU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ+cL2sKD9sLS0AYVUTc+qvAg8RjmbOpiXM1sMiwYTeEE5AO3a
	LOwX80MNueeUJusHVZYpRk8sfhujevxFi5o14hjDD3lNvJZ2h1pCHoanqCme2/Z/lqhWM92ydjQ
	sHJiNjcJHjuf/3UdFLk/NSzj/aPpRxyHBeFoi
X-Gm-Gg: ASbGncuSk6kfg6nj8tbM+15sSojgCepSZxIyUFR6UUFJLIyZjmk2Z8fWcnp5zxv8nJ3
	quoDepIzaXOIDsXNcA6k8DFy3j7wwohchKaDCGV1awnJuhQA2jXxEu3tmrsDY
X-Google-Smtp-Source: AGHT+IFdkSoHyavqa/rWYWexCV5GeErWCgxte9R1lHiqNRFVJXCyk2W6mdtD7fnvhuSYzrquH11z1oepbqTe6XTTqdc=
X-Received: by 2002:ac8:5f06:0:b0:462:ad94:3555 with SMTP id
 d75a77b69052e-462fa646403mr5858781cf.25.1731016458594; Thu, 07 Nov 2024
 13:54:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241102175115.1769468-1-xur@google.com> <20241102175115.1769468-8-xur@google.com>
 <20241107204504.GA3432398@thelio-3990X>
In-Reply-To: <20241107204504.GA3432398@thelio-3990X>
From: Rong Xu <xur@google.com>
Date: Thu, 7 Nov 2024 13:54:06 -0800
Message-ID: <CAF1bQ=TNOs7shXMbgY3UYzDZyF3ge=6hUdfEJvHV4LOo--tqVA@mail.gmail.com>
Subject: Re: [PATCH v7 7/7] Add Propeller configuration for kernel build
To: Nathan Chancellor <nathan@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Bill Wendling <morbo@google.com>, Borislav Petkov <bp@alien8.de>, 
	Breno Leitao <leitao@debian.org>, Brian Gerst <brgerst@gmail.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, David Li <davidxl@google.com>, 
	Han Shen <shenhan@google.com>, Heiko Carstens <hca@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, "Mike Rapoport (IBM)" <rppt@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nicolas Schier <nicolas@fjasle.eu>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Wei Yang <richard.weiyang@gmail.com>, workflows@vger.kernel.org, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Maksim Panchenko <max4bolt@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Yonghong Song <yonghong.song@linux.dev>, Yabin Cui <yabinc@google.com>, 
	Krzysztof Pszeniczny <kpszeniczny@google.com>, Sriraman Tallam <tmsriram@google.com>, 
	Stephane Eranian <eranian@google.com>, x86@kernel.org, linux-arch@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Nathan for finding this out!

We changed the propeller option with this patch:
https://github.com/llvm/llvm-project/pull/110039

Currently, this patch is only in the ToT clang (v20) and not yet
released in v19.
I'll add a compiler version check to the patch: if the clang version >=3D 2=
0,
use the new option.

If this patch is later released in v19.x clang, I'll have to update the che=
ck
accordingly.

If I don't hear objections, I'll send a fixup on top of Masahiro's branch.

Thanks,

-Rong

On Thu, Nov 7, 2024 at 12:45=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Hi Rong,
>
> On Sat, Nov 02, 2024 at 10:51:14AM -0700, Rong Xu wrote:
> > diff --git a/scripts/Makefile.propeller b/scripts/Makefile.propeller
> > new file mode 100644
> > index 0000000000000..344190717e471
> > --- /dev/null
> > +++ b/scripts/Makefile.propeller
> > @@ -0,0 +1,28 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +# Enable available and selected Clang Propeller features.
> > +ifdef CLANG_PROPELLER_PROFILE_PREFIX
> > +  CFLAGS_PROPELLER_CLANG :=3D -fbasic-block-sections=3Dlist=3D$(CLANG_=
PROPELLER_PROFILE_PREFIX)_cc_profile.txt -ffunction-sections
> > +  KBUILD_LDFLAGS +=3D --symbol-ordering-file=3D$(CLANG_PROPELLER_PROFI=
LE_PREFIX)_ld_profile.txt --no-warn-symbol-ordering
> > +else
> > +  CFLAGS_PROPELLER_CLANG :=3D -fbasic-block-sections=3Dlabels
> > +endif
>
> It appears that '-fbasic-block-sections=3Dlabels' has been deprecated in
> the main branch of LLVM, as I see a warning repeated over and over when
> building allmodconfig:
>
>   clang: warning: argument '-fbasic-block-sections=3Dlabels' is deprecate=
d, use '-fbasic-block-address-map' instead [-Wdeprecated]
>
> https://github.com/llvm/llvm-project/commit/7b7747dc1d3da1a829503ea9505b4=
cecce4f5bda
>
> Sorry that I missed this during testing, as I was only using clang-19 at
> the time.
>
> I think you can send a fixup on top of Masahiro's branch:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.gi=
t/log/?h=3Dkbuild
>
> > +# Propeller requires debug information to embed module names in the pr=
ofiles.
> > +# If CONFIG_DEBUG_INFO is not enabled, set -gmlt option. Skip this for=
 AutoFDO,
> > +# as the option should already be set.
> > +ifndef CONFIG_DEBUG_INFO
> > +  ifndef CONFIG_AUTOFDO_CLANG
> > +    CFLAGS_PROPELLER_CLANG +=3D -gmlt
> > +  endif
> > +endif
> > +
> > +ifdef CONFIG_LTO_CLANG_THIN
> > +  ifdef CLANG_PROPELLER_PROFILE_PREFIX
> > +    KBUILD_LDFLAGS +=3D --lto-basic-block-sections=3D$(CLANG_PROPELLER=
_PROFILE_PREFIX)_cc_profile.txt
> > +  else
> > +    KBUILD_LDFLAGS +=3D --lto-basic-block-sections=3Dlabels
>
> I think this might have a similar problem but I have not tested.
>
> > +  endif
> > +endif
> > +
> > +export CFLAGS_PROPELLER_CLANG
>
> Cheers,
> Nathan

