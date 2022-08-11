Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C99658FE44
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Aug 2022 16:31:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234295AbiHKObD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Aug 2022 10:31:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235528AbiHKObA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Aug 2022 10:31:00 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B4C8774CF4
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Aug 2022 07:30:57 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 06381106F;
        Thu, 11 Aug 2022 07:30:58 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.43.154])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 460013F5A1;
        Thu, 11 Aug 2022 07:30:56 -0700 (PDT)
Date:   Thu, 11 Aug 2022 15:30:50 +0100
From:   Mark Rutland <mark.rutland@arm.com>
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: Odd kbuild behaviour
Message-ID: <YvUSmt/LinmjCY+w@FVFF77S0Q05N>
References: <YvUQOwL6lD4/5/U6@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YvUQOwL6lD4/5/U6@shell.armlinux.org.uk>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Aug 11, 2022 at 03:20:43PM +0100, Russell King (Oracle) wrote:
> Hi,
> 
> Please can someone try to explain what is going on when I ask for a .S
> file to be built to an object with 5.19 and GNU make 4.3 from Debian
> Bullseye (although I don't think this is a make version issue):
> 
> $ rm ../build/multi/arch/arm/lib/findbit.o
> $ make -j2 CROSS_COMPILE="arm-linux-gnueabihf-" ARCH="arm" O=../build/multi arch/arm/lib/findbit.o
> make[1]: Entering directory '/home/rmk/git/build/multi'
>   GEN     Makefile
>   CALL    /home/rmk/git/linux-rmk/scripts/atomic/check-atomics.sh
>   CALL    /home/rmk/git/linux-rmk/scripts/checksyscalls.sh
> make[3]: *** No rule to make target 'arch/arm/lib/findbit.o'.  Stop.
> make[2]: *** [/home/rmk/git/linux-rmk/scripts/Makefile.build:441: __build] Error 2
> make[1]: *** [/home/rmk/git/linux-rmk/Makefile:1843: arch/arm] Error 2
> make[1]: *** Waiting for unfinished jobs....
>   AS      arch/arm/lib/findbit.o
> make[1]: Leaving directory '/home/rmk/git/build/multi'
> make: *** [Makefile:219: __sub-make] Error 2

FWIW, I think this is to do with lib-y directories rather than wheether the
object is C or assembly:

[mark@lakrids:~/src/linux]% ls arch/arm64/lib 
clear_page.S  copy_from_user.S  copy_template.S  crc32.S  delay.c         insn.c           Makefile  memcmp.S  memset.S  strchr.S  strlen.S   strnlen.S  tishift.S             xor-neon.c
clear_user.S  copy_page.S       copy_to_user.S   csum.c   error-inject.c  kasan_sw_tags.S  memchr.S  memcpy.S  mte.S     strcmp.S  strncmp.S  strrchr.S  uaccess_flushcache.c
[mark@lakrids:~/src/linux]% usekorg 12.1.0 make ARCH=arm64 CROSS_COMPILE=aarch64-linux- arch/arm64/lib/insn.o
  CALL    scripts/checksyscalls.sh
  CALL    scripts/atomic/check-atomics.sh
make[2]: *** No rule to make target 'arch/arm64/lib/insn.o'.  Stop.
make[1]: *** [scripts/Makefile.build:441: __build] Error 2
make: *** [Makefile:1844: arch/arm64] Error 2
[mark@lakrids:~/src/linux]% usekorg 12.1.0 make ARCH=arm64 CROSS_COMPILE=aarch64-linux- arch/arm64/lib/copy_page.o
  CALL    scripts/checksyscalls.sh
  CALL    scripts/atomic/check-atomics.sh
make[2]: *** No rule to make target 'arch/arm64/lib/copy_page.o'.  Stop.
make[1]: *** [scripts/Makefile.build:441: __build] Error 2
make: *** [Makefile:1844: arch/arm64] Error 2
[mark@lakrids:~/src/linux]% usekorg 12.1.0 make ARCH=arm64 CROSS_COMPILE=aarch64-linux- arch/arm64/lib            
  CALL    scripts/checksyscalls.sh
  CALL    scripts/atomic/check-atomics.sh
  AS      arch/arm64/lib/clear_page.o
  AS      arch/arm64/lib/clear_user.o
  AS      arch/arm64/lib/copy_from_user.o
  AS      arch/arm64/lib/copy_page.o
  AS      arch/arm64/lib/copy_to_user.o
  CC      arch/arm64/lib/csum.o
  CC      arch/arm64/lib/delay.o
  CC      arch/arm64/lib/insn.o
  AS      arch/arm64/lib/memchr.o
  AS      arch/arm64/lib/memcmp.o
  AS      arch/arm64/lib/memcpy.o
  AS      arch/arm64/lib/memset.o
  AS      arch/arm64/lib/strchr.o
  AS      arch/arm64/lib/strcmp.o
  AS      arch/arm64/lib/strlen.o
  AS      arch/arm64/lib/strncmp.o
  AS      arch/arm64/lib/strnlen.o
  AS      arch/arm64/lib/strrchr.o
  AS      arch/arm64/lib/tishift.o
  AR      arch/arm64/lib/lib.a
  AS      arch/arm64/lib/crc32.o
  AS      arch/arm64/lib/mte.o
  AR      arch/arm64/lib/built-in.a


... clearly it figures how to build the directory as a whole, but can't figure
out how to build indiviual objects within that.

Thanks,
Mark
