Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F5E32C2F51
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Nov 2020 18:51:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404011AbgKXRvg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 24 Nov 2020 12:51:36 -0500
Received: from gate.crashing.org ([63.228.1.57]:35981 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2403999AbgKXRvg (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Nov 2020 12:51:36 -0500
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 0AOHkEuE024001;
        Tue, 24 Nov 2020 11:46:14 -0600
Received: (from segher@localhost)
        by gate.crashing.org (8.14.1/8.14.1/Submit) id 0AOHkDC4024000;
        Tue, 24 Nov 2020 11:46:13 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date:   Tue, 24 Nov 2020 11:46:13 -0600
From:   Segher Boessenkool <segher@kernel.crashing.org>
To:     Arvind Sankar <nivedita@alum.mit.edu>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Jakub Jelinek <jakub@redhat.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-toolchains@vger.kernel.org,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Fangrui Song <maskray@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Dmitry Golovin <dima@golovin.in>,
        Alistair Delva <adelva@google.com>
Subject: Re: [PATCH v2 3/4] Kbuild: make DWARF version a choice
Message-ID: <20201124174613.GW2672@gate.crashing.org>
References: <CAK7LNAST0Ma4bGGOA_HATzYAmRhZG=x_X=8p_9dKGX7bYc2FMA@mail.gmail.com> <20201104005343.4192504-1-ndesaulniers@google.com> <20201104005343.4192504-4-ndesaulniers@google.com> <20201123232210.GA208735@rani.riverdale.lan> <20201124003357.GR2672@gate.crashing.org> <20201124165602.GA343230@rani.riverdale.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201124165602.GA343230@rani.riverdale.lan>
User-Agent: Mutt/1.4.2.3i
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Nov 24, 2020 at 11:56:02AM -0500, Arvind Sankar wrote:
> On Mon, Nov 23, 2020 at 06:33:57PM -0600, Segher Boessenkool wrote:
> > On Mon, Nov 23, 2020 at 06:22:10PM -0500, Arvind Sankar wrote:
> > > Btw, is -gsplit-dwarf at all useful for assembler files?
> > 
> > If you invoke the assembler via the compiler, with that flag it still
> > creates separate .o and .dwo files (via objcopy invocations as usual).
> > Whether that is useful depends on if you have any debug info that can
> > be split :-)
> 
> Right, the latter was what I was really asking :) We don't currently
> pass -gsplit-dwarf for assembler and I was wondering if that mattered.

If there is any debug info in the .s files, it will all end up in the .o
file, not a .dwo file.  That may matter aesthetically, and it can cost a
few bytes of disk space, but it doesn't matter functionally (GDB will
search in both places).


Segher
