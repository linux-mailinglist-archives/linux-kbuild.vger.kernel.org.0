Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB3EB6CD14E
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Mar 2023 06:55:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229634AbjC2Ezj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 29 Mar 2023 00:55:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229562AbjC2Ezi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 29 Mar 2023 00:55:38 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 595E62707
        for <linux-kbuild@vger.kernel.org>; Tue, 28 Mar 2023 21:55:37 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id bg16-20020a05600c3c9000b003eb34e21bdfso10672462wmb.0
        for <linux-kbuild@vger.kernel.org>; Tue, 28 Mar 2023 21:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1680065736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EwZQgZuukK5ZcMfwhQ8cOp9XaPAwPgUAMS4WLeQguqk=;
        b=E3Z4Yqhoin1W8r2t+Jyhb4Jqxbb/dLpgY31WgMC/8f4M9Agb0OzJlakAr0drlghh2B
         ZtOOx+SrUI2+Y2A2rSR9cMwIRUMF5pNcTOP1QTN3TGiqltjw5qd92s7SeTRGf1Falocp
         QTJ5ejL81s/SAgZfBKC69BFU2tmVRBauch20G2Y5j6xUaUdlA0SGZopmV6daT6VRNgRI
         IJS+IFtjoBb0K1xT2ifMxLBr8JTiqs+T8R/Rth3HfyOLzpfjohMpDGfFJaDQgExXIBL/
         5H7bEEdsD0Sy58CqDhf7boCxDSJekNe+SKevoFuOkns50ZDd6e9wroN5P47Q03l4x0Sl
         VTDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680065736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EwZQgZuukK5ZcMfwhQ8cOp9XaPAwPgUAMS4WLeQguqk=;
        b=mgt2YVe/brP0nSR6zSNEfFKbSpUNcwRH9akiLmbkHEKvV0TgdEiFmz679O78oILN3L
         W78bAIxsa0ocfBfTJ1oze41DkXr14Qt8MplV+phNDxh0O5+JcksboyJdy4HzjonfzNEw
         Ym0rYWUcq2RRtvyhYTI6ym+QEiYYrd1cCEBUzyLAf5ke4IkoAv0fqPCIDHJzu+1lPvGy
         vsTiabpIeBJdRdZ8IpIf0dbkrQDTSwixrlmADuD+ykqLSxoDpszXb8QYjY059mJn3qP8
         JMoDsQBPMItrlpLFZS7gcTDCrUqCFvcCgfLNjAkO/2pWHHbTrt02NXeqCqFOUuIwWWCB
         B3Zg==
X-Gm-Message-State: AO0yUKXSQ+URsebKSuUEKF9o2afFeaKiSJU/vJQ8MPpf/u0qE50YHdQk
        xqhN8yKLwBb9sw7VRQYqPLcBZA==
X-Google-Smtp-Source: AK7set+5IRHyYxxuib+WjeFew51ry16Zrb5/PPkIgLCKxGSq+H5MoxgqvQV7tTLU4AjobT2NNsYQgQ==
X-Received: by 2002:a7b:cbd2:0:b0:3ee:3e07:5d26 with SMTP id n18-20020a7bcbd2000000b003ee3e075d26mr13763028wmi.24.1680065735865;
        Tue, 28 Mar 2023 21:55:35 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id c1-20020a05600c0a4100b003ee5fa61f45sm840822wmq.3.2023.03.28.21.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 21:55:35 -0700 (PDT)
From:   Alexandre Ghiti <alexghiti@rivosinc.com>
To:     Nick Desaulniers <ndesaulniers@google.com>,
        =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kbuild@vger.kernel.org
Cc:     Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v9 2/6] riscv: Move .rela.dyn outside of init to avoid empty relocations
Date:   Wed, 29 Mar 2023 06:53:25 +0200
Message-Id: <20230329045329.64565-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230329045329.64565-1-alexghiti@rivosinc.com>
References: <20230329045329.64565-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This is a preparatory patch for relocatable kernels: .rela.dyn should be
in .init but doing so actually produces empty relocations, so this should
be a temporary commit until we find a solution.

This issue was reported here [1].

[1] https://lore.kernel.org/all/4a6fc7a3-9697-a49b-0941-97f32194b0d7@ghiti.fr/.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/kernel/vmlinux.lds.S | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index 1c38294580c0..e05e6df44225 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -96,10 +96,6 @@ SECTIONS
 		*(.rel.dyn*)
 	}
 
-	.rela.dyn : {
-		*(.rela*)
-	}
-
 	__init_data_end = .;
 
 	. = ALIGN(8);
@@ -126,6 +122,10 @@ SECTIONS
 		*(.sdata*)
 	}
 
+	.rela.dyn : {
+		*(.rela*)
+	}
+
 #ifdef CONFIG_EFI
 	.pecoff_edata_padding : { BYTE(0); . = ALIGN(PECOFF_FILE_ALIGNMENT); }
 	__pecoff_data_raw_size = ABSOLUTE(. - __pecoff_text_end);
-- 
2.37.2

