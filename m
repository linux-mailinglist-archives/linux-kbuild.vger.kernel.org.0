Return-Path: <linux-kbuild+bounces-4079-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A7B99CACF
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Oct 2024 14:57:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F35A281F99
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Oct 2024 12:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3803C1A08A9;
	Mon, 14 Oct 2024 12:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EGaQfK9n"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774C41A76DD
	for <linux-kbuild@vger.kernel.org>; Mon, 14 Oct 2024 12:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728910635; cv=none; b=KiqA3bxqpe+Caww5HP7nDV3bdIGSZSrlM5HLJj8926yzUO8/utNcEV0EqLL6AEUQOK9VVUpxEGhoTa2jV15Bz5mRHjiHWX5KSreuwx+n3OY2fSENr6KvOVqHmeFeHfs9siq5fIUy9xYjeBg9FtbDiXyvBWQQMwKTVpNlZqxSGZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728910635; c=relaxed/simple;
	bh=n5hy9Z+L7ZRxP7bOPjIZ23jooU15sCOaLLYdguPKWZU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Zg/CdzneUHkbpH8LUIiDhjS0/XdH8JyZiw1UgqdhVLOaX52c4Q0hAQ8m0GylfD5uIZ3ZuJL5QoYk6vQgKfZ3VHvELEuNjMyXySZcFuLH9WUL/TSy8mRkrvmqUUTcekK3cIh7GwvobaRzn9dqD0vM9rUIK/XsHtnNR6agQcFvUSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EGaQfK9n; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-37d60f3e458so1219457f8f.1
        for <linux-kbuild@vger.kernel.org>; Mon, 14 Oct 2024 05:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728910632; x=1729515432; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/4+Id/JvDOWrciOX+Pt0gw96Ii3oR3apf9+eeU2SPu0=;
        b=EGaQfK9nVC4bpG8BfsLCRohU2e+V1bVMBjuwHuojBlrK87sdXYiitzVRZnlwTqtHWx
         h3Roo76a1qLaplZa81WqrTp6i0DSBA83CR2gTeZ1iw1UX9JK7TutQ5Lh6UPFgy5uKNLA
         1xXPbqdbJL52TvAKPwosHyj1/EcaIPFr1UoN3gr1Z/ObNxi4L9LPYoeBjHk8ZbWM1Q3t
         GbMboLgSRcyRZ/vvLrnjdy528xr4sxb80m+fKUrnhtRUjNkKORyn+bgE4UJOz1EhzHBE
         sJkP2ND6zGKgPiAqbhXxUnCJSKmZgRQcw1IfVG+Ar2m63cSmO3O64S7SLR6trvyCWa4z
         rIYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728910632; x=1729515432;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/4+Id/JvDOWrciOX+Pt0gw96Ii3oR3apf9+eeU2SPu0=;
        b=VObKtB1TitpTqriMWVWTTJwdR9gNdy6+pbHcc5sXb/A2Jb4U80m5nam/LMAH+p6vaP
         /Gpigg8qZbx63BlM076iIydeUUa7HD9R7h2hEbweqWDU5/o0BmrbRYZYzIZrP9bt7ajH
         8cTShGGiiOMBo0KM648b37zGeM92rJpk75RIpEWgo9oVFqb2Kss1n4x7cM1IWlxAADHj
         yMu7TX/SLg+iiaWEehXKZ0KAqc4iOqshPyAnxdTUFd9Pk6hi43klA/cJNjVha78AWtBb
         QKo92mmmSRwdDSxGOoC11K0c0c52ZNPDNPT9hBcxjCL3uz/tW/QN988SV+ankcKy6Ztp
         4Z9w==
X-Forwarded-Encrypted: i=1; AJvYcCVfpCNdtpL43yPg+CJp/jWlTd/6MZ/csX/hYoGJUYuGj1xhJmnYf2t382J+LkLgQRALshCQpTbcxhk4eBM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxwb6a3Kgrr9JcHFbZ7k9CDfXnYOSuDJPcd/hKcHWKMMJYwwzbF
	X2MFfGr6C61FmCfaQ+JmuU0ga8KQXo7EUi4X/IY+Vua/VCPa8rT9xcL1ST+rk+pnRaInBQ==
X-Google-Smtp-Source: AGHT+IGCETarcWcQqRIFRqqHH6KuqwoHb8bPYOCS/I0QvqDwtXW1Y79wZek7+MHKLcfDyEgkZpc9XL2l
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a5d:6349:0:b0:37d:496a:af40 with SMTP id
 ffacd0b85a97d-37d5519e9f7mr14077f8f.1.1728910631360; Mon, 14 Oct 2024
 05:57:11 -0700 (PDT)
Date: Mon, 14 Oct 2024 14:57:05 +0200
In-Reply-To: <20241014125703.2287936-4-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241014125703.2287936-4-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2118; i=ardb@kernel.org;
 h=from:subject; bh=MtWmIu/XLANHMVww4WyPFLDlQ8/l/C/DRmC5uEQQzio=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIZ1XVNHwoeS37nPZH8+9jH/hl7bp0+2HPxo3Wze3X9irp
 3O/lOVgRykLgxgHg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZhIpzgjw6WCzw7LSvZtXxIe
 Jldyg2+rqsRr3031i5gOXjDVZ539rZ+R4Uxopky14DObzLN7jl2QsN2SvWKJyyaVFNYcxV2fhRn P8gEA
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241014125703.2287936-5-ardb+git@google.com>
Subject: [PATCH 1/2] codetag: Use dot prefix for section name
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Arnd Bergmann <arnd@arndb.de>, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Sections typically use leading dots in their names, and deviating from
this breaks some assumptions in the existing code, e.g., in strip_relocs
on x86, which filters out .rela.* and .rela__* sections.

  [65] alloc_tags        PROGBITS         0000000000000000  03a57958
       0000000000026340  0000000000000000  WA       0     0     8
  [66] .relaalloc_tags   RELA             0000000000000000  08dbb868
       0000000000044c40  0000000000000018   I      280    65     8

So use a leading dot for the alloc_tags sections.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 include/asm-generic/codetag.lds.h | 2 +-
 include/linux/alloc_tag.h         | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/asm-generic/codetag.lds.h b/include/asm-generic/codetag.lds.h
index 64f536b80380..dcd18351ba2f 100644
--- a/include/asm-generic/codetag.lds.h
+++ b/include/asm-generic/codetag.lds.h
@@ -5,7 +5,7 @@
 #define SECTION_WITH_BOUNDARIES(_name)	\
 	. = ALIGN(8);			\
 	__start_##_name = .;		\
-	KEEP(*(_name))			\
+	KEEP(*(. ## _name))		\
 	__stop_##_name = .;
 
 #define CODETAG_SECTIONS()		\
diff --git a/include/linux/alloc_tag.h b/include/linux/alloc_tag.h
index 1f0a9ff23a2c..d45a8a582970 100644
--- a/include/linux/alloc_tag.h
+++ b/include/linux/alloc_tag.h
@@ -76,7 +76,7 @@ DECLARE_PER_CPU(struct alloc_tag_counters, _shared_alloc_tag);
 
 #define DEFINE_ALLOC_TAG(_alloc_tag)						\
 	static struct alloc_tag _alloc_tag __used __aligned(8)			\
-	__section("alloc_tags") = {						\
+	__section(".alloc_tags") = {						\
 		.ct = CODE_TAG_INIT,						\
 		.counters = &_shared_alloc_tag };
 
@@ -85,7 +85,7 @@ DECLARE_PER_CPU(struct alloc_tag_counters, _shared_alloc_tag);
 #define DEFINE_ALLOC_TAG(_alloc_tag)						\
 	static DEFINE_PER_CPU(struct alloc_tag_counters, _alloc_tag_cntr);	\
 	static struct alloc_tag _alloc_tag __used __aligned(8)			\
-	__section("alloc_tags") = {						\
+	__section(".alloc_tags") = {						\
 		.ct = CODE_TAG_INIT,						\
 		.counters = &_alloc_tag_cntr };
 
-- 
2.47.0.rc1.288.g06298d1525-goog


