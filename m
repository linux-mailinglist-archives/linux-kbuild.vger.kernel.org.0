Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F1092C9E1F
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Dec 2020 10:41:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727041AbgLAJiy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 1 Dec 2020 04:38:54 -0500
Received: from gate.crashing.org ([63.228.1.57]:50576 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727035AbgLAJix (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Dec 2020 04:38:53 -0500
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 0B19WsYY019369;
        Tue, 1 Dec 2020 03:32:54 -0600
Received: (from segher@localhost)
        by gate.crashing.org (8.14.1/8.14.1/Submit) id 0B19Wrls019366;
        Tue, 1 Dec 2020 03:32:53 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date:   Tue, 1 Dec 2020 03:32:53 -0600
From:   Segher Boessenkool <segher@kernel.crashing.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     =?utf-8?B?RsSBbmctcnXDrCBTw7JuZw==?= <maskray@google.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jakub Jelinek <jakub@redhat.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-toolchains@vger.kernel.org,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Dmitry Golovin <dima@golovin.in>,
        Alistair Delva <adelva@google.com>
Subject: Re: [PATCH v2 3/4] Kbuild: make DWARF version a choice
Message-ID: <20201201093253.GJ2672@gate.crashing.org>
References: <CAK7LNAST0Ma4bGGOA_HATzYAmRhZG=x_X=8p_9dKGX7bYc2FMA@mail.gmail.com> <20201104005343.4192504-1-ndesaulniers@google.com> <20201104005343.4192504-4-ndesaulniers@google.com> <CAK7LNAT5MQqUddv+QbFu5ToLBK3eUPArHSBR=5AOS3ONtMqKaw@mail.gmail.com> <CAFP8O3Ki9HoqcV450fn29fBOWAbmuGAdB6USLz8pGsW4Vzf7sg@mail.gmail.com> <CAK7LNAS_hxevOS7hKxepyCBVU-4j87Yf5Y8DB6mFq+4xuaz3AA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAS_hxevOS7hKxepyCBVU-4j87Yf5Y8DB6mFq+4xuaz3AA@mail.gmail.com>
User-Agent: Mutt/1.4.2.3i
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Dec 01, 2020 at 12:38:16PM +0900, Masahiro Yamada wrote:
> > We can bump -Wa,-gdwarf-2 to -Wa,-gdwarf-3 since GNU actually emits
> > DWARF v3 DW_AT_ranges (see
> > https://sourceware.org/bugzilla/show_bug.cgi?id=26850 )
> > This can avoid the `warning: DWARF2 only supports one section per
> > compilation unit` warning for Clang.

That warning should be "there can be only one section with executable
code per translation unit", or similar.

> I am not a DWARF spec expert.

Neither am I.

> Please teach me.
> 
> In my understanding, "DWARF2 only supports one section ..."
> is warned only when building .S files with LLVM_IAS=1

.S files are simply run through the C preprocessor first, and then given
to the assembler.  The only difference there should be wrt debug info is
you could have some macros that expand to assembler debug statements.

> If this is due to the limitation of DWARF v2, why is it OK to
> build .c files with LLVM_IAS?

The compiler can of course make sure not to use certain constructs in
its generated assembler code, while the assembler will have to swallow
whatever the user wrote.


Segher
