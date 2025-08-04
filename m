Return-Path: <linux-kbuild+bounces-8288-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BCFB1A97D
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Aug 2025 21:19:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2969518A39F0
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Aug 2025 19:19:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F9D928B516;
	Mon,  4 Aug 2025 19:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YzD5lKCp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4382328B417
	for <linux-kbuild@vger.kernel.org>; Mon,  4 Aug 2025 19:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754335110; cv=none; b=tPZT93nXv6808a+o4nIUo/C4aJVlxhM+H6iNceDwWAcjRAbvwO867pg2wK3+vHo/7fDuJbhTqjDaY90tlinyAkTOh9dcttol5nH52zWfEV/oeOYJwQCusdU1bXKVU1NmZY8zQ0jis8E/gc7UucVryf338ERxyRR1OUth/jcqAQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754335110; c=relaxed/simple;
	bh=OF7LyNhIL1EOuOn5pfi758khliHdObXKjDRY6+iPVTk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nJSo6kjetxMH1kfqf9UoM+zf2UQtVJRgxfsqNaSDwLg4j7GHOXSb1NJI3u48eJSsJ9iTBpZybOW9jC3A8LAtysws6kxQ1TfTX76wfJ1+a9A8frTAvZ+ejumI4QqGJ40uDSQ17POcZUyiD4rhIhhkOiAawHHUBNsvrbWXh+11Q4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YzD5lKCp; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-458bf57a4e7so125e9.1
        for <linux-kbuild@vger.kernel.org>; Mon, 04 Aug 2025 12:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754335106; x=1754939906; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UiTfAb9cnMOM27iD69XKZ3u4igfynQ6rP5nLGl75Z/s=;
        b=YzD5lKCp3Nc7LL+onR3iz9pARhaMIVkDuAPRgZwo+ncQd8SXrQa4jpe7z/nklub7EL
         8PJGaNPy9+4pkUSP9Msey/7o5bMmAiLz7Cxz+lx8kMt7/Mn2W+tazAx9sFfpgOO5tMSJ
         SbPbNbFlhLW8y2sLPzc+SNVUeNkjdND8RRrWbTG+RBZ4grqhaWIOrESc9ekAz+kMznri
         O2jv7fZpCr+jXh4t2BA7mbaGEeMpOq/Q51hThe4ue6BGC+eKME00qZm4zOIyC1+VvJFb
         a+lekUx8S4DAp75MXoxScbIWzSoG2meZh7qRq0QMT/nPfYPcAajDriqWcgTvGSjVzWmm
         lKgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754335106; x=1754939906;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UiTfAb9cnMOM27iD69XKZ3u4igfynQ6rP5nLGl75Z/s=;
        b=H3sc7ztekUewkfvhNyzTrKmyn5ILP61VGNYzRopva2kOHKI9XZwjpxye5/C50cIpxA
         uL5HWfP3qranIquvJ54Gl1bHB3hszaFcEkfAOjVdwfZnBPnF2PRR4WS0jbLsU6flb5zm
         I+r/mfXoYmqE5XlBhfp9OC0jPQIzVJJrUSdcwE40LhZaT4c7vPUN6ejp/D797p18VHY6
         Jv0yh+V5Eu14U4Cyv2trt7OatAUMTMfetAU4oaMzn9rgtj483XTUX5Y/cdE0JTvbCg8F
         s/BhaLq+1u6KuD2FFfoM/F5IxMg1hz6EzhV9i5fee4R8YgJug0fwzsD/rpv7WGh+iLXS
         WTpw==
X-Gm-Message-State: AOJu0Yxhc2kp9uquZyia/JwphuQL/cv6v4+DwYZ8NFwOC2gi+KVmh6sF
	sW/MJpjcsLAt4Ly3zcR0sO0HNBWIIfExrG2VefZNT++3qHo1iqialXrp/OiLEwY4OA==
X-Gm-Gg: ASbGnctHo5lak1uZrw82242tJdJrkzrKqZg2Z9suWr13A0pQFjQLV2EmWqPG/PVOx+f
	Vfp7kDVuWG/dmv2d6RcunLU5AXBWSzNLM6dNCdletzLkFKOQP83zbOAtCFepUptv/RSlj3oVfTO
	QSrIS9c63IqaOungrFJlAu0Tm1Eg5jnPNZLVO1xXtlwieyDZjD9t1S8j0RKCUESa9raMQxvoNuy
	WG2JK0k19Bn3iaId56jjwTmM89n2JjkjT8UtGyK9+WylyriOMgcLVhQm+WYAC2hbPdeh/AH4nJC
	p7WSGJnchTv4PGBOxjdNGBTJRfP2V8ji/Ru3L3Sw4jD6mG7Kkqa2e9KPDJBwtU7ICZYGPRJrpcm
	PCBg9Nva/qg==
X-Google-Smtp-Source: AGHT+IGv48sGeD5VUgCauZAiE/92kma0rYRuzmY0NHuib68VVw0+Cdvc44IEf/hoe+8yq75/M+2y6A==
X-Received: by 2002:a05:600c:444e:b0:442:feea:622d with SMTP id 5b1f17b1804b1-459e14ef635mr140015e9.1.1754335106255;
        Mon, 04 Aug 2025 12:18:26 -0700 (PDT)
Received: from localhost ([2a00:79e0:9d:4:2069:2f99:1a0c:3fdd])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b79c3b9386sm16502103f8f.18.2025.08.04.12.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 12:18:25 -0700 (PDT)
From: Jann Horn <jannh@google.com>
Date: Mon, 04 Aug 2025 21:17:05 +0200
Subject: [PATCH early RFC 1/4] kbuild: kasan,kcsan: refactor out enablement
 check
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250804-kasan-via-kcsan-v1-1-823a6d5b5f84@google.com>
References: <20250804-kasan-via-kcsan-v1-0-823a6d5b5f84@google.com>
In-Reply-To: <20250804-kasan-via-kcsan-v1-0-823a6d5b5f84@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
 Alexander Potapenko <glider@google.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Marco Elver <elver@google.com>, 
 Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Roman Gushchin <roman.gushchin@linux.dev>, 
 Harry Yoo <harry.yoo@oracle.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kasan-dev@googlegroups.com, linux-mm@kvack.org, 
 Jann Horn <jannh@google.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754335100; l=2094;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=OF7LyNhIL1EOuOn5pfi758khliHdObXKjDRY6+iPVTk=;
 b=Nj7lWb06h7SXCifoXeKMs0DUlOqOdP4H8VnS8Otq1aKjtHh/Kl7wkBiRiTwimSc9Mb/vQL3wz
 G/GTNIUIiYQAgciu1KMGaY+kSTClICVFU5L25WqzmjcvA+7+WE4fbAH
X-Developer-Key: i=jannh@google.com; a=ed25519;
 pk=AljNtGOzXeF6khBXDJVVvwSEkVDGnnZZYqfWhP1V+C8=

In preparation for making the logic for enabling KASAN/KCSAN compiler
instrumentation more complicated, refactor the existing logic to be more
readable and (for KASAN) less repetitive.

Signed-off-by: Jann Horn <jannh@google.com>
---
 scripts/Makefile.lib | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 1d581ba5df66..017c9801b6bb 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -52,14 +52,12 @@ endif
 # Enable address sanitizer flags for kernel except some files or directories
 # we don't want to check (depends on variables KASAN_SANITIZE_obj.o, KASAN_SANITIZE)
 #
+is-kasan-compatible = $(patsubst n%,, \
+	$(KASAN_SANITIZE_$(target-stem).o)$(KASAN_SANITIZE)$(is-kernel-object))
 ifeq ($(CONFIG_KASAN),y)
 ifneq ($(CONFIG_KASAN_HW_TAGS),y)
-_c_flags += $(if $(patsubst n%,, \
-		$(KASAN_SANITIZE_$(target-stem).o)$(KASAN_SANITIZE)$(is-kernel-object)), \
-		$(CFLAGS_KASAN), $(CFLAGS_KASAN_NOSANITIZE))
-_rust_flags += $(if $(patsubst n%,, \
-		$(KASAN_SANITIZE_$(target-stem).o)$(KASAN_SANITIZE)$(is-kernel-object)), \
-		$(RUSTFLAGS_KASAN))
+_c_flags += $(if $(is-kasan-compatible), $(CFLAGS_KASAN), $(CFLAGS_KASAN_NOSANITIZE))
+_rust_flags += $(if $(is-kasan-compatible), $(RUSTFLAGS_KASAN))
 endif
 endif
 
@@ -94,10 +92,10 @@ endif
 # Enable KCSAN flags except some files or directories we don't want to check
 # (depends on variables KCSAN_SANITIZE_obj.o, KCSAN_SANITIZE)
 #
+is-kcsan-compatible = $(patsubst n%,, \
+	$(KCSAN_SANITIZE_$(target-stem).o)$(KCSAN_SANITIZE)$(is-kernel-object))
 ifeq ($(CONFIG_KCSAN),y)
-_c_flags += $(if $(patsubst n%,, \
-	$(KCSAN_SANITIZE_$(target-stem).o)$(KCSAN_SANITIZE)$(is-kernel-object)), \
-	$(CFLAGS_KCSAN))
+_c_flags += $(if $(is-kcsan-compatible), $(CFLAGS_KCSAN))
 # Some uninstrumented files provide implied barriers required to avoid false
 # positives: set KCSAN_INSTRUMENT_BARRIERS for barrier instrumentation only.
 _c_flags += $(if $(patsubst n%,, \

-- 
2.50.1.565.gc32cd1483b-goog


