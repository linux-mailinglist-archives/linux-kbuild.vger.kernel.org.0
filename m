Return-Path: <linux-kbuild+bounces-3799-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0884D9869D7
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Sep 2024 01:42:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A06E1C235E8
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Sep 2024 23:42:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 477C71AD9CF;
	Wed, 25 Sep 2024 23:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="k0MZOISt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963321AD9D2
	for <linux-kbuild@vger.kernel.org>; Wed, 25 Sep 2024 23:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727307591; cv=none; b=WHffUv2cfaCNJFAi0ZKi8AiIrIrm6jKGh4XYZZmb+Gec1KttIaKebhl6dWGkittQzJuipE5xiNLj8BsDwy3CRZLPwI7wi0tohTVPoG5WAML6BOMsZZmZVHElXwOwCuPn02htqHr3Nc/yLCKEDKrKixhUjr0uld7WUgM7iG3cPLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727307591; c=relaxed/simple;
	bh=W7tU7P3GNG+a73WgyQWeP1re2H5Hhpn0LeAD9h0akfE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oaeHad6jIU/WCp63Bb6Y4ZSVFeWVqF+vtsacgKPEF7imS9as01wd0R7NLzthsBGamz2DdaLzb+9Ek1tZKeu+i/yhGKssJ2lG2jB2HplAbHLcHAcQZ5eWT/kzXI8ZQGMTEGo5pfEz0+jBmbWjrTdVgCBIqnFewDGf3LTr7GUikf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=k0MZOISt; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6e21d0bfba7so9662537b3.3
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Sep 2024 16:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727307589; x=1727912389; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=t2yLoLuY3hdxUDQj4FAKHilbBg2KnzEPjHr+p4Rv35M=;
        b=k0MZOIStxeoZXVUF3SJMKXDcAm5STmIlI3OIg3Fl2vjaRXY/whcZtEC1DIffzUPVX6
         GxJ3KS9/LE787QxTPsXtloPhhHp3NsQYs3RJe5sbWQwwukOCmgUHWIuMmTy6+SzNhZ28
         +rJjcpI0NA6nsgtPsnPJsqkEz5srRdl3ybWKucSYzXQlmjWUBCeLwu+qZMc3qETB/Rdx
         TMtlBGwpgZP0CnEe95JKgqO4v1fB9/o1jUJJfc/6yJ8swTnfacnXp5Zs6vdHyBm8kjw5
         +H0IZQxdUUNleR8XBBHzJHTuwB3jpKz2XL9dPjFoNhQ3IxlUChMswxwpwSbIyXYzv6Vn
         LRJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727307589; x=1727912389;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t2yLoLuY3hdxUDQj4FAKHilbBg2KnzEPjHr+p4Rv35M=;
        b=qn8sqkVdUhAzurVSrs7MyjKnQkm6rGKp7ftGtifTm4wPn3NMrHXRw1pFlZQyxfCIHq
         Kig4QBj6PTyJkHxy8R5J8C9UTShDSsinx+M9LQOQGWh6oIl3et0T4Hgkl+Yj45/YaqZU
         Bow7ZAyY6NUEVB2GG/M2o5KpxRN3IUIkhS7774NusyiPYV6NOrGIb+PfUSeNiANK5fez
         /AIoxhcePYGHlWKHttpzcZOY5JyBwB03s3dQQUYorZpjIBnKj9QIsYjsazMNtbEb1Ci/
         VOHC2gDWQY5o7+sNi3enmeyglLvGw17AQp9V9kb1jvV7Jmu+NQDGVe1hngDQn2hGWWNZ
         7dMw==
X-Forwarded-Encrypted: i=1; AJvYcCUR2U9R3/DYgaEImRuQZ5x2FkLAYFTx6RJTMhf0HuO5xjhJ/gvRIXWN5PMQdLXXzAdaI9ixVXdvK6NW5e8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPdKTdBSl2m/L/PDbXYIobdlDCgXP7npMR8d19KO45fKs9Cx8N
	SH0wV6jNCFlU4EfFrIg3+3YKQk+jqtK2UC/g39NKgO5/K+o3aT4toxUO12jkFDDy765SOVo6e8b
	tSQMJEA==
X-Google-Smtp-Source: AGHT+IGo3KQ6k/CMKWp9luhAJxulkW1/EkZDzA8kfvweM/2fd5g67sil+zl5Hoq7sgFCeukL28HlOifIuPFz
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a25:b120:0:b0:e22:624b:aea2 with SMTP id
 3f1490d57ef6-e24d46b5e11mr4072276.0.1727307588565; Wed, 25 Sep 2024 16:39:48
 -0700 (PDT)
Date: Wed, 25 Sep 2024 23:38:27 +0000
In-Reply-To: <20240925233854.90072-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240925233854.90072-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
Message-ID: <20240925233854.90072-13-mmaurer@google.com>
Subject: [PATCH v5 12/16] module: Reformat struct for code style
From: Matthew Maurer <mmaurer@google.com>
To: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org, 
	gary@garyguo.net, mcgrof@kernel.org, Alex Gaynor <alex.gaynor@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, neal@gompa.dev, marcan@marcan.st, j@jannau.net, 
	asahi@lists.linux.dev, linux-modules@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>, Petr Pavlu <petr.pavlu@suse.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>, 
	Boqun Feng <boqun.feng@gmail.com>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>
Content-Type: text/plain; charset="UTF-8"

Using commas to declare struct members makes adding new members to this
struct not as nice with patch management.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 kernel/module/internal.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/kernel/module/internal.h b/kernel/module/internal.h
index 2ebece8a789f..daef2be83902 100644
--- a/kernel/module/internal.h
+++ b/kernel/module/internal.h
@@ -80,7 +80,12 @@ struct load_info {
 	unsigned int used_pages;
 #endif
 	struct {
-		unsigned int sym, str, mod, vers, info, pcpu;
+		unsigned int sym;
+		unsigned int str;
+		unsigned int mod;
+		unsigned int vers;
+		unsigned int info;
+		unsigned int pcpu;
 	} index;
 };
 
-- 
2.46.1.824.gd892dcdcdd-goog


