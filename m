Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E32FD59831A
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Aug 2022 14:27:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244634AbiHRM0V (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 18 Aug 2022 08:26:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244633AbiHRM0U (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 18 Aug 2022 08:26:20 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C67B5A3E1;
        Thu, 18 Aug 2022 05:26:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 27868B82168;
        Thu, 18 Aug 2022 12:26:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45369C433C1;
        Thu, 18 Aug 2022 12:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1660825576;
        bh=2HfeV/FUeCfFB9ahk1dEIdH1Z5Xm4ZpUI9pxyzXtVNY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ldExojEWXMzZbv5iaFVyGoeebhh1grtNtOMHurAW12WWoZEOxE387gy4UaZ4z4H3M
         oi712cn5j905RlOoF1cE25p10FoK+joF2aUY+v9jxXooNL+wYu9QOQcG3DsJ/iv4rZ
         jF590iJWZlf1aT2bEszQcOp9qcFA2JKcn5pQpuL8=
Date:   Thu, 18 Aug 2022 14:26:14 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Alexander Lobakin <alexandr.lobakin@intel.com>
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
        Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
        "David S. Miller" <davem@davemloft.net>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Jiri Kosina <jikos@kernel.org>,
        Miroslav Benes <mbenes@suse.cz>,
        Petr Mladek <pmladek@suse.com>,
        Joe Lawrence <joe.lawrence@redhat.com>,
        linux-kbuild@vger.kernel.org, live-patching@vger.kernel.org,
        lkp@intel.com, stable@vger.kernel.org
Subject: Re: [RFC PATCH 1/3] modpost: fix TO_NATIVE() with expressions and
 consts
Message-ID: <Yv4v5vwXDER3GA2y@kroah.com>
References: <20220818115306.1109642-1-alexandr.lobakin@intel.com>
 <20220818115306.1109642-2-alexandr.lobakin@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220818115306.1109642-2-alexandr.lobakin@intel.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Aug 18, 2022 at 01:53:04PM +0200, Alexander Lobakin wrote:
> Macro TO_NATIVE() directly takes a reference to its argument @x
> without making an intermediate variable. This makes compilers
> emit build warnings and errors if @x is an expression or a deref
> of a const pointer (when target Endianness != host Endianness):
> 
> >> scripts/mod/modpost.h:87:18: error: lvalue required as unary '&' operand
>       87 |         __endian(&(x), &(__x), sizeof(__x));                    \
>          |                  ^
>    scripts/mod/sympath.c:19:25: note: in expansion of macro 'TO_NATIVE'
>       19 | #define t(x)            TO_NATIVE(x)
>          |                         ^~~~~~~~~
>    scripts/mod/sympath.c:100:31: note: in expansion of macro 't'
>      100 |                 eh->e_shoff = t(h(eh->e_shoff) + off);
> 
> >> scripts/mod/modpost.h:87:24: warning: passing argument 2 of '__endian'
> discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
>       87 |         __endian(&(x), &(__x), sizeof(__x));                    \
>          |                        ^~~~~~
>    scripts/mod/sympath.c:18:25: note: in expansion of macro 'TO_NATIVE'
>       18 | #define h(x)            TO_NATIVE(x)
>          |                         ^~~~~~~~~
>    scripts/mod/sympath.c:178:48: note: in expansion of macro 'h'
>      178 |              iter < end; iter = (void *)iter + h(eh->e_shentsize)) {

How come this hasn't shown up in cross-builds today?


> 
> Create a temporary variable, assign @x to it and don't use @x after
> that. This makes it possible to pass expressions as an argument.
> Also, do a cast-away for the second argument when calling __endian()
> to avoid 'discarded qualifiers' warning, as typeof() preserves
> qualifiers and makes compilers think that we're passing pointer
> to a const.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org # 4.9+

Where are these build warnings showing up at that we don't see them
today, yet this is needed to go back to all stable trees?

still confused,

greg k-h
