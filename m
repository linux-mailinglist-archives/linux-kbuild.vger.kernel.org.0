Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAC9F3AF5D6
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Jun 2021 21:09:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231218AbhFUTLw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 21 Jun 2021 15:11:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229940AbhFUTLv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 21 Jun 2021 15:11:51 -0400
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6295DC061574;
        Mon, 21 Jun 2021 12:09:34 -0700 (PDT)
Received: by mail-qk1-x732.google.com with SMTP id g4so32031217qkl.1;
        Mon, 21 Jun 2021 12:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=64p3rTJ8C4Y4xbt9bWVWwTFj4vexAuU70eIjzKEaDiU=;
        b=SisdruXpXTzw1ZqYxswCpHZM6ssIJVQL24NoxzDaXbobIzGdqqtdSXZ38PcjZgOyZT
         zpL88716XKOl8WQwRXzEwjYSNdFSBoi8+oYq4VfNtinSNWzQzkslEedGzBVrxyNqSUNV
         5+0rrUT0Kl8G0mckK5AzsQ1/WkiwCAw+2HjpvixaprI8z/qQ9eui7B5TXBVZlG3JT0RR
         +FQo5IauDN9TjK88YpvMkXGDYvUtmuHpDgk1pMhl559rD8jiAJdrwRIsLcWPu7pFzb/q
         8KjS+TKQ9dpNHOLekWkV+seQVxFoBYdSxIPPC3xbH3JvaYSInPwLLnJVQMNh/NQ55GXo
         xezQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=64p3rTJ8C4Y4xbt9bWVWwTFj4vexAuU70eIjzKEaDiU=;
        b=ki7YLyyqRWmCOAhutJkIUSBokO+BIQPQjPdf2bW+PLO3GvyC+N7UB0G/Kx94++sWj7
         NwLxEnWfXvSP3E7Vdyzf6CabyJFz1YTgzs4dSSlWFrditY+fm7q4IllJFs3lIYlHutU7
         f2dlO6SPKrgAKeZuA2CXbYMdprkNbSXernLC8f6m4A9KclNiwDZtXwqLwV2pQL9iI3SF
         wHhn4w+tCFU6NjlzldXo/9vObgUM2G4nG0SOFRD3+B6hUzDg6+45NJk/38qP9NxXNHb7
         jYLGQN12L7PE/WfdFh5yzLNLUPftxOF3ez61Wwv6fYjDu7pMzeX15hVM6q8TSIk/K7m/
         jAkw==
X-Gm-Message-State: AOAM531nvcfQbdms7pXCSa+oSbuCwOQ5ifvXZC6t4s+TqIJEsyfXcKaF
        YcyaT00R13VAkprPkSyNQK5L63q888Jdts8HIaE=
X-Google-Smtp-Source: ABdhPJyAEnnUq24/8IcFrqJTt75MMg4Au4Ksk7GhLf8MAYWs3qpwIUa9vJAGS4lYcLXeTwGjioOSDZT2mMmjMlxs9GQ=
X-Received: by 2002:a25:a448:: with SMTP id f66mr33082808ybi.135.1624302573176;
 Mon, 21 Jun 2021 12:09:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210618233023.1360185-1-ndesaulniers@google.com>
 <20210618233023.1360185-2-ndesaulniers@google.com> <CANiq72kjyiAQn2+ijZKFo7SY3z+dCV6fGXYP1O_Mq7Ui3EqSzQ@mail.gmail.com>
 <CANiq72nbbqeD2dv3z0y3rN-_kdnh=9-pD7oSyWUfaG8oJ2y_8A@mail.gmail.com>
 <CAKwvOd=B6LV9rZmtPacfz_F10jj1wrovoGu8yvdOqKZ69-T6mQ@mail.gmail.com> <20210621182418.57qbumtovysrlkwy@google.com>
In-Reply-To: <20210621182418.57qbumtovysrlkwy@google.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Mon, 21 Jun 2021 21:09:22 +0200
Message-ID: <CANiq72kn2sbpknuBPdpHcPw+AhFF+qBjp_TkxG0+t3fs8-dW=A@mail.gmail.com>
Subject: Re: [PATCH 1/2] compiler_attributes.h: define __no_profile, add to noinstr
To:     Fangrui Song <maskray@google.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Kees Cook <keescook@chromium.org>,
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
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Johannes Berg <johannes.berg@intel.com>,
        linux-toolchains@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jun 21, 2021 at 8:24 PM Fangrui Song <maskray@google.com> wrote:
>
> Also a reminder that __GCC4_has_attribute___no_profile in v1 misses two
> underscores. v2 no_profile_instrument_function may need to fix this.

Good catch! Yes, it is missing the last two.

Cheers,
Miguel
