Return-Path: <linux-kbuild+bounces-9111-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4185BD5351
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Oct 2025 18:49:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B595D480AFD
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Oct 2025 16:01:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2511A31D392;
	Mon, 13 Oct 2025 15:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KqYlAWzX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF7E31CA42
	for <linux-kbuild@vger.kernel.org>; Mon, 13 Oct 2025 15:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760369999; cv=none; b=YC0nSVxULtyFhxxfHionIe+fn1H9E/E2yrc8QSH1V+nqDFHGmI/SlZEQNk5Oz7LJk106Kg/trnwzGUr0Nj+uQ2FETdMYcjyuLl0rvXIDZ5JB3PCgs2emiXyFozLB7GR+HcNnX1HpPbGw206ic6vSejBndqxhYz2cETUGfV9HP5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760369999; c=relaxed/simple;
	bh=fZiA1VUJ/o59/ps5AdQY0hmjgLVHeNv1xGnN2udifhI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ngeBvKFv5rYjSBxQLc+3Mwh0nuPZyl+Bj1kKnKL98nwpg63PReTbYg5arhMashNXTGsoZjJAT6rbZyWsl/vtTN0YIznvacT6FtaEUN2haKb0CSugJZNBWymwxTK+gOgSVt24T8G/cnMmuzetXUbWqoCgx3jvZ6NOT19klJTovFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KqYlAWzX; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3ed9557f976so4420369f8f.3
        for <linux-kbuild@vger.kernel.org>; Mon, 13 Oct 2025 08:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760369995; x=1760974795; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IKbWNapgsR6VEWEFu85lrkRceG4RpO+nq/TjDXD68V4=;
        b=KqYlAWzX85zYfeDq7wptaCvLfbQlYdR0+LOh8IKo0pFeFf5R/HUE/+Lyb34Vy/NQvW
         QLo/baTG0PMvYDH7fgHioXvddXmBiRhNopJqeUEc44ARxbdqBpgiEUavY07D9aQ0gEB/
         UOlCetT9NbcL9/2419sQy8tvv4oq9+xGdWg9db+tgsPxBl5cgR3TmZ41eH8cdqJ1OOk+
         pW8Ix+jSB3d9wCo9pWoLOGvTBn+4A0uvdJg+zEnJUNbmdJ3UVl3PrpJVIU8zkL6X6/AP
         J5x2WeEPpmxEcce1s2/ebK12+3Y6tgsDWjNcNvrBohFVGY7j5tS9kBDTtgVVfLuz4S0x
         Gjiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760369995; x=1760974795;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IKbWNapgsR6VEWEFu85lrkRceG4RpO+nq/TjDXD68V4=;
        b=C4v4IPEE34kUWqyaalGpz3uDLYni2H8EbdGZsFsyO8UYzjTX2CPA6dZfQfMzA4xLEB
         FSykgTrKT95MTkTfIJZvpRy3lsoVtOMKybiKwvX5jtTRHcx1bfu+BCNSLdtXKncDtioi
         z1HYNE4TsRJG0T1Lm1pJo4zZ3/I/hOM9+qjv8G3pcWKefE5/yaEJ+Vl9H67jobXx+5se
         g/ewm6uuReTtK7HPmzk7yol9VEtU7F/cWXXGb8ziyaRRtRfAlFeDqLudGD25Jj9yegC3
         HQY0P3pXpl1OrbtnVrrxPRRtbd4glvMMP83+fnK5352q7Te6HkHdZolVK057IdwBLIKF
         D98Q==
X-Forwarded-Encrypted: i=1; AJvYcCXwoeyijrlUGZ/A0PwigSfw5as/NgHELd3zFtUTCZ34h+oMYRyODE4E//1Wa2M1dTFDnfKgDmRvz8Rwt94=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhcsdaNIvqmZpIlM1vX3u7lUS0/KnZKdjEYJ1w8eNFDdb6wu4Z
	YAtcxu45mwnio57LsIUBLo2ytg8pNtfVXqCF2bAo1e3Xyjx5gsfjB3jBFhhIpErg1dh2wz02QN8
	l2uGjxvffwZwR64pNFA==
X-Google-Smtp-Source: AGHT+IGp+ZsF3D3bWIYgeYXV3HNMy4q84TyGQUuNRX9+df1SaWGYGQu8plkyY8YMsQnmYsyopCUPAzi7vnd9SmE=
X-Received: from wrbfi8.prod.google.com ([2002:a05:6000:4408:b0:405:9111:bac4])
 (user=sidnayyar job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:24ca:b0:3ea:15cd:ac3b with SMTP id ffacd0b85a97d-4266e7e15eemr11989551f8f.30.1760369994784;
 Mon, 13 Oct 2025 08:39:54 -0700 (PDT)
Date: Mon, 13 Oct 2025 15:39:16 +0000
In-Reply-To: <20251013153918.2206045-1-sidnayyar@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251013153918.2206045-1-sidnayyar@google.com>
X-Mailer: git-send-email 2.51.0.740.g6adb054d12-goog
Message-ID: <20251013153918.2206045-9-sidnayyar@google.com>
Subject: [PATCH v2 08/10] remove references to *_gpl sections in documentation
From: Siddharth Nayyar <sidnayyar@google.com>
To: petr.pavlu@suse.com
Cc: arnd@arndb.de, linux-arch@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	mcgrof@kernel.org, nathan@kernel.org, nicolas.schier@linux.dev, 
	samitolvanen@google.com, sidnayyar@google.com, maennich@google.com, 
	gprocida@google.com
Content-Type: text/plain; charset="UTF-8"

Signed-off-by: Siddharth Nayyar <sidnayyar@google.com>
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
---
 Documentation/kbuild/modules.rst | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/Documentation/kbuild/modules.rst b/Documentation/kbuild/modules.rst
index d0703605bfa4..b3a26a36ee17 100644
--- a/Documentation/kbuild/modules.rst
+++ b/Documentation/kbuild/modules.rst
@@ -426,11 +426,12 @@ Symbols From the Kernel (vmlinux + modules)
 Version Information Formats
 ---------------------------
 
-	Exported symbols have information stored in __ksymtab or __ksymtab_gpl
-	sections. Symbol names and namespaces are stored in __ksymtab_strings,
-	using a format similar to the string table used for ELF. If
-	CONFIG_MODVERSIONS is enabled, the CRCs corresponding to exported
-	symbols will be added to the __kcrctab or __kcrctab_gpl.
+	Exported symbols have information stored in the __ksymtab and
+	__kflagstab sections. Symbol names and namespaces are stored in
+	__ksymtab_strings section, using a format similar to the string
+	table used for ELF. If CONFIG_MODVERSIONS is enabled, the CRCs
+	corresponding to exported symbols will be added to the
+	__kcrctab section.
 
 	If CONFIG_BASIC_MODVERSIONS is enabled (default with
 	CONFIG_MODVERSIONS), imported symbols will have their symbol name and
-- 
2.51.0.740.g6adb054d12-goog


