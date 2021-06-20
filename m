Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC6CF3ADF1C
	for <lists+linux-kbuild@lfdr.de>; Sun, 20 Jun 2021 16:53:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229875AbhFTOzc (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 20 Jun 2021 10:55:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229650AbhFTOzb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 20 Jun 2021 10:55:31 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36D1BC061574;
        Sun, 20 Jun 2021 07:53:17 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id bm25so9005342qkb.0;
        Sun, 20 Jun 2021 07:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LVm+BTGafhxRvZqtNEKilS0FyUHlzax8QFALCeDTe2Q=;
        b=Q63+XIaQozXY/ZR3IPtw3Ez5KYNZP3gf07w6RAATGkueUBDeS6sIssciNhr7b6kZ5A
         HJy0kLVzp2Ieqg2iWCWaVoJgOU7ZK6zN/izIV3+dyETAhMFBWeQ0KweGozf9QWV7QnGY
         6tAJhLUuHSrI3DC9diNxnbsDnciZnlKKLpdi+MMVQwjGJWH3cG+MJQSsitrx7Xe4ggcR
         pb7bEeqHgQOYbws5/hpvCDvGBeYwFEPcoU1IT2zXck5tMg/+kx6FSw0U0Pwjezo2MOyH
         NZRsDl3EXf2Z34to7JDNyDSULwy7j3DIZK+jKKyqqnNB2muMmyGXVsOCUKwudnvNIY5e
         Nzdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LVm+BTGafhxRvZqtNEKilS0FyUHlzax8QFALCeDTe2Q=;
        b=XrJ6FEYI1kHq2AsJ0wLni3X1VPxkmU64odl0T3M+G47oylliRe/kOv05sTvmnp9v2m
         HHfMd6B3u5jduWa81i2TPbx0LKVWRwYXbRjmRupDdUqa0PumwSbcTMQg6XZwu2WEKDn1
         RpOWYk8ol0Oq2iBKlUWOhfv5jjwbte+lyHWdTQe0zQ8PsOT4cMx9KK1UQRtT0YU6PHlQ
         PYKhA8B2yUwn9FTJ6uhIRTOa0LqBMtstV+ks0viyncUuUWouyRkBxBNupj/9EEsKOsjN
         rLzyS+budjrdQi+ZBtQkOJ4HmCJVqza4HCRqsQOtWCpF+arjt6muaDQSxj6csuILJ7jm
         rOYQ==
X-Gm-Message-State: AOAM530QTFciq9Zud/Er2WYQAzRwmYaaJqHAfEG65VIzkJ5tDpiPDcBT
        w4gVfCaknJH6Jhy9iNigYR2pXTtVvgGcyb9wm1E=
X-Google-Smtp-Source: ABdhPJxxYg0bDZCWlJBrC+utGt1wfx0PW5vTXUzPwc7cVgZxVmjzWHEfwpkPsAVKAt0DDqVl6euVP9BVz7h4W6YMQrY=
X-Received: by 2002:a25:880f:: with SMTP id c15mr24720201ybl.247.1624200796182;
 Sun, 20 Jun 2021 07:53:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210618233023.1360185-1-ndesaulniers@google.com> <202106181945.AC10BF38ED@keescook>
In-Reply-To: <202106181945.AC10BF38ED@keescook>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sun, 20 Jun 2021 16:53:05 +0200
Message-ID: <CANiq72mwT3WpNcjehXq5njwdrA3U=U+U6H47AQPKRk_BDRsNow@mail.gmail.com>
Subject: Re: [PATCH 0/2] no_profile fn attr and Kconfig for GCOV+PGO
To:     Kees Cook <keescook@chromium.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Bill Wendling <wcw@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Peter Oberparleiter <oberpar@linux.ibm.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Borislav Petkov <bp@alien8.de>, Martin Liska <mliska@suse.cz>,
        Marco Elver <elver@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Fangrui Song <maskray@google.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>, johannes.berg@intel.com,
        linux-toolchains@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Jun 19, 2021 at 4:45 AM Kees Cook <keescook@chromium.org> wrote:
>
> Oh, awesome! Thanks for the fast work on this. If there are no objections,
> I'll apply this in front of the PGO series and put it in -next.

If you are picking both patches on your tree, please see my comment on
the first commit.

With that solved, for the first commit:

    Reviewed-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
