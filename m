Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 860564EAB57
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Mar 2022 12:36:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234426AbiC2Kho (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 29 Mar 2022 06:37:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233793AbiC2Khn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 29 Mar 2022 06:37:43 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2022887B0;
        Tue, 29 Mar 2022 03:36:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5C96D6122F;
        Tue, 29 Mar 2022 10:36:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 638A2C340ED;
        Tue, 29 Mar 2022 10:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1648550159;
        bh=BpnVSnHL7Wyq0djkfiO8bZ3rjaX+b+Rn7WKaEVjMV/Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QoENHCGYpqfrb5U5Sq0SbyOcbWDNGjck+IdASRsHORmiZ5kQoE56vqddSMk3yn/9q
         Se5Ju7OO5CaE/eXH22eqPx0mSMN8KQjMB31mvQdPuqBcbSZWvHPmdiySCooUnvd24a
         e7CRc1uwSUszHIfhVMMa+pwq6Yp9yXez/krCSEjo=
Date:   Tue, 29 Mar 2022 12:35:56 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Dmitry V. Levin" <ldv@altlinux.org>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH 2/2] kbuild: forbid exported headers from including
 <stdint.h>, <stdbool.h>
Message-ID: <YkLhDMlImRBQuPWx@kroah.com>
References: <20220328172130.197319-1-masahiroy@kernel.org>
 <20220328172130.197319-2-masahiroy@kernel.org>
 <YkKhc2BbkmdVwKex@kroah.com>
 <CAK7LNAT0nuMXDjPzc37g_Pg-h+-iUOf8hrzqwZTF=N3RDUhosA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAT0nuMXDjPzc37g_Pg-h+-iUOf8hrzqwZTF=N3RDUhosA@mail.gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Mar 29, 2022 at 04:16:02PM +0900, Masahiro Yamada wrote:
> On Tue, Mar 29, 2022 at 3:04 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Tue, Mar 29, 2022 at 02:21:30AM +0900, Masahiro Yamada wrote:
> > > Some UAPI headers included <stdlib.h>, like this:
> > >
> > >   #ifndef __KERNEL__
> > >   #include <stdlib.h>
> > >   #endif
> > >
> > > As it turned out, they just included it for no good reason.
> > >
> > > After some fixes, now I can compile-test UAPI headers
> > > (CONFIG_UAPI_HEADER_TEST=y) without <stdlib.h> included.
> > >
> > > To avoid somebody getting it back again, this commit adds the dummy
> > > header, usr/dummy-include/stdlib.h
> > >
> > > I added $(srctree)/usr/dummy-include to the header search paths.
> > > Because it is searched before the system directories, if someone
> > > tries to include <stdlib.h>, they will see the error message.
> > >
> > > While I am here, I also replaced $(objtree)/usr/include with $(obj), but
> > > it is just a small refactoring.
> > >
> > > If we achieve the situation where none of system headers is included
> > > from exported kernel headers (i.e. kernel headers become self-contained),
> > > we might be able to add -nostdinc, but that is much far from where we
> > > stand now. (see many no-header-test lines in usr/include/Makefile)
> > >
> > > As a realistic solution, you can forbid header inclusion individually by
> > > putting a dummy header into usr/dummy-include/.
> > >
> > > Currently, no header include <stdbool.h>. I put it as well before somebody
> > > attempts to use it.
> > >
> > > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> >
> > Nice work!
> >
> > Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> 
> I made a mistake in the patch subject.
> 
> The correct title should be:
> 
>     kbuild: forbid exported headers from including <stdlib.h>, <stdbool.h>
> 
> I will fix it in v2.

Ah, missed that, yes.

> We cannot ban <stdint.h> for now because there are still some users.
> 
> A fix-up patch exists, but the fuse maintainer was opposed to it.
> https://lore.kernel.org/lkml/20220318171405.2728855-1-cmllamas@google.com/

It's not ok for one lone file to break the rules that all other uapi
header files follow.  I think that needs to be fixed, there is NOTHING
special about that one subsystem to justify this.

Uniformity is good, and should be followed, and I strongly think that
change needs to be accepted.

thanks,

greg k-h
