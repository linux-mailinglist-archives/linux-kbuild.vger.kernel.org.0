Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F27E2CE241
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Dec 2020 23:58:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729657AbgLCW5g (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 3 Dec 2020 17:57:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727533AbgLCW5g (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 3 Dec 2020 17:57:36 -0500
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 238EBC061A4F
        for <linux-kbuild@vger.kernel.org>; Thu,  3 Dec 2020 14:56:56 -0800 (PST)
Received: by mail-pl1-x644.google.com with SMTP id l11so2026134plt.1
        for <linux-kbuild@vger.kernel.org>; Thu, 03 Dec 2020 14:56:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EHAYrKbj/zPl1+pVBO2mTUTD59eSt3ugUwhIW8vCe/M=;
        b=ovTruuoqCEsd5W5/yRX9B6q1dnWkeOHgHxocdVVbWfkA3R605oK/EWYMKEVL8CI5EO
         HUYQcNF0XWX4gYmPHzITxzP6Ow3StkrjkbcWocMtTHrdnGKfCziCOhHCoI2xzgubaOA6
         OQiN99aPdqBWZkfavhfdXtcqrJokKEJ+UxvjvI5EMgfMxZvHW2wkJUl8+cFvoX84Bijc
         HqEAJsDWhSF4RFtMUkHO+Zlo9Bm0PzHfwUHj0oPE1yE7VMTzQ1RuFgpwMUfBbL5J+n2w
         xWUTKTDJgAzxwXdvRSgZOhZ+9zIaPiWDSQPgo++wRTMmbZKzYhw8Wx8ktgyoONFgFdW5
         +Ocg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EHAYrKbj/zPl1+pVBO2mTUTD59eSt3ugUwhIW8vCe/M=;
        b=oCL9PjIN7hh/TJsPV8+eBwRsfJQ9rE3A0aetHdyitEfhhfMpeBkXcDvgVJkj7G6ILr
         rlxygd7oMeltijhBDE5vr1O8gT0ythl33qPqJpD/lrmZ0SEZPr39GZmlAfryDUABvLwo
         264zdWeZ7bMGmpdq+NEdKc/tHx5laBzsWcdas1UuQu6fEmulYC5J47U9WKPPbyoiAgKV
         SDKVbTHfePGVdJqkPthSnNnD1jRRp5s1b8uhvgQq5mvf375PHOzPPSggqZv5zXRS74qv
         uoQX55LT0GVfQOqsGjVKbXOwmepUGm2hE1iWxO7KMTIRGstv7f37iFZkD1gJScZHxRdj
         ybJA==
X-Gm-Message-State: AOAM530NS11F0qwASUCLVF3oMmCijDhbnMjLmh+Vsw8HS96DVZb6BOR4
        c36hOefpit/kz3lSsgBM4sz3CIIgOsc38K7gH1XGOctDgmYTig==
X-Google-Smtp-Source: ABdhPJzbOJ8AkzQrZ1pmet6hcC3Amko/IKkWSx77hmaWe06U2WVabo59psGy4ODZ38M2QGHs888LYCI4one4nnVU36Y=
X-Received: by 2002:a17:902:e901:b029:d8:e727:2595 with SMTP id
 k1-20020a170902e901b02900d8e7272595mr1164945pld.56.1607036215507; Thu, 03 Dec
 2020 14:56:55 -0800 (PST)
MIME-Version: 1.0
References: <20201022012106.1875129-1-ndesaulniers@google.com>
 <20201104000016.GA2399651@rani.riverdale.lan> <CAKwvOdnFstgMa3c+=Vo=QtFYsABDekVeddcPmP=8Pn2bqWfxpg@mail.gmail.com>
 <20201104001703.GA2407187@rani.riverdale.lan>
In-Reply-To: <20201104001703.GA2407187@rani.riverdale.lan>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 3 Dec 2020 14:56:43 -0800
Message-ID: <CAKwvOd=U1mxfgep3KyoAJ3WBcsywdx9_wfVgLcgAhd-+kFfZhA@mail.gmail.com>
Subject: Re: [PATCH] Kbuild: implement support for DWARF5
To:     Arvind Sankar <nivedita@alum.mit.edu>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        linux-toolchains@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Nov 3, 2020 at 4:17 PM Arvind Sankar <nivedita@alum.mit.edu> wrote:
>
> On Tue, Nov 03, 2020 at 04:05:36PM -0800, Nick Desaulniers wrote:
> > On Tue, Nov 3, 2020 at 4:00 PM Arvind Sankar <nivedita@alum.mit.edu> wrote:
> > >
> > > On Wed, Oct 21, 2020 at 06:21:06PM -0700, Nick Desaulniers wrote:
> > > > Further -gdwarf-X where X is an unsupported value doesn't
> > > > produce an error in $(CC).
> > >
> > > Do you have more details here? On godbolt.org, gcc does report an error
> > > for unsupported dwarf versions.
> > >
> > > https://godbolt.org/z/G35798
> > >
> > > gcc does not seem to pass the -gdwarf-* options to the assembler when
> > > compiling C source. For assembler, gcc will pass an appropriate option
> > > depending on the version of binutils it was configured with: if the
> > > assembler doesn't support dwarf-5 it can call it with --gdwarf2 for eg.
> > >
> > > If the user is using a properly configured toolchain it doesn't look
> > > like it should be an issue to just use cc-option?
> >
> > I wrote the base patch back in May, and didn't revisit until recently.
> > I could have sworn the cc-option silently failed for the check
> > cc-option does, which is /dev/null input.  I need to recheck that, but
> > it doesn't hurt to simply include it for now, which I've done in a v2
> > I'm about to send.
> > --
> > Thanks,
> > ~Nick Desaulniers
>
> This is giving me deja vu about the -gz=zlib option.
>
> Didn't Masahiro fix the cc-option issue with
>   4d0831e8a029 ("kconfig: unify cc-option and as-option")
>
> The existing -Wa,-gdwarf-2 in the Makefile seems bogus, btw. GCC 4.9.0
> at least appears to pass on --gdwarf2 automatically.

It looks like we don't need -Wa,-gdwarf-2 when -gdwarf-2 is set. So I
can probably drop
+DEBUG_CFLAGS   += $(dwarf-aflag)
from v2.  Will retest though.
-- 
Thanks,
~Nick Desaulniers
