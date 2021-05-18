Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6510C387B0E
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 May 2021 16:23:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233103AbhEROYi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 18 May 2021 10:24:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59029 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232769AbhEROYh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 18 May 2021 10:24:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621347799;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=f8IzFIOzbsxUCqwXiXd4bDeaGDFMJm7rKWjjlTMeQkU=;
        b=K/166PnWuY8f2WXlM9QtlhmQ05fwo1JE4AwikoY9IF3KCojnH6hIHExj9lSpRHg3PUNySB
        12Ee4gruEPma9xXMMlEIo64oEGwgn+NLyJy/kzea2y4BDM94v/1zF/D970xR2g7kMuFelk
        SuSApHpQtix7TAX0dIy1y3QYS375vX8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-601-7H3xJ5CNMZ2M0o0052eYog-1; Tue, 18 May 2021 10:23:15 -0400
X-MC-Unique: 7H3xJ5CNMZ2M0o0052eYog-1
Received: by mail-wr1-f70.google.com with SMTP id v5-20020adf9e450000b029010e708f05b3so5667999wre.6
        for <linux-kbuild@vger.kernel.org>; Tue, 18 May 2021 07:23:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f8IzFIOzbsxUCqwXiXd4bDeaGDFMJm7rKWjjlTMeQkU=;
        b=nW/fHqDUNb6xJsK88h5EecQD0eZ1pqnoDG1e83M17lGEfMT09EmfdYZod+B2P3FPwp
         Jl7XK50pwpuwSBO0pDg3vCHIIZZ5thTJy8Qx8h+vDzkAtzmVnlTcjEGf8RkT5jkbk7my
         Xj4Uv26sfeaWC9hGr+RRxNJ8a9Kj7KH6cmGYr5Fwja+69hKarJYf5cu9GaGM+xrF9pWC
         RPohlcMwH0aal6XnMiMWzPEsAjiMmnxikNsWArob5dwlr9ciiq5eO/n+YC0xYzSd9HQp
         u0tgXOVr+/NTp/obxLHg/Iup3P0X7F0QjliSR6xdBGC7lhUmi8sk3SzjkAE/Ws7ydsWE
         cDmQ==
X-Gm-Message-State: AOAM533Pt9epMBgQu8zfD7DAmyQyuqFH7Olbxd92adDaIMH4zdbtBXOU
        mxzYq3O210ZmyL6srsPJWgkarQX33cebC+b79gf4ry+/HmSuiKCjFdBn+IJoVRaXR8MKa62ZIQz
        JJWC7I9AKLXO5g8xFCBkE5FTP
X-Received: by 2002:adf:f907:: with SMTP id b7mr7312889wrr.357.1621347794392;
        Tue, 18 May 2021 07:23:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6E1MI1XSdj+/UrQccO5djZLBo0D5vzJ6188cg66WvIejc4itI68QMz8MWHG8lIVM4l7oV0g==
X-Received: by 2002:adf:f907:: with SMTP id b7mr7312863wrr.357.1621347794154;
        Tue, 18 May 2021 07:23:14 -0700 (PDT)
Received: from minerva.redhat.com ([92.176.231.106])
        by smtp.gmail.com with ESMTPSA id i1sm10700145wrp.51.2021.05.18.07.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 07:23:13 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     Arnaldo Carvalho de Melo <acme@kernel.org>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Andrii Nakryiko <andrii@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org
Subject: [PATCH] kbuild: quote OBJCOPY var to avoid a pahole call break the build
Date:   Tue, 18 May 2021 16:23:02 +0200
Message-Id: <20210518142302.1046718-1-javierm@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The ccache tool can be used to speed up cross-compilation, by calling the
compiler and binutils through ccache. For example, following should work:

    $ export ARCH=arm64 CROSS_COMPILE="ccache aarch64-linux-gnu-"

    $ make M=drivers/gpu/drm/rockchip/

but pahole fails to extract the BTF info from DWARF, breaking the build:

      CC [M]  drivers/gpu/drm/rockchip//rockchipdrm.mod.o
      LD [M]  drivers/gpu/drm/rockchip//rockchipdrm.ko
      BTF [M] drivers/gpu/drm/rockchip//rockchipdrm.ko
    aarch64-linux-gnu-objcopy: invalid option -- 'J'
    Usage: aarch64-linux-gnu-objcopy [option(s)] in-file [out-file]
     Copies a binary file, possibly transforming it in the process
    ...
    make[1]: *** [scripts/Makefile.modpost:156: __modpost] Error 2
    make: *** [Makefile:1866: modules] Error 2

this fails because OBJCOPY is set to "ccache aarch64-linux-gnu-copy" and
later pahole is executed with the following command line:

    LLVM_OBJCOPY=$(OBJCOPY) $(PAHOLE) -J --btf_base vmlinux $@

which gets expanded to:

    LLVM_OBJCOPY=ccache aarch64-linux-gnu-objcopy pahole -J ...

instead of:

    LLVM_OBJCOPY="ccache aarch64-linux-gnu-objcopy" pahole -J ...

Fixes: 5f9ae91f7c0 ("kbuild: Build kernel module BTFs if BTF is enabled and pahole supports it")
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 scripts/Makefile.modfinal | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
index dd87cea9fba..a7883e45529 100644
--- a/scripts/Makefile.modfinal
+++ b/scripts/Makefile.modfinal
@@ -59,7 +59,7 @@ quiet_cmd_ld_ko_o = LD [M]  $@
 quiet_cmd_btf_ko = BTF [M] $@
       cmd_btf_ko = 							\
 	if [ -f vmlinux ]; then						\
-		LLVM_OBJCOPY=$(OBJCOPY) $(PAHOLE) -J --btf_base vmlinux $@; \
+		LLVM_OBJCOPY="$(OBJCOPY)" $(PAHOLE) -J --btf_base vmlinux $@; \
 	else								\
 		printf "Skipping BTF generation for %s due to unavailability of vmlinux\n" $@ 1>&2; \
 	fi;
-- 
2.31.1

