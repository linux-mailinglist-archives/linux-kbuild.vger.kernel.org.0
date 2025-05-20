Return-Path: <linux-kbuild+bounces-7163-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 663B3ABD18E
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 May 2025 10:12:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35AB0189BF62
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 May 2025 08:12:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFB8225B69F;
	Tue, 20 May 2025 08:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z2ttoRup"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D63F259C92;
	Tue, 20 May 2025 08:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747728714; cv=none; b=W5+nm+akAxSY9Zu9MiwCm0m1SECMQOemDI9CZSWl3lmmKiuJoDV8EYgbRsV4hICi3DpR9L4vxb69nPUOiCzgSBsNDUxO8TkVn5PEaPlJ/UkNg+HHk0WbDWxEkCxGsI5qeJzQF6ICkX3cFDJs1ZGF/EVTcH1NPSfy98v53YjzaV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747728714; c=relaxed/simple;
	bh=HY3/3VrBJOV9DPhjj3cdE9p8tIgorKhSkSawnUdq37c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bQj75m0Hc74OpD4xXoPgG932zrat9eyiALg+BXNto8zUTqmVlANdLQgmmcyK8DMFZuZnopjbTKtQYA4cXFhUOPTaJYBOen8I/WoK7A4jJ6sH7nD+hUN9D46fj3lRnEsQ/mYRy/BFmfp2F0WFtv5UNX91X2Iv2+bl1muO4n5u8NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z2ttoRup; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-22e033a3a07so54598205ad.0;
        Tue, 20 May 2025 01:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747728712; x=1748333512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IRjDqcSJJrxFBZdRg26AJmo3YQXMo538YSxA/CYDg10=;
        b=Z2ttoRupXmJg37v4o2b7/L2GTMQ8owmMt0ybmGJ4S0RxD3pvs+pWMDgjj0/hmFh19p
         7uVxTaddOnvHNronq2IcWLqoBZ+rMErXnG1KYxwpvMkD3Z3SmqTS7xNmT8QchGTArgFW
         HDWkgN9xzcu4FH/yE0LBQbi6Io9PqfRc5IJyRZkfCFU4Nz95kwa1AVEodqgvcgf8BhRb
         KUqqwev/Fpf2mbqtMAeREW0g0Whmt+NECcn1OrNAqML45Pv+HnTyl0ZtI6lCXRYm9eqL
         hoCQctwAIrkFrwXxEjjm2AGRcbd/3YlGshkWmyQZAubFr4JgfBzpqyTsVQOKuuKgiZRH
         umdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747728712; x=1748333512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IRjDqcSJJrxFBZdRg26AJmo3YQXMo538YSxA/CYDg10=;
        b=bITTma0j08z2NUnpjaZqNP7kZB6xcy83WNl/T6cwEI6EsTOG83rHpwlwdVpxcXZugi
         pZVDKb9KRwZyaFqA8Y6Mq91v1rHoHOdaanPXQdo5SSA9ZEX7gLsjKQdJOBlI9Vmd4nsP
         2/8BrAdJDPe+a+jOkMYcffkY7C44VwrvjqtpCULb9QjwPwN2NWaPJ6heIb5+UkmbklM8
         lsHKogsHEogzeAJ+CE+i6KNRudWFscPR8/knD0HgtLUyaMp85zYc/iIaeMPUTRU4LNRz
         Actm9bhShh3iy9FQuz4NS/VZ1fLRZHnY9MUUPjRIRyyIFfu6N1QhAYOVJXRmS9ceGR56
         nWqw==
X-Forwarded-Encrypted: i=1; AJvYcCV7v9bNRcNlCh77INLbGeP7YXcXkizaOYkS9XnDAXELySpb0FTvM/p4YmjEfAGI9nlj2dQfQhobupztTZY=@vger.kernel.org, AJvYcCVEWUd630Jf7dvtPXpjNmrnGGzcsypYnguhXvTjXjfxRevUHUSujuDrbRq2FDkXM/o+mKUEQSQDFw8Tv7Nx@vger.kernel.org
X-Gm-Message-State: AOJu0YzRhOH7g0MLiScniUNbGySMJFN6WHhV56UdYJvsYB0etFC8HgQG
	DA5m11ipvqgFAQmjKPMvQjwcowZix3SoLjXHKh+BekKC4uTRdvNwRsee
X-Gm-Gg: ASbGncswo7BRINCkgVd5Kh+dljlw8CgtyV0CdX5lcZMe2QRKMKfTCjEwXTS2+AASqAy
	PzSWNk36RT94kwcN9mdYD4K+yNSEsSEt9togNJ0JVmRk2ML4uWehT3XddyS0D2lHdR8c7rBkJ8c
	/UAfZGZorwh79M6Zp8a440ddwLbrrECOAJ73xI5J0BsKrx2FUHuYlt3bs3v+lbVycJK6qEs3FRc
	DLMJ4YfL+NOENZrS2PKScgJx6ZfIv86NgqJ2aC4S6dG7THdoe7r8CDMxcSd/ZiDo9a8AFoCbcTX
	9JP9o/R6tY0QR1J/9H4j4lgjn3S9lSbGjSfTeeHHtHzck+ioUJGffZ9ILA/fyfAwtb6DHLSRBA=
	=
X-Google-Smtp-Source: AGHT+IF01pc7wJS45XtZbbEPv7g6v1IT8nDwJMbFmA9NsJ7SIh5+xzKe2M0rmxrrsMIIzkDuHtu2Wg==
X-Received: by 2002:a17:903:1a68:b0:216:393b:23d4 with SMTP id d9443c01a7336-231d43d9bd7mr237599345ad.11.1747728712228;
        Tue, 20 May 2025 01:11:52 -0700 (PDT)
Received: from localhost.localdomain ([183.137.13.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4adbfe1sm71788425ad.66.2025.05.20.01.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 01:11:52 -0700 (PDT)
From: oaygnahzz <oaygnahzz@gmail.com>
To: masahiroy@kernel.org
Cc: nathan@kernel.org,
	nicolas.schier@linux.dev,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	oaygnahzz <oaygnahzz@gmail.com>
Subject: [PATCH] modpost: decreasing the log print level
Date: Tue, 20 May 2025 13:07:03 +0800
Message-Id: <20250520050703.12173-1-oaygnahzz@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We are doing a kernel hot patch and have modified the internal 
implementation of an exported function (funcA) while also adding 
a new function (funcB) and exporting it. The compilation of the 
kernel hot patch failed, and the print is as follows:.
export_stymbol section contains strange symbol '(unknown)'.

I found that there was a change in whether to call sym_add_exported. 
Before commit ddb5cdbafaaa ("kbuild: generate KSYMTAB entries by modpost")
 committed, it only judged whether it was equal to __ksymtab_. But now, 
it obtains the export symbol by traversing the. rela.export_symbol section 
and then calls check_export_symbol. In the above case, the. 
rela.export_symbol section will have additional funcA information, 
but no export information. This will lead to an error in calling 
check_export_symbol (null is returned when find_fromsym processes funcA), 
and the hot patch make fails.

Signed-off-by: oaygnahzz <oaygnahzz@gmail.com>
---
 scripts/mod/modpost.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index be89921d60b6..cbf83c58f00f 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1075,7 +1075,7 @@ static void check_export_symbol(struct module *mod, struct elf_info *elf,
 	label_name = sym_name(elf, label);
 
 	if (!strstarts(label_name, prefix)) {
-		error("%s: .export_symbol section contains strange symbol '%s'\n",
+		warn("%s: .export_symbol section contains strange symbol '%s'\n",
 		      mod->name, label_name);
 		return;
 	}
-- 
2.33.0


