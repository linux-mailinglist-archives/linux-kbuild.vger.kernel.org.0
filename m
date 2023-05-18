Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8324707BF6
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 May 2023 10:27:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230150AbjERI1J (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 18 May 2023 04:27:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230088AbjERI1I (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 18 May 2023 04:27:08 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8700A198E
        for <linux-kbuild@vger.kernel.org>; Thu, 18 May 2023 01:27:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1847C61AA8
        for <linux-kbuild@vger.kernel.org>; Thu, 18 May 2023 08:27:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 819AFC433D2
        for <linux-kbuild@vger.kernel.org>; Thu, 18 May 2023 08:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684398425;
        bh=OuUb0GFcpm3oT9D//g949iHPeGSWTDQbYa68G/ZlGSY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=sTxoxjIiQY5mNgDiBwqqUClAbPM//wsKBKu9DLj4OBCMbyjEcrT+vzUOzQ5ET7ykc
         /YYxZsO7me/VQFCJD8GERgzg/bmzfAX8XKufN7FTKNFqAQ73qB9roq+y8KgP6mt2Im
         byhQ5961Rxb1EtG3rp1Gd7lRurM9rM6WaI8HZnRjoV4F9QoqF6QAkpqstRzwB1Ouyj
         yzTji4Gm4CJ0Ov96Q8KcBqT4CxJK4W2bGRzX3WabqVlAHgS7GBstGQUBhwfZn8nHDK
         VQJEG6KNKTGsQ9jgZCxaZU+6SDrn9y65hmKkwB4hrD9OQACSCRZrkMAYyejfmZRk+t
         kiI3b8JMFFIAQ==
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-392116ae103so1116328b6e.0
        for <linux-kbuild@vger.kernel.org>; Thu, 18 May 2023 01:27:05 -0700 (PDT)
X-Gm-Message-State: AC+VfDwpFdTqwhdM2g/2Pt/9ENzOzLOVpdmJkEjovdTy+5KeHrdDb1xO
        kJsBWasDiWE+kSP9CNAGjf1W3QW021QdFLLg64k=
X-Google-Smtp-Source: ACHHUZ79hT0E78gusGfJRrHVa6vdtoFGbOJGzEofZqP2yTO3ntemixkzb20oUAA6y9RB3GMtrcI4LHReYB3fjLiAEEQ=
X-Received: by 2002:a05:6808:14c9:b0:394:4aaa:eab2 with SMTP id
 f9-20020a05680814c900b003944aaaeab2mr912886oiw.36.1684398424784; Thu, 18 May
 2023 01:27:04 -0700 (PDT)
MIME-Version: 1.0
References: <ZGVi9HbI43R5trN8@bhelgaas>
In-Reply-To: <ZGVi9HbI43R5trN8@bhelgaas>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 18 May 2023 17:26:28 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQPXapu3Ydh9XaB2ggGqgfYX5mo0pHPNHDcnm=w3ubYag@mail.gmail.com>
Message-ID: <CAK7LNAQPXapu3Ydh9XaB2ggGqgfYX5mo0pHPNHDcnm=w3ubYag@mail.gmail.com>
Subject: Re: possible dependency error?
To:     Bjorn Helgaas <helgaas@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, Josh Poimboeuf <jpoimboe@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

(+CC: Josh Poimboeuf,Peter Zijlstra, objtool maintainer)



On Thu, May 18, 2023 at 8:27=E2=80=AFAM Bjorn Helgaas <helgaas@kernel.org> =
wrote:
>
> This is on v6.4-rc1.  I fat-fingered the make target (I intended
> "pciehp.o", not "pciehp.c"), then interrupted the build when I noticed
> my mistake:
>
>   06:04:15 ~/linux (hotplug)$ make drivers/pci/hotplug/pciehp.c
>     SYNC    include/config/auto.conf.cmd
>   ^Cmake: *** [include/config/auto.conf.cmd] Deleting file 'include/gener=
ated/rustc_cfg'
>   make: *** [include/config/auto.conf.cmd] Deleting file 'include/generat=
ed/autoconf.h'
>   make[2]: *** [scripts/kconfig/Makefile:77: syncconfig] Interrupt
>   make[1]: *** [Makefile:692: syncconfig] Interrupt
>   make: *** [Makefile:793: include/config/auto.conf.cmd] Interrupt
>
> Subsequent builds now fail ("pciehp.o" is *also* an incorrect target,
> but doesn't seem related to the error):
>
>   06:04:22 ~/linux (hotplug)$ make drivers/pci/hotplug/pciehp.o
>     SYNC    include/config/auto.conf.cmd
>     UPD     include/config/kernel.release
>     UPD     include/generated/utsrelease.h
>     UPD     include/generated/compile.h
>     CC      scripts/mod/empty.o
>     MKELF   scripts/mod/elfconfig.h
>     HOSTCC  scripts/mod/modpost.o
>     CC      scripts/mod/devicetable-offsets.s
>     HOSTCC  scripts/mod/file2alias.o
>     HOSTCC  scripts/mod/sumversion.o
>     HOSTLD  scripts/mod/modpost
>     CC      kernel/bounds.s
>     CC      arch/x86/kernel/asm-offsets.s
>     CALL    scripts/checksyscalls.sh
>     DESCEND objtool
>     HOSTCC  /home/bjorn/linux/tools/objtool/fixdep.o
>     HOSTLD  /home/bjorn/linux/tools/objtool/fixdep-in.o
>     LINK    /home/bjorn/linux/tools/objtool/fixdep
>   make[4]: *** No rule to make target '/usr/include/x86_64-linux-gnu/bits=
/sys_errlist.h', needed by '/home/bjorn/linux/tools/objtool/libsubcmd/exec-=
cmd.o'.  Stop.
>   make[3]: *** [Makefile:80: /home/bjorn/linux/tools/objtool/libsubcmd/li=
bsubcmd-in.o] Error 2
>   make[2]: *** [Makefile:78: /home/bjorn/linux/tools/objtool/libsubcmd/li=
bsubcmd.a] Error 2
>   make[1]: *** [Makefile:73: objtool] Error 2
>   make: *** [Makefile:1440: tools/objtool] Error 2
>
> I finally got the right target, but the build still fails:
>
>   06:04:39 ~/linux (hotplug)$ make drivers/pci/hotplug/
>     CALL    scripts/checksyscalls.sh
>     DESCEND objtool
>   make[4]: *** No rule to make target '/usr/include/x86_64-linux-gnu/bits=
/sys_errlist.h', needed by '/home/bjorn/linux/tools/objtool/libsubcmd/exec-=
cmd.o'.  Stop.
>   make[3]: *** [Makefile:80: /home/bjorn/linux/tools/objtool/libsubcmd/li=
bsubcmd-in.o] Error 2
>   make[2]: *** [Makefile:78: /home/bjorn/linux/tools/objtool/libsubcmd/li=
bsubcmd.a] Error 2
>   make[1]: *** [Makefile:73: objtool] Error 2
>   make: *** [Makefile:1440: tools/objtool] Error 2
>
> After "make distclean", everything works as expected, so maybe this is
> just the expected behavior after my initial user error?  I dunno; it
> seemed surprising.  Just FYI.
>
> Bjorn


I do not know what is happening on your build machine,
but judging from the error log, something went wrong
while building objtool.

objtool Makefile is not a part of Kbuild.
The maintainers of objtool may have some insight.





BTW, I could not reproduce the issue.
I could not find anything weird from the Kbuild perspective so far.
The errors in the single target builds are expected.

This is what I did.

$ git clean -fdx
$ make defconfig
$ make drivers/pci/hotplug/pciehp.c
    -> Fail. This is expected behavior
$ make drivers/pci/hotplug/pciehp.o
    -> Fail. This is also expected behavior
       because CONFIG_HOTPLUG_PCI_PCIE is unset
$ make drivers/pci/hotplug/
    -> success for me


Is this the same command sequence as you did?



--=20
Best Regards
Masahiro Yamada
