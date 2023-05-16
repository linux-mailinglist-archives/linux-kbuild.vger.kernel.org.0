Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50F7E705A85
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 May 2023 00:21:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbjEPWVZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 16 May 2023 18:21:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbjEPWVX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 May 2023 18:21:23 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C68F729F
        for <linux-kbuild@vger.kernel.org>; Tue, 16 May 2023 15:21:07 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id A74402221C;
        Tue, 16 May 2023 22:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1684275664; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=30ytYFWJWtsChKTibTzEP58GGrlZH7dunlLpgnjRQFI=;
        b=B+vUzYounRKopmC4Ul/VaGxyrsRYB/gtaJ5A9kyUpopeVW13CMq3d4PeI9ungFr0hlsHiR
        niqxE1MM7MTDSEXZAnSWwr0Jwp5pOuH+JlHwIOVN3oJhyDxmpkCVEcLi/DZxe0IkFez4V9
        i6F+PvmoXlKK7xbQO5iHIINvkXTVELA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1684275664;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=30ytYFWJWtsChKTibTzEP58GGrlZH7dunlLpgnjRQFI=;
        b=5gJBCqNsZ9Ls1jmfrb8eVmFjNcAGdW+LZYHIbWy69+rjoLciz7RkFrQB08+jOLNmTJfkqa
        fMOKbEamCT00GVCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 98CFD138F5;
        Tue, 16 May 2023 22:21:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id iL+DJNABZGT7MgAAMHmgww
        (envelope-from <mpdesouza@suse.com>); Tue, 16 May 2023 22:21:04 +0000
Date:   Wed, 17 May 2023 00:21:04 +0200
From:   Marcos Paulo de Souza <mpdesouza@suse.de>
To:     linux-kbuild@vger.kernel.org
Cc:     masahiroy@kernel.org
Subject: Re: Question: Adding new kselftest mod build rule resulting on "m2c:
 command not found"
Message-ID: <di7rk2hxyf3uczkl6cqmpttgwi4yuvgh3klsgj5zfkim6zkqha@mosbfoi7ttfv>
References: <rgbi7vgqel5f2vtzeuxykeh7civd6xxbxkohsgwgsond3vwbbv@hebfs24hxzir>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <rgbi7vgqel5f2vtzeuxykeh7civd6xxbxkohsgwgsond3vwbbv@hebfs24hxzir>
X-Spam-Status: No, score=-4.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Apr 24, 2023 at 02:46:53PM -0300, Marcos Paulo de Souza wrote:
> Hi,
> 
> I've being trying to understand a problem when adding a new rule to compile
> modules on ksefltests:
> 
> $ make kselftest TARGETS=livepatch
> make[2]: Entering directory '/home/mpdesouza/git/linux/tools/testing/selftests/livepatch'
> make[3]: Entering directory '/home/mpdesouza/git/linux/tools/testing/selftests/livepatch/test_modules'
> make -C /home/mpdesouza/git/linux M=/home/mpdesouza/git/linux/tools/testing/selftests/livepatch/test_modules modules
> m2c    -o scripts/Makefile.build -e scripts/Makefile.build scripts/Makefile.build.mod
> make[5]: m2c: No such file or directory
> 
> I managed to create a minimal reproducer for the problem here[1]. I'll attach
> the patches at the end of the email if you want to inspect the changes without
> getting the patches from github.

Humble ping :)

> 
> The curious part is, if I execute the ksefltests using a different target, it
> works:
> 
> $ make -C tools/testing/selftests run_tests TARGETS=livepatch
> make: Entering directory '/home/mpdesouza/git/linux/tools/testing/selftests'
> make[1]: Entering directory '/home/mpdesouza/git/linux/tools/testing/selftests/livepatch'
> make -C /home/mpdesouza/git/linux/tools/testing/selftests/livepatch/test_modules
> make[2]: Entering directory '/home/mpdesouza/git/linux/tools/testing/selftests/livepatch/test_modules'
> make -C /home/mpdesouza/git/linux M=/home/mpdesouza/git/linux/tools/testing/selftests/livepatch/test_modules modules
>   CC [M]  /home/mpdesouza/git/linux/tools/testing/selftests/livepatch/test_modules/mod_test.o
>   MODPOST /home/mpdesouza/git/linux/tools/testing/selftests/livepatch/test_modules/Module.symvers
>   CC [M]  /home/mpdesouza/git/linux/tools/testing/selftests/livepatch/test_modules/mod_test.mod.o
>   LD [M]  /home/mpdesouza/git/linux/tools/testing/selftests/livepatch/test_modules/mod_test.ko
>   BTF [M] /home/mpdesouza/git/linux/tools/testing/selftests/livepatch/test_modules/mod_test.ko
> make[2]: Leaving directory '/home/mpdesouza/git/linux/tools/testing/selftests/livepatch/test_modules'
> make[1]: Leaving directory '/home/mpdesouza/git/linux/tools/testing/selftests/livepatch'
> make[1]: Entering directory '/home/mpdesouza/git/linux/tools/testing/selftests/livepatch'
> make -C /home/mpdesouza/git/linux/tools/testing/selftests/livepatch/test_modules
> make[2]: Entering directory '/home/mpdesouza/git/linux/tools/testing/selftests/livepatch/test_modules'
> make -C /home/mpdesouza/git/linux M=/home/mpdesouza/git/linux/tools/testing/selftests/livepatch/test_modules modules
> make[2]: Leaving directory '/home/mpdesouza/git/linux/tools/testing/selftests/livepatch/test_modules'
> TAP version 13
> 1..1
> # selftests: livepatch: test-true.sh
> ok 1 selftests: livepatch: test-true.sh
> make[1]: Leaving directory '/home/mpdesouza/git/linux/tools/testing/selftests/livepatch'
> make: Leaving directory '/home/mpdesouza/git/linux/tools/testing/selftests'
> 
> In the root Makefile, ksefltest is defined as:
> 
> PHONY += kselftest
> kselftest: headers
>         $(Q)$(MAKE) -C $(srctree)/tools/testing/selftests run_tests
> 
> So, it's quite odd that a "mostly identical" rules being triggered result in
> that odd "m2c" command being invoked. Both outputs here were got from a openSUSE
> Tumbleweed machine, using make 4.4.1. When executing the kselftest target on a
> Ubuntu machine, the error is similar but not the same:
> 
> ...
> make[4]: Entering directory '/root/linux-kbuild'
> make -f ./scripts/Makefile.build obj=arch/x86/entry/syscalls all
> m2c    -o scripts/Makefile.lib -e scripts/Makefile.lib scripts/Makefile.lib.mod
> make[5]: m2c: No such file or directory
> make[5]: *** [<builtin>: scripts/Makefile.lib] Error 127
> make[4]: *** [arch/x86/Makefile:248: archheaders] Error 2
> ...
> 
> So, error is the same, but it failed on Makefile.lib, instead of Makefile.build
> from the previous run.
> 
> I also tried to change the KDIR from
> tools/testing/selftests/livepatch/test_modules/Makefile to point to KDIR ?=
> /lib/modules/$(shell uname -r)/build, but it then results in a different
> problem, making building_out_of_srctree to be set to false on
> /usr/src/linux-6.2.10-1-obj/x86_64/default/Makefile, which then results in
> different problems... So I would like to understand this problem first, since
> there was no way to stop make from calling "m2c". It was also tested on
> linux-kbuild/for-next, but the problem is the same.
> 
> I also found some links[2] mentioning "m2c", but the workarounds didn't solved
> the issue. At this point any help would be great!
> 
> [1]: https://github.com/marcosps/linux/commits/kbuild-next-kselftests
> [2]: https://lists.mcs.anl.gov/pipermail/petsc-users/2010-November/007299.html



