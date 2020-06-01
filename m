Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F7161EA875
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Jun 2020 19:38:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726962AbgFARiy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 1 Jun 2020 13:38:54 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:53547 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726017AbgFARix (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Jun 2020 13:38:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1591033131;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=j3La3/IwaxnOET8NRtQwxdy61w/eF/NkEHGvpZshyBY=;
        b=EnfOdtM6wk8MTzmvKA+WaHujGuViEEKi6Q59AO45RuKLIcmLIn0vJnzE6IQRGiGzKNaHgd
        R22lmDErteX/RkrGVwkivhk0Dm5kInzcbizikEeMp0ME5Lt0z0mqmae5dv4mQ1W5PMdUAu
        hJYx4jILtxxAUlim5foC2bcp3buxxDw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-kg2Xm74kMjmoQlPnsXLHJw-1; Mon, 01 Jun 2020 13:38:47 -0400
X-MC-Unique: kg2Xm74kMjmoQlPnsXLHJw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E130800053;
        Mon,  1 Jun 2020 17:38:45 +0000 (UTC)
Received: from treble (ovpn-116-170.rdu2.redhat.com [10.10.116.170])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id E984210013C1;
        Mon,  1 Jun 2020 17:38:42 +0000 (UTC)
Date:   Mon, 1 Jun 2020 12:38:40 -0500
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     changhuaixin <changhuaixin@linux.alibaba.com>
Cc:     linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        bp@alien8.de, hpa@zytor.com, luto@amacapital.net,
        michal.lkml@markovi.net, mingo@redhat.com, peterz@infradead.org,
        tglx@linutronix.de, x86@kernel.org, yamada.masahiro@socionext.com
Subject: Re: [PATCH 0/2] Build ORC fast lookup table in scripts/sorttable tool
Message-ID: <20200601173840.3f36m6l4fsu5bill@treble>
References: <20200429064626.16389-1-changhuaixin@linux.alibaba.com>
 <20200522182815.ezanmvbemhzq2fmm@treble>
 <482837A8-E9D9-4229-B7B1-8E14403FB2AC@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <482837A8-E9D9-4229-B7B1-8E14403FB2AC@linux.alibaba.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, May 31, 2020 at 01:26:54PM +0800, changhuaixin wrote:
>    It turned out to be an alignment problem. If sh_size of previous section
>    orc_unwind is not 4-byte aligned, sh_offset of the following orc_lookup
>    section is not 4-byte aligned too. However, the VMA of section orc_lookup
>    is aligned to the nearest 4-byte. Thus, the orc_lookup section means two
>    different ares for scripts/sorttable tool and kernel.
> 
>    Sections headers look like this when it happens:
> 
>    12 .orc_unwind_ip 00172124  ffffffff82573b28  0000000002573b28  01773b28
>     2**0
>                     CONTENTS, ALLOC, LOAD, RELOC, READONLY, DATA
>    13 .orc_unwind   0022b1b6  ffffffff826e5c4c  00000000026e5c4c  018e5c4c
>     2**0
>                     CONTENTS, ALLOC, LOAD, READONLY, DATA
>    14 .orc_lookup   0003003c  ffffffff82910e04  0000000002910e04  01b10e02
>     2**0
>                     ALLOC
>    15 .vvar         00001000  ffffffff82941000  0000000002941000  01b41000
>     2**4
>                     CONTENTS, ALLOC, LOAD, DATA
> 
>    Sorttable tool uses the are starting with offset 0x01b10e02 for 0x0003003c
>    bytes. While kernel use the area starting with VMA at  0xffffffff82910e04
>    for 0x0003003c bytes, meaning that each entry in this table used by kernel
>    is actually 2 bytes behind the corresponding entry set from sorttable
>    tool.
> 
>    Any suggestion on fixing this？

The VMA and LMA are both 4-byte aligned.  The file offset alignment
(0x01b10e02) shouldn't matter.

Actually it looks like the problem is that the section doesn't have
CONTENTS, so it's just loaded as a BSS section (all zeros).  The section
needs to be type SHT_PROGBITS instead of SHT_NOBITS.

$ readelf -S vmlinux |grep orc_lookup
  [16] .orc_lookup       NOBITS           ffffffff82b68418  01d68418

I tried to fix it with

diff --git a/scripts/sorttable.h b/scripts/sorttable.h
index a36c76c17be4..76adb1fb88f8 100644
--- a/scripts/sorttable.h
+++ b/scripts/sorttable.h
@@ -341,6 +341,7 @@ static int do_sort(Elf_Ehdr *ehdr,
 			param.lookup_table_size = s->sh_size;
 			param.orc_lookup_table = (unsigned int *)
 				((void *)ehdr + s->sh_offset);
+			w(SHT_PROGBITS, &s->sh_type);
 		}
 		if (!strcmp(secstrings + idx, ".text")) {
 			param.text_size = s->sh_size;


But that makes kallsyms unhappy, so I guess we need to do it from the
linker script where .orc_lookup is created.

Linker script doesn't seem to allow manual specification of the section
type, so this is the best I could come up with:

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

