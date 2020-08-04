Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8057B23B261
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Aug 2020 03:41:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729449AbgHDBlF convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-kbuild@lfdr.de>); Mon, 3 Aug 2020 21:41:05 -0400
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133]:36808 "EHLO
        out30-133.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729412AbgHDBlF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 Aug 2020 21:41:05 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01f04397;MF=changhuaixin@linux.alibaba.com;NM=1;PH=DS;RN=14;SR=0;TI=SMTPD_---0U4hDN3a_1596505240;
Received: from 30.27.116.1(mailfrom:changhuaixin@linux.alibaba.com fp:SMTPD_---0U4hDN3a_1596505240)
          by smtp.aliyun-inc.com(127.0.0.1);
          Tue, 04 Aug 2020 09:40:41 +0800
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH 1/3] scripts/sorttable: Change section type of orc_lookup
 to SHT_PROGBITS
From:   changhuaixin <changhuaixin@linux.alibaba.com>
In-Reply-To: <20200723034643.33537-2-changhuaixin@linux.alibaba.com>
Date:   Tue, 4 Aug 2020 09:40:40 +0800
Cc:     changhuaixin <changhuaixin@linux.alibaba.com>, bp@alien8.de,
        hpa@zytor.com, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, luto@amacapital.net,
        michal.lkml@markovi.net, mingo@redhat.com,
        Peter Zijlstra <peterz@infradead.org>, tglx@linutronix.de,
        x86@kernel.org, yamada.masahiro@socionext.com, jpoimboe@redhat.com
Content-Transfer-Encoding: 8BIT
Message-Id: <2714DF66-5F65-4CB1-A232-B88E4D5AF566@linux.alibaba.com>
References: <20200723034643.33537-1-changhuaixin@linux.alibaba.com>
 <20200723034643.33537-2-changhuaixin@linux.alibaba.com>
To:     Ingo Molnar <mingo@kernel.org>
X-Mailer: Apple Mail (2.3445.104.11)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi, Ingo

Another way to write SHT_PROGBITS is using elf_create_section to write orc_lookup table headers, when orc_unwind_ip table and orc_unwind table are written. Is this a better solution?

diff --git a/tools/objtool/orc_gen.c b/tools/objtool/orc_gen.c
index 3f98dcfbc177..860d4dcec8e6 100644
--- a/tools/objtool/orc_gen.c
+++ b/tools/objtool/orc_gen.c
@@ -183,6 +183,10 @@ int create_orc_sections(struct objtool_file *file)
        u_sec = elf_create_section(file->elf, ".orc_unwind",
                                   sizeof(struct orc_entry), idx);

+       /* make flags of section orc_lookup right */
+       if (!elf_create_section(file->elf, ".orc_lookup", sizeof(int), 0))
+               return -1;
+
        /* populate sections */
        idx = 0;
        for_each_sec(file, sec) {

Thanks,
Huaixin

> On Jul 23, 2020, at 11:46 AM, Huaixin Chang <changhuaixin@linux.alibaba.com> wrote:
> 
> In order to edit orc_lookup table via sorttable, type of section
> orc_lookup needs to be SHT_PROGBITS instead of SHT_NOBITS.
> 
> Linker script doesn't seem to allow manual specification of the section
> type, so just write a byte into the section instead.
> 
> Signed-off-by: Josh Poimboeuf <jpoimboe@redhat.com>
> Signed-off-by: Huaixin Chang <changhuaixin@linux.alibaba.com>
> Signed-off-by: Shile Zhang <shile.zhang@linux.alibaba.com>
> ---
> include/asm-generic/vmlinux.lds.h | 2 ++
> 1 file changed, 2 insertions(+)
> 
> diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
> index db600ef218d7..49f4f5bc6165 100644
> --- a/include/asm-generic/vmlinux.lds.h
> +++ b/include/asm-generic/vmlinux.lds.h
> @@ -826,6 +826,8 @@
> 		. += (((SIZEOF(.text) + LOOKUP_BLOCK_SIZE - 1) /	\
> 			LOOKUP_BLOCK_SIZE) + 1) * 4;			\
> 		orc_lookup_end = .;					\
> +		/* HACK: force SHT_PROGBITS so sorttable can edit: */	\
> +		BYTE(1);						\
> 	}
> #else
> #define ORC_UNWIND_TABLE
> -- 
> 2.14.4.44.g2045bb6

