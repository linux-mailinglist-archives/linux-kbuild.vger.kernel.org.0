Return-Path: <linux-kbuild+bounces-2843-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF199499F7
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2024 23:21:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE948283AB9
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2024 21:21:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6373316C69C;
	Tue,  6 Aug 2024 21:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sMR8GsLr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C686615F3F8
	for <linux-kbuild@vger.kernel.org>; Tue,  6 Aug 2024 21:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722979276; cv=none; b=BdOTMwjs/DLZ7kjxHZ2EFFIMtVtDnMQt+07kkJg0ZT3p2fd6EvpfJMhSR++Sl1+Ga/nafIURCIavkl1l33zz6VNk0kdg5XKEBL5ChhwGLGlxCI+e9PG8tMWgMgebFT8QG1lZoaOM8jIWgA+PcmJZSqxvxvfP99vk/JCQYcj28N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722979276; c=relaxed/simple;
	bh=iji02Oc/3eVse8/8b0a97tqkHPOd2ny7+/1oh5B8hHY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fmlEclTMlDLJLX/ZgW3pAQ1elyP9yCI+ZdsEeEolNHy6gTSxMdlKV9sIq6vXOosWKy4XZ3B/MW6/+V9zN4qVuGhIRcKBNHG9qnF23Km9dfm/gSuZ2C53uh/8/K7apQXekvKqVecZCQfN1ypuLOEJjTY8f6FUz7aI9ku2Js/OWqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sMR8GsLr; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e0be470f76bso1793999276.3
        for <linux-kbuild@vger.kernel.org>; Tue, 06 Aug 2024 14:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722979273; x=1723584073; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jOl8CtEcN1RVp67UAYoE5SQ2BHxlCocLL/lZKU0oS64=;
        b=sMR8GsLrWGGLnAivD0/ZcacpSVIAT+HyrCJr80Ljsgb+akD+gu0IyhTaRPMVbRCOwQ
         e29Km3ZQI0bm+x05zroBtWzX07TIXLAcGyeDLoQiBYtddkf/TO1KZwjswxtlila8Nyqi
         mZbCjf/GGXUanauQs1mzDSILPh2h5e+XpQV6VyMTe2djpqs5qacmhEuD5JkXhCT2Llc0
         gBga8E4G+3s3M2jZtVWgdJMcNxy95wSE9E37NY+GoSuD1gyh/LtDgtz85emICnvg8d3g
         8TtXaCp5Gi0CLB6K1Y61NlKDXN7borzFDdwip7Tc2ASj+IHzVzaHhCnjXmYl/TEIL0cS
         aHbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722979273; x=1723584073;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jOl8CtEcN1RVp67UAYoE5SQ2BHxlCocLL/lZKU0oS64=;
        b=pe3ulo50Fno9emv1ra6CLZzqGGktwUQmhQw8O6T4Evl3TGmwKbbnAdKiI3Bslqg+vI
         h5fRlWzZR0TbjvA+c7tDDmscS6n25+2MW/QTHcVwl0vdk3fS1USz44r2+6FJcSp1ojBa
         ElsUyb9cFh6bHnnnYyno7k1jsQFy82L9OhyajoQoMUQwQU6Ky7wNxQ3cB3G338vRlKig
         dIVFu6qOIx2L+V3eBskgjsniZKSajTW6z0/OkPW+Vf76uDJNWpFcEI/VwmS9veS+YFso
         xK3vVwoFWQS7m/B3BQ4zaire1TMKekwVCrwrFycb6+NEbxyken62a0ZpDRsdZuv+dSK4
         m0AQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNMD3+T++cIvl6wsReStUStNBgdlLoORA9LudjXLvaj4dz9eqKRv2X5NIxP2NQ77qhY49UF1ljoCsDrAaY6E+RiLNqONn6giNqyTav
X-Gm-Message-State: AOJu0YyXJhJ5mOmUs9qCpuYdH3iMOl4BXB77iJRC04xKS78Kcl8alulp
	Y9EFUsTtAJOTj1fybsOYM0K5qFl0jzP6brzFsKXKZu7BaRsCpQs4G9NCwZUmxItY6k7Kd2Ij1Yd
	M/KfcwQ==
X-Google-Smtp-Source: AGHT+IH68bwpdjlnY26x/2+wcQZQXwD9UHybE1nA22cklT9RgpSzraQUX4QVqW9CAA8bhLmB1AIfRzUuzphh
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:6902:188a:b0:e0c:301a:1d8d with SMTP
 id 3f1490d57ef6-e0c30666c8bmr256479276.4.1722979272769; Tue, 06 Aug 2024
 14:21:12 -0700 (PDT)
Date: Tue,  6 Aug 2024 21:20:27 +0000
In-Reply-To: <20240806212106.617164-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240806212106.617164-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
Message-ID: <20240806212106.617164-2-mmaurer@google.com>
Subject: [PATCH v3 01/16] module: Take const arg in validate_section_offset
From: Matthew Maurer <mmaurer@google.com>
To: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org, 
	gary@garyguo.net, mcgrof@kernel.org, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, neal@gompa.dev, 
	marcan@marcan.st, j@jannau.net, asahi@lists.linux.dev, 
	Boqun Feng <boqun.feng@gmail.com>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, 
	linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

`validate_section_offset` doesn't modify the info passed in. Make this
clear by adjusting the type signature.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 kernel/module/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/module/main.c b/kernel/module/main.c
index d9592195c5bb..141a964b6b13 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -1645,7 +1645,7 @@ bool __weak module_exit_section(const char *name)
 	return strstarts(name, ".exit");
 }
 
-static int validate_section_offset(struct load_info *info, Elf_Shdr *shdr)
+static int validate_section_offset(const struct load_info *info, Elf_Shdr *shdr)
 {
 #if defined(CONFIG_64BIT)
 	unsigned long long secend;
-- 
2.46.0.rc2.264.g509ed76dc8-goog


