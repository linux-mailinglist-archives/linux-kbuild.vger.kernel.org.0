Return-Path: <linux-kbuild+bounces-3788-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6549869AC
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Sep 2024 01:39:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50D72283523
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Sep 2024 23:39:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 146C41A3BD0;
	Wed, 25 Sep 2024 23:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sSv2LwGg"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8C91A3BCF
	for <linux-kbuild@vger.kernel.org>; Wed, 25 Sep 2024 23:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727307567; cv=none; b=HZ9jLv0V/m5ySjcPggjyT8LO013jLodK2uaq8mwvYrhqwaiBHbpoIblqA51FzlJB5hssqx5UYUYF3vMG8y6tQLxgqSFsHwNxvwtUyrIg4ZI5z7obIkak7b4QBcEpWNTbujAG3YYDcz/3QmhIuHTi8AESGdU2+de2EcaoTplHsOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727307567; c=relaxed/simple;
	bh=87UiLghCgImjI67qGqkZVlUAdkIatHILzWkWX7E7o4U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=R9A+78LpF9qRfIDgdTKsAMOreOz+H7kGMWydggBlCBLEuKwqh5lXtcPLjYX7yacYi59WqbTD1uk/eu1NhGiyGTbKLrPRbwoE5ZrrkoSQZUq0wl+QgUJWOaO3pH5VMIyXd8p+dWrLmo985BQecXQRI9ni4J8XuLrlwXkjfAldLSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sSv2LwGg; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e17bb508bb9so763248276.2
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Sep 2024 16:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727307563; x=1727912363; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LyxbaKZI7M7/7zXNo9r/7MnbWQPTGkdTyXhoBixsIfc=;
        b=sSv2LwGgnR8j+P3liOLGDS+Gd7WpWyGEpltfC2fOq9aHCnwHqKpAttF7d+ujur0gB8
         uajSGw9bVI1blAghnlpJjKpoTU8usQLS1/X50XZcXRK2ld2nldpX0shMzOrzMTxdVLIJ
         o2OFB6nS8m8f30g49HHszNUg4NYHQ7YOfOnn0pR3DzgI2jh4Ex0z/zxC6aNfqKlvgEJB
         r/zziTXy3Y/X9G/QWZlE+NWZ6N6MwuehcCCRkvO/+09LtjzKlTZoKwgwXnRpuHJO48eN
         eg7WXZaSbwse0lfJZGVqJ0XJl+5015CPNqjSCTK27vwULOfZQfEkq5wL2ShUhcw7U2j6
         u2MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727307563; x=1727912363;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LyxbaKZI7M7/7zXNo9r/7MnbWQPTGkdTyXhoBixsIfc=;
        b=H0pV3E1UCsZS/GA2Szs9g3VybURbTYLX4x76tdU0NYxcyQV1Vhzhkcwst2jyJ6f7D6
         du0S8dvcYBM036xDaip6wWXwo+bZXcrGkscR7y4UR5LkIb/ZMLq9sU9NiYUtw+eIKbCa
         O0gFKvZNvwViW69YapCPUujnPBFgJ/2LEocApcGhuvyEO7+FH6h8tZU39SIpMD5eEc9k
         bTNtqt7UtmJBUwozRmfR95txF4accExm62rg8Y+KXePfk4sjOmwZyoxYyakvEiW+BThY
         lRU8Ep7Yn+AOmqqPJGt7cJOBsRLBZkVuJ6adRWrp7a5GexCSorwT59Fonq7wrcjoA/TY
         2z8A==
X-Forwarded-Encrypted: i=1; AJvYcCXjeEBUUmYHliPN1Nh1exQejQ4Z3uOhmGlHf/l3LqhdN9w3wNip873qVCalhSrgB+JyabqrsbRqu5KldyE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4yL/pmS9MxOCFJDXe6vGTd+jKbpGdCBe5LqsKnKfSSVAnwwJ8
	d9YmEEPRaPyFdE8pEBLS1O0jKux6M4ke8vkvA0hQs4Z1eAWMfaaKcHpR46VHtrIftKymlf+Auk1
	BSlY5vg==
X-Google-Smtp-Source: AGHT+IEL4w0/gR8iE4pApg14NOFOUxZBPfsQ63YvAHEvZzW8W2ulmi1Lrysl9VB/6vA6caGgF7tNgGtZN5yi
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:6902:2e88:b0:e22:5f73:1701 with SMTP
 id 3f1490d57ef6-e24d44c8e18mr28465276.0.1727307563386; Wed, 25 Sep 2024
 16:39:23 -0700 (PDT)
Date: Wed, 25 Sep 2024 23:38:16 +0000
In-Reply-To: <20240925233854.90072-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240925233854.90072-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
Message-ID: <20240925233854.90072-2-mmaurer@google.com>
Subject: [PATCH v5 01/16] module: Take const arg in validate_section_offset
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

`validate_section_offset` doesn't modify the info passed in. Make this
clear by adjusting the type signature.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 kernel/module/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/module/main.c b/kernel/module/main.c
index 49b9bca9de12..1a2dd52147ba 100644
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
2.46.1.824.gd892dcdcdd-goog


