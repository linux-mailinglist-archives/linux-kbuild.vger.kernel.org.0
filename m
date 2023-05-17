Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C96F9707664
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 May 2023 01:27:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229452AbjEQX1y (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 17 May 2023 19:27:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbjEQX1x (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 May 2023 19:27:53 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FF363A8D
        for <linux-kbuild@vger.kernel.org>; Wed, 17 May 2023 16:27:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 04B566168E
        for <linux-kbuild@vger.kernel.org>; Wed, 17 May 2023 23:27:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07DDEC433D2
        for <linux-kbuild@vger.kernel.org>; Wed, 17 May 2023 23:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684366070;
        bh=jQbL8iQnTsxTbZ2AExD1FHDrUl56PwltPGATZNpDTYc=;
        h=Date:From:To:Subject:From;
        b=oDIc2s/hmXyaPcOQHhB2Asm220i1FxZFL/ePYy7KfMaDPv39wavDTZnFMrGpZ5VaS
         VG7BE9tMbsqgadBObItcVKY7gfdfptRExqxySeOQoRUDlCUpBetk2PVc10OFTaDF0g
         GwTkbsn2FWWWcU1HxDFK4In7TkGuErPux14x+yp8tKTRXQAlVagxXWuXDI/bBfBwxW
         urzOIg3YCfwE5AsnRh93CgJrCqbtAbum0Iu3FoAcOr5dQwyXLBAqCTGpif5O0n2QIo
         KUvZZ3YIiFi5vC1+npV5tpcPuJk704V35xeNgVvtCOIiMuwFIMdxZlPySOLpJD1Nju
         HufK0Boqptexg==
Date:   Wed, 17 May 2023 18:27:48 -0500
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     linux-kbuild@vger.kernel.org
Subject: possible dependency error?
Message-ID: <ZGVi9HbI43R5trN8@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This is on v6.4-rc1.  I fat-fingered the make target (I intended
"pciehp.o", not "pciehp.c"), then interrupted the build when I noticed
my mistake:

  06:04:15 ~/linux (hotplug)$ make drivers/pci/hotplug/pciehp.c
    SYNC    include/config/auto.conf.cmd
  ^Cmake: *** [include/config/auto.conf.cmd] Deleting file 'include/generated/rustc_cfg'
  make: *** [include/config/auto.conf.cmd] Deleting file 'include/generated/autoconf.h'
  make[2]: *** [scripts/kconfig/Makefile:77: syncconfig] Interrupt
  make[1]: *** [Makefile:692: syncconfig] Interrupt
  make: *** [Makefile:793: include/config/auto.conf.cmd] Interrupt

Subsequent builds now fail ("pciehp.o" is *also* an incorrect target,
but doesn't seem related to the error):

  06:04:22 ~/linux (hotplug)$ make drivers/pci/hotplug/pciehp.o
    SYNC    include/config/auto.conf.cmd
    UPD     include/config/kernel.release
    UPD     include/generated/utsrelease.h
    UPD     include/generated/compile.h
    CC      scripts/mod/empty.o
    MKELF   scripts/mod/elfconfig.h
    HOSTCC  scripts/mod/modpost.o
    CC      scripts/mod/devicetable-offsets.s
    HOSTCC  scripts/mod/file2alias.o
    HOSTCC  scripts/mod/sumversion.o
    HOSTLD  scripts/mod/modpost
    CC      kernel/bounds.s
    CC      arch/x86/kernel/asm-offsets.s
    CALL    scripts/checksyscalls.sh
    DESCEND objtool
    HOSTCC  /home/bjorn/linux/tools/objtool/fixdep.o
    HOSTLD  /home/bjorn/linux/tools/objtool/fixdep-in.o
    LINK    /home/bjorn/linux/tools/objtool/fixdep
  make[4]: *** No rule to make target '/usr/include/x86_64-linux-gnu/bits/sys_errlist.h', needed by '/home/bjorn/linux/tools/objtool/libsubcmd/exec-cmd.o'.  Stop.
  make[3]: *** [Makefile:80: /home/bjorn/linux/tools/objtool/libsubcmd/libsubcmd-in.o] Error 2
  make[2]: *** [Makefile:78: /home/bjorn/linux/tools/objtool/libsubcmd/libsubcmd.a] Error 2
  make[1]: *** [Makefile:73: objtool] Error 2
  make: *** [Makefile:1440: tools/objtool] Error 2

I finally got the right target, but the build still fails:

  06:04:39 ~/linux (hotplug)$ make drivers/pci/hotplug/
    CALL    scripts/checksyscalls.sh
    DESCEND objtool
  make[4]: *** No rule to make target '/usr/include/x86_64-linux-gnu/bits/sys_errlist.h', needed by '/home/bjorn/linux/tools/objtool/libsubcmd/exec-cmd.o'.  Stop.
  make[3]: *** [Makefile:80: /home/bjorn/linux/tools/objtool/libsubcmd/libsubcmd-in.o] Error 2
  make[2]: *** [Makefile:78: /home/bjorn/linux/tools/objtool/libsubcmd/libsubcmd.a] Error 2
  make[1]: *** [Makefile:73: objtool] Error 2
  make: *** [Makefile:1440: tools/objtool] Error 2

After "make distclean", everything works as expected, so maybe this is
just the expected behavior after my initial user error?  I dunno; it
seemed surprising.  Just FYI.

Bjorn
