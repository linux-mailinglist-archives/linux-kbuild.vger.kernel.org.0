Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D46EE7327BC
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Jun 2023 08:37:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234096AbjFPGh3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 16 Jun 2023 02:37:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235690AbjFPGh3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Jun 2023 02:37:29 -0400
Received: from out-14.mta0.migadu.com (out-14.mta0.migadu.com [IPv6:2001:41d0:1004:224b::e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D65892721
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Jun 2023 23:37:26 -0700 (PDT)
Date:   Fri, 16 Jun 2023 02:37:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1686897444;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=TSZQg4QznSXeUHmcg4TxmiEBy4BQv/GK9R9MEex5wyw=;
        b=T8q45pH1TaQFur5EILbukCv3Jf+7nqmiKyU6FpB6O4r13JhZkfXfCBbdH5nFf5bj8WVfjk
        wYukGpLkvdcm5aDDiclS4MIdLYJQpNj8n3hVxhBqug6lnR3cq+zXRwe3p/O2WQ2dPNzbtL
        sjL1IuN6DMH0cZCSwgvjYIvHmEZ1se0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Kent Overstreet <kent.overstreet@linux.dev>
To:     Peter Oberparleiter <oberpar@linux.ibm.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        linux-kbuild@vger.kernel.org
Subject: Re: Specifying CFLAGS for a directory on the command line
Message-ID: <ZIwDIOxq3rE/8QUV@moria.home.lan>
References: <ZIOmUkXlegycIExQ@moria.home.lan>
 <CAKwvOdneu4Fzy+x1KTd_ugLzt4iyUpE+fGXwXeNCWW12Jtj1GA@mail.gmail.com>
 <CAKwvOdnuPYKahsgAA=n6MD+byxujaEW82FEUWd2Ay4Tx9VAiDw@mail.gmail.com>
 <ZIO3leNyqOeJw6u3@moria.home.lan>
 <bddaf556-6417-ffaf-2301-9caf47089b21@linux.ibm.com>
 <ZIiz4WjIB6r8Gz4l@moria.home.lan>
 <a077ce91-1cfc-5c15-aa0e-1cf90f71e719@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a077ce91-1cfc-5c15-aa0e-1cf90f71e719@linux.ibm.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jun 15, 2023 at 11:54:23AM +0200, Peter Oberparleiter wrote:
> I'll likely not be able to implement this myself, but if you or anyone
> else wants to go that route, here are my thoughts: $(src) should have
> the relative source code path that is needed, so here's what needs to be
> done:
> 
> 1. Determine how to handle non-letter/digit/underscore characters in the
>    variable name:
> 
>    a) GCOV_PROFILE_fs/bcachefs => supported by GNU make [1], though
>       discouraged due to possible side-effects
>    b) GCOV_PROFILE_fs_bcachefs => might cause overlays, e.g. a/b/c and
>       a/b_c both have the same a_b_c suffix
> 
>    Personally I'd prefer option b)

Agreed, feels more consistent

> 2. Define a new Makefile variable that contains $(src) with required
>    character replacements (scripts/Kbuild.include might be a good place)
> 
> 3. Add $(GCOV_PROFILE_$(name_of_that_new_var)) to the code quoted above
>    (scripts/Makefile.lib)

So this is where I was getting stuck, because we really want this to
apply to subdirectories (e.g. GCOV_PROFILE_fs_xfs should really also
apply to fs/xfs/libxfs).

Do we have existing code for generating a list of path prefixes for a
given path?
