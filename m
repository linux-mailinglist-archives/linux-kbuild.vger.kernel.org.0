Return-Path: <linux-kbuild+bounces-9949-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DA9C9CEA3
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Dec 2025 21:28:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 45ACF348DB9
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Dec 2025 20:28:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE6632F1FC9;
	Tue,  2 Dec 2025 20:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RvOx4AtQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DB52EACEF
	for <linux-kbuild@vger.kernel.org>; Tue,  2 Dec 2025 20:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764707294; cv=none; b=ZFRT6TKYtpfQtIBdgV2nXkfjgqex8HwSjzOwdfr8DenZaRrtxjMlBSXPxR4mPgdhlgFFmC5m+HvUn3iukMqNXDwLOKPNh7wVmqW4NBYreQF3k+QUTNFkVI1nGzSIleMgAZtAawNGBCpymfKXkFxkzN7hXhS4FkbKevZNb0fyz3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764707294; c=relaxed/simple;
	bh=o237WR5t4MMOHA/6xwLqKKnBZN3/rDT9uVvqOcTiQhs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JngMLvZQReT6jeWobE9wteyDf0LdUh8/X0KgBXOuhURoJsry8t4ZaxFqOkLI/UQ07DrzeGerh9PZKJggEQK0PkE3aqJQn3r0FwhUJBddnHktAxtHnhtC31OmV9Vwk+ClIFsR17znFRD38RcPfNl/+DDFKTkHbUqJxel7tJmavYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RvOx4AtQ; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b736eca894fso446946566b.1
        for <linux-kbuild@vger.kernel.org>; Tue, 02 Dec 2025 12:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764707291; x=1765312091; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0yaLbdbXJAqPOG8MVf6C4XR3DKZYvDAAnU5HF8zvPbo=;
        b=RvOx4AtQHBpN6vRQmlqdo3GHoSePk/yMwKE1iFz79u/gbST6sQqKbv7j4u13qxNFN1
         oUTo9wxfPfx+HxrWAcCbLvxi9mbqbFLKFMCzhE6U4rXPz6xb3R8TVcc7Z50n26C0VVFy
         tRKYfebbyaDmFK36TTuFADVaqDZZ7fidQdxNtiwQ5//tnnXReEr5uN3Iti9Zgfpw9m70
         oxCi9Acp8GlkbhAFRo8rcOopUh0FtCpMD6G7NNVRTOb6OzqLEkgTgEYPBdMwb3hO/oNQ
         lz+ZN17j7SX/c0zr3ckfWAz08NqYwfUiAfbyiMj6L7R+KABatidh/KvkQeVWFMPOkbLG
         2HKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764707291; x=1765312091;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0yaLbdbXJAqPOG8MVf6C4XR3DKZYvDAAnU5HF8zvPbo=;
        b=pFmPgGT8zSRUv68e23M2PQPjJLlybN2/I2cSuqQkmWvy3KOJN/e34v/lx7OIVo0pt5
         AdevXglRUFeZohMty0Ch/rn6wLE+9pM1idKcJ+RmgVl4fKs6PCbeno+ylY/TJ2OjncEt
         dosU5857jeScwqzHvk6GzAlsDBQk/yGM5gQz8vNUu7ym5Z3sluipmaQoFOEJdSa/Lj2d
         4DboKFt+igzomYzBiKGhLqszM8ibHYoY6eO7YABr5U01Nyg9M/5+wkGSX1LDdh001iwO
         8l8vq8RtF60u9cEJnrEcJ3iluOE9NSJfbR9x5ROPNSYsrAmRJhb2JCLLaCJRxhT0dCy/
         j/DQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfYwIHX01kFvpNIzLTL1euos1qRIAdyYbWZFeKFRdqq93W8wVMr+HNTXTyCEw0JRV0z7cp4D0mw/J2/fk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyT1gzEDX8LnuSOVXu1j4jBYDcRqQC8Un50pOxi8Tu2clNrDcPj
	Ui7C3YtbOaYreDnlKGjlqSN1o/e43b1Zxv2TskLSs7bfljS9Yx+esEca/vkthJSafIonsF/fUO5
	oP7fZfV6MTZL/SrVQPw==
X-Google-Smtp-Source: AGHT+IFxbJTUi3LG/UxAzVg0DHJfs/QK8ZkbgJFUFzeew/1o2JPNxmwoD7ry+SYsd199ZxrJFbneEJ7rLxcSHeI=
X-Received: from ejckp26.prod.google.com ([2002:a17:907:999a:b0:b72:6a6d:5018])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:9289:b0:b73:76c5:8f7c with SMTP id a640c23a62f3a-b767184bc4cmr5031432266b.43.1764707290453;
 Tue, 02 Dec 2025 12:28:10 -0800 (PST)
Date: Tue, 02 Dec 2025 20:27:56 +0000
In-Reply-To: <20251202-inline-helpers-v1-0-879dae33a66a@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251202-inline-helpers-v1-0-879dae33a66a@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=993; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=o237WR5t4MMOHA/6xwLqKKnBZN3/rDT9uVvqOcTiQhs=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpL0vXS2KTuDwIHjFPV9SPMyVgAzUi/MU12KYc+
 WMaROi5+LCJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaS9L1wAKCRAEWL7uWMY5
 RjdSD/41DCALGMN7nyQxyeW2hZ9gETkyG8/iqH2wlmXrShi1r1+WB5woa9Xyur1kDN4fny2B3pO
 Y/5ZTPeLOcZ/aZiVYBNJA/D9HwDtronU7j5mUuxB0yWDU86evl6AxsKiEvJuzy96b8AtZ0ARx94
 IgGN41NqoWqbtVWQg6QlCkP56YIrgkpzGAS8atcgpDUrXNb+PE5wxdosva9Kh9do0WUVeLVeSKd
 BdEA9iG36VbrEo4YdJv4GRojxiLeD9CDzvYaGx6ijS8AsM1Osv5V66FEhywlu5eg8vNaBbPlcj2
 xI8IBYCVYdeDDvb1eKyZRLyLRwSvHfbhkMIgkLYycP51rfgkb9kJ8xzMWQGx4zynmLXzAXH0J0m
 5EB4i8kqfcM55bSpXOcCJzmldnW5zNj6/a6PmCC3hINHPjiHjIKkZmyQFZ+xyfRWH5U5ZZnvqIq
 RTDSAE/Vjex1zfELbKMrNyp4+efGryIeLo2hKskD8xXiqzcEDhKiNZY7C3d1jHSgp0uyZLRoe7e
 N/0L4pucmpbvlsisOuuXdvhokGnGK0s/K4V9WjZ94AoP9QZDTbOpFHNW6iUVflzEdZFfDfqHEs/
 ToADXA5Wr2TwTuT9flTY9YEdDg46zEMD7PVRz2llCMVxG6AYZdE+1gKeJLV9PHtLVfRe6h8qxrt EQLssKb+G2MtrPw==
X-Mailer: b4 0.14.2
Message-ID: <20251202-inline-helpers-v1-1-879dae33a66a@google.com>
Subject: [PATCH 1/4] vmalloc: export vrealloc_node_align_noprof
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Uladzislau Rezki <urezki@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, linux-mm@kvack.org, 
	nouveau@lists.freedesktop.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

This symbol is used from the Nova driver, so it needs to be exported to
avoid a build failure when building Nova as a module.

ERROR: modpost: "vrealloc_node_align_noprof" [drivers/gpu/nova-core/nova_core.ko] undefined!
ERROR: modpost: "vrealloc_node_align_noprof" [samples/rust/rust_dma.ko] undefined!

This error is only triggered if inlining of helpers into Rust is
enabled.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 mm/vmalloc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 798b2ed21e46059f341ed0d46c7fe56bbe357b22..e086d00f04d61ebd481cb84e3dfea51d8a2ffc57 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -4200,6 +4200,7 @@ void *vrealloc_node_align_noprof(const void *p, size_t size, unsigned long align
 
 	return n;
 }
+EXPORT_SYMBOL(vrealloc_node_align_noprof);
 
 #if defined(CONFIG_64BIT) && defined(CONFIG_ZONE_DMA32)
 #define GFP_VMALLOC32 (GFP_DMA32 | GFP_KERNEL)

-- 
2.52.0.158.g65b55ccf14-goog


