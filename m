Return-Path: <linux-kbuild+bounces-8658-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4552BB3B961
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 Aug 2025 12:55:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F3E81C86A37
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 Aug 2025 10:55:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDF7E313526;
	Fri, 29 Aug 2025 10:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NNcZnBe/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A081E310782
	for <linux-kbuild@vger.kernel.org>; Fri, 29 Aug 2025 10:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756464876; cv=none; b=DNdwOTK+pTDGgPwnDpIQNyXKwQlbDWJXPfIW83wG6iNkLZdC5bzEUhjrBC9rgEmBsexsTP8rBvLL9LB4EohhCPXDBuQhOppJwGJOhM2ZqKb3GnhvbEaZxsttFmzEypNb3Ha4Hzcf3nkt9EXgZr4R70/osCQUlWOlgqN2DwiZxSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756464876; c=relaxed/simple;
	bh=HAvzKytnoUkJmif830vACBYuc4i5mIbg0Ge6+UpzfJU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=G4IiRC83aLVwtFhmaEA7k//p+yAD1ORg7xkgQRQlQONzr3pOq8cKAvVDsAFzTPjki03qNEqqAsc85x1bL7HetiEoNi48akWe8fpn7ZPfo3YWDMZjkEPIbfDY3f6bhEFo7ddz3XeerFyKDL9BfqfYhOjxp0XbtOvlslE8/VwRuU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NNcZnBe/; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-45a1b0ccb6cso12125545e9.3
        for <linux-kbuild@vger.kernel.org>; Fri, 29 Aug 2025 03:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756464873; x=1757069673; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IzWK5ktBAXMKEip0pMwXuQ+LMz45Er37x59lYOQDEQc=;
        b=NNcZnBe/m8THClDDboyth+1POb+d4nTnlTAYnz/UCSNQT8VoTRSdNghLRH9vCMEyX7
         ujrYO8V4HlwthPPiCPoKTbU3aRuyilet+FtT/qn6W9sW6lV6DfpZlbLeVtiAx0mymGIM
         yq820heCzdiThkwz3EbrlFF+s1Hkh0Ro8+utYuhYYjXPyeFu1fE4GgfoBv1hVn+kkb3G
         GKHKPjwAc/11gD7rofTCC2OWADXg3hobs7RbJfllxA+enEezkal2/6fVQNyqyhb7nuLu
         aQ5D9OFihNR67hQDqvsbffLsHIzge+CHSGxU4Qz+0g7VLYdEt1nedzmPJ5DEDafROUWn
         79IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756464873; x=1757069673;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IzWK5ktBAXMKEip0pMwXuQ+LMz45Er37x59lYOQDEQc=;
        b=ZrunyE453vv1f/3tmyKd2TZgQERUfConEi7xjTPY/zvEfX62oCypp8391I6koTF9wJ
         h/ayotImhie9yQUoph/TbSr+9aJEBoHUowT5jxLXVOiKRKmAOmywqmCPus8f95wkPTaU
         T/XzalgFoCEDw3x3rlHXdO7k2ODJHvWcYRhIAB47EYnbFdElkKWi35HuE+kQeU7hHnWe
         eC383U6jXgKFRBNJmP60RhfG+Uef4GVUYEw+NG+d8ctvEWS99rO5QrKEKViZsJNBrloS
         tjfPcC+t/V0a3BxudCEGDDvTBXAmFXCUo8qE2U8wvI/XsDs8YJfdazYgH1Fat0nhK+A7
         nLPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUT4ydL9T477w+ma39QEWX08VkwH8Oiwob9/FUdlfa8qjeimvq9eL034viv3FiJ09Ab9egMcZrDbXQ2rl0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5KIP8bCH1MDN7QLchglpBR2VH5rGVTZoIovhyWGCIPwRzF1RP
	jh4YXDVGd4LTuEyDczu8JAQsKnIZR1PuJroid/D5PbcGuja6xMQ/godeF2nG8HyRGlG2qF+7D1p
	63YbeOQOuVOFye8hs9w==
X-Google-Smtp-Source: AGHT+IGnly/av0KHtbsEt0YxJt41btV3bsiIzWd21FF8oQs3ujT3eSzg5vuOKzY8Bw/eXCf7KCDZaZBKghFBcok=
X-Received: from wmbdw13.prod.google.com ([2002:a05:600c:638d:b0:45b:8079:102c])
 (user=sidnayyar job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:21c8:b0:3c9:39f3:7af9 with SMTP id ffacd0b85a97d-3c939f37eadmr7626880f8f.9.1756464872992;
 Fri, 29 Aug 2025 03:54:32 -0700 (PDT)
Date: Fri, 29 Aug 2025 10:54:11 +0000
In-Reply-To: <20250829105418.3053274-1-sidnayyar@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250829105418.3053274-1-sidnayyar@google.com>
X-Mailer: git-send-email 2.51.0.338.gd7d06c2dae-goog
Message-ID: <20250829105418.3053274-4-sidnayyar@google.com>
Subject: [PATCH 03/10] modpost: create entries for kflagstab
From: Siddharth Nayyar <sidnayyar@google.com>
To: Nathan Chancellor <nathan@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>
Cc: Nicolas Schier <nicolas.schier@linux.dev>, Petr Pavlu <petr.pavlu@suse.com>, 
	Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Siddharth Nayyar <sidnayyar@google.com>
Content-Type: text/plain; charset="UTF-8"

Signed-off-by: Siddharth Nayyar <sidnayyar@google.com>
---
 include/linux/export-internal.h | 7 +++++++
 scripts/mod/modpost.c           | 8 ++++++++
 2 files changed, 15 insertions(+)

diff --git a/include/linux/export-internal.h b/include/linux/export-internal.h
index d445705ac13c..4123c7592404 100644
--- a/include/linux/export-internal.h
+++ b/include/linux/export-internal.h
@@ -69,4 +69,11 @@
 	    ".long " #crc					"\n" \
 	    ".previous"						"\n")
 
+#define SYMBOL_FLAGS(sym, flags)					\
+	asm("	.section \"___kflagstab+" #sym "\",\"a\""	"\n"	\
+	    "__flags_" #sym ":"					"\n"	\
+	    "	.byte " #flags					"\n"	\
+	    "	.previous"					"\n"	\
+	)
+
 #endif /* __LINUX_EXPORT_INTERNAL_H__ */
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 5ca7c268294e..f5ce7aeed52d 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -244,6 +244,11 @@ static struct symbol *alloc_symbol(const char *name)
 	return s;
 }
 
+static uint8_t get_symbol_flags(const struct symbol *sym)
+{
+	return sym->is_gpl_only ? KSYM_FLAG_GPL_ONLY : 0;
+}
+
 /* For the hash of exported symbols */
 static void hash_add_symbol(struct symbol *sym)
 {
@@ -1865,6 +1870,9 @@ static void add_exported_symbols(struct buffer *buf, struct module *mod)
 		buf_printf(buf, "KSYMTAB_%s(%s, \"%s\", \"%s\");\n",
 			   sym->is_func ? "FUNC" : "DATA", sym->name,
 			   sym->is_gpl_only ? "_gpl" : "", sym->namespace);
+
+		buf_printf(buf, "SYMBOL_FLAGS(%s, 0x%02x);\n",
+			   sym->name, get_symbol_flags(sym));
 	}
 
 	if (!modversions)
-- 
2.51.0.338.gd7d06c2dae-goog


