Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08BCD1ED23F
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Jun 2020 16:42:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726032AbgFCOmF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 3 Jun 2020 10:42:05 -0400
Received: from out30-56.freemail.mail.aliyun.com ([115.124.30.56]:33508 "EHLO
        out30-56.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725867AbgFCOmF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 3 Jun 2020 10:42:05 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R971e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04426;MF=changhuaixin@linux.alibaba.com;NM=1;PH=DS;RN=13;SR=0;TI=SMTPD_---0U-UFKG._1591195317;
Received: from localhost(mailfrom:changhuaixin@linux.alibaba.com fp:SMTPD_---0U-UFKG._1591195317)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 03 Jun 2020 22:41:57 +0800
From:   Huaixin Chang <changhuaixin@linux.alibaba.com>
To:     jpoimboe@redhat.com
Cc:     bp@alien8.de, changhuaixin@linux.alibaba.com, hpa@zytor.com,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        luto@amacapital.net, michal.lkml@markovi.net, mingo@redhat.com,
        peterz@infradead.org, tglx@linutronix.de, x86@kernel.org,
        yamada.masahiro@socionext.com
Subject: [PATCH 1/3] scripts/sorttable: Change section type of orc_lookup to SHT_PROGBITS
Date:   Wed,  3 Jun 2020 22:39:43 +0800
Message-Id: <20200603143945.64248-2-changhuaixin@linux.alibaba.com>
X-Mailer: git-send-email 2.14.4.44.g2045bb6
In-Reply-To: <20200603143945.64248-1-changhuaixin@linux.alibaba.com>
References: <20200601173840.3f36m6l4fsu5bill@treble>
 <20200603143945.64248-1-changhuaixin@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

In order to edit orc_lookup table via sorttable, type of section
orc_lookup needs to be SHT_PROGBITS instead of SHT_NOBITS.

Linker script doesn't seem to allow manual specification of the section
type, so just write a byte into the section instead.

Signed-off-by: Josh Poimboeuf <jpoimboe@redhat.com>
Signed-off-by: Huaixin Chang <changhuaixin@linux.alibaba.com>
Signed-off-by: Shile Zhang <shile.zhang@linux.alibaba.com>
---
 include/asm-generic/vmlinux.lds.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index db600ef218d7..49f4f5bc6165 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -826,6 +826,8 @@
 		. += (((SIZEOF(.text) + LOOKUP_BLOCK_SIZE - 1) /	\
 			LOOKUP_BLOCK_SIZE) + 1) * 4;			\
 		orc_lookup_end = .;					\
+		/* HACK: force SHT_PROGBITS so sorttable can edit: */	\
+		BYTE(1);						\
 	}
 #else
 #define ORC_UNWIND_TABLE
-- 
2.14.4.44.g2045bb6

