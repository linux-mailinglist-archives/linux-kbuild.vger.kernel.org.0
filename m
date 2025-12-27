Return-Path: <linux-kbuild+bounces-10341-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C14CDFD4E
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Dec 2025 15:23:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F1BEF300AC41
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Dec 2025 14:22:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 883B331AAA0;
	Sat, 27 Dec 2025 14:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CHvQerfY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3B932039B
	for <linux-kbuild@vger.kernel.org>; Sat, 27 Dec 2025 14:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766845351; cv=none; b=Aaxf8YlT1odLPqyXh2OLqXqDLgez+ruSCriIuBovjDF0n05D3l+BZUOX0W3puT3qGLCI6IEdzUs2mEtz3Ev+N3EMuwFq2OM8gmOI93rJc3dAqRvOYnGpspk1OkvMbCTbP+BDIOcCDaHWAlkbFErfiQBySABkot1GwKSvcxeusT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766845351; c=relaxed/simple;
	bh=XjhzIln6T98OU+/144ye0mPj2kCYhj5pKwfpf9/qz28=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YsBVP6ZfI9cbiqeff6UaQFgs30cyo8yZkkl+oepgogHeennGrp7tMekBlU6R5us4epqS/byY1Bqfy+bCq0nj3Ribgmh0RlWvi5arP4JjJa8mh5nSJxQg5D6S8vDRREzcd/4Fct/AXrRxYTMHQv21lFl9t5QttTPaLqBoQZxrpoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CHvQerfY; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7c6da42fbd4so4194969a34.1
        for <linux-kbuild@vger.kernel.org>; Sat, 27 Dec 2025 06:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1766845348; x=1767450148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Stn7BG5p2kiWu3fO1SYV4KqjZkimP4vmWf/OzcEQFxc=;
        b=CHvQerfYIuw6GzNk8b+BV6Fbc5OmUXBL5xxw//8aqvEVtCsprTLnO+SPpenDCwaJRp
         gdeXLRW1t9YG0Wmup9DgFDuZZSG+qEdoNky5wXlUwH5lMO6OwBDD1H1P1jCOfqKHQvl8
         mU/cXYvEtC53JnPuY5nrsxSDFF0rI3vsGVkw8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766845348; x=1767450148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Stn7BG5p2kiWu3fO1SYV4KqjZkimP4vmWf/OzcEQFxc=;
        b=vpnyahxfI14c8mIULfFMPqrRpaaR8ov9V7tipw3hmfqLitPe3w5z1p9sPTxiHG+oKx
         j21ajkgReFQtU0JP4WY2M9hxog3lkHPNEKaCleBAFFBMU0Qylz0oaQBgcES9ANcy/ZAq
         8EXhx4OGviLqp/aW00CBUsA9p3vhDkrRhhaRqs3VGpVxo6qjjT5+1aVXaYD40wX19mMx
         5wJQbsoDvHOMQx7NqXa8bLjE1pZxwqJhsGLYHFCyHvWDse/bL0RgiXYFv63+dnLUdXAT
         M2UTiZfLZVl+bHLo1FftX+6pBETx7qlGWBaVJjHD/p9YjXKAc94nbkTV3d6MbFCrYRvf
         jctQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnggwYiXrhGDDVuxDOZb4rQrflou+ETDMwyeWwJturiW375fNVTNKnm+BaLvDP9Mj+EAn4CQqVoZpl8Yg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXXtNUi/5mJwxMJymDnRHByIsMjPBv9YyVT+2MX88JA2+YcuAx
	TfCN8DMq7CyW0WvVx+JqbDC5fkMkaRvTthtmuTudPUZWp6XCI3OGUpnJGpvSD55T/A==
X-Gm-Gg: AY/fxX77ohpbRFY4NJ0mvigbZlPBTB9tohjlzN93YH/8v0Z9wxtQRFhfIucVxLjyZAI
	/yetUzBo+d9RKoPR7VWdApsejKOiF4H4Z9tu1Z3C0mcsmE25HHyaXRDKBKgpjlAg08FpDmdbjB9
	/jOKUvsF81z8qkMEy7k7LmVUHTBLGv4uV+34G3ej2IH1j5ABzdUCMQLHXPn3rZruBy06uBoRIzy
	UNhgQk3dJ2dnU5RN9qbz8i78qR6ClaXYKmnx/a7mllYc4SXNNo2NFWS0QeGSlm2r70rl3AUm8jd
	k2zNQOGb6JeRUD6NrITygeVnzEmEPlu4CBSciiOuRW4A/B2yTQuwR7msOs7H1vs/dbhuXjr8e5c
	/1v6w/o2+gF99J5L2Mmnmnp+8HPMyzSYQ1TWg+hO0Eg1IdnzhHjvGVAUGRuHy7eUImi+H23b3yS
	xZm+R1VSOVXx4uWMQ=
X-Google-Smtp-Source: AGHT+IGLZpCOF9onuPISW/tPeWU8M37UAPoGGRxrM8fdwUy2auYhL1uc1u62/1fsGdJy6tTGv+8Z1A==
X-Received: by 2002:a05:6808:4a52:10b0:459:b530:28ae with SMTP id 5614622812f47-459b5302fb7mr2050092b6e.63.1766845347754;
        Sat, 27 Dec 2025 06:22:27 -0800 (PST)
Received: from chromium.org ([73.34.74.121])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7cc66727e11sm17352660a34.3.2025.12.27.06.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 06:22:25 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Nicolas Schier <nicolas@fjasle.eu>,
	=?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Tom Rini <trini@konsulko.com>,
	Simon Glass <sjg@chromium.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Oleh Zadorozhnyi <lesorubshayan@gmail.com>,
	Petr Mladek <pmladek@suse.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 4/6] kbuild: Support a MAKE_FIT_FLAGS environment variable
Date: Sat, 27 Dec 2025 07:21:48 -0700
Message-ID: <20251227142200.2241198-5-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251227142200.2241198-1-sjg@chromium.org>
References: <20251227142200.2241198-1-sjg@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In some cases it is useful to be able to pass additional flags to the
make_fit.py script. For example, since ramdisks are typically large,
passing -E to use external data can be helpful.

Add a new MAKE_FIT_FLAGS variable for this.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

(no changes since v7)

Changes in v7:
- Add a new patch with the MAKE_FIT_FLAGS change

 scripts/Makefile.lib | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 28a1c08e3b22..a5641a6538b1 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -400,7 +400,7 @@ FIT_COMPRESSION ?= gzip
 
 quiet_cmd_fit = FIT     $@
       cmd_fit = $(MAKE_FIT) -o $@ --arch $(UIMAGE_ARCH) --os linux \
-		--name '$(UIMAGE_NAME)' \
+		--name '$(UIMAGE_NAME)' $(MAKE_FIT_FLAGS) \
 		$(if $(findstring 1,$(KBUILD_VERBOSE)),-v) \
 		$(if $(FIT_DECOMPOSE_DTBS),--decompose-dtbs) \
 		--compress $(FIT_COMPRESSION) -k $< @$(word 2,$^)
-- 
2.43.0


