Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 876C6374894
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 May 2021 21:18:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235444AbhEETTK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 5 May 2021 15:19:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235107AbhEETTF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 5 May 2021 15:19:05 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D515AC06174A
        for <linux-kbuild@vger.kernel.org>; Wed,  5 May 2021 12:18:07 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id m190so2521767pga.2
        for <linux-kbuild@vger.kernel.org>; Wed, 05 May 2021 12:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4WYSC4vZQjtev2oFzlx0FGKTMmYzxEnnQo/e/yAZ4w8=;
        b=kPvQemPtSPOW/yzBzeEYb+M1Ag2ysITcVCD+EG4obVHyhN8ONYEUXUYUBJXh7XznIt
         Zvxxx93f26qcHTzi1BL9KKkw5rMICh0K5dySFfjUYcgol62ZlD3TOLX4E6JapDAaKFFV
         D3z7bkHVbiJZOxV5aY+rcYfJMQwjTEcwXnxOg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4WYSC4vZQjtev2oFzlx0FGKTMmYzxEnnQo/e/yAZ4w8=;
        b=bTtPZa1cVJdLLTou27Wv11xJuJGwcQOE/VGAYWXJQcOxnWd5DBwQb6iHg//Wi6/aqF
         v+xssq8FrsfdtIVO1JsVPQhmrWyhJhst+JIQ/cXZZ+mQniGlmL2TbvypejRI7P8sNV1o
         d6Z2ziKUez3PDvI9QWacB1V+d5urJzLsyhc0EJbx8bwtUH9ZNRCTCtH0jufzT685WwJW
         t9v1N3S7Dd5IHzZdFTdyHp05HyxEVbtdwnkTPadFVCzm2eWI7sxDJrUvrNd43ihTwTp3
         QLYxzHkzgaE5mtnH7SRI0mc3M5HD5aMSFFS4Y/7Z08q1oPDj5/rfwQPt8P7tAwu4fnw5
         XR1Q==
X-Gm-Message-State: AOAM532pyJoDOh45i7skFE1+GI/vOEvbrl5LM1H+b3o0G/XwBsTw/B1z
        j3oyyPQNoi+tfo/VmzDVEIYL1iy5p7Qa4Q==
X-Google-Smtp-Source: ABdhPJysdlxx7Lr0SIayibsfBEnnNF5N67lBnTfNjc9vFhiqdhpxd/izyt4dW9Lm8k/+21BMTSrUeQ==
X-Received: by 2002:a63:465b:: with SMTP id v27mr414257pgk.445.1620242287430;
        Wed, 05 May 2021 12:18:07 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id b21sm26163pfl.82.2021.05.05.12.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 12:18:06 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     linux-hardening@vger.kernel.org
Cc:     Kees Cook <keescook@chromium.org>,
        Qing Zhao <qing.zhao@oracle.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-security-module@vger.kernel.org
Subject: [PATCH] Makefile: Introduce CONFIG_ZERO_CALL_USED_REGS
Date:   Wed,  5 May 2021 12:18:04 -0700
Message-Id: <20210505191804.4015873-1-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; g=486ae8ef11ec6ce07be8f36f937bc84f12b212d7; i=INxa/4VCLBovtkxgk4v6PayUOJQvpGeFUZovolpEDWo=; m=6hofzkFzCVIzIaBPLx/ZSwUq1VzuU3BvCXxnAGa5Moo=; p=yiFCvg8shZIMIJrM4uWz6P8G93GPjOZ7K1K592eVyGA=
X-Patch-Sig: m=pgp; i=keescook@chromium.org; s=0x0x8972F4DFDC6DC026; b=iQIzBAABCgAdFiEEpcP2jyKd1g9yPm4TiXL039xtwCYFAmCS72sACgkQiXL039xtwCZG5g/+J1o l9p/R17NzyztXLl2VsbdCf3h4tXYkMbK+K6TpUi19k92VY2sbrGJN1i5uXLSAXyVaQIvyChiqoCCM gWv+amkmus6B4aCuie6xRnnqqYfxUGICtTys9T60XMCuqbMawGDuXd/5r0kIwYN4JitjJv9WR1kTt z4mdwwlb3bp6vKn1YxcvVgE45rGJNN8tgth0B7gqy4llri/agllSLgkRvU9PUu0x7dBwYWIdiz2/V yfbBRBhn1Wthc+Quz372wiYylx1O3/QfggDxabhE8j+gYlCi7NtgWpkkL4OpAn8+3kOGng+VVK1/K Ht10W/Ikjcwx99XlgyTMmj28FK4FDec838v125bjsnV/aRhiNOffmYTIFfR2xV+xY6ddkG66xMAAG cP5ng83+VpYV+vEcZ4zkIKv4KbYs4siOmi0YlqpcTwp0QhWbhEWQ34YCe/1PCgyvkiYTJ1NpMnPIP PNNCNJjBO95lr3lIVu4+XrTTrG3zoirjq5SO1u1gyS+6Z3lHeAHAAp7k0JtKoZ8a0GaFFj5r2mh6l VihdtWY3ysqlHCVPqlTcTbrCxxHv5fdJnPjUOdEaPPx3gvBsbW8T1yyYn67/4DCTSoPRguS1j5bGT uaui+WGG8Xbe42gGc3dJrAjPcxzXML6vVGa0e6kswXg4VuCiHHXCHNrhS2aI6JoA=
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

When CONFIG_ZERO_CALL_USED_REGS is enabled, build the kernel with
"-fzero-call-used-regs=used-gpr" (in GCC 11). This option will zero any
caller-used register contents just before returning from a function,
ensuring that temporary values are not leaked beyond the function
boundary. This means that register contents are less likely to be
available for side channel attacks and information exposures.

Additionally this helps reduce the number of useful ROP gadgets in the
kernel image by about 20%:

$ ROPgadget.py --nosys --nojop --binary vmlinux.stock | tail -n1
Unique gadgets found: 337245

$ ROPgadget.py --nosys --nojop --binary vmlinux.zero-call-regs | tail -n1
Unique gadgets found: 267175

and more notably removes simple "write-what-where" gadgets:

$ ROPgadget.py --ropchain --binary vmlinux.stock | sed -n '/Step 1/,/Step 2/p'
- Step 1 -- Write-what-where gadgets

        [+] Gadget found: 0xffffffff8102d76c mov qword ptr [rsi], rdx ; ret
        [+] Gadget found: 0xffffffff81000cf5 pop rsi ; ret
        [+] Gadget found: 0xffffffff8104d7c8 pop rdx ; ret
        [-] Can't find the 'xor rdx, rdx' gadget. Try with another 'mov [reg], reg'

        [+] Gadget found: 0xffffffff814c2b4c mov qword ptr [rsi], rdi ; ret
        [+] Gadget found: 0xffffffff81000cf5 pop rsi ; ret
        [+] Gadget found: 0xffffffff81001e51 pop rdi ; ret
        [-] Can't find the 'xor rdi, rdi' gadget. Try with another 'mov [reg], reg'

        [+] Gadget found: 0xffffffff81540d61 mov qword ptr [rsi], rdi ; pop rbx ; pop rbp ; ret
        [+] Gadget found: 0xffffffff81000cf5 pop rsi ; ret
        [+] Gadget found: 0xffffffff81001e51 pop rdi ; ret
        [-] Can't find the 'xor rdi, rdi' gadget. Try with another 'mov [reg], reg'

        [+] Gadget found: 0xffffffff8105341e mov qword ptr [rsi], rax ; ret
        [+] Gadget found: 0xffffffff81000cf5 pop rsi ; ret
        [+] Gadget found: 0xffffffff81029a11 pop rax ; ret
        [+] Gadget found: 0xffffffff811f1c3b xor rax, rax ; ret

- Step 2 -- Init syscall number gadgets

$ ROPgadget.py --ropchain --binary vmlinux.zero* | sed -n '/Step 1/,/Step 2/p'
- Step 1 -- Write-what-where gadgets

        [-] Can't find the 'mov qword ptr [r64], r64' gadget

In parallel build tests, this has a less than 1% performance impact,
and grows the image size less than 1%:

$ size vmlinux.stock vmlinux.zero-call-regs
   text    data     bss     dec     hex filename
22437676   8559152 14127340 45124168 2b08a48 vmlinux.stock
22453184   8563248 14110956 45127388 2b096dc vmlinux.zero-call-regs

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 Makefile                   |  5 +++++
 security/Kconfig.hardening | 17 +++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/Makefile b/Makefile
index 31dcdb3d61fa..810600618490 100644
--- a/Makefile
+++ b/Makefile
@@ -811,6 +811,11 @@ KBUILD_CFLAGS	+= -ftrivial-auto-var-init=zero
 KBUILD_CFLAGS	+= -enable-trivial-auto-var-init-zero-knowing-it-will-be-removed-from-clang
 endif
 
+# Clear used registers at func exit (to reduce data lifetime and ROP gadgets).
+ifdef CONFIG_ZERO_CALL_USED_REGS
+KBUILD_CFLAGS	+= -fzero-call-used-regs=used-gpr
+endif
+
 DEBUG_CFLAGS	:=
 
 # Workaround for GCC versions < 5.0
diff --git a/security/Kconfig.hardening b/security/Kconfig.hardening
index 269967c4fc1b..85f7f2036725 100644
--- a/security/Kconfig.hardening
+++ b/security/Kconfig.hardening
@@ -217,6 +217,23 @@ config INIT_ON_FREE_DEFAULT_ON
 	  touching "cold" memory areas. Most cases see 3-5% impact. Some
 	  synthetic workloads have measured as high as 8%.
 
+config CC_HAS_ZERO_CALL_USED_REGS
+	def_bool $(cc-option,-fzero-call-used-regs=used-gpr)
+
+config ZERO_CALL_USED_REGS
+	bool "Enable register zeroing on function exit"
+	depends on CC_HAS_ZERO_CALL_USED_REGS
+	help
+	  At the end of functions, always zero any caller-used register
+	  contents. This helps ensure that temporary values are not
+	  leaked beyond the function boundary. This means that register
+	  contents are less likely to be available for side channels
+	  and information exposures. Additionally, this helps reduce the
+	  number of useful ROP gadgets by about 20% (and removes compiler
+	  generated "write-what-where" gadgets) in the resulting kernel
+	  image. This has a less than 1% performance impact on most
+	  workloads, and grows the image size less than 1%.
+
 endmenu
 
 endmenu
-- 
2.25.1

