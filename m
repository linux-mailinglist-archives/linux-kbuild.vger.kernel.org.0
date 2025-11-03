Return-Path: <linux-kbuild+bounces-9376-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4963DC2D277
	for <lists+linux-kbuild@lfdr.de>; Mon, 03 Nov 2025 17:34:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5465A426479
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Nov 2025 16:20:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2D16319862;
	Mon,  3 Nov 2025 16:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nPTqGnTE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A663191A3
	for <linux-kbuild@vger.kernel.org>; Mon,  3 Nov 2025 16:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762186809; cv=none; b=ov2oeoywgO796218Ggll7KcfTiacHrN1Gc2piAxXpHAC1TIfZ1yYDbKBDn+IkbMNhchedMi6cKFdqmz9rZLopUYWwFRJKALz56WOQlOyGeGvgHJ/cEMObjr45H0xqHzFSGJ03O0mxLa3P1jECEpPFCcSOtutGz0h3R34lVWatE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762186809; c=relaxed/simple;
	bh=jkxdHhADxKe70tQ3LxdaaXA6uDsYEFMedCjDeqV0A7Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uZ7yBxNyX1G05olIHbH713DhniN8p7MKsS6qMtg1cAyohnjX7tmRP2TH/rsnooTXOwfEFGcNsVkBwLUqyH11s/gVfPri/JGGlCPjFgWB0Z1xKWlczp2D35lmP7VABA5tjBb0s8dfD2oD3O9SREeyuw5T7D8kaIKQqPQ7oDGkm6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nPTqGnTE; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-429cce847c4so919685f8f.2
        for <linux-kbuild@vger.kernel.org>; Mon, 03 Nov 2025 08:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762186805; x=1762791605; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=P4w/p5iGh/i/9IMayogTX0N6/mX9464BshDveJOwZLI=;
        b=nPTqGnTEQPqLxXB27cBYYHHxBxD7ns+aEvyVWs41PZB1OJqnaCIqjxYPpP0jjUsVUo
         hVRQnpTXZ3GPYtI5wu0cmwJdeg7bjL5hzOd1elANbgxM94h9yWT06iwBPYHZQG+sWZld
         BQUafx7TaAnsTRhi7GYevL7EfytwFlt1kEZaoVAL3SJQNH5bBkDBv4wOXPz02mJCJfEE
         72ZrnXrqV3tifKXt0jyUH+keOf6GVE5gJiKl7lmulyLCIO0DIa2NvxYH3z+hGuIi8Fe+
         Ud7hhePYGKvCK/7r+pPsDxppcTQ+lNurzmnj2pSU9J7ZMcqCwqe05SHvlymSwOpVnC1v
         zG5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762186805; x=1762791605;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P4w/p5iGh/i/9IMayogTX0N6/mX9464BshDveJOwZLI=;
        b=gZBa5aA4zAoya+/1rNtAeavgxhOIp6d5E6vZQf0y17HK57J0tDV8XW2jmZ1f2b1cBH
         cTyJ4eRlorbnEFi7UoPY5Yf6ifXeEW80Nu//tREaX9yXBOmQhA1RaZTHTWKDqVz36hJ2
         JaJhtK/+W2qkNaqiNssgFcyRdSRj3v11Bdr8vZblQBgKHsonxHSL1p5U8dG0r3T53sjr
         eef80KEHn9pZCGPo52TfbdJ9PUOjjNhcMPoi//6Nhx/L3KYjNzmGy9rZMu2PrQsntci2
         gh4UcOGP7wjqmKhBTp74Hh4RxNI7xftNmGlUShk23OEat0WPRfEQBs3lYCjEu+2t6NFy
         SA3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUids5HnLnsrlfoGfAbBkgw/eZRxPyuPGnPyXHkyIuqbtJCUvAAShzsHjvj8ElChLUZfOl/9XCccf5Bv9w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+LbslbEEQiYnBy+2sXTu506SkoITvq5d6nIRds9x3Qn2I2p71
	OIyUj/ndE85adKlQhd9jqjez+RjMRgZkYTreadOupeD7kMY0lZ/E3XJdvg1zUAU5Dd/UlQdoS8N
	Gk0MW6qUO6kEMhruFfQ==
X-Google-Smtp-Source: AGHT+IFf+tT8KEZ4bOrXCsQXmpdi3VAAa0VDdDuJqsBmNk6vQmoBDyCE42yQpSuuN+bhZNXSvklX9SUFaH5ZyqI=
X-Received: from wmbjd5.prod.google.com ([2002:a05:600c:68c5:b0:475:de3d:2cc9])
 (user=sidnayyar job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:26ce:b0:426:d5ac:8660 with SMTP id ffacd0b85a97d-429bd6e3dbamr12562628f8f.58.1762186805589;
 Mon, 03 Nov 2025 08:20:05 -0800 (PST)
Date: Mon,  3 Nov 2025 16:19:49 +0000
In-Reply-To: <20251103161954.1351784-1-sidnayyar@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251103161954.1351784-1-sidnayyar@google.com>
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251103161954.1351784-4-sidnayyar@google.com>
Subject: [PATCH v3 3/8] modpost: create entries for kflagstab
From: Siddharth Nayyar <sidnayyar@google.com>
To: petr.pavlu@suse.com, corbet@lwn.net
Cc: arnd@arndb.de, linux-arch@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	mcgrof@kernel.org, nathan@kernel.org, nicolas.schier@linux.dev, 
	samitolvanen@google.com, sidnayyar@google.com, maennich@google.com, 
	gprocida@google.com
Content-Type: text/plain; charset="UTF-8"

Signed-off-by: Siddharth Nayyar <sidnayyar@google.com>
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
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
2.51.1.930.gacf6e81ea2-goog


