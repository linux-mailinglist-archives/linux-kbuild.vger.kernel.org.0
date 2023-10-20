Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2448A7D0753
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Oct 2023 06:21:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346941AbjJTEVs (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 20 Oct 2023 00:21:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346919AbjJTEVr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 20 Oct 2023 00:21:47 -0400
Received: from mail.avm.de (mail.avm.de [IPv6:2001:bf0:244:244::119])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1037BC9
        for <linux-kbuild@vger.kernel.org>; Thu, 19 Oct 2023 21:21:44 -0700 (PDT)
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [212.42.244.71])
        by mail.avm.de (Postfix) with ESMTPS;
        Fri, 20 Oct 2023 06:21:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
        t=1697775701; bh=HN3ppZeWhhzzh2jT+6ySso3DGC38FuNt93n6SqnCH84=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jZeKKFJnITYk8nBUNI1yTwt9StbFGwoGqdheE5xlQ0Wj9XAno4zGi8IJfAMUoEtdR
         5AGafwnZN1Vwt9XfFts2dl3vGg8fX5H/8yjWxQQIj7/FLPfo0yuzWhE/+QROf1lrBW
         QIrjRnf4z5tzQrGSvJuqEqk6gI6MVZ3TH1OW6D2I=
Received: from buildd.core.avm.de (buildd-sv-01.avm.de [172.16.0.225])
        by mail-auth.avm.de (Postfix) with ESMTPA id D9039807EB;
        Fri, 20 Oct 2023 06:21:40 +0200 (CEST)
Received: by buildd.core.avm.de (Postfix, from userid 1000)
        id CB47E180C9E; Fri, 20 Oct 2023 06:21:40 +0200 (CEST)
Date:   Fri, 20 Oct 2023 06:21:40 +0200
From:   Nicolas Schier <n.schier@avm.de>
To:     Marcos Paulo de Souza <mpdesouza@suse.de>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org, mbenes@suse.cz
Subject: Re: # Toplevel Makefile doesn't process module build correctly on
 recursive make calls
Message-ID: <ZTIAVNpVhPfSSQl8@buildd.core.avm.de>
Mail-Followup-To: Marcos Paulo de Souza <mpdesouza@suse.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org, mbenes@suse.cz
References: <lp2gjgzwxvhluh7fpmmo2drhii7bxcrlvxacclfgsl4ycubjhc@jjq2jfvow4y2>
 <CAK7LNATLv2KSWo0BnFGXi73GVdnvc1EX23TvTkKT1U-krgBnNQ@mail.gmail.com>
 <b73okxdwey2s2pdjepb3tbrlk55utqjvnkrhkyx74bvm3tzvfy@kqxltdo7s2sz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b73okxdwey2s2pdjepb3tbrlk55utqjvnkrhkyx74bvm3tzvfy@kqxltdo7s2sz>
X-purgate-ID: 149429::1697775701-95E3035E-80668C05/0/0
X-purgate-type: clean
X-purgate-size: 7780
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate: clean
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Oct 19, 2023 at 03:50:05PM -0300, Marcos Paulo de Souza wrote:
> On Sat, Oct 14, 2023 at 05:35:55PM +0900, Masahiro Yamada wrote:
> > On Tue, Oct 10, 2023 at 5:43 AM Marcos Paulo de Souza <mpdesouza@suse.de> wrote:
> > >
> > > Hi all,
> > >
> > > I found an issue while moving the livepatch kselftest modules to be built on the
> > > fly, instead of building them on kernel building.
> > >
> > > If, for some reason, there is a recursive make invocation that starts from the
> > > top level Makefile and in the leaf Makefile it tries to build a module (using M=
> > > in the make invocation), it doesn't produce the module. This happens because the
> > > toplevel Makefile checks for M= only once. This is controlled by the
> > > sub_make_done variable, which is exported after checking the command line
> > > options are passed to the top level Makefile. Once this variable is set it's
> > > the M= setting is never checked again on the recursive call.
> > >
> > > This can be observed when cleaning the bpf kselftest dir. When calling
> > >
> > >         $ make TARGETS="bpf" SKIP_TARGETS="" kselftest-clean
> > >
> > > What happens:
> > >
> > >         1. It checks for some command line settings (like M=) was passed (it wasn't),
> > >         set some definitions and exports sub_make_done.
> > >
> > >         2. Jump into tools/testing/selftests/bpf, and calls the clean target.
> > >
> > >         3. The clean target is overwritten to remove some files and then jump to
> > >         bpf_testmod dir and call clean there
> > >
> > >         4. On bpf_testmod/Makefile, the clean target will execute
> > >                 $(Q)make -C $(KDIR) M=$(BPF_TESTMOD_DIR) clean
> > >
> > >         5. The KDIR is to toplevel dir. The top Makefile will check that sub_make_done was
> > >         already set, ignoring the M= setting.
> > >
> > >         6. As M= wasn't checked, KBUILD_EXTMOD isn't set, and the clean target applies
> > >         to the kernel as a whole, making it clean all generated code/objects and
> > >         everything.
> > >
> > > One way to avoid it is to call "unexport sub_make_done" on
> > > tools/testing/selftests/bpf/bpf_testmod/Makefile before processing the all
> > > target, forcing the toplevel Makefile to process the M=, producing the module
> > > file correctly.
> > >
> > > If the M=dir points to /lib/modules/.../build, then it fails with "m2c: No such
> > > file", which I already reported here[1]. At the time this problem was treated
> > > like a problem with kselftest infrastructure.
> > >
> > > Important: The process works fine if the initial make invocation is targeted to a
> > > different directory (using -C), since it doesn't goes through the toplevel
> > > Makefile, and sub_make_done variable is not set.
> > >
> > > I attached a minimal reproducer, that can be used to better understand the
> > > problem. The "make testmod" and "make testmod-clean" have the same effect that
> > > can be seem with the bpf kselftests. There is a unexport call commented on
> > > test-mods/Makefile, and once that is called the process works as expected.
> > >
> > > Is there a better way to fix this? Is this really a problem, or am I missing
> > > something?
> > 
> > 
> > Or, using KBUILD_EXTMOD will work too.
> 
> Yes, that works, only if set to /lib/modules:
> 
> $ make kselftest TARGETS=bpf SKIP_TARGETS=""
> make[3]: Entering directory '/home/mpdesouza/git/linux/tools/testing/selftests/bpf'
>   MOD      bpf_testmod.ko
> warning: the compiler differs from the one used to build the kernel
>   The kernel was built by: gcc (SUSE Linux) 13.2.1 20230803 [revision cc279d6c64562f05019e1d12d0d825f9391b5553]
>   You are using:           gcc (SUSE Linux) 13.2.1 20230912 [revision b96e66fd4ef3e36983969fb8cdd1956f551a074b]
>   CC [M]  /home/mpdesouza/git/linux/tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.o
>   MODPOST /home/mpdesouza/git/linux/tools/testing/selftests/bpf/bpf_testmod/Module.symvers
>   CC [M]  /home/mpdesouza/git/linux/tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.mod.o
>   LD [M]  /home/mpdesouza/git/linux/tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.ko
>   BTF [M] /home/mpdesouza/git/linux/tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.ko
> Skipping BTF generation for /home/mpdesouza/git/linux/tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.ko due to unavailability of vmlinux
>   BINARY   xdp_synproxy
> ...
> 
> But if we set the KBUILD_EXTMOD to toplevel Makefile, it fails with a different
> strange issue:
> 
> $ make kselftest TARGETS=bpf SKIP_TARGETS=""
>   BINARY   urandom_read
>   MOD      bpf_testmod.ko
> m2c    -o scripts/Makefile.build -e scripts/Makefile.build scripts/Makefile.build.mod
> make[6]: m2c: No such file or directory
> make[6]: *** [<builtin>: scripts/Makefile.build] Error 127
> make[5]: *** [Makefile:1913: /home/mpdesouza/git/linux/tools/testing/selftests/bpf/bpf_testmod] Error 2
> make[4]: *** [Makefile:19: all] Error 2
> make[3]: *** [Makefile:229: /home/mpdesouza/git/linux/tools/testing/selftests/bpf/bpf_testmod.ko] Error 2
> make[3]: Leaving directory '/home/mpdesouza/git/linux/tools/testing/selftests/bpf'
> make[2]: *** [Makefile:175: all] Error 2
> make[1]: *** [/home/mpdesouza/git/linux/Makefile:1362: kselftest] Error 2
> 
> I attached a patch that can reproduce the case where it works, and the case
> where it doesn't by changing the value of KDIR.
> 
> I understand that KBUILD_EXTMOD, as the name implies, was designed to build
> "external" modules, and not ones that live inside kernel, but how could this be
> solved?

It seems to me as if there is some confusion about in-tree vs.
out-of-tree kmods.

KBUILD_EXTMOD and M are almost the same and indicate that you want to
build _external_ (=out-of-tree) kernel modules.  In-tree modules are
only those that stay in-tree _and_ are built along with the kernel.
Thus, 'make modules KBUILD_EXTMOD=fs/ext4' could be used to build ext4
kmod as "out-of-tree" kernel module, that even taints the kernel if it
gets loaded.

If you want bpf_testmod.ko to be an in-tree kmod, it has to be build
during the usual kernel build, not by running 'make kselftest'.

If you use 'make -C $(KDIR)' for building out-of-tree kmods, KDIR has to
point to the kernel build directory.  (Or it may point to the source
tree if you give O=$(BUILDDIR) as well).

HTH.

Kind regards,
Nicolas


> For the sake of my initial about livepatch kselftests, KBUILD_EXTMOD
> will suffice, since we will target /lib/modules, but I would like to know what
> we can do in this case. Do you have other suggestions?
> 
> Thanks in advance,
>   Marcos
> 
> > 
> > 
> > 
> > 
> > 
> > --
> > Best Regards
> > Masahiro Yamada

> diff --git a/tools/testing/selftests/bpf/bpf_testmod/Makefile b/tools/testing/selftests/bpf/bpf_testmod/Makefile
> index 15cb36c4483a..1dce76f35405 100644
> --- a/tools/testing/selftests/bpf/bpf_testmod/Makefile
> +++ b/tools/testing/selftests/bpf/bpf_testmod/Makefile
> @@ -1,5 +1,6 @@
>  BPF_TESTMOD_DIR := $(realpath $(dir $(abspath $(lastword $(MAKEFILE_LIST)))))
> -KDIR ?= $(abspath $(BPF_TESTMOD_DIR)/../../../../..)
> +#KDIR ?= $(abspath $(BPF_TESTMOD_DIR)/../../../../..)
> +KDIR ?= /lib/modules/$(shell uname -r)/build
>  
>  ifeq ($(V),1)
>  Q =
> @@ -12,9 +13,10 @@ MODULES = bpf_testmod.ko
>  obj-m += bpf_testmod.o
>  CFLAGS_bpf_testmod.o = -I$(src)
>  
> +export KBUILD_EXTMOD := $(BPF_TESTMOD_DIR)
> +
>  all:
> -	+$(Q)make -C $(KDIR) M=$(BPF_TESTMOD_DIR) modules
> +	+$(Q)make -C $(KDIR) modules
>  
>  clean:
> -	+$(Q)make -C $(KDIR) M=$(BPF_TESTMOD_DIR) clean
> -
> +	+$(Q)make -C $(KDIR) clean

