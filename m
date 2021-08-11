Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9DF73E86FC
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Aug 2021 02:06:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235662AbhHKAGY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 10 Aug 2021 20:06:24 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:28844 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234289AbhHKAGX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 10 Aug 2021 20:06:23 -0400
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 17B05Rnr002593
        for <linux-kbuild@vger.kernel.org>; Wed, 11 Aug 2021 09:05:27 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 17B05Rnr002593
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1628640328;
        bh=SJajvErMbsoEWkshmBzmdwnyevn7G1Ebp1GGHefGmJw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Jz36Syd5wBUztFUT6pz8IVkKrYg5JiY6zTQzZPiWiwEjwqxcMV8ua/ogAjzfmCwCJ
         /0P97Revmm5wpHubxhTeYmZLBODVzl3vVxSbOXuJeU5+1FrtGl1bbQyzG2k7iuix9N
         nNjvsMXLWhQKJHthUVnSqNn0XTZWxa1DDwukhrthioqYCVupRYqkrjQXRzil8u93MD
         p5eC7CCRn+394qLrzfUA71iu7uVTVex2BE2xtlAnt9vp1O8MVqnzrb496xoNF80MxG
         DiWOXSR+rOJ5bMoV1MRfmxRMpT/b2gjIyHP3dr6x5B6M4Sjhfn+Ekp862LdXhS6yVa
         yNl+yCE/tOyDA==
X-Nifty-SrcIP: [209.85.216.46]
Received: by mail-pj1-f46.google.com with SMTP id m24-20020a17090a7f98b0290178b1a81700so1751884pjl.4
        for <linux-kbuild@vger.kernel.org>; Tue, 10 Aug 2021 17:05:27 -0700 (PDT)
X-Gm-Message-State: AOAM533b0ytZwVseZu1V7w//i4nQfClk4evuiLN3KG6uhPeJcvzqlTnu
        JGUObZK1SExeDryo0z1Mp3AjGpP0n7+QDu3MR0Y=
X-Google-Smtp-Source: ABdhPJzNiL8V7wfntucXZyEaanoI/S9B/Ra7Kr1Fq6TkYjw3jS9x3GUDDHvW/WKQbHcDfyVMrgLz0oRsqgY99Kuqmfs=
X-Received: by 2002:aa7:8e56:0:b029:3cd:c2ec:6c1c with SMTP id
 d22-20020aa78e560000b02903cdc2ec6c1cmr6512919pfr.80.1628640327151; Tue, 10
 Aug 2021 17:05:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAKwvOdkPLrL6wkhSGaadAcj3HNi1W2q6TQHWFhSej8JvatSzfw@mail.gmail.com>
In-Reply-To: <CAKwvOdkPLrL6wkhSGaadAcj3HNi1W2q6TQHWFhSej8JvatSzfw@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 11 Aug 2021 09:04:50 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS_VVpRuwAayeQY0AAVBU1CchtgGMKT_G=bTgNf9TQ1Tw@mail.gmail.com>
Message-ID: <CAK7LNAS_VVpRuwAayeQY0AAVBU1CchtgGMKT_G=bTgNf9TQ1Tw@mail.gmail.com>
Subject: Re: cc-option-yn necessary? (vs cc-option)
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Arnd Bergmann <arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Aug 11, 2021 at 2:58 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> Masahiro,
> I was looking through the uses of cc-option, cc-option-yn, and
> cc-disable-warning to see what we're missing support for in Clang.
>
> I have a short list of places where cc-option can be removed at
> https://github.com/ClangBuiltLinux/linux/issues/1436#issuecomment-895557491
> because all supported versions of supported toolchains support these
> flags.  These should remove a few unnecessary compiler invocations.
>
> There are also a few cc-option tests that are very compiler specific,
> so those might be convertible to just check CC_IS_* rather than
> cc-option (I'll have to verify).
>
> Another thing I noticed is that it seems that most uses of
> cc-option-yn are replaceable with simply cc-option when they use
> cc-option-yn but check that the result is equal to y. I think even the
> cases that check against n could be converted to:
>
> Examples:
> arch/x86/Makefile
> From:
> ifeq ($(call cc-option-yn, -mfentry), n)
> To:
> ifeq ($(call cc-option,-mfentry),)
> (Though technically, all supported versions of gcc and clang support
> -mfentry, so this block should just be deleted)
>
> arch/powerpc/Makefile
> From:
> ifeq ($(call cc-option-yn,-mcmodel=medium),y)
> To:
> ifneq ($(call cc-option,-mcmodel=medium),)
>
> Then perhaps we could consolidate cc-option-yn into cc-option?  What
> are your thoughts? Should I start sending you patches for all of the
> above?


Yes, I think it is a nice clean-up.

Patches are welcome.

-- 
Best Regards
Masahiro Yamada
