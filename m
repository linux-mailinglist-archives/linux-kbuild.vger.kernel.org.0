Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E684939225C
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 May 2021 23:52:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233967AbhEZVyQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 26 May 2021 17:54:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45089 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233790AbhEZVyP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 May 2021 17:54:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1622065962;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=2ooIrO6+PnLW9RdU2+GIho8vABniPqVAPdMUszZt5uE=;
        b=cj+zGVBUYScvaKAZjPBbroLHJCbKvbWK4h6Pjozv9h/Dcun2xzeHLME7k0Z167wMqGHL99
        JhISloN09SD7xK9pZJj1zn2uLvGJEtMn//4gOVj36VK+ugYIeTC+GYMmtugRHH4KcmgZj5
        ulK6Pm41KGE5LqmNboa/YwqCiLGmmpo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-K0s1PhNHOoeP6VvvJQJwvA-1; Wed, 26 May 2021 17:52:41 -0400
X-MC-Unique: K0s1PhNHOoeP6VvvJQJwvA-1
Received: by mail-wm1-f71.google.com with SMTP id y205-20020a1ce1d60000b029019278214067so774769wmg.3
        for <linux-kbuild@vger.kernel.org>; Wed, 26 May 2021 14:52:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2ooIrO6+PnLW9RdU2+GIho8vABniPqVAPdMUszZt5uE=;
        b=I2mvwkJHawERzNvpaFae0d2Oaw/TzsNo1ozTgtGhgho8HjSDJuF32UTczwAert7ODs
         L9/xQGkaO8Lba0pH3rKMlFN3cos9DOZ0zrKltYoxlEcTIhYEwoEUz/bgmeyGI6LWonEL
         r5zZnhSIix1CUv8d2xmWpeJhKsf3bLdjwfEfnY+YIEZw3Qdt7hH/H1WBpUVGWZ7ytnx5
         tHpkqYbxnMhe3hEeY9ccW7cuIwDJT5wSOQNX6X1bDlprdrY4EwO8uFaBn54DFEqWSefy
         i9Wpw3qZ930pvz2l7Rc+N6Wjc1FFmxcxfxye1feJvcIxE5CobIhHfC929WfdluJ5ySd0
         b4SA==
X-Gm-Message-State: AOAM530Jn+cyc2MQGwwHHbEA/d6KboAwHIHf23UuVvYHoaP7s6q0Qciq
        y9mF2gFWboJ3MJF04MY9v7C7bhnLHb/D/oXVeGMoSNeZYQSDgKK8U1ZOz84Yf/bIInjsY25tGlb
        SIjsEOfql8pm4ueqzIlp7Qppl
X-Received: by 2002:a05:6000:11ce:: with SMTP id i14mr80393wrx.221.1622065960120;
        Wed, 26 May 2021 14:52:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzpR2jhnqwvB6Ifd8antV8AzpNPZsvRhuhOfJO+5wlVtFi9SUKlsBy9gkyhhjnjvo1hBm188Q==
X-Received: by 2002:a05:6000:11ce:: with SMTP id i14mr80383wrx.221.1622065959965;
        Wed, 26 May 2021 14:52:39 -0700 (PDT)
Received: from minerva.home ([92.176.231.106])
        by smtp.gmail.com with ESMTPSA id q5sm388996wmc.0.2021.05.26.14.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 14:52:39 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     Arnaldo Carvalho de Melo <acme@kernel.org>, bpf@vger.kernel.org,
        Javier Martinez Canillas <javierm@redhat.com>,
        Andrii Nakryiko <andrii@kernel.org>,
        Arnaldo Carvalho de Melo <acme@redhat.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org
Subject: [PATCH v2] kbuild: quote OBJCOPY var to avoid a pahole call break the build
Date:   Wed, 26 May 2021 23:52:28 +0200
Message-Id: <20210526215228.3729875-1-javierm@redhat.com>
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
Acked-by: Andrii Nakryiko <andrii@kernel.org>
Acked-by: Arnaldo Carvalho de Melo <acme@redhat.com>
---

Changes in v2:
- Add collected Acked-by tags.
- Also quote on a similar assignment in scripts/link-vmlinux.sh (masahiroy)

 scripts/Makefile.modfinal | 2 +-
 scripts/link-vmlinux.sh   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

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
diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index f4de4c97015..0e0f6466b18 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -240,7 +240,7 @@ gen_btf()
 	fi
 
 	info "BTF" ${2}
-	LLVM_OBJCOPY=${OBJCOPY} ${PAHOLE} -J ${extra_paholeopt} ${1}
+	LLVM_OBJCOPY="${OBJCOPY}" ${PAHOLE} -J ${extra_paholeopt} ${1}
 
 	# Create ${2} which contains just .BTF section but no symbols. Add
 	# SHF_ALLOC because .BTF will be part of the vmlinux image. --strip-all
-- 
2.31.1

