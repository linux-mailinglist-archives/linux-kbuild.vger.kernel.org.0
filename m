Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D2E9332CF9
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Mar 2021 18:14:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229775AbhCIRNe (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 9 Mar 2021 12:13:34 -0500
Received: from conssluserg-03.nifty.com ([210.131.2.82]:27598 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231278AbhCIRNE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Mar 2021 12:13:04 -0500
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 129HCjEB021999;
        Wed, 10 Mar 2021 02:12:45 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 129HCjEB021999
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1615309965;
        bh=HQz0eqgwXM4TQ+VhcwSduAv9iEwVCWz6iaE77e/XCCw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=zuMZQPQo4KW3iBjMosStz7/tuOoVmbaGDiRutTXHwNRAHrVzDBmiYhQEskfH+HJhq
         NF7Nk4aVuNJLBkE9tLsRWDCSyhYpzDpxxtQg69Z97ClKaR7FaYxOY5WXVXiNvJ+o3L
         mId5eMAqtKBQk8LE//5k5dzkWsCvT5IdOddBH903xAT6b3YbZ7gDJeoxgJXJ+xw2HU
         UGSydXKjymJmYO80rX63aMek3CmJy1TpEKd+y71AGGxNTmc87AAof2ZQZ6N1TRYjgC
         vO/tWGqZyU4eUC7r77bY4Ly4WnU8Myoqmz4Pfu0zjPzSHvKBgJX7B7Dl549mykdlFK
         K32xtHBvqn+MA==
X-Nifty-SrcIP: [209.85.216.45]
Received: by mail-pj1-f45.google.com with SMTP id kx1so1213539pjb.3;
        Tue, 09 Mar 2021 09:12:45 -0800 (PST)
X-Gm-Message-State: AOAM531MZfP5koio3EmqY29MkDN3JxsdJOS1bW18+k0ifBz539c6rQLc
        cBtbUxszY1X7bYv5z88s1RkHzKgdJquzYQhsEbU=
X-Google-Smtp-Source: ABdhPJx6Xjh/yWePtHmH8WtstwVgIEb8OX85KgO0lUQzcWU3prZxKHJKx0Z5fyDGOUYsY8HA2wKCkoBGbMJx1AfIk7w=
X-Received: by 2002:a17:90a:5510:: with SMTP id b16mr5689486pji.87.1615309964768;
 Tue, 09 Mar 2021 09:12:44 -0800 (PST)
MIME-Version: 1.0
References: <20210308184656.1914947-1-samitolvanen@google.com> <202103081339.B18898E@keescook>
In-Reply-To: <202103081339.B18898E@keescook>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 10 Mar 2021 02:12:07 +0900
X-Gmail-Original-Message-ID: <CAK7LNASjXiZJ3N6XsQ-5+d3fwNOkFmLLnbn3KLpf-xBGGDuqAw@mail.gmail.com>
Message-ID: <CAK7LNASjXiZJ3N6XsQ-5+d3fwNOkFmLLnbn3KLpf-xBGGDuqAw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Allow LTO to be selected with KASAN_HW_TAGS
To:     Kees Cook <keescook@chromium.org>
Cc:     Sami Tolvanen <samitolvanen@google.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alistair Delva <adelva@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Mar 9, 2021 at 6:39 AM Kees Cook <keescook@chromium.org> wrote:
>
> On Mon, Mar 08, 2021 at 10:46:56AM -0800, Sami Tolvanen wrote:
> > While LTO with KASAN is normally not useful, hardware tag-based KASAN
> > can be used also in production kernels with ARM64_MTE. Therefore, allow
> > KASAN_HW_TAGS to be selected together with HAS_LTO_CLANG.
> >
> > Reported-by: Alistair Delva <adelva@google.com>
> > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
>
> Reviewed-by: Kees Cook <keescook@chromium.org>
>
> --
> Kees Cook

Applied to linux-kbuild/fixes. Thanks.


-- 
Best Regards
Masahiro Yamada
