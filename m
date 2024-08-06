Return-Path: <linux-kbuild+bounces-2857-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0618949A23
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2024 23:25:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 781562828A7
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2024 21:25:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 072F217B43C;
	Tue,  6 Aug 2024 21:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p24wlvFX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77910170A02
	for <linux-kbuild@vger.kernel.org>; Tue,  6 Aug 2024 21:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722979313; cv=none; b=K9c72qlpdUUdjmUMb+oA0bJih33hAzSHia6K954rw3zp+1qfB9FrEgiWsxLf7ehkaKr9j+v7XAdLuc32hJ6f6hJ6OpD6eOicT6EARh42CygcqjjPfwOk7Etjf2lYGLZUbIOIamBcuwACwYrXIebnPWlIBpKYEcFt3UeJpfhjwIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722979313; c=relaxed/simple;
	bh=DMq6ESqIR0/VIsSRGNMSbsDfLuIED4Xka2kr04JLUHs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SWapQ5r+27gxPqGSOP8YLyF9xhFBF7pF4S/aMO8YPRVnxdHe5wujybhD4wRQF2DDDMkNgMSb0KbG8T+Cjv54+0f8Zy5V1iPy8R66IVecQjMKgnjAeEbniww+DclPOu2UY2Uyka16L/MEcNNwMTGPqXsSa4kjr+vPVnO7/KOpLy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p24wlvFX; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e0bb206570aso1880429276.3
        for <linux-kbuild@vger.kernel.org>; Tue, 06 Aug 2024 14:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722979311; x=1723584111; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RuVcyDMKWDRqQRwS9dw4e6Gmb475WtbXjj7m3vj6AK4=;
        b=p24wlvFX60FQigq1KU1grq1ftep8zHth2dykdqrw6vc6UbMpBMs0m/CWFPBRl2g63W
         d+uS9t5J0dQITrUQPld/9ppJQ3FaUYSmoL2i6fDTT0mPym/pmLllsWxvI184P/mCO74n
         /6F0Lr40iro2f+RtRQqTN4guO8cClh5OszkpeSi22cWULD0oOrA5IQsaBcboOqsXADTh
         jM7mYoMczoDDk7UyeRjZcX4uxL2fXrYxHvDbPc8b0PIHmmGw6fYrzpRLdsC743lDn3Lq
         d5jJy9B91tiejItz6r0eGfsFUzwp35XFk20NmNLrU0EqvZCmDM87/X0i9HuFG7Wy5CdR
         6XnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722979311; x=1723584111;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RuVcyDMKWDRqQRwS9dw4e6Gmb475WtbXjj7m3vj6AK4=;
        b=ZHPudiuHD1/TiJXYMu0diRamsWTvA/9fBImdb0QZctuKAe+1u16fsDB/cAndz+jsCE
         vhRvBziMEEzzpEgamX+M5PZC4FaRNhdqeEgCOo8k6uqoP1pfGowfiPZUkl+1R3BNCogL
         wKbf352M3B0Whma/MTQ3rnOXh9QvsuOiLe4xtqahxZkj4hnvOHIq2I/r/JT+bG/rHOUn
         0Z7e3zwwx1ibp32or3pkeW6YOzfJyGdFnUxJOYWL6+7+LIozpJwE2TWq5YH+Ajm/cTN7
         FfQ2CHSpyoxmhuEjvRdv3MV/2FwWZ+XTSGooxIc0nxar5/prpDV1zgB7CNoiesxSvk8W
         0LtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBmKim54oIK40E/KvBA1OQMJBCb0OBAwpM+ZNEsrcsHutJazWGDO/OuTypvh9f0TPogLO8qDdEcdC3HOfO3ydZhA8KCl0WtdyTyELQ
X-Gm-Message-State: AOJu0Yx4QAel/oJQwT7QV9CUA0UGT95eVqG6TWfjQYc+48ZpGH0KW2v0
	LSNa1ANGGKUx2YjiqcaajzYoptRmAA8qOGN9KwReCApsbA4hShxXiIdvQ3POn1e4Wn+/VOcTRuA
	g+iTZ3g==
X-Google-Smtp-Source: AGHT+IGQTT1cAUuvwn4UUC6gSSIPxxqmG4QoKxAROxcqI8j8mxH6hY2aXaEo55QtGexIV+XLbHLydKtWm5V4
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:6902:c08:b0:e0b:bafe:a7f3 with SMTP id
 3f1490d57ef6-e0bde428581mr579475276.11.1722979311355; Tue, 06 Aug 2024
 14:21:51 -0700 (PDT)
Date: Tue,  6 Aug 2024 21:20:41 +0000
In-Reply-To: <20240806212106.617164-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240806212106.617164-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
Message-ID: <20240806212106.617164-16-mmaurer@google.com>
Subject: [PATCH v3 15/16] modpost: Produce extended modversion information
From: Matthew Maurer <mmaurer@google.com>
To: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org, 
	gary@garyguo.net, mcgrof@kernel.org, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, neal@gompa.dev, 
	marcan@marcan.st, j@jannau.net, asahi@lists.linux.dev, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="UTF-8"

Generate both the existing modversions format and the new extended one
when running modpost.

We no longer generate an error on long symbols in modpost, as they can
now be appropriately encoded in the extended section. These symbols will
be skipped in the previous encoding.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 scripts/mod/modpost.c | 39 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 36 insertions(+), 3 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index d16d0ace2775..8f9a4f262567 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1856,15 +1856,48 @@ static void add_versions(struct buffer *b, struct module *mod)
 			continue;
 		}
 		if (strlen(s->name) >= MODULE_NAME_LEN) {
-			error("too long symbol \"%s\" [%s.ko]\n",
-			      s->name, mod->name);
-			break;
+			/* this symbol will only be in the extended info */
+			continue;
 		}
 		buf_printf(b, "\t{ %#8x, \"%s\" },\n",
 			   s->crc, s->name);
 	}
 
 	buf_printf(b, "};\n");
+
+	buf_printf(b, "static const s32 ____version_ext_crcs[]\n");
+	buf_printf(b, "__used __section(\"__version_ext_crcs\") = {\n");
+	list_for_each_entry(s, &mod->unresolved_symbols, list) {
+		if (!s->module)
+			continue;
+		if (!s->crc_valid) {
+			/*
+			 * We already warned on this when producing the legacy
+			 * modversions table.
+			 */
+			continue;
+		}
+		buf_printf(b, "\t%#8x,\n", s->crc);
+	}
+	buf_printf(b, "};\n");
+
+	buf_printf(b, "static const char ____version_ext_names[]\n");
+	buf_printf(b, "__used __section(\"__version_ext_names\") =\n");
+	list_for_each_entry(s, &mod->unresolved_symbols, list) {
+		if (!s->module)
+			continue;
+		if (!s->crc_valid) {
+			/*
+			 * We already warned on this when producing the legacy
+			 * modversions table.
+			 * We need to skip its name too, as the indexes in
+			 * both tables need to align.
+			 */
+			continue;
+		}
+		buf_printf(b, "\t\"%s\\0\"\n", s->name);
+	}
+	buf_printf(b, ";\n");
 }
 
 static void add_depends(struct buffer *b, struct module *mod)
-- 
2.46.0.rc2.264.g509ed76dc8-goog


