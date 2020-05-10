Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C490B1CCD24
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 May 2020 21:04:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728763AbgEJTEd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 10 May 2020 15:04:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728385AbgEJTEd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 10 May 2020 15:04:33 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BA29C061A0C;
        Sun, 10 May 2020 12:04:33 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id a4so5608501lfh.12;
        Sun, 10 May 2020 12:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ijGXEOZY+ZRz/1wBDTheYxIT3v0Pzz8SXgM5BlTLsrc=;
        b=csJifi0LdMfFNSb1sgjJHS6qZyTW70hsJpmUIURzkGVrLHq6/071JzsU5VaS7vNx4s
         gn4DfFQedWuLt+a0ohcop8fmcu4i4vq3ygHCXZqXANsWqhXL+l8BNcu73wSEW1EYuP85
         SLPavTmoHXD4j8N9bSXrxdt8e1DbUFnD6fHX9Rj9C8zs1k6Mwbppdb2TU5ilmWXYwGEt
         26Rfil7ElI+BqbZSNMHK2osSHrNyd0YHl8WEPKr12ok/Y7Jx5l/IwxpNp2zBnb3abPzO
         0YwUJaXVM9G0oxXT/yRXh7zvAxQx64afyONvD0vwhdZqZ0VTYZdV3vWxv3LAX2tyFOTC
         vO9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ijGXEOZY+ZRz/1wBDTheYxIT3v0Pzz8SXgM5BlTLsrc=;
        b=kW8YDVt1BnrC6ivdhLvy0dkbn4prYyd9Vcw1m1FfOKSiLxY0Ohd5rbVyyAqMe05f1e
         IXUsYieF4pFAXiEY/VRwlxS610VJUin/4em2kH78lmQlHV3JBUqtEvxGHlQqQG/F47QM
         sJ0SZutECmPpnk4JolAKV2PGIBqdIeYX0No/taP++5RqBt8Qp5P5MD6T/yDNzzuCQ6Ic
         b14g2lArn1gcZ15rV3GorbeFcbWVAElcUqQLx2GoH0iptHHWKMkxz/JAI9pSozPlKlwo
         X8AtJ908F2589ITaA6G7ToxDptlBrJh1BBKIUlKs0y3T3ouMvugmh/ksEAhGcZd2MxlT
         OfXA==
X-Gm-Message-State: AOAM530tBgqji+w0j0XIG4CYw8HyRYNuexjVjBYCL0TcXDcyRP03CVnU
        lU6mLim+dBXMVmCoI5VPXwTNJPUxfcg8Tli2HErLhlMrm9fe
X-Google-Smtp-Source: ABdhPJyyLwCUnley0y5bA59ITeseyZW4vNVjU/wzoAGg1g5s47KNBkR2ZUyuVIisLW7TZjPM5wuvUPjlPSIJ8zHCPhc=
X-Received: by 2002:a19:6a02:: with SMTP id u2mr4742224lfu.144.1589137471547;
 Sun, 10 May 2020 12:04:31 -0700 (PDT)
MIME-Version: 1.0
References: <CADa2P2UP1AtEmQYtyqUFKVNz8Rxii+-Zut3ibc5pMYnQB90-zw@mail.gmail.com>
 <32637993-b73f-c2cb-6823-590c1638b5a6@infradead.org> <CADa2P2UTMwwYPFLW+UM5FNBL+_8Pi_Am+saa+Y2ywpi0jPDvWw@mail.gmail.com>
 <ff3401cc-e2c1-f510-c971-2151e9d540fe@infradead.org>
In-Reply-To: <ff3401cc-e2c1-f510-c971-2151e9d540fe@infradead.org>
From:   Mahmood Naderan <mahmood.nt@gmail.com>
Date:   Sun, 10 May 2020 23:34:20 +0430
Message-ID: <CADa2P2VP6-aLgTqiTDpBjU+gnzT0dPT9SqGu9GY8c+OZ_xhfcw@mail.gmail.com>
Subject: Re: Using a custom LDFLAG for all objects and binaries
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel@vger.kernel.org,
        linux-kbuild <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

> > or
> > 2- Editing arch/x86/Makefile with
> >    KBUILD_LDFLAGS := -m --emit-relocs elf_$(UTS_MACHINE)
>
> That should work.


Seems not... I ran the following commands:

$ cp -v /boot/config-$(uname -r) .config
$ make menuconfig  -> Exit -> Save
$ vim arch/x86/Makefile
     KBUILD_LDFLAGS := -m --emit-relocs elf_$(UTS_MACHINE)
$ make V=1

This is the error that I get

make -f ./scripts/Makefile.build obj=usr need-builtin=1
/bin/bash ./usr/gen_initramfs_list.sh -l -d > usr/.initramfs_data.cpio.d
(cat /dev/null; ) > usr/modules.order
make -f ./scripts/Makefile.build obj=arch/x86 need-builtin=1
make -f ./scripts/Makefile.build obj=arch/x86/crypto need-builtin=1
make -f ./scripts/Makefile.build obj=arch/x86/crypto/sha1-mb need-builtin=
(cat /dev/null;   echo kernel/arch/x86/crypto/sha1-mb/sha1-mb.ko;) >
arch/x86/crypto/sha1-mb/modules.order
  ld -m --emit-relocs elf_x86_64     -r -o
arch/x86/crypto/sha1-mb/sha1-mb.o arch/x86/crypto/sha1-mb/sha1_mb.o
arch/x86/crypto/sha1-mb/sha1_mb_mgr_flush_avx2.o
arch/x86/crypto/sha1-mb/sha1_mb_mgr_init_avx2.o
arch/x86/crypto/sha1-mb/sha1_mb_mgr_submit_avx2.o
arch/x86/crypto/sha1-mb/sha1_x8_avx2.o
ld: unrecognised emulation mode: --emit-relocs
Supported emulations: elf_x86_64 elf32_x86_64 elf_i386 elf_iamcu
i386linux elf_l1om elf_k1om i386pep i386pe
scripts/Makefile.build:516: recipe for target
'arch/x86/crypto/sha1-mb/sha1-mb.o' failed
make[3]: *** [arch/x86/crypto/sha1-mb/sha1-mb.o] Error 1
scripts/Makefile.build:544: recipe for target 'arch/x86/crypto/sha1-mb' failed
make[2]: *** [arch/x86/crypto/sha1-mb] Error 2
scripts/Makefile.build:544: recipe for target 'arch/x86/crypto' failed
make[1]: *** [arch/x86/crypto] Error 2
Makefile:1053: recipe for target 'arch/x86' failed
make: *** [arch/x86] Error 2





ORIGINAL QUESTION:

>Hi
>I would like to modify the kernel makefile in a way to include
>--emit-relocs for every file that is linked during the process of
>kernel make.
>I see
>
>KBUILD_HOSTLDFLAGS  := $(HOST_LFS_LDFLAGS) $(HOSTLDFLAGS)
>LDFLAGS_MODULE  =
>LDFLAGS_vmlinux =
>...
>
>But I don't know which one is the main. Should I put that option in
>front of every LD* variable? Or it is possible to apply one variable
>for every file that is linked?
>Appreciate your help.
>


Regards,
Mahmood
