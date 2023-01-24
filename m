Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C761679EEB
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jan 2023 17:39:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233988AbjAXQjr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 24 Jan 2023 11:39:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234111AbjAXQjr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Jan 2023 11:39:47 -0500
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0E56840C4
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Jan 2023 08:39:44 -0800 (PST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 30OGUo7N008108;
        Tue, 24 Jan 2023 10:30:50 -0600
Received: (from segher@localhost)
        by gate.crashing.org (8.14.1/8.14.1/Submit) id 30OGUmel008107;
        Tue, 24 Jan 2023 10:30:48 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date:   Tue, 24 Jan 2023 10:30:48 -0600
From:   Segher Boessenkool <segher@kernel.crashing.org>
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     masahiroy@kernel.org, nicolas@fjasle.eu,
        linux-kbuild@vger.kernel.org, trix@redhat.com,
        llvm@lists.linux.dev, ndesaulniers@google.com, npiggin@gmail.com,
        linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 07/14] powerpc/vdso: Improve linker flags
Message-ID: <20230124163048.GL25951@gate.crashing.org>
References: <20221228-drop-qunused-arguments-v2-0-9adbddd20d86@kernel.org> <20221228-drop-qunused-arguments-v2-7-9adbddd20d86@kernel.org> <20230123150716.GJ25951@gate.crashing.org> <Y9AD/Mejnv6jp7Np@dev-arch.thelio-3990X>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y9AD/Mejnv6jp7Np@dev-arch.thelio-3990X>
User-Agent: Mutt/1.4.2.3i
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jan 24, 2023 at 09:14:52AM -0700, Nathan Chancellor wrote:
> On Mon, Jan 23, 2023 at 09:07:16AM -0600, Segher Boessenkool wrote:
> > And here it is even more obviously fine.  If you need obfuscation like
> > in your patch, it is better not to do this imo.
> 
> I do not think this patch really obfuscates anything? The filtering is
> pretty clear to me.

And not having such filtering is more obvious and more clear.

It doesn't matter much for just this patch of course, but it will make
the code significantly harder to read (and deal with in other ways) if
this continues.

> If this is a real objection to the patch, I suppose we could just
> localize '-Qunused-arguments' to this Makefile and be done with it but I
> do not think this change is a bad solution to the problem either.

It is a comment about the direction this patch is moving us in.  I don't
think it is a good idea at all to try to avoid all warnings, and even
more so it is a bad idea to make objectively worse source code just to
appease a trigger-happy and questionable warning.

As I said, you can often avoid warnings by writing better code, like
part of the patch did.  That is a good reaction to warnings.  Making
worse code to avoid warnings is not a good idea normally.

Just don't use -Werror by default, and don't make other people suffer
its yoke!


Segher
