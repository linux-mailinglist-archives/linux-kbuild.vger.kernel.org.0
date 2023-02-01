Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 250C4679D7E
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jan 2023 16:30:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232793AbjAXPaO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 24 Jan 2023 10:30:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234813AbjAXPaN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Jan 2023 10:30:13 -0500
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com [IPv6:2607:f8b0:4864:20::92a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 325113802C
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Jan 2023 07:30:11 -0800 (PST)
Received: by mail-ua1-x92a.google.com with SMTP id c15so3641304uas.2
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Jan 2023 07:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UyCfMSVt5YQ93dvQzsfOUKEDIKXZpwg4MvkDLyqNHiA=;
        b=XZ2VY4ncaYA9BICy27D7vfCt1S+bUXYea16Cc2fJhPUE0OX1kj8HsB47D77IsDONZl
         U6Cf5/aXnbFjyoJeW1LaVZ0Kw7VnuZvBsCo/9vOQkt8jCc6eTkSOZJaQ35OEDIebTY4e
         wjfhJgqG6HfeXBAulPceXNd5fs697ZnmJhzHhbgdi8A72RuX/LdvU2wr7GWOWSyJ6p3P
         vXBUBFY+QVUd9X8Out3vC1ZXZ7XMAtzXt/A5seZeMwxTDUohxC6h/ktDqD4qVtfwcrDA
         qpxk9+y+gGehYvlG9VMUupGcLXEPj8YK5MYH8uzIwwlrpGSEhJZdRnBGcARX68T3MR2A
         ys1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UyCfMSVt5YQ93dvQzsfOUKEDIKXZpwg4MvkDLyqNHiA=;
        b=W3naYHZfwojpgKsD3ZG7xggNy6RRdv6PqFfbL7xwwfGUqLP1TaO1abHLj0hBdMG19T
         zUn+bUo1NpVk1gXFABQiZT/XiA3NaavQA9kFuA2AQhQObiKhOoEqU5vRX8AdDMArDv2H
         /PaLb4GLYkeiFOByukUeasRlEVCQT36vnhb2UP8xnBFHzenaC3Z5N2hLbP0cM960y+qo
         EqLa8MvAEW39I5MCJHmuxMxywqbrLEah2czhUBu17vkTiq22gvwBEZukNJuNYBDpDirV
         p47IQ4Y5haVXi4FUkPeqQFV21egzIv1c/SlMPgbDUPlR526gNBkmPMi8sE0OH65sAAYz
         vrMA==
X-Gm-Message-State: AFqh2krnkGgD+rfV3D3zh7duWIvS4Nx4qdsDtOJaILI5jeoSFFiSJNBj
        DRDT3uX+EwGyCAzmCzFRfWnkr7DTwxeQuPXqtdS7zg==
X-Google-Smtp-Source: AMrXdXuKRuAD41xpguf1eHKBlJO8W4vD7lac7tM28Emygp2ffmu3CfYnqjmwkMJDzMpgKkJSkz2p0bDht+YE9XQTmVE=
X-Received: by 2002:a9f:3263:0:b0:5d5:d02:8626 with SMTP id
 y32-20020a9f3263000000b005d50d028626mr3149869uad.115.1674574209956; Tue, 24
 Jan 2023 07:30:09 -0800 (PST)
MIME-Version: 1.0
References: <20221228-drop-qunused-arguments-v2-0-9adbddd20d86@kernel.org>
 <CA+G9fYs58vWj705MdaBKomVfHxNJ5ekSTmf53S4=4oVmc43CZg@mail.gmail.com> <Y86xyqe+Rd9wri7I@dev-arch.thelio-3990X>
In-Reply-To: <Y86xyqe+Rd9wri7I@dev-arch.thelio-3990X>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Tue, 24 Jan 2023 20:59:58 +0530
Message-ID: <CA+G9fYv1cAfGUDmz-+XC-E7aXQdU55D7SW=-WFc_RiUuNgGNsw@mail.gmail.com>
Subject: Re: [PATCH v2 00/14] Remove clang's -Qunused-arguments from KBUILD_CPPFLAGS
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     masahiroy@kernel.org, ndesaulniers@google.com, nicolas@fjasle.eu,
        trix@redhat.com, linux-kbuild@vger.kernel.org,
        llvm@lists.linux.dev, tglx@linutronix.de, mingo@redhat.com,
        bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
        kernel test robot <lkp@intel.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>,
        linux-mips@vger.kernel.org, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org,
        Segher Boessenkool <segher@kernel.crashing.org>,
        Heiko Carstens <hca@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        linux-s390@vger.kernel.org,
        Alex Deucher <alexander.deucher@amd.com>,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        lkft-triage@lists.linaro.org,
        Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Nathan,

On Mon, 23 Jan 2023 at 21:41, Nathan Chancellor <nathan@kernel.org> wrote:
>
> Hi Naresh,
>
> On Mon, Jan 23, 2023 at 07:28:10PM +0530, Naresh Kamboju wrote:
> > FYI,
> > [ please provide comments, feedback and improvements on build/ ltp smok=
e tests ]
> >
> > LKFT test farm have fetched your patch series [1]
> > [PATCH v2 00/14] Remove clang's -Qunused-arguments from KBUILD_CPPFLAGS
> >  [1] https://lore.kernel.org/llvm/20221228-drop-qunused-arguments-v2-0-=
9adbddd20d86@kernel.org/
>
> Thank you a lot for testing this series, it is much appreciated!
>
> It looks like this was applied on top of 6.2-rc3 if I am reading your
> logs right but your mainline testing is recent, 6.2-rc5. I think the
> errors you are seeing here are just existing mainline regressions that
> were later fixed.
>
> > Following build warnings and errors reported.
> >
> > sh:
> > gcc-11-defconfig =E2=80=94 FAIL
> > gcc-11-shx3_defconfig =E2=80=94 FAIL
> > https://qa-reports.linaro.org/~anders.roxell/linux-mainline-patches/bui=
ld/https___lore_kernel_org_llvm_20221228-drop-qunused-arguments-v2-1-9adbdd=
d20d86_kernel_org/testrun/14221835/suite/build/tests/
> >
> > mainline getting passed.
> > https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.2-rc5=
/testrun/14298156/suite/build/test/gcc-11-defconfig/history/
> > https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.2-rc5=
/testrun/14298156/suite/build/test/gcc-11-shx3_defconfig/history/
> >
> > Build error:
> > In function 'follow_pmd_mask',
> >     inlined from 'follow_pud_mask' at /builds/linux/mm/gup.c:735:9,
> >     inlined from 'follow_p4d_mask' at /builds/linux/mm/gup.c:752:9,
> >     inlined from 'follow_page_mask' at /builds/linux/mm/gup.c:809:9:
> > /builds/linux/include/linux/compiler_types.h:358:45: error: call to
> > '__compiletime_assert_263' declared with attribute error: Unsupported
> > access size for {READ,WRITE}_ONCE().
> >   358 |         _compiletime_assert(condition, msg,
> > __compiletime_assert_, __COUNTER__)
>
> I think this was fixed with mainline commit 526970be53d5 ("sh/mm: Fix
> pmd_t for real"), released in 6.2-rc4. You can see a previous build
> failing in the same manner:
>
> https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.2-rc3-9=
-g5a41237ad1d4/testrun/14056384/suite/build/tests/
>
> > s390:
> > clang-15-defconfig =E2=80=94 FAIL
> > https://qa-reports.linaro.org/~anders.roxell/linux-mainline-patches/bui=
ld/https___lore_kernel_org_llvm_20221228-drop-qunused-arguments-v2-1-9adbdd=
d20d86_kernel_org/testrun/14221913/suite/build/tests/
> >
> > mainline getting passed.
> > https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.2-rc5=
/testrun/14300495/suite/build/test/clang-15-defconfig/history/
> >
> > Build error:
> > make --silent --keep-going --jobs=3D8
> > O=3D/home/tuxbuild/.cache/tuxmake/builds/1/build LLVM_IAS=3D0 ARCH=3Ds3=
90
> > CROSS_COMPILE=3Ds390x-linux-gnu- 'HOSTCC=3Dsccache clang' 'CC=3Dsccache
> > clang'
> > `.exit.text' referenced in section `__jump_table' of fs/fuse/inode.o:
> > defined in discarded section `.exit.text' of fs/fuse/inode.o
> > `.exit.text' referenced in section `__jump_table' of fs/fuse/inode.o:
> > defined in discarded section `.exit.text' of fs/fuse/inode.o
> > `.exit.text' referenced in section `__bug_table' of crypto/algboss.o:
> > defined in discarded section `.exit.text' of crypto/algboss.o
> > `.exit.text' referenced in section `__bug_table' of drivers/scsi/sd.o:
> > defined in discarded section `.exit.text' of drivers/scsi/sd.o
> > `.exit.text' referenced in section `__jump_table' of drivers/md/md.o:
> > defined in discarded section `.exit.text' of drivers/md/md.o
> > `.exit.text' referenced in section `__jump_table' of drivers/md/md.o:
> > defined in discarded section `.exit.text' of drivers/md/md.o
> > `.exit.text' referenced in section `.altinstructions' of
> > drivers/md/md.o: defined in discarded section `.exit.text' of
> > drivers/md/md.o
> > `.exit.text' referenced in section `.altinstructions' of
> > drivers/md/md.o: defined in discarded section `.exit.text' of
> > drivers/md/md.o
> > `.exit.text' referenced in section `.altinstructions' of
> > net/iucv/iucv.o: defined in discarded section `.exit.text' of
> > net/iucv/iucv.o
> > `.exit.text' referenced in section `__bug_table' of
> > drivers/s390/cio/qdio_thinint.o: defined in discarded section
> > `.exit.text' of drivers/s390/cio/qdio_thinint.o
> > `.exit.text' referenced in section `__bug_table' of
> > drivers/s390/net/qeth_l3_main.o: defined in discarded section
> > `.exit.text' of drivers/s390/net/qeth_l3_main.o
> > `.exit.text' referenced in section `__bug_table' of
> > drivers/s390/net/qeth_l3_main.o: defined in discarded section
> > `.exit.text' of drivers/s390/net/qeth_l3_main.o
> > s390x-linux-gnu-ld: BFD (GNU Binutils for Debian) 2.35.2 assertion
> > fail ../../bfd/elf64-s390.c:3349
> > make[2]: *** [/builds/linux/scripts/Makefile.vmlinux:34: vmlinux] Error=
 1
>
> This should be fixed with mainline commit a494398bde27 ("s390: define
> RUNTIME_DISCARD_EXIT to fix link error with GNU ld < 2.36"), released in
> 6.2-rc4 as well. Same as before, visible in mainline at one point
> without this series:
>
> https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.2-rc3-9=
-g5a41237ad1d4/testrun/14057142/suite/build/tests/
>
> > But,
> > Build and boot pass on arm64, arm, x86_64 and i386.
> > Build test performed for mips, parisc, riscv, s390, sh, sparc and
> > powerpc (known build errors for maple_defconfig and cell_defconfig),
>
> Good to hear!
>
> Please consider retesting this series on top of 6.2-rc5 or testing the
> current kbuild tree, which has this series applied in it:

This is the perfect place to test.

> https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.gi=
t/log/?h=3Dfor-next

Build test pass on arm, arm64, i386, mips, parisc, powerpc, riscv, s390, sh=
,
sparc and x86_64.
Boot and LTP smoke pass on qemu-arm64, qemu-armv7, qemu-i386 and qemu-x86_6=
4.

  Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
  Tested-by: Anders Roxell <anders.roxell@linaro.org>

Please refer to the following link for details of testing.
  https://qa-reports.linaro.org/~anders.roxell/linux-mainline-patches/build=
/linux-kbuild_masahiroy-branch-kbuild-20230124/?failures_only=3Dfalse&resul=
ts_layout=3Dtable#!#test-results

metadata:
  git_describe : v6.2-rc5-46-ga778c9dd138b
  git_repo : https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linu=
x-kbuild.git
  git_sha : a778c9dd138b4f4410779705b444d58ce6f8fc44
  git_short_log : a778c9dd138b ("builddeb: clean generated package content"=
)

--
Linaro LKFT
https://lkft.linaro.org

>
> Cheers,
> Nathan
