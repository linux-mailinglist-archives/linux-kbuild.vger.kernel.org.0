Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1E852A641E
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Nov 2020 13:19:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729804AbgKDMTr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 4 Nov 2020 07:19:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58146 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729089AbgKDMTr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Nov 2020 07:19:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604492385;
        h=from:from:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:in-reply-to:in-reply-to:  references:references;
        bh=gvbJKCfeEljigutKFUzdUYW55JqbQpoNpBQ+4SF+G30=;
        b=Hep2pHp/ydN439qtUEOvg8ZFRYgF6ELuAMVyV83eWDzue1YZ4RoY6LzpAW6Q8vVlAnL3Ff
        T7L+UIvJz50acFOMU/pIFigrIPru8ofeW/qK/EgPHByW9TkMLQBqqeN5AG8t0/ML8KzwN3
        4TPhq8F3W8B4gqmGlnkCrPL8B+5f/B0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-xmFgMa1aNs-6L8PAORyRBw-1; Wed, 04 Nov 2020 07:19:40 -0500
X-MC-Unique: xmFgMa1aNs-6L8PAORyRBw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7508A192CC72;
        Wed,  4 Nov 2020 12:19:39 +0000 (UTC)
Received: from tucnak.zalov.cz (ovpn-113-127.ams2.redhat.com [10.36.113.127])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 017C06266E;
        Wed,  4 Nov 2020 12:19:38 +0000 (UTC)
Received: from tucnak.zalov.cz (localhost [127.0.0.1])
        by tucnak.zalov.cz (8.16.1/8.16.1) with ESMTPS id 0A4CJZRx3343910
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
        Wed, 4 Nov 2020 13:19:35 +0100
Received: (from jakub@localhost)
        by tucnak.zalov.cz (8.16.1/8.16.1/Submit) id 0A4CJYBh3343909;
        Wed, 4 Nov 2020 13:19:34 +0100
Date:   Wed, 4 Nov 2020 13:19:34 +0100
From:   Jakub Jelinek <jakub@redhat.com>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        linux-toolchains@vger.kernel.org,
        Alistair Delva <adelva@google.com>,
        Nick Clifton <nickc@redhat.com>
Subject: Re: [PATCH] Kbuild: implement support for DWARF5
Message-ID: <20201104121934.GT3788@tucnak>
Reply-To: Jakub Jelinek <jakub@redhat.com>
References: <20201022012106.1875129-1-ndesaulniers@google.com>
 <CAK7LNAST0Ma4bGGOA_HATzYAmRhZG=x_X=8p_9dKGX7bYc2FMA@mail.gmail.com>
 <20201102081810.GB3788@tucnak>
 <CAKwvOd=ez9nXCdQu6QRbNk5tfUAsSj9RLhopZtNE4RhDupg7+w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOd=ez9nXCdQu6QRbNk5tfUAsSj9RLhopZtNE4RhDupg7+w@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Nov 03, 2020 at 02:21:22PM -0800, Nick Desaulniers wrote:
> > > This script fails for GCC 10.
> >
> > One thing is GCC DWARF-5 support, that is whether the compiler
> > will support -gdwarf-5 flag, and that support should be there from
> > GCC 7 onwards.
> 
> I should improve my Kconfig check; I don't actually have a test for
> -gdwarf-5 for the compiler.  In godbolt, it looks like -gdwarf-5
> produces an error from GCC up until GCC 5.1.  Does (5.1 < GCC < 7) not
> produce DWARF5?

No.  After all, those versions also predate DWARF5.
All 5.1 - 6.x did was start accepting -gdwarf-5 as experimental option
that enabled some small DWARF subset (initially only a few DW_LANG_* codes
newly added to DWARF5 drafts).  Only GCC 7 (released after DWARF 5 has
been finalized) started emitting DWARF5 section headers and got most of the
DWARF5 changes in, e.g. including switching over most of the now
standardized GNU extensions from their DW_*_GNU_* codes to DWARF5 DW_*).
With GCC 5/6, you get:
echo 'int i;' | gcc -c -o /tmp/test.o -xc - -gdwarf-5; readelf -wi /tmp/test.o | grep Version:
   Version:       4
while with 7+
   Version:       5
instead.

>  Maybe there's a more specific test you had in mind?

Guess what you want to test is what version you actually get in .debug_info
if you compile with -gdwarf-5.

> > Another separate thing is whether the assembler does support
> > the -gdwarf-5 option (i.e. if you can compile assembler files
> > with -Wa,-gdwarf-5) for GNU as I think that is binutils 35.1,
> > i.e. very new); but only if you want to pass the -Wa,-gdwarf-5
> > only when compiling *.s and *.S files.  That option is about whether
> > the assembler will emit DWARF5 or DWARF2 .debug_line.
> > It is fine to compile C sources with -gdwarf-5 and use DWARF2
> > .debug_line for assembler files if as doesn't support it.
> >
> > Yet another thing is if you can pass -Wa,-gdwarf-5 even when
> > compiling C files.  There are several bugs in that category that have been
> > fixed only in the last few days on binutils trunk, I'd suggest
> > just not to bother, GCC 11 will have proper test for fixed assembler
> > and will pass -gdwarf-5 to as when compiling even C sources with -gdwarf-5.
> 
> Do you have links?  I would prefer to do feature detection rather than

The
https://gcc.gnu.org/r11-3693
https://gcc.gnu.org/r11-4338
commits contain those tests in gcc/configure.ac

	Jakub

