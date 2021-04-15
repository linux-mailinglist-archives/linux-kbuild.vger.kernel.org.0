Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7ED1360378
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Apr 2021 09:35:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231215AbhDOHfb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 15 Apr 2021 03:35:31 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:47603 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230090AbhDOHfa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Apr 2021 03:35:30 -0400
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 13F7Ysge006199;
        Thu, 15 Apr 2021 16:34:55 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 13F7Ysge006199
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1618472095;
        bh=OD3UH9B00q+oHiwfctNQok660hdenl+h06KhhwWImE4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=2ZRJZV3P2+7LuX6FUG/vyFLoTTmX4f3gIShVelb8Ub9i9Sl1F8ycDIc36CVKPWOtT
         GjDeK1QhJpskypXZyLQUmEDEF9SYYnUd43cY5pH54Owaxq1gldQhpc1iGViBzwki9S
         dAnuNKWIM7Ev5u4+a7XGZpwdJCczS5p7irZdwuOFI9/ZRgSHHgbKHUDlciBnPwIS2l
         JPfRVUD2J4a+HbwT21ia5VsTpzwcPrlwS6zMTox823cZRf/HX4m6cbLT920PjRb2Gb
         9aDW55h6x+oO0EPwr/GOr8EV0YH7qu3WYEwe6LqVrBIh33Kq9GWN3jajFDYeLKtGjD
         Dpcoz5NYUWtvQ==
X-Nifty-SrcIP: [209.85.214.171]
Received: by mail-pl1-f171.google.com with SMTP id j7so11579681plx.2;
        Thu, 15 Apr 2021 00:34:55 -0700 (PDT)
X-Gm-Message-State: AOAM530KMVZL62j5ITsQPzngyKeFCv2n1we0RvjxlaUQOBPM5w7JOPUJ
        rmghu0TcmZWzh5XAlHkBB24Pki81vW1RZ66xMOA=
X-Google-Smtp-Source: ABdhPJzRbpjHLU63bJTalOwvIG9Y/CwD/naLKG/8Bv4KHJDhxu8mJxCHQSzrLOECFTJSQrKUrtme+9hbqp1PBj7+nJQ=
X-Received: by 2002:a17:902:d645:b029:e8:ec90:d097 with SMTP id
 y5-20020a170902d645b02900e8ec90d097mr2325772plh.47.1618472094311; Thu, 15 Apr
 2021 00:34:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210228061028.239459-1-masahiroy@kernel.org> <20210228061028.239459-3-masahiroy@kernel.org>
 <86dadf33-70f7-a5ac-cb8c-64966d2f45a1@linux.ibm.com> <395d2db1-b860-0da2-a859-d1d840508a46@de.ibm.com>
In-Reply-To: <395d2db1-b860-0da2-a859-d1d840508a46@de.ibm.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 15 Apr 2021 16:34:17 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQB0pJay==-FvvYNYR2TDymtznPU_FELWJOBPaAjnYrcQ@mail.gmail.com>
Message-ID: <CAK7LNAQB0pJay==-FvvYNYR2TDymtznPU_FELWJOBPaAjnYrcQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] kbuild: spilt cc-option and friends to scripts/Makefile.compiler
To:     Christian Borntraeger <borntraeger@de.ibm.com>
Cc:     Janosch Frank <frankja@linux.ibm.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Marc Hartmayer <mhartmay@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Apr 13, 2021 at 10:11 PM Christian Borntraeger
<borntraeger@de.ibm.com> wrote:
>
>
>
> On 13.04.21 14:51, Janosch Frank wrote:
> > On 2/28/21 7:10 AM, Masahiro Yamada wrote:
> >> scripts/Kbuild.include is included everywhere, but macros such as
> >> cc-option are needed by build targets only.
> >>
> >> For example, when 'make clean' traverses the tree, it does not need
> >> to evaluate $(call cc-option,).
> >>
> >> Split cc-option, ld-option, etc. to scripts/Makefile.compiler, which
> >> is only included from the top Makefile and scripts/Makefile.build.
> >>
> >> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> >
> > This commit broke the KVM selftest compilation under s390 in linux-next
> > for me. Funny enough the compilation is only broken on Ubuntu, under
> > Fedora the test fails with an assertion.
> >
> > FEDORA:
> > [root@fedora kvm]# ./set_memory_region_test
> > Allowed number of memory slots: 32767
> > ==== Test Assertion Failure ====
> >    lib/kvm_util.c:142: vm->fd >= 0
> >    pid=1541645 tid=1541645 - Invalid argument
> >       1       0x0000000001002f4b: vm_open at kvm_util.c:142
> >       2        (inlined by) vm_create at kvm_util.c:258
> >       3       0x00000000010015ef: test_add_max_memory_regions at
> > set_memory_region_test.c:351
> >       4        (inlined by) main at set_memory_region_test.c:397
> >       5       0x000003ffa3d2bb89: ?? ??:0
> >       6       0x00000000010017ad: .annobin_abi_note.c.hot at crt1.o:?
> >    KVM_CREATE_VM ioctl failed, rc: -1 errno: 22
> >
> >
> > Ubuntu:
> > make[1]: Leaving directory '/mnt/dev/linux'
> > gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=gnu99
> > -fno-stack-protector -fno-PIE -I../../../../tools/include
> > -I../../../../tools/arch/s390/include -I../../../../usr/include/
> > -Iinclude -Ilib -Iinclude/s390x -I..   -c lib/sparsebit.c -o
> > /mnt/dev/linux/tools/testing/selftests/kvm/lib/sparsebit.o
> > gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=gnu99
> > -fno-stack-protector -fno-PIE -I../../../../tools/include
> > -I../../../../tools/arch/s390/include -I../../../../usr/include/
> > -Iinclude -Ilib -Iinclude/s390x -I..   -c lib/kvm_util.c -o
> > /mnt/dev/linux/tools/testing/selftests/kvm/lib/kvm_util.o
> > gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=gnu99
> > -fno-stack-protector -fno-PIE -I../../../../tools/include
> > -I../../../../tools/arch/s390/include -I../../../../usr/include/
> > -Iinclude -Ilib/s390x -Iinclude/s390x -I..   -c
> > lib/s390x/diag318_test_handler.c -o
> > /mnt/dev/linux/tools/testing/selftests/kvm/lib/s390x/diag318_test_handler.o
> > ar crs /mnt/dev/linux/tools/testing/selftests/kvm/libkvm.a
> > /mnt/dev/linux/tools/testing/selftests/kvm/lib/assert.o
> > /mnt/dev/linux/tools/testing/selftests/kvm/lib/elf.o
> > /mnt/dev/linux/tools/testing/selftests/kvm/lib/io.o
> > /mnt/dev/linux/tools/testing/selftests/kvm/lib/kvm_util.o
> > /mnt/dev/linux/tools/testing/selftests/kvm/lib/sparsebit.o
> > /mnt/dev/linux/tools/testing/selftests/kvm/lib/test_util.o
> > /mnt/dev/linux/tools/testing/selftests/kvm/lib/guest_modes.o
> > /mnt/dev/linux/tools/testing/selftests/kvm/lib/perf_test_util.o
> > /mnt/dev/linux/tools/testing/selftests/kvm/lib/s390x/processor.o
> > /mnt/dev/linux/tools/testing/selftests/kvm/lib/s390x/ucall.o
> > /mnt/dev/linux/tools/testing/selftests/kvm/lib/s390x/diag318_test_handler.o
> > gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=gnu99
> > -fno-stack-protector -fno-PIE -I../../../../tools/include
> > -I../../../../tools/arch/s390/include -I../../../../usr/include/
> > -Iinclude -Is390x -Iinclude/s390x -I..  -pthread    s390x/memop.c
> > /mnt/dev/linux/tools/testing/selftests/kvm/libkvm.a  -o
> > /mnt/dev/linux/tools/testing/selftests/kvm/s390x/memop
> > /usr/bin/ld: /tmp/ccFU8WYF.o: `stdout@@GLIBC_2.2' non-PLT reloc for
> > symbol defined in shared library and accessed from executable (rebuild
> > file with -fPIC ?)
> > /usr/bin/ld: final link failed: bad value
> > collect2: error: ld returned 1 exit status
> > make: *** [../lib.mk:139:
> > /mnt/dev/linux/tools/testing/selftests/kvm/s390x/memop] Error 1
> >
>
>
>
> It looks like that from tools/testing/selftests/kvm/Makefile
> additional linker flags are being ignored with this patch.
>
> no-pie-option := $(call try-run, echo 'int main() { return 0; }' | \
>          $(CC) -Werror -no-pie -x c - -o "$$TMP", -no-pie)
>
> # On s390, build the testcases KVM-enabled
> pgste-option = $(call try-run, echo 'int main() { return 0; }' | \
>          $(CC) -Werror -Wl$(comma)--s390-pgste -x c - -o "$$TMP",-Wl$(comma)--s390-pgste)
>
>
> LDFLAGS += -pthread $(no-pie-option) $(pgste-option)
>


Thanks.

I will separate Kbuild and the tool build system.
https://patchwork.kernel.org/project/linux-kbuild/patch/20210415072700.147125-2-masahiroy@kernel.org/

I do not want to be bothered by the can of worms.





-- 
Best Regards
Masahiro Yamada
