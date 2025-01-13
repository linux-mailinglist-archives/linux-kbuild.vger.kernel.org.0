Return-Path: <linux-kbuild+bounces-5445-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BAD4A0B904
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jan 2025 15:05:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 74C8B163061
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jan 2025 14:05:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3254723DEA4;
	Mon, 13 Jan 2025 14:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="010+OfKi"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E7B23DE81
	for <linux-kbuild@vger.kernel.org>; Mon, 13 Jan 2025 14:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736777123; cv=none; b=JFoqzFu6eMLqxpOLPGPzD80UMGPht3ej20HAJQlapsSxhkwbSkNRUrfUCWY7iC+kvNT3MoCeSct3x59QeI/J4Dqv8WQqtccU8EdOb19ydNkEuQIY+qd5AEu1kxqAqGyI3bndUdQVhNCJlsnn+YfSKWMkcfZrW180OvKy7FdAXH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736777123; c=relaxed/simple;
	bh=iWwaIcsDZ4Sr3b4S/577j90zLHdoeIMa/iamDlPNBwA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ipJ96Z+SWGfrUPQm9NpORpeLKH+aTvRFcV6mkauuyGoxJH7/PYd7AaBtR4l/szkF/TfLqGLM7Pu0corSG+T3Knh/Nvt88kvRclrZpnHbCyin+IEL/f/SbQul5GucvcwzLXKpx2GCaCMadngRY5lv76op/6k8D/pKpVIgFmw6Z6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=010+OfKi; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4361efc9d1fso35775075e9.2
        for <linux-kbuild@vger.kernel.org>; Mon, 13 Jan 2025 06:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736777120; x=1737381920; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xf7YP3IkAsRQQJxEEobRB3kyQUwCz1GCIfo0L/Ujnio=;
        b=010+OfKi2PDi6GWJmLdf2Fb8T5kupeQm3PGu2IQPKwBeU296lW9UJR1QutqjuWYhEo
         tYl4yeR0961UrPm5wbRWNjR5VoEVoS7vwdE/f6/Hf2lfZSH07odWbE3vFHQhRo8zTlUT
         5vI/yiCX/4G/aWM8P4WK5uzKFO6N+yapGy+G40z1mheK0wf0KZKKOJCuDLD6RDgTkC/M
         K9lCVIsgfDwrKdKLCdeSsXxxLgkxoHco/YXoDoJJ0jbinFxheCeaSlCRRSmW6Aqjk0oI
         voXZn3F9dhSxN30d1DN+Ak97X1aKsYX5kE+HuUHm63DrWFsBjNFE5eH7bJQEMWNaQ1d/
         OUog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736777120; x=1737381920;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xf7YP3IkAsRQQJxEEobRB3kyQUwCz1GCIfo0L/Ujnio=;
        b=GpJbuGGLV7hkpMrSPVDSI0TyAtE2Tw2reYpUaGDzQtBYDn5j6hmBkn4ynrdAMMgAmk
         7uridGdgRUBLVdz35zKkV7Vt3Gt+qnyVhpV8xSk8E/70dEJ0XKWjcCDfapesA5Sk1gKw
         /PvwbIj8NGtI7hZ2X2cGkD4sci928YySxQTMQTvl5tHW/xPnTAKHGF1eMHpnwrAZ5F9M
         CtdQLYPOXbbtVS/ONYKP59PpNKgWAQbD2AzHpbrqmcsTe1tye0pX1KsBWKuCWnSjgGSS
         nIusmZ/5YKMj4lBHwtPOiNaIE5vjTLStNGV6L9rLkiTz+IWstk35gDvqo53MU+mHnKGX
         ugsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzBSbxYnO84PlLsD2XC5qWpvoBBH8s0+uXH/1SKrQxgckkMZ6FmqMOyJdDMIDlgUOO4Rg8CQgq5ogEdP8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8dGlEP/UmAW9Oo1Y0LRC4DYyFUcqknKkdq8ouQa2kr+OIzXP6
	nsrgXgXeI10IAjXRkOwMcT26fm/UorweqRo8v6PKPa3HnHPNveWuhCwQYXTIP46HiOtmOS/2pjI
	KvCBb3jH2jQ==
X-Google-Smtp-Source: AGHT+IHnIaAjS6kBqmfKE63dAzuPWGyY5MpgyWZmqfJgPPlsZjSHP5Qbhww3cRWn0ef6rWZdDf/BMeBb6tlkEw==
X-Received: from wmrn32.prod.google.com ([2002:a05:600c:5020:b0:434:a7ee:3c40])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f47:b0:431:5632:448b with SMTP id 5b1f17b1804b1-436e26e23f8mr165897915e9.25.1736777119969;
 Mon, 13 Jan 2025 06:05:19 -0800 (PST)
Date: Mon, 13 Jan 2025 14:05:15 +0000
In-Reply-To: <20250113-objtool-strict-v3-0-8b51f94957fb@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250113-objtool-strict-v3-0-8b51f94957fb@google.com>
X-Mailer: b4 0.15-dev
Message-ID: <20250113-objtool-strict-v3-1-8b51f94957fb@google.com>
Subject: [PATCH v3 1/2] objtool: Add --Werror
From: Brendan Jackman <jackmanb@google.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Brendan Jackman <jackmanb@google.com>
Content-Type: text/plain; charset="utf-8"

At present objtool only prints to the terminal when observing "fatal
warnings". This option lets you have it produce an error instead.

The use case for this is noinstr validation; so far I've never seen any
false warnings here, but it quite often detects real bugs. It would
be useful for the build to fail when I have those bugs.

Signed-off-by: Brendan Jackman <jackmanb@google.com>
---
 tools/objtool/builtin-check.c           | 6 ++++++
 tools/objtool/check.c                   | 7 ++-----
 tools/objtool/include/objtool/builtin.h | 1 +
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/tools/objtool/builtin-check.c b/tools/objtool/builtin-check.c
index 387d56a7f5fb8da8435d0a3f5c05eeee66932c9b..0b28082df90710ff7127327deb857c0548f378c7 100644
--- a/tools/objtool/builtin-check.c
+++ b/tools/objtool/builtin-check.c
@@ -94,6 +94,12 @@ static const struct option check_options[] = {
 	OPT_BOOLEAN(0, "sec-address", &opts.sec_address, "print section addresses in warnings"),
 	OPT_BOOLEAN(0, "stats", &opts.stats, "print statistics"),
 	OPT_BOOLEAN('v', "verbose", &opts.verbose, "verbose warnings"),
+	/*
+	 *  For now, don't fail the kernel build on fatal warnings by default.
+	 *  These errors are still fairly common due to the growing matrix of
+	 *  supported toolchains and their recent pace of change.
+	 */
+	OPT_BOOLEAN(0, "Werror", &opts.werror, "fail on fatal warnings"),
 
 	OPT_END(),
 };
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 76060da755b5c51cda3a669d8245d7d004e25f22..e44135293eb45f908e00359d84d954cfeddd266f 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -4944,10 +4944,7 @@ int check(struct objtool_file *file)
 	}
 
 out:
-	/*
-	 *  For now, don't fail the kernel build on fatal warnings.  These
-	 *  errors are still fairly common due to the growing matrix of
-	 *  supported toolchains and their recent pace of change.
-	 */
+	if (opts.werror && warnings)
+		return 1;
 	return 0;
 }
diff --git a/tools/objtool/include/objtool/builtin.h b/tools/objtool/include/objtool/builtin.h
index fcca6662c8b4b5e0048e54fada8694cc2e6ebc34..97d668010efadfa05bb6e25e1967a7d72bf77815 100644
--- a/tools/objtool/include/objtool/builtin.h
+++ b/tools/objtool/include/objtool/builtin.h
@@ -38,6 +38,7 @@ struct opts {
 	bool sec_address;
 	bool stats;
 	bool verbose;
+	bool werror;
 };
 
 extern struct opts opts;

-- 
2.47.1.613.gc27f4b7a9f-goog


