Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D182D1F78ED
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jun 2020 15:47:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726452AbgFLNrh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 12 Jun 2020 09:47:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726257AbgFLNrg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 12 Jun 2020 09:47:36 -0400
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3E94C03E96F
        for <linux-kbuild@vger.kernel.org>; Fri, 12 Jun 2020 06:47:35 -0700 (PDT)
Received: by mail-il1-x136.google.com with SMTP id l6so8844908ilo.2
        for <linux-kbuild@vger.kernel.org>; Fri, 12 Jun 2020 06:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to:cc;
        bh=ZgaJ/olqdC7Z/v5U9mNTpCoSFUmQjzCxsS9YV5RfjSA=;
        b=vTAEZhVOPpqIec17B9X0sqNf3rXi5xNaSd8nMAGwV0XLmBtEurg+0P0QKkHWNae+cS
         YvViw2aHdkmcGLsmP5c0rnNolJU/Hz1Mox27RDqhiwU9RGlTf152W9oSKqtlc8sREVnH
         IzTfR5L6+TvxMow+7wpADrEW6/KgfTWSCPiTJSWFSZZncNzXzuC6zAD9dOyJqIXTYEkU
         niz03nGfjTrTfO3xdqcLd/xVtmlT3Dx+EIQv3ExwMWVhwLNTj+5gsgLYv3eowoQcwHY6
         Iz0zw4E1GPtlkO5DCW2GY443IvkwvL7afuaZgY1lktlBs2Lw68jhed8LEZSdJMw/PwSM
         We+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:cc;
        bh=ZgaJ/olqdC7Z/v5U9mNTpCoSFUmQjzCxsS9YV5RfjSA=;
        b=Nwml9zEiar3rOM+NePDZj/4m9vRDP9DNoV3I5Rgfhlo1gWIEPUYWVV0mjtcmcYjVh+
         d0RmrngS1rxthDAT4RHoymvnfiCRtSy08gV3O6D2cjjVfRIeY4IGOCMUs6JeOq9TsbNy
         bAhrZvBIbcavDTZrUxCE2VuYs2+gXnb5CS1n7IXT2GwIkbgXuqPf5B8NL1HnuIalkIiV
         IZpGbliVFmBqsh/sqJryQqoD19E6wq7jNQFoQXo5UJ26LsCh5tvSa5nQUk38XZQ+O3oo
         vIuUjhMhig7SGVNE3CE3ZYeZBRUhly9KFoh/rdXJY000nGmfCORlOVj6Ls7/jqTXHK2f
         0g3w==
X-Gm-Message-State: AOAM530sbCTu0uxvKoVY4CWAWqidTiHc8Uk5yzP2sSixSgGTFYhKOrmW
        z9P0ZC5xWShpemOpTr9PaNk7H6wjEwdtOp0ZX9U=
X-Google-Smtp-Source: ABdhPJxTHiiesT1540op9O+HMH1GSGZH2r8x6zXXh9RZVd+KBl22Xw2L28R3rlWUecjhgmwV3xlzNQ1G5uO+sajVdIM=
X-Received: by 2002:a92:1904:: with SMTP id 4mr12569296ilz.212.1591969655190;
 Fri, 12 Jun 2020 06:47:35 -0700 (PDT)
MIME-Version: 1.0
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Fri, 12 Jun 2020 15:47:23 +0200
Message-ID: <CA+icZUX20_yarSs7fJWq6Sxy3xBaeUXSQjmMbjcQFXB4JnyijA@mail.gmail.com>
Subject: x86/crypto: Set -no-integrated-as for specific object-file when
 building with LLVM_IAS=1
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Masahiro,

I am trying to build with clang-10, ld.lld-10 and LLVM_IAS=1.

I fell over some problems in x86/crypto area where I have found fixes.

But how on hell can I set -no-integrated-as for specific object-file?

[ arch/x86/crypto/Makefile ]

ifdef LLVM_IAS
KBUILD_CPPFLAGS += -no-integrated-as
endif

...at the top sets -no-integrated-as for all object-files.

I have two broken object-files (or more exact the corresponding *.S
file is broken):
#1: aes_ctrby8_avx-x86_64.o <--- FIXED
<https://github.com/ClangBuiltLinux/linux/issues/1008>
#2: crc32c-pcl-intel-asm_64.o <--- PATCH exist - does not work for me

I tried...

CFLAGS_aes_ctrby8_avx-x86_64.o += -no-integrated-as
CLAGS_crc32c-pcl-intel-asm_64.o += -no-integrated-as

or

CPPFLAGS_aes_ctrby8_avx-x86_64.o += -no-integrated-as
CPPFLAGS_crc32c-pcl-intel-asm_64.o += -no-integrated-as

or

cflags-$(CONFIG_CRYPTO_AES_NI_INTEL) += -no-integrated-as
cflags-$(CONFIG_CRYPTO_CRC32C_INTEL) += -no-integrated-as

or

cppflags-$(CONFIG_CRYPTO_AES_NI_INTEL) += -no-integrated-as
cppflags-$(CONFIG_CRYPTO_CRC32C_INTEL) += -no-integrated-as

All above also with "-fno-integrated-as" at the top and at the bottom
of the Makefile.

Can you give a hint?

Thanks.

Regards,
- Sedat -

[1] https://github.com/ClangBuiltLinux/linux/issues/1049
[1] https://github.com/ClangBuiltLinux/linux/issues/1050
