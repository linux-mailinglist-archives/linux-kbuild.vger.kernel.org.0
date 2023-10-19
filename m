Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4DA07D0211
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Oct 2023 20:50:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346428AbjJSSuQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 19 Oct 2023 14:50:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345159AbjJSSuP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 19 Oct 2023 14:50:15 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B826318D
        for <linux-kbuild@vger.kernel.org>; Thu, 19 Oct 2023 11:50:10 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 2DD7721A9A;
        Thu, 19 Oct 2023 18:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1697741409; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1vodCvbeIpQ75LZbyQYZLBHMqc7+iilOylUz9Ax4Q14=;
        b=vblQ6+ZYxA/q2WUr2vsppvaTK9TMpifh5Z8YcJ+DBcGljCmVYRqWROTj7bWw//8Cxr9zf2
        vJ11rp0Y2mypcwqt1U5+10dsSCkNVBfqrgDiCUGKdPyx4TFsDTlECzaRReYjZnqerH7f6Z
        9+WomWf/ysbqHT/39/aMz0TFkL9xZ4w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1697741409;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1vodCvbeIpQ75LZbyQYZLBHMqc7+iilOylUz9Ax4Q14=;
        b=EyXJ+qgGvsqikQqwBLEoz6MbtC6nGqq4oRH0FeOvoTXnwbT5AhdV9AfGsITcdivBfhwfPu
        a2+/7j1y3+1GT6DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A6191139C2;
        Thu, 19 Oct 2023 18:50:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id eLV1GmB6MWVqBQAAMHmgww
        (envelope-from <mpdesouza@suse.com>); Thu, 19 Oct 2023 18:50:08 +0000
Date:   Thu, 19 Oct 2023 15:50:05 -0300
From:   Marcos Paulo de Souza <mpdesouza@suse.de>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, mbenes@suse.cz
Subject: Re: # Toplevel Makefile doesn't process module build correctly on
 recursive make calls
Message-ID: <b73okxdwey2s2pdjepb3tbrlk55utqjvnkrhkyx74bvm3tzvfy@kqxltdo7s2sz>
References: <lp2gjgzwxvhluh7fpmmo2drhii7bxcrlvxacclfgsl4ycubjhc@jjq2jfvow4y2>
 <CAK7LNATLv2KSWo0BnFGXi73GVdnvc1EX23TvTkKT1U-krgBnNQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="f3zuymrle5xnkkxa"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNATLv2KSWo0BnFGXi73GVdnvc1EX23TvTkKT1U-krgBnNQ@mail.gmail.com>
Authentication-Results: smtp-out1.suse.de;
        none
X-Spam-Level: 
X-Spam-Score: -6.20
X-Spamd-Result: default: False [-6.20 / 50.00];
         ARC_NA(0.00)[];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         BAYES_HAM(-3.00)[100.00%];
         FROM_HAS_DN(0.00)[];
         RCPT_COUNT_THREE(0.00)[3];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[multipart/mixed,text/plain,text/x-patch];
         HAS_ATTACHMENT(0.00)[];
         NEURAL_HAM_LONG(-3.00)[-1.000];
         DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
         NEURAL_HAM_SHORT(-1.00)[-1.000];
         FORGED_SENDER(0.30)[mpdesouza@suse.de,mpdesouza@suse.com];
         MIME_TRACE(0.00)[0:+,1:+,2:+];
         MID_RHS_NOT_FQDN(0.50)[];
         RCVD_COUNT_TWO(0.00)[2];
         FROM_NEQ_ENVFROM(0.10)[mpdesouza@suse.de,mpdesouza@suse.com];
         RCVD_TLS_ALL(0.00)[]
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--f3zuymrle5xnkkxa
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sat, Oct 14, 2023 at 05:35:55PM +0900, Masahiro Yamada wrote:
> On Tue, Oct 10, 2023 at 5:43 AM Marcos Paulo de Souza <mpdesouza@suse.de> wrote:
> >
> > Hi all,
> >
> > I found an issue while moving the livepatch kselftest modules to be built on the
> > fly, instead of building them on kernel building.
> >
> > If, for some reason, there is a recursive make invocation that starts from the
> > top level Makefile and in the leaf Makefile it tries to build a module (using M=
> > in the make invocation), it doesn't produce the module. This happens because the
> > toplevel Makefile checks for M= only once. This is controlled by the
> > sub_make_done variable, which is exported after checking the command line
> > options are passed to the top level Makefile. Once this variable is set it's
> > the M= setting is never checked again on the recursive call.
> >
> > This can be observed when cleaning the bpf kselftest dir. When calling
> >
> >         $ make TARGETS="bpf" SKIP_TARGETS="" kselftest-clean
> >
> > What happens:
> >
> >         1. It checks for some command line settings (like M=) was passed (it wasn't),
> >         set some definitions and exports sub_make_done.
> >
> >         2. Jump into tools/testing/selftests/bpf, and calls the clean target.
> >
> >         3. The clean target is overwritten to remove some files and then jump to
> >         bpf_testmod dir and call clean there
> >
> >         4. On bpf_testmod/Makefile, the clean target will execute
> >                 $(Q)make -C $(KDIR) M=$(BPF_TESTMOD_DIR) clean
> >
> >         5. The KDIR is to toplevel dir. The top Makefile will check that sub_make_done was
> >         already set, ignoring the M= setting.
> >
> >         6. As M= wasn't checked, KBUILD_EXTMOD isn't set, and the clean target applies
> >         to the kernel as a whole, making it clean all generated code/objects and
> >         everything.
> >
> > One way to avoid it is to call "unexport sub_make_done" on
> > tools/testing/selftests/bpf/bpf_testmod/Makefile before processing the all
> > target, forcing the toplevel Makefile to process the M=, producing the module
> > file correctly.
> >
> > If the M=dir points to /lib/modules/.../build, then it fails with "m2c: No such
> > file", which I already reported here[1]. At the time this problem was treated
> > like a problem with kselftest infrastructure.
> >
> > Important: The process works fine if the initial make invocation is targeted to a
> > different directory (using -C), since it doesn't goes through the toplevel
> > Makefile, and sub_make_done variable is not set.
> >
> > I attached a minimal reproducer, that can be used to better understand the
> > problem. The "make testmod" and "make testmod-clean" have the same effect that
> > can be seem with the bpf kselftests. There is a unexport call commented on
> > test-mods/Makefile, and once that is called the process works as expected.
> >
> > Is there a better way to fix this? Is this really a problem, or am I missing
> > something?
> 
> 
> Or, using KBUILD_EXTMOD will work too.

Yes, that works, only if set to /lib/modules:

$ make kselftest TARGETS=bpf SKIP_TARGETS=""
make[3]: Entering directory '/home/mpdesouza/git/linux/tools/testing/selftests/bpf'
  MOD      bpf_testmod.ko
warning: the compiler differs from the one used to build the kernel
  The kernel was built by: gcc (SUSE Linux) 13.2.1 20230803 [revision cc279d6c64562f05019e1d12d0d825f9391b5553]
  You are using:           gcc (SUSE Linux) 13.2.1 20230912 [revision b96e66fd4ef3e36983969fb8cdd1956f551a074b]
  CC [M]  /home/mpdesouza/git/linux/tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.o
  MODPOST /home/mpdesouza/git/linux/tools/testing/selftests/bpf/bpf_testmod/Module.symvers
  CC [M]  /home/mpdesouza/git/linux/tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.mod.o
  LD [M]  /home/mpdesouza/git/linux/tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.ko
  BTF [M] /home/mpdesouza/git/linux/tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.ko
Skipping BTF generation for /home/mpdesouza/git/linux/tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.ko due to unavailability of vmlinux
  BINARY   xdp_synproxy
...

But if we set the KBUILD_EXTMOD to toplevel Makefile, it fails with a different
strange issue:

$ make kselftest TARGETS=bpf SKIP_TARGETS=""
  BINARY   urandom_read
  MOD      bpf_testmod.ko
m2c    -o scripts/Makefile.build -e scripts/Makefile.build scripts/Makefile.build.mod
make[6]: m2c: No such file or directory
make[6]: *** [<builtin>: scripts/Makefile.build] Error 127
make[5]: *** [Makefile:1913: /home/mpdesouza/git/linux/tools/testing/selftests/bpf/bpf_testmod] Error 2
make[4]: *** [Makefile:19: all] Error 2
make[3]: *** [Makefile:229: /home/mpdesouza/git/linux/tools/testing/selftests/bpf/bpf_testmod.ko] Error 2
make[3]: Leaving directory '/home/mpdesouza/git/linux/tools/testing/selftests/bpf'
make[2]: *** [Makefile:175: all] Error 2
make[1]: *** [/home/mpdesouza/git/linux/Makefile:1362: kselftest] Error 2

I attached a patch that can reproduce the case where it works, and the case
where it doesn't by changing the value of KDIR.

I understand that KBUILD_EXTMOD, as the name implies, was designed to build
"external" modules, and not ones that live inside kernel, but how could this be
solved? For the sake of my initial about livepatch kselftests, KBUILD_EXTMOD
will suffice, since we will target /lib/modules, but I would like to know what
we can do in this case. Do you have other suggestions?

Thanks in advance,
  Marcos

> 
> 
> 
> 
> 
> --
> Best Regards
> Masahiro Yamada

--f3zuymrle5xnkkxa
Content-Type: text/x-patch; charset=us-ascii
Content-Disposition: attachment; filename="bpfmod.diff"

diff --git a/tools/testing/selftests/bpf/bpf_testmod/Makefile b/tools/testing/selftests/bpf/bpf_testmod/Makefile
index 15cb36c4483a..1dce76f35405 100644
--- a/tools/testing/selftests/bpf/bpf_testmod/Makefile
+++ b/tools/testing/selftests/bpf/bpf_testmod/Makefile
@@ -1,5 +1,6 @@
 BPF_TESTMOD_DIR := $(realpath $(dir $(abspath $(lastword $(MAKEFILE_LIST)))))
-KDIR ?= $(abspath $(BPF_TESTMOD_DIR)/../../../../..)
+#KDIR ?= $(abspath $(BPF_TESTMOD_DIR)/../../../../..)
+KDIR ?= /lib/modules/$(shell uname -r)/build
 
 ifeq ($(V),1)
 Q =
@@ -12,9 +13,10 @@ MODULES = bpf_testmod.ko
 obj-m += bpf_testmod.o
 CFLAGS_bpf_testmod.o = -I$(src)
 
+export KBUILD_EXTMOD := $(BPF_TESTMOD_DIR)
+
 all:
-	+$(Q)make -C $(KDIR) M=$(BPF_TESTMOD_DIR) modules
+	+$(Q)make -C $(KDIR) modules
 
 clean:
-	+$(Q)make -C $(KDIR) M=$(BPF_TESTMOD_DIR) clean
-
+	+$(Q)make -C $(KDIR) clean

--f3zuymrle5xnkkxa--
