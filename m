Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 734B21CCD5C
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 May 2020 21:53:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729195AbgEJTxk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 10 May 2020 15:53:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729032AbgEJTxk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 10 May 2020 15:53:40 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0F50C061A0C;
        Sun, 10 May 2020 12:53:39 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id x73so5694093lfa.2;
        Sun, 10 May 2020 12:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q79Xf6eTKvurdgU6V2k+s2PCNIvRJ2YWWmSItDSdnJE=;
        b=n0wpKxNCEllwuHMANjS2odIfDIwswRNTpip73RE6/Okx79PJZ7t6lHoAq3IrvIjHto
         2/dXe0Euk3SKrxZ5SQGH8AWhsSdQbtm3E4IJ9o50DlOWrN18TdH7A7lMJ3WNqQa334xE
         q4H4AqsMgq6+JdUDBsdZKOf3Y4TgwTL6HdqPbL6OHtgKZY7saN3m6WjfO3jbByBPtuYi
         CIoor349Bv3to/dFnfrA0RXkJ8k48n8wwk/IPDKr6MdhRsA0Oat77Rxv//LdE/S39WSO
         zFJDKQEfsWwlSsiFYvnvrMJPWlVQPYyw48kzQGnDU36QOwnZNc+79AsdLfjpuCxkU9Bo
         s7fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q79Xf6eTKvurdgU6V2k+s2PCNIvRJ2YWWmSItDSdnJE=;
        b=RNnfb3VaLIJcFdaLKnAHY19wh+uXkdDIvTWOILeO36zZhbRELpPBagYs4vcHyURlAK
         fweJvzsWXBxQlsSgO3ydf+m6IAi4Yfegtlpzd6hQtTmTrMyTFcM/4fTavv6np8W4nlJP
         eSOJNKss2eSJxdE40cw2PmTUbLPRnluPZIpVR5X2iOy5FXRA8k5Vg2V0wa4EkYEAKx7i
         FWFzv7d450fK2hbQuwdFPuFDqmGd/dpYpBhPy4UhiTIXsY7XYsyuv/gJYy6ZSy+6JmEd
         sKerS+kK2rt3ABslWy6zAXJp0Ohsqvz0ARfHbE2pIXhPnNgbdYBBeSvSDrF+WjXw5XL5
         Ubxg==
X-Gm-Message-State: AOAM533Y0T901FM5/ah47YnV8Gpy+y6veQl3uxqMkj8TbKOswGEPZLUK
        5+dmEgeI7iCauphNoNeXAkDtwTktH9jdXPxLFHabZcxjshAS
X-Google-Smtp-Source: ABdhPJynTLpEeF9JMTEZzza9vTF0/XFeTXwvXFn+eNjLjoipKVnNd0CzmaStb3l/y0E6poRK7olLeG8lTEyMJobLzuY=
X-Received: by 2002:ac2:57cd:: with SMTP id k13mr8573594lfo.104.1589140418405;
 Sun, 10 May 2020 12:53:38 -0700 (PDT)
MIME-Version: 1.0
References: <CADa2P2UP1AtEmQYtyqUFKVNz8Rxii+-Zut3ibc5pMYnQB90-zw@mail.gmail.com>
 <32637993-b73f-c2cb-6823-590c1638b5a6@infradead.org> <CADa2P2UTMwwYPFLW+UM5FNBL+_8Pi_Am+saa+Y2ywpi0jPDvWw@mail.gmail.com>
 <ff3401cc-e2c1-f510-c971-2151e9d540fe@infradead.org> <CADa2P2VP6-aLgTqiTDpBjU+gnzT0dPT9SqGu9GY8c+OZ_xhfcw@mail.gmail.com>
 <a8c709ff-67df-09b6-25ff-a4b46a5a2a79@infradead.org>
In-Reply-To: <a8c709ff-67df-09b6-25ff-a4b46a5a2a79@infradead.org>
From:   Mahmood Naderan <mahmood.nt@gmail.com>
Date:   Mon, 11 May 2020 00:23:27 +0430
Message-ID: <CADa2P2WqYxUjZWMYw5aq_5e8XLf8zRCnTsMaF98sFg8==F+WNw@mail.gmail.com>
Subject: Re: Using a custom LDFLAG for all objects and binaries
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel@vger.kernel.org,
        linux-kbuild <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

>OK, I suggest that you reorder the options like so:
>
>        KBUILD_LDFLAGS := -m elf_$(UTS_MACHINE) --emit-relocs


I did that. After

$ make V=1
$ sudo make modules_install V=1
$ sudo make install

I grepped for "emit-relocs" in the log and saw many instances such as

  gcc -Wp,-MD,drivers/rtc/.rtc-ds1305.o.d  -nostdinc -isystem
/usr/lib/gcc/x86_64-linux-gnu/5/include -I./arch/x86/include
-I./arch/x86/include/generated  -I./include -I./arch/x86/include/uapi
-I./arch/x86/include/generated/uapi -I./include/uapi
-I./include/generated/uapi -include ./include/linux/kconfig.h -include
./include/linux/compiler_types.h -D__KERNEL__ -Wall -Wundef
-Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common
-fshort-wchar -Werror-implicit-function-declaration
-Wno-format-security -std=gnu89 -fno-PIE -mno-sse -mno-mmx -mno-sse2
-mno-3dnow -mno-avx -m64 -falign-jumps=1 -falign-loops=1 -mno-80387
-mno-fp-ret-in-387 -mpreferred-stack-boundary=3 -mskip-rax-setup
-mtune=generic -mno-red-zone -mcmodel=kernel -funit-at-a-time
-DCONFIG_X86_X32_ABI -DCONFIG_AS_CFI=1 -DCONFIG_AS_CFI_SIGNAL_FRAME=1
-DCONFIG_AS_CFI_SECTIONS=1 -DCONFIG_AS_FXSAVEQ=1 -DCONFIG_AS_SSSE3=1
-DCONFIG_AS_CRC32=1 -DCONFIG_AS_AVX=1 -DCONFIG_AS_AVX2=1
-DCONFIG_AS_AVX512=1 -DCONFIG_AS_SHA1_NI=1 -DCONFIG_AS_SHA256_NI=1
-pipe -Wno-sign-compare -fno-asynchronous-unwind-tables
-mindirect-branch=thunk-extern -mindirect-branch-register
-fno-jump-tables -fno-delete-null-pointer-checks -O2
--param=allow-store-data-races=0 -Wframe-larger-than=1024
-fstack-protector-strong -Wno-unused-but-set-variable
-fno-omit-frame-pointer -fno-optimize-sibling-calls
-fno-var-tracking-assignments -g -gdwarf-4 -pg -mrecord-mcount
-mfentry -DCC_USING_FENTRY -Wdeclaration-after-statement
-Wno-pointer-sign -fno-strict-overflow -fno-merge-all-constants
-fmerge-constants -fno-stack-check -fconserve-stack
-Werror=implicit-int -Werror=strict-prototypes -Werror=date-time
-Werror=incompatible-pointer-types -Werror=designated-init  -DMODULE
-DKBUILD_BASENAME='"rtc_ds1305"' -DKBUILD_MODNAME='"rtc_ds1305"' -c -o
drivers/rtc/rtc-ds1305.o drivers/rtc/rtc-ds1305.c
   ./tools/objtool/objtool check  --module --retpoline
"drivers/scsi/aacraid/dpcsup.o";

OR

  ld -r -m elf_x86_64 --emit-relocs  -z max-page-size=0x200000 -T
./scripts/module-common.lds  --build-id  -o
sound/usb/line6/snd-usb-line6.ko sound/usb/line6/snd-usb-line6.o
sound/usb/line6/snd-usb-line6.mod.o ;  true



I guess that all kernel modules are now use --emit-relocs.
I would like to be sure that libc and those files related to syscalls
are also using that.

I grepped for "libc.so" but it seems that there is no such match.
Did I miss something?


Regards,
Mahmood
