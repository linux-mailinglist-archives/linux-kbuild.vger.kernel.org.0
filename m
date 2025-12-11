Return-Path: <linux-kbuild+bounces-10071-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B70CCB621E
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Dec 2025 15:04:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5AB7C301F02B
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Dec 2025 14:03:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E534B2D0C7A;
	Thu, 11 Dec 2025 14:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dpNBIpQ2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4A1213E7A
	for <linux-kbuild@vger.kernel.org>; Thu, 11 Dec 2025 14:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765461830; cv=none; b=Nb89O/9wnvkbCeL3ovl8s92bE5jAL488IuerdmxeeAAN2yz8HDZU9KRzDC9DiBIOmPweUk+A0+qqvCYsop0E+vun1s9idh8OGsBJKn9mDOMSY6gjN2bZR98CC/TkV8NL+ANmmYr1s+sva6cskbXRpz7ISu6t2F6mKTQhq8MKocM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765461830; c=relaxed/simple;
	bh=h3wjZGG48fZ9pxWsr3LfkOz8cQcq5N+oV3tr1nZ5BOI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IjsARKuUVWpdvFueJOAP8vAvNRjiLSTu4eW0AVh5dZ3tnHcWBLvPWRhdUSOJiAzETPpRtjhUv2JIsxrFQ7hqdiSYExv1G02q+3tnbeIciZzqbs5YhblrJQaw54xdvOn+fONhvTapC2WxtvLaROj48ivfMTb6wmvkjmZqN0g7J04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dpNBIpQ2; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-450b3f60c31so38186b6e.3
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Dec 2025 06:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1765461828; x=1766066628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ocxfd2riU5l6RNdagWaPymuHyCDM3y1Y0L0w/bDOMGU=;
        b=dpNBIpQ2FgaS1DHIOTcCYfjxLJEOGEUbt0+JswT4dsswDFAwpB9MfpqBANbOBB/ZNJ
         QTELh/zHYSGbXeQLHTLx5DshX3n/eBY2Y6ADXJed2kjRe9zUY6CFaqE0EPY1z9NEh2nb
         7yEgNUEU2wTz7Iar3wa/lxNmSczkg/I3n9hSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765461828; x=1766066628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ocxfd2riU5l6RNdagWaPymuHyCDM3y1Y0L0w/bDOMGU=;
        b=e4MT3NvDqIc9JNddm5WExvA2pebQRHnE3Bx8DIhvtFKJGy292x5d9UzpXf1/xP5lOG
         4wFOlVw7+lreLErikeJ//tQ2l/4bv1daD+W2ZjwcvG1tZppxPjlsiaT3CGBYfJo6FBMB
         a032cpGHEYP8ta4ISe30N8I/ICdkC+1U7n8D+geopeGYxXhfTI63gEPScV0fTIvV2SNT
         fK7jl58IitCjwL5xhIXtdVlVI1SBsguNdIKKr9SqbycFcSIgy9TVNM1s90FE47xQQ2Ru
         LHfXrfrGuEKQLBgJ3N/I3mFeYxUT1l1XUnopwHknp1RKsST+kV5avpFqSkjc+0oLchoj
         XWQg==
X-Forwarded-Encrypted: i=1; AJvYcCWtgwezCHt2olL2LnVx253vaVWpI+oXe1lrpg5k1B2wXXVjQSTV/JRcqbi1EMW+19Mn9m17uTk06Ubf1uI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCYS9WmnnxF8rehPtUGhCqFvYjP1JiAjJDsoOhGDrILIdWQA17
	3faaidjSY71v36epD1+vRlJmPQ7BFqqMuiTdoPF5ygETrg+mjt+mnc8T/0Hl1yq0m2A5FTAN5o3
	AXaU=
X-Gm-Gg: AY/fxX7IAwP3WHNLl3saZFAvTj8UOZD04Hl3JME1I2DzRDeXYrFARL4Pm+UrNNFIJfM
	86vuZ7lAzVaFkSRokC72VRQbf9dAfYX9VuAiOXsJrFWr80HfyurArVOsNIEWRFRFBJJjIzAjxyE
	avoXYAttUyR3B/XmB4TyXvzMzMYlIs2EyacBOZbYtgeeyBuSco5JE1U6ed3Y3bJFaKy4n+NcMSe
	ozRtavJ8CM5hISEm/GQ8u3PZmUxWAZg9mL9CeZXiJvw1mLHEaG2s4NcKZVbglcxxscV0EG8xU/e
	qVmi5ckeYOgynu3hvlle9bUIUFb8lLjm69IUwYUwPo7fN2m3JySEcbAfZMmgaMYoBznxGdrTzq9
	B9KO1naDoJvQu5Hkeyc3sH/pNx+Jh10Zezt4BjEYAIuPc6FnbCWPqJkp5cdA8gD6Su0pcBZ14pP
	hFv+4B
X-Google-Smtp-Source: AGHT+IHtuzi/39tczpLCYlwV1m0CpQpVxWVqkNMlvivSc8jFvfBYvWlon4SeWF8dguVxgleSft/DYA==
X-Received: by 2002:a05:6808:bc2:b0:44d:b8d3:3214 with SMTP id 5614622812f47-45586581c02mr2763469b6e.3.1765461828234;
        Thu, 11 Dec 2025 06:03:48 -0800 (PST)
Received: from chromium.org ([73.34.74.121])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45598d6e789sm1130030b6e.22.2025.12.11.06.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 06:03:47 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Nicolas Schier <nicolas@fjasle.eu>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	=?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Tom Rini <trini@konsulko.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Simon Glass <sjg@chromium.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Oleh Zadorozhnyi <lesorubshayan@gmail.com>,
	Petr Mladek <pmladek@suse.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 4/6] kbuild: Support a MAKE_FIT_FLAGS environment variable
Date: Thu, 11 Dec 2025 07:03:01 -0700
Message-ID: <20251211140309.1910613-5-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251211140309.1910613-1-sjg@chromium.org>
References: <20251211140309.1910613-1-sjg@chromium.org>
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


