Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E74DD207D5F
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Jun 2020 22:36:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406609AbgFXUds (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 24 Jun 2020 16:33:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406607AbgFXUdi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 24 Jun 2020 16:33:38 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11194C061573
        for <linux-kbuild@vger.kernel.org>; Wed, 24 Jun 2020 13:33:37 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id z7so3557462ybz.1
        for <linux-kbuild@vger.kernel.org>; Wed, 24 Jun 2020 13:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=vVvCAj3rXahkiTyB3fdf4JdbPFhKMTMNyBg/koJzOHM=;
        b=A1OVxmohREiIQE9uWobns3DZjU2BjnF5/uRv4vfcaF2sodOxkh4sxle+6JGl3ADtOZ
         3fmTbkzX8W7ahG1bTGpXMMU9CdKC8UZUye2VucpEx7325i3QESTUcI83ndSOc6E8Kmzu
         N5PlhLkCWO4j4sIvQEk9eacQtD+bX2UY3Y5a4I1dsdat2Jm3e0YTj4ppvoCyl2YlPdbY
         ZyEZAXO2uSqBN9R05BjPoqjam4RsnD1PfD+i8NAuT2L+OMarD3RxLispCXwkir37c5B5
         L+Lu+ZWTjo7NmJwPgVCLx0NgAf7Qq1Qws+DG9FZOXnsn8vOlmmibTipSbU4GNNmhC8bb
         0u7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=vVvCAj3rXahkiTyB3fdf4JdbPFhKMTMNyBg/koJzOHM=;
        b=XtTpQoH8M5Vzspwfe5nwIBpaAVUZ5vXKCJOB+6dzqf5NEDlN1eBD1eafsh6Umk4UI8
         omY39mE8OO2J+3IQ2nhk1D4BlcjCIfzWu3TbRO4+/XKpaYtyRzloza9Iuds2EtVktOV0
         cfupN0nkJLNAE2r49+XPCL66prMXxaT/2vI3Us206ekupBuh8pRkDm7RCQHAl1s2eqKS
         5pq/CFvXHkunAiXn8Rrg1antHFEO3gtctYkCoz7Bup55xv3SIRKb/2EWq3g9Zo3W8Atp
         JLbo0rrRD29AbxSL0BGuzDMMOQ4TFl4puDyrrzheZJO6LgLD1m3KBfWmK0trnw7unJG6
         PQnw==
X-Gm-Message-State: AOAM5315ojb/MAZNSJA/G6MGiYPx4+OwyTf7uWyC5ilhdtk/qGX2jxYM
        3B3TNAv0P009oNYp7HB663Fqm2az57FPYz/goVI=
X-Google-Smtp-Source: ABdhPJxFwd5sYHcpKP7HH5wq1l18/N0yS86uUmxUS0eTeAHpLUaXB5pBxjwc02CZmZmfKSgokc5xwqXiDOu/w8PP8nk=
X-Received: by 2002:a25:7450:: with SMTP id p77mr23380392ybc.155.1593030816256;
 Wed, 24 Jun 2020 13:33:36 -0700 (PDT)
Date:   Wed, 24 Jun 2020 13:31:59 -0700
In-Reply-To: <20200624203200.78870-1-samitolvanen@google.com>
Message-Id: <20200624203200.78870-22-samitolvanen@google.com>
Mime-Version: 1.0
References: <20200624203200.78870-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
Subject: [PATCH 21/22] x86, relocs: Ignore L4_PAGE_OFFSET relocations
From:   Sami Tolvanen <samitolvanen@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Will Deacon <will@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com,
        kernel-hardening@lists.openwall.com, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        x86@kernel.org, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

L4_PAGE_OFFSET is a constant value, so don't warn about absolute
relocations.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 arch/x86/tools/relocs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/tools/relocs.c b/arch/x86/tools/relocs.c
index ce7188cbdae5..8f3bf34840ce 100644
--- a/arch/x86/tools/relocs.c
+++ b/arch/x86/tools/relocs.c
@@ -47,6 +47,7 @@ static const char * const sym_regex_kernel[S_NSYMTYPES] = {
 	[S_ABS] =
 	"^(xen_irq_disable_direct_reloc$|"
 	"xen_save_fl_direct_reloc$|"
+	"L4_PAGE_OFFSET|"
 	"VDSO|"
 	"__crc_)",
 
-- 
2.27.0.212.ge8ba1cc988-goog

