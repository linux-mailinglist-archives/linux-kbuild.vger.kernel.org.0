Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87278677F68
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Jan 2023 16:17:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232474AbjAWPRy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 23 Jan 2023 10:17:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232626AbjAWPRg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 23 Jan 2023 10:17:36 -0500
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7464328856
        for <linux-kbuild@vger.kernel.org>; Mon, 23 Jan 2023 07:16:52 -0800 (PST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 30NF7JXS005826;
        Mon, 23 Jan 2023 09:07:19 -0600
Received: (from segher@localhost)
        by gate.crashing.org (8.14.1/8.14.1/Submit) id 30NF7GUt005822;
        Mon, 23 Jan 2023 09:07:16 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date:   Mon, 23 Jan 2023 09:07:16 -0600
From:   Segher Boessenkool <segher@kernel.crashing.org>
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     masahiroy@kernel.org, nicolas@fjasle.eu,
        linux-kbuild@vger.kernel.org, trix@redhat.com,
        llvm@lists.linux.dev, ndesaulniers@google.com, npiggin@gmail.com,
        linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 07/14] powerpc/vdso: Improve linker flags
Message-ID: <20230123150716.GJ25951@gate.crashing.org>
References: <20221228-drop-qunused-arguments-v2-0-9adbddd20d86@kernel.org> <20221228-drop-qunused-arguments-v2-7-9adbddd20d86@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221228-drop-qunused-arguments-v2-7-9adbddd20d86@kernel.org>
User-Agent: Mutt/1.4.2.3i
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi!

On Wed, Jan 11, 2023 at 08:05:04PM -0700, Nathan Chancellor wrote:
> When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, there
> are several warnings in the PowerPC vDSO:
> 
>   clang-16: error: -Wl,-soname=linux-vdso32.so.1: 'linker' input unused [-Werror,-Wunused-command-line-argument]
>   clang-16: error: -Wl,--hash-style=both: 'linker' input unused [-Werror,-Wunused-command-line-argument]
>   clang-16: error: argument unused during compilation: '-shared' [-Werror,-Wunused-command-line-argument]
> 
>   clang-16: error: argument unused during compilation: '-nostdinc' [-Werror,-Wunused-command-line-argument]
>   clang-16: error: argument unused during compilation: '-Wa,-maltivec' [-Werror,-Wunused-command-line-argument]

There is nothing wrong with the warnings, but as usual, -Werror is very
counterproductive.

> The first group of warnings point out that linker flags were being added
> to all invocations of $(CC), even though they will only be used during
> the final vDSO link. Move those flags to ldflags-y.

Which is explicitly allowed, and won't do anything, so nothing harmful
either.  It is not a bad idea to avoid this if that is trivial to do,
of course.

> The second group of warnings are compiler or assembler flags that will
> be unused during linking. Filter them out from KBUILD_CFLAGS so that
> they are not used during linking.

And here it is even more obviously fine.  If you need obfuscation like
in your patch, it is better not to do this imo.

The warning text "linker input unused" is misleading btw.  It would be
good to warn about that, if it was true: very likely the user didn't
intend what he wrote.  But a linker input is an object file, or perhaps
a linker script.  These things are just compiler flags.


Segher
