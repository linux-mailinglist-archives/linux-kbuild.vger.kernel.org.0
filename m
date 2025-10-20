Return-Path: <linux-kbuild+bounces-9218-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E2707BF1D11
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 Oct 2025 16:23:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F281D1881625
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 Oct 2025 14:23:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00BE2322A1C;
	Mon, 20 Oct 2025 14:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b="Ka38wHVp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F493148B5
	for <linux-kbuild@vger.kernel.org>; Mon, 20 Oct 2025 14:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760970157; cv=none; b=rNgKeUaMnfWyYFhDKR98Ir8IFZzRISrshYgyxpJqQFPnyRixpOgTSTPUGVM4G8FjMJdp+pzxBLlkNGpfkwoD4Z67t1LnsQWTPWsAVWscGcdh0lVeedT3kA3YKiIg4onXE2RxC+f2jkKJdqWNfkroImArHDIglU9MuxrbQTj2IKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760970157; c=relaxed/simple;
	bh=JXxQAYlMzHf7CapetiWBiehB9Jp+AeiDGB7Scbh1Zy8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ot56tb5Q3tCkENZ1IwlZQnbXK12O2ebd1uCBRsC5O5YINNnmbSmpG7PXK4VruqyFvIFKeAbTMbeQUq+jUJ7146pM8N02r2y1IN8wUkIJBbRqR7aF6TTuCadmd7mS1mTmD5S9bozoWPDHvgrh5oboV8Z2B8q8vxHEWCIx4GcUXLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk; spf=pass smtp.mailfrom=rasmusvillemoes.dk; dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b=Ka38wHVp; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rasmusvillemoes.dk
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3717780ea70so48539731fa.1
        for <linux-kbuild@vger.kernel.org>; Mon, 20 Oct 2025 07:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google; t=1760970154; x=1761574954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l53u/lFYy4UkryOGZpDbVu9TvyPGaOFSDZbxWRdpUJ4=;
        b=Ka38wHVpKtQH0cxPgUGb0imzmq+FIMV1xOn06VDnoS0JlEcWJG9e3yXzuWlRh+5QPf
         05AD2sOIKQ0ha1oLqJOqhQGAtyA3cAvNbe9jlZ496pdYC49DBxER7VdP72K76AwxrY63
         tmTxFfQp7u0D9eo9hwMcpgaUfZmvIeFMOmxcg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760970154; x=1761574954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l53u/lFYy4UkryOGZpDbVu9TvyPGaOFSDZbxWRdpUJ4=;
        b=UcCHi4itc9q2kUXPGnnZPbfWn55hK1zdbvwDA+qbQNm1R7mx+hEZevyjqrz53Vk8HG
         sCX6z6fXYXcuy9/sCwpIgEoUwKfytp5SI0oXfCFa+fU3fa8OHnkBhC9U6IP8mnBex1cd
         +qjT4qZd7I0Vb5+o+oLEAfEW2WayDp4zlUVe83vlrvDzPnSrNPx+9vDhrybgv1RFKW5R
         ReLcfLomvGg1+fhac3crDOlzt5g5Lg0NtmL2ubKJmcDnBmbZFT3820HzzlivynFiwL8P
         PsM210SLjaYtXZ421H0wQ3ee5EEBJu/q1syvO+TQ2PvlJ5gdy2mfD9b4QRuf/n4IJHP9
         Cr5A==
X-Forwarded-Encrypted: i=1; AJvYcCXx67JfEZ1FD39tWdEiiEHwlgxbak5ab2f5g0fHNRS6bEhqymLL0lFCycalPvVSUiKJv08Z5uimHvHExNM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhxaH4Y4UEqEEVClct3QIQd8/gXL+mdkOjWT5rKLWnRRtDpNX0
	BG6Q6VXLO3KFWr4RdonxAb39Zmww7Ztrj1ak62q9bRF/kMO1M4+secnrDEy48Y9kEJA=
X-Gm-Gg: ASbGncsiVxCVXaD1ThsXZW4ygIONNDTHGhUynCv5cwCjCt55w5fvy1bIXcvXdZS+j0+
	NugXmPmUd9tp4j18LODudC7SvZ4/a6MCJSjKPQw4vahe0uBhIwpMNR0Ro0aIy/f13xSbcRcdP7W
	W6CrvWxOIGojkdIUuBFtplZg2frFYv0HF4t0rdRrXErOxL/aqmKvaSRZPeOzJ5qJTkgVPs6JK/B
	CFEqgVXLSZmPsnxxRYb62oc60dIZMKjOfGLNFaekv4tOHWxfkD1kRxKoeYOGj62eIzlFZrfEEbe
	/m1r4HEDgjn21bYSy0EP3i6qKvwFQYT9d3egXxjPhXfqRe/ky3TxRjSVzzYN7r6AAd3jeZcbPx5
	szAvfPIPN7+OlrekEz9TFdGzxl2dD/zKwPCjZol/ZpuU3Zq+dfT9xfHEWf1Ey3jMMpM+eCC1aV0
	kAqH2sPLb9JPBBJg==
X-Google-Smtp-Source: AGHT+IFTE/qW1dtgMqVJs7zGeEeHleNHdYWfYhUz3cdcHeE5+GjvJKt7zg605bf5VDdT5d0tjB/QKw==
X-Received: by 2002:a05:651c:3617:b0:375:ffc2:1b38 with SMTP id 38308e7fff4ca-37797864f2fmr43425001fa.11.1760970153412;
        Mon, 20 Oct 2025 07:22:33 -0700 (PDT)
Received: from localhost ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-377a9666274sm21216501fa.52.2025.10.20.07.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 07:22:33 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	David Sterba <dsterba@suse.com>
Cc: linux-btrfs@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	linux-kbuild@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH 1/2] Kbuild: enable -fms-extensions
Date: Mon, 20 Oct 2025 16:22:27 +0200
Message-ID: <20251020142228.1819871-2-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251020142228.1819871-1-linux@rasmusvillemoes.dk>
References: <20251020142228.1819871-1-linux@rasmusvillemoes.dk>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Once in a while, it turns out that enabling -fms-extensions could
allow some slightly prettier code. But every time it has come up, the
code that had to be used instead has been deemed "not too awful" and
not worth introducing another compiler flag for.

That's probably true for each individual case, but then it's somewhat
of a chicken/egg situation.

If we just "bite the bullet" as Linus says and enable it once and for
all, it is available whenever a use case turns up, and no individual
case has to justify it.

A lore.kernel.org search provides these examples:

- https://lore.kernel.org/lkml/200706301813.58435.agruen@suse.de/
- https://lore.kernel.org/lkml/20180419152817.GD25406@bombadil.infradead.org/
- https://lore.kernel.org/lkml/170622208395.21664.2510213291504081000@noble.neil.brown.name/
- https://lore.kernel.org/lkml/87h6475w9q.fsf@prevas.dk/
- https://lore.kernel.org/lkml/CAHk-=wjeZwww6Zswn6F_iZTpUihTSNKYppLqj36iQDDhfntuEw@mail.gmail.com/

Undoubtedly, there are more places in the code where this could also
be used but where -fms-extensions just didn't come up in any
discussion.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 Makefile | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Makefile b/Makefile
index d14824792227..ef6f23ee8e7f 100644
--- a/Makefile
+++ b/Makefile
@@ -1061,6 +1061,15 @@ NOSTDINC_FLAGS += -nostdinc
 # perform bounds checking.
 KBUILD_CFLAGS += $(call cc-option, -fstrict-flex-arrays=3)
 
+# Allow including a tagged struct or union anonymously in another struct/union.
+KBUILD_CFLAGS += -fms-extensions
+
+# For clang, the -fms-extensions flag is apparently not enough to
+# express one's intention to make use of those extensions.
+ifdef CONFIG_CC_IS_CLANG
+KBUILD_CFLAGS += -Wno-microsoft-anon-tag
+endif
+
 # disable invalid "can't wrap" optimizations for signed / pointers
 KBUILD_CFLAGS	+= -fno-strict-overflow
 
-- 
2.51.0


