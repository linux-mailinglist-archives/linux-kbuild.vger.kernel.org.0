Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D6582F2A11
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Jan 2021 09:31:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405243AbhALIab (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 12 Jan 2021 03:30:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404959AbhALIaa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Jan 2021 03:30:30 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0E0CC0617A7
        for <linux-kbuild@vger.kernel.org>; Tue, 12 Jan 2021 00:29:18 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id v19so942000pgj.12
        for <linux-kbuild@vger.kernel.org>; Tue, 12 Jan 2021 00:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9FnCdmEEGSQX+RKqefc8hvZ3CGNJpcGjSObBIm4DdhU=;
        b=hrulJ76Tv91s7SpdhYOy9jmlFw1Fhw/qiYTAMrHBR79CBwvq6sAzjtxv5hEnUF1yXq
         Vn+MH/2OzfXdLH4R5B1XZsBVJ0NF9pFu4OqX5CCiPhTgaxCnUygFwsq6cQb8M69Z2dyK
         pD/Lzt2kiEq0cmqq31x5zlDCPAzScU/o7M6hec8Aw2HP2CX98MfZStjEgwGw+Ly7W0IU
         CPle+X0NZ6EvnErCZiFMbIneBrc1cWVTjm5Q7QflQ0bGrMRX8nbv5UcU812AzKU6r9DB
         idwrnlwnDMOYRaKg9IqNcNJuMCcT0M54mgFiZECjX7MzThKAJwsDMQU/xzBhUrkscUMS
         GU4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9FnCdmEEGSQX+RKqefc8hvZ3CGNJpcGjSObBIm4DdhU=;
        b=fkp1yX2QfUuUWlJPt/rEhUQvV+krlvz+xHrhsPLkrHV6FnvIHkaV4BjOElLv2B2L05
         tFwJuJfuio8k2FqGKqf+LvHX9snNWYW+Na65kqnFtyCTzMWHRix59+rzqC/xqU/wMB42
         5CIlgqQEkN5EqBal00D2xALgO/fNPOpbbOMWbTrNjPiw+nUrajnr04wtqsaIgQ+tgmF9
         K6aWttHNiwvmbidKfGb4E6D0Bv/qnilZngwsUPnCDXSPMtmOvMXJknhBThvaPAi3VcDw
         rFXzv7QqBRkYa3pwHD4nZRUi/vbBCOD87JoMcy+u83qsiTcMeS0ZYrbHlszZRvMMb2fR
         p56Q==
X-Gm-Message-State: AOAM530tZA/d6Kty6AID00TMVnGmtG3THgOJ9oU+AP5ncnyYuM4Z2i8h
        1/Jz2fiXPkA4GNJSvF+TCUatcQ==
X-Google-Smtp-Source: ABdhPJy3+Z6QgkpOKB9CLurMPFoM5R15S4+aImyXeHZ/86rBAV3ZUmQwtDYFMyCYzPlSEIAQZKpKYw==
X-Received: by 2002:aa7:843a:0:b029:19d:b279:73c9 with SMTP id q26-20020aa7843a0000b029019db27973c9mr3843688pfn.3.1610440158277;
        Tue, 12 Jan 2021 00:29:18 -0800 (PST)
Received: from localhost ([122.172.85.111])
        by smtp.gmail.com with ESMTPSA id t7sm2143478pfe.179.2021.01.12.00.29.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 Jan 2021 00:29:17 -0800 (PST)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>, anmar.oueja@linaro.org,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH V4 3/3] scripts: dtc: Remove the unused fdtdump.c file
Date:   Tue, 12 Jan 2021 13:59:02 +0530
Message-Id: <25d98b2fe9bea3fe784f8392a73b88a253c8b97a.1610431620.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1610431620.git.viresh.kumar@linaro.org>
References: <cover.1610431620.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This was copied from external DTC repository long back and isn't used
anymore. Over that the dtc tool can be used to generate the dts source
back from the dtb. Remove the unused fdtdump.c file.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 scripts/dtc/fdtdump.c | 163 ------------------------------------------
 1 file changed, 163 deletions(-)
 delete mode 100644 scripts/dtc/fdtdump.c

diff --git a/scripts/dtc/fdtdump.c b/scripts/dtc/fdtdump.c
deleted file mode 100644
index 7d460a50b513..000000000000
--- a/scripts/dtc/fdtdump.c
+++ /dev/null
@@ -1,163 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * fdtdump.c - Contributed by Pantelis Antoniou <pantelis.antoniou AT gmail.com>
- */
-
-#include <stdint.h>
-#include <stdio.h>
-#include <stdlib.h>
-#include <string.h>
-#include <ctype.h>
-
-#include <fdt.h>
-#include <libfdt_env.h>
-
-#include "util.h"
-
-#define ALIGN(x, a)	(((x) + ((a) - 1)) & ~((a) - 1))
-#define PALIGN(p, a)	((void *)(ALIGN((unsigned long)(p), (a))))
-#define GET_CELL(p)	(p += 4, *((const uint32_t *)(p-4)))
-
-static void print_data(const char *data, int len)
-{
-	int i;
-	const char *p = data;
-
-	/* no data, don't print */
-	if (len == 0)
-		return;
-
-	if (util_is_printable_string(data, len)) {
-		printf(" = \"%s\"", (const char *)data);
-	} else if ((len % 4) == 0) {
-		printf(" = <");
-		for (i = 0; i < len; i += 4)
-			printf("0x%08x%s", fdt32_to_cpu(GET_CELL(p)),
-			       i < (len - 4) ? " " : "");
-		printf(">");
-	} else {
-		printf(" = [");
-		for (i = 0; i < len; i++)
-			printf("%02x%s", *p++, i < len - 1 ? " " : "");
-		printf("]");
-	}
-}
-
-static void dump_blob(void *blob)
-{
-	struct fdt_header *bph = blob;
-	uint32_t off_mem_rsvmap = fdt32_to_cpu(bph->off_mem_rsvmap);
-	uint32_t off_dt = fdt32_to_cpu(bph->off_dt_struct);
-	uint32_t off_str = fdt32_to_cpu(bph->off_dt_strings);
-	struct fdt_reserve_entry *p_rsvmap =
-		(struct fdt_reserve_entry *)((char *)blob + off_mem_rsvmap);
-	const char *p_struct = (const char *)blob + off_dt;
-	const char *p_strings = (const char *)blob + off_str;
-	uint32_t version = fdt32_to_cpu(bph->version);
-	uint32_t totalsize = fdt32_to_cpu(bph->totalsize);
-	uint32_t tag;
-	const char *p, *s, *t;
-	int depth, sz, shift;
-	int i;
-	uint64_t addr, size;
-
-	depth = 0;
-	shift = 4;
-
-	printf("/dts-v1/;\n");
-	printf("// magic:\t\t0x%x\n", fdt32_to_cpu(bph->magic));
-	printf("// totalsize:\t\t0x%x (%d)\n", totalsize, totalsize);
-	printf("// off_dt_struct:\t0x%x\n", off_dt);
-	printf("// off_dt_strings:\t0x%x\n", off_str);
-	printf("// off_mem_rsvmap:\t0x%x\n", off_mem_rsvmap);
-	printf("// version:\t\t%d\n", version);
-	printf("// last_comp_version:\t%d\n",
-	       fdt32_to_cpu(bph->last_comp_version));
-	if (version >= 2)
-		printf("// boot_cpuid_phys:\t0x%x\n",
-		       fdt32_to_cpu(bph->boot_cpuid_phys));
-
-	if (version >= 3)
-		printf("// size_dt_strings:\t0x%x\n",
-		       fdt32_to_cpu(bph->size_dt_strings));
-	if (version >= 17)
-		printf("// size_dt_struct:\t0x%x\n",
-		       fdt32_to_cpu(bph->size_dt_struct));
-	printf("\n");
-
-	for (i = 0; ; i++) {
-		addr = fdt64_to_cpu(p_rsvmap[i].address);
-		size = fdt64_to_cpu(p_rsvmap[i].size);
-		if (addr == 0 && size == 0)
-			break;
-
-		printf("/memreserve/ %llx %llx;\n",
-		       (unsigned long long)addr, (unsigned long long)size);
-	}
-
-	p = p_struct;
-	while ((tag = fdt32_to_cpu(GET_CELL(p))) != FDT_END) {
-
-		/* printf("tag: 0x%08x (%d)\n", tag, p - p_struct); */
-
-		if (tag == FDT_BEGIN_NODE) {
-			s = p;
-			p = PALIGN(p + strlen(s) + 1, 4);
-
-			if (*s == '\0')
-				s = "/";
-
-			printf("%*s%s {\n", depth * shift, "", s);
-
-			depth++;
-			continue;
-		}
-
-		if (tag == FDT_END_NODE) {
-			depth--;
-
-			printf("%*s};\n", depth * shift, "");
-			continue;
-		}
-
-		if (tag == FDT_NOP) {
-			printf("%*s// [NOP]\n", depth * shift, "");
-			continue;
-		}
-
-		if (tag != FDT_PROP) {
-			fprintf(stderr, "%*s ** Unknown tag 0x%08x\n", depth * shift, "", tag);
-			break;
-		}
-		sz = fdt32_to_cpu(GET_CELL(p));
-		s = p_strings + fdt32_to_cpu(GET_CELL(p));
-		if (version < 16 && sz >= 8)
-			p = PALIGN(p, 8);
-		t = p;
-
-		p = PALIGN(p + sz, 4);
-
-		printf("%*s%s", depth * shift, "", s);
-		print_data(t, sz);
-		printf(";\n");
-	}
-}
-
-
-int main(int argc, char *argv[])
-{
-	char *buf;
-
-	if (argc < 2) {
-		fprintf(stderr, "supply input filename\n");
-		return 5;
-	}
-
-	buf = utilfdt_read(argv[1]);
-	if (buf)
-		dump_blob(buf);
-	else
-		return 10;
-
-	return 0;
-}
-- 
2.25.0.rc1.19.g042ed3e048af

