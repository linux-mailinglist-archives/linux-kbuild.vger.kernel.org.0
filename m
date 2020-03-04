Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7940B1789CD
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Mar 2020 06:00:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725283AbgCDFAS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 4 Mar 2020 00:00:18 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:35509 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725271AbgCDFAS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Mar 2020 00:00:18 -0500
Received: by mail-pj1-f65.google.com with SMTP id s8so376220pjq.0
        for <linux-kbuild@vger.kernel.org>; Tue, 03 Mar 2020 21:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fWqhM71qdeipb2iv8w287UkX52XUZx5tSHx/mc0k7rs=;
        b=fXXaNqoiPncoYjCuFf9WkuZi+IMWgU1bnSRWKawHHq2oxTa7/Wl8h0CyLgP9hvnVXb
         BYZBk3nQUkQjp5/O1xWhQTOnb/G7yk6Nyb4TYkjVdhU7uDJvih1ZuZXEd+ml+8EQBtMz
         EnuXhBSCUag+yM071GYeq6KEWY83i8aX8mXNgHok0VORiuvnxNMZ4QQmZOSxkolPmG/v
         wM9CIfLQctAxd4P7g5d57AE/oFjAMVeWaNpUOOd4cd1AU47GVu5fLbQRyxLkqx+4IU1o
         cP0TGnnGEU30qHHQYV3Nv7bMnH128LVxnL605M4OMpRbWYmLAXz8WiSmvnkibPfq8Et+
         ZTGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fWqhM71qdeipb2iv8w287UkX52XUZx5tSHx/mc0k7rs=;
        b=AkneU9VfDEeDWJ2BpPwY9CjEUxvOqOJdQNJz9poUDFZ1gvmTN+AjiYrGzzCuEg6yHP
         gmV9rdNlWNvbFbUHYPX7VnXWLxENXdL8jnPi1EKQ7ETLKvtlhwDET75x7esnTSOOK6lE
         TlycC8MMMUT0aTQxHL1VhGgBH2N0MRGM8iMGeeIcejuSN8zskEc7EdvN5ijQPKlzGAZa
         y1ncZdgQWdvfPxRd77SFKy89YXpKP7RD9A0jmfLynVCOXloXQKfhIoTcR6SFMF3Cn7Bl
         mXJIwbxXFuu6p19If7DQ+4co6Zo6tChp/nTnJrBI4SX6W7s+PpUz3QvIpsJ5XQZz8nnQ
         sVHA==
X-Gm-Message-State: ANhLgQ387aMH2M7TyjWRlEGYHvqgwFZAla9uEIlG5EPUvC2YqBW3qJEf
        JrcNWW860W4q8opXvc8UQQO67gO74ZVFmA4vR6Vv0B953J0=
X-Google-Smtp-Source: ADFU+vtrwJGhgHjtw7Z6vOhj33JZhaWGUTizaDfIWmRUZ0NF65RL2MDvJX4RNBrZ/Ey7huEANg0F5atX5TitxH74qCQ=
X-Received: by 2002:a17:90a:bc4c:: with SMTP id t12mr1211341pjv.138.1583298015616;
 Tue, 03 Mar 2020 21:00:15 -0800 (PST)
MIME-Version: 1.0
References: <20200115115249.27774-1-ilie.halip@gmail.com> <CAKwvOdkdD9VF1k==G4vMeo4bBLarYz8gPvWfv6+N2kejeoXfjA@mail.gmail.com>
 <CAK7LNAQ1pS0nK7JoUbgOn0aMtaYH69XukjNELZNxTtV_iMmR1Q@mail.gmail.com>
In-Reply-To: <CAK7LNAQ1pS0nK7JoUbgOn0aMtaYH69XukjNELZNxTtV_iMmR1Q@mail.gmail.com>
From:   =?UTF-8?B?RsSBbmctcnXDrCBTw7JuZw==?= <maskray@google.com>
Date:   Tue, 3 Mar 2020 21:00:04 -0800
Message-ID: <CAFP8O3+cEinopXVP5yKWG2WBP=TOdudxUnVikfh90SF7muEcSA@mail.gmail.com>
Subject: Re: [RFC PATCH] lib: move memcat_p.o to obj-y
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Ilie Halip <ilie.halip@gmail.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jan 17, 2020 at 10:01 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Fri, Jan 17, 2020 at 7:30 AM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > On Wed, Jan 15, 2020 at 3:53 AM Ilie Halip <ilie.halip@gmail.com> wrote:
> > >
> > > The semantics of `--undefined` differ between ld.bfd and ld.lld:
> > >     $ echo | gcc -x c -c - -o a.o
> > >     $ echo "EXTERN(test)" > a.lds
> > >     $ ld.bfd a.o -t a.lds -o - 2>/dev/null && objdump -t | grep test
> > >     0000000000000000         *UND*      0000000000000000 test
> > >     $ ld.lld a.o -t a.lds -o - 2>/dev/null && objdump -t | grep test
> > >     $
> > >
> > > When building with CONFIG_STM=m, there are no in-kernel users of memcat_p()
> > > and ld.lld discards this symbol because it's linked in via --no-whole-archive.
> > > It's marked as undefined by a linker script but ld.lld discards it anyway (as
> > > seen in the above snippet).
> > >
> > > Work around the ld.lld behavior by moving the object file to obj-y.
> > >
> > > Signed-off-by: Ilie Halip <ilie.halip@gmail.com>
> > > Link: https://github.com/ClangBuiltLinux/linux/issues/515
> >
> > Thanks for the patch.  This solves the observed linkage failure.
> > Maybe Masahiro has more input based on the discussion in the above
> > Link?
>
> Sorry, I did not notice that thread until now.
> I will take a look at it when I have time.
>
>
> This patch does not seem to be a proper fix.
>
> If this fix-up were acceptable, theoretically,
> all objects that contain EXPORTED_SYMBOL
> would need to be turned into obj-y from lib-y ?
>
> > Tested-by: Nick Desaulniers <ndesaulniers@google.com>

Hi Masahiro,

lld ELF maintainer here. This seems to the only blocker of `LD=ld.lld
allmodconfig` (https://github.com/ClangBuiltLinux/linux/issues/839).
Hope you can help if you think there is a more complete fix.

Below is some (probably obscure) explanation why I think the GNU ld -u
behavior is not consistent and lld should not match:

If a.o has an undefined symbol foo, `{ld.bfd,ld.lld} -shared a.o` will
place foo in .dynsym .

GNU ld's EXTERN(foo) and -u foo behavior is consistent with its
documentation with regard to .symtab, but it is not consistent with
regard to .dynsym.
`ld.bfd -shared -u test a.o` does not place test in .dynsym. So an
undefined symbol added by -u is different from a regular undefined
symbol.

The different behavior for .dynsym is understandable: if GNU ld places
foo in .dynsym, the shared object will likely have an unresolved
reference at run time and will thus be rejected by ld.so.
So for .dynsym, GNU ld's behavior is actually similar to lld's: -u foo
triggers linking of an archive (if the archive defines foo).

Additionally, lld has an extension --undefined-glob=<pattern>, which
is similar to multiple -u. The only reasonable behavior for a pattern
argument is to trigger linking of archive definitions. This is
consistent with lld's current interpretation of -u.


Reviewed-by: Fangrui Song <maskray@google.com>
