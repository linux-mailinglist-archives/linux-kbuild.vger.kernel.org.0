Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B80023E69C
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Aug 2020 06:18:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726096AbgHGESc (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 7 Aug 2020 00:18:32 -0400
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130]:36563 "EHLO
        out30-130.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725379AbgHGESb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 7 Aug 2020 00:18:31 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R431e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04407;MF=changhuaixin@linux.alibaba.com;NM=1;PH=DS;RN=13;SR=0;TI=SMTPD_---0U4zfEsz_1596773909;
Received: from localhost(mailfrom:changhuaixin@linux.alibaba.com fp:SMTPD_---0U4zfEsz_1596773909)
          by smtp.aliyun-inc.com(127.0.0.1);
          Fri, 07 Aug 2020 12:18:29 +0800
From:   Huaixin Chang <changhuaixin@linux.alibaba.com>
To:     changhuaixin@linux.alibaba.com
Cc:     bp@alien8.de, hpa@zytor.com, jpoimboe@redhat.com,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        luto@amacapital.net, michal.lkml@markovi.net, mingo@redhat.com,
        peterz@infradead.org, tglx@linutronix.de, x86@kernel.org,
        yamada.masahiro@socionext.com
Subject: [PATCH 1/3] objtool: Write .orc_lookup section header
Date:   Fri,  7 Aug 2020 12:18:00 +0800
Message-Id: <20200807041802.18639-2-changhuaixin@linux.alibaba.com>
X-Mailer: git-send-email 2.14.4.44.g2045bb6
In-Reply-To: <20200807041802.18639-1-changhuaixin@linux.alibaba.com>
References: <20200723034643.33537-1-changhuaixin@linux.alibaba.com>
 <20200807041802.18639-1-changhuaixin@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The purpose of this patch is to set sh_type to SHT_PROGBITS and remove
write bits away from sh_flags. In order to write section header, just
call elf_create_section() upon section orc_lookup with 0 entry written.

Originally, section headers are as follows:

  [23] .orc_unwind_ip    PROGBITS         ffffffff8259f4b8  0179f4b8
       0000000000178bbc  0000000000000000   A       0     0     1
  [24] .rela.orc_unwind_ RELA             0000000000000000  11e57b58
       00000000008d4668  0000000000000018   I      70    23     8
  [25] .orc_unwind       PROGBITS         ffffffff82718074  01918074
       000000000023519a  0000000000000000   A       0     0     1
  [26] .orc_lookup       NOBITS           ffffffff8294d210  01b4d20e
       0000000000030038  0000000000000000  WA       0     0     1
  [27] .vvar             PROGBITS         ffffffff8297e000  01b7e000
       0000000000001000  0000000000000000  WA       0     0     16

Now, they are changed to:

  [23] .orc_unwind_ip    PROGBITS         ffffffff8259f4b8  0179f4b8
       0000000000178bbc  0000000000000000   A       0     0     1
  [24] .rela.orc_unwind_ RELA             0000000000000000  11e57b58
       00000000008d4668  0000000000000018   I      70    23     8
  [25] .orc_unwind       PROGBITS         ffffffff82718074  01918074
       000000000023519a  0000000000000000   A       0     0     1
  [26] .orc_lookup       PROGBITS         ffffffff8294d210  01b4d210
       0000000000030038  0000000000000000   A       0     0     1
  [27] .vvar             PROGBITS         ffffffff8297e000  01b7e000
       0000000000001000  0000000000000000  WA       0     0     16

Signed-off-by: Huaixin Chang <changhuaixin@linux.alibaba.com>
---
 tools/objtool/orc_gen.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/objtool/orc_gen.c b/tools/objtool/orc_gen.c
index 968f55e6dd94..2b2653979ad6 100644
--- a/tools/objtool/orc_gen.c
+++ b/tools/objtool/orc_gen.c
@@ -189,6 +189,10 @@ int create_orc_sections(struct objtool_file *file)
 	u_sec = elf_create_section(file->elf, ".orc_unwind",
 				   sizeof(struct orc_entry), idx);
 
+	/* make flags of section orc_lookup right */
+	if (!elf_create_section(file->elf, ".orc_lookup", sizeof(int), 0))
+		return -1;
+
 	/* populate sections */
 	idx = 0;
 	for_each_sec(file, sec) {
-- 
2.14.4.44.g2045bb6

