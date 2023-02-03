Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 563E368A084
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Feb 2023 18:38:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231526AbjBCRid (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 3 Feb 2023 12:38:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233473AbjBCRi2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 3 Feb 2023 12:38:28 -0500
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 007C893D2;
        Fri,  3 Feb 2023 09:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
        s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:
        Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=NGs0D5IZjQcREfJVznKum6Ng05dV4TpF7IPFxqAtWD4=; b=YGXa/an4mKsbYcwtqloAOvm+hn
        WaGH9ssdElPqG1yylMqiZL/Wbb819CP05kHWjJaxu0RUR1Tyr4qm0xZAICXsLBxRmf9cK1Jyy2IW8
        GLZt1Sh3jSLL6CLPn1/e3V4yaiF7nd7AOZb4G+kItgJgCP6MDf7KOWHIDIzlW5Aay4Yv+dz+3wDlv
        3seIFG/b6/u4FDQLDzWmTwfgEnwNRZ5s93YqLPS2cmgqR1bHDwtXzBy/wnZ/WZuXS8ZgSAmRlLFAn
        eWGFy2mGKgFKoezMnA0sMXRowdsOQVF2Yu5V7iYPNcfr30EKx71Z43NkgrpT3f81kUbHXukN7bcXX
        c29c5qIA==;
Received: from [187.36.234.139] (helo=bowie..)
        by fanzine2.igalia.com with esmtpsa 
        (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
        id 1pO00H-008PW0-ML; Fri, 03 Feb 2023 18:37:38 +0100
From:   =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>
Cc:     Melissa Wen <mwen@igalia.com>, linux-kbuild@vger.kernel.org,
        rust-for-linux@vger.kernel.org,
        =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH] rust: delete rust-project.json when running make clean
Date:   Fri,  3 Feb 2023 14:37:04 -0300
Message-Id: <20230203173704.108942-1-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

rust-project.json is the configuration file used by rust-analyzer.
As it is a configuration file and it is not needed to build external
modules, it should be delete by make clean. So, delete rust-project.json
when running make clean.

Link: https://github.com/Rust-for-Linux/linux/issues/939
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index f41ec8c8426b..6223d5f82f66 100644
--- a/Makefile
+++ b/Makefile
@@ -1573,7 +1573,7 @@ endif # CONFIG_MODULES
 CLEAN_FILES += include/ksym vmlinux.symvers modules-only.symvers \
 	       modules.builtin modules.builtin.modinfo modules.nsdeps \
 	       compile_commands.json .thinlto-cache rust/test rust/doc \
-	       .vmlinux.objs .vmlinux.export.c
+	       rust-project.json .vmlinux.objs .vmlinux.export.c
 
 # Directories & files removed with 'make mrproper'
 MRPROPER_FILES += include/config include/generated          \
-- 
2.39.1

