Return-Path: <linux-kbuild+bounces-5175-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6A59F6938
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Dec 2024 15:59:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DECDE165B88
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Dec 2024 14:59:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F49B1EBFF8;
	Wed, 18 Dec 2024 14:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AGbNema/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438091D54E3
	for <linux-kbuild@vger.kernel.org>; Wed, 18 Dec 2024 14:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734533944; cv=none; b=srb0bdDa//wqMSRhaJTEvkCGjc1BPwGrclUq9r/5TSRHNT4ivhvdyLhhSRIG5R14Qyqc37sUA3xILQzkiz/EqqIKQQecG8naHhe/mk+2ggI2LI2anfYwesExNg0b2/HuqozpkkyGzwzJzceMiaKlyLS9rhe6/XSMfUK5eHIldFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734533944; c=relaxed/simple;
	bh=KCEr2W+5QMJ0aau2ejxlB/jVgNJmqNP817wKzYYGqxE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=l/ujZPBLlT86kqxzwhEE2rcXF5n162K5D3utKgW1udoW9S1Nosb4ffFXrmBMMMTKPRtcdpCF2xOCAlbwmd59KhzmK8pQjrC6/13KOzuU3vZQtgmebbxQF4k4vNw7FolIiIR9cjIRgeBNS5RnDLO5rjHip9f9EbUBjGJq1CZ2Pxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AGbNema/; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4362b9c1641so29446905e9.3
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Dec 2024 06:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734533940; x=1735138740; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=idHXEvLLy2mDizWltND5EhS5SGdeBni13+lqGt1+LxU=;
        b=AGbNema/vKjBlDTiqxyTT9DphZS98J69TnjIn6hYgWJy0s8cNXgzIK1SyxBSf+rQt3
         WyGs0Sqr7gYu1KX+ArNrykhTHaSlWtHl3a8qeOEWYFCsQ8iJxQiAgJ1IyyJQeX8qXyHN
         TCPu+CL/6/EX2lfo/nZExskBuiyuLAoT34XXxiO8SYzzdaU3v3+GSKYb0aufhOjbG6S8
         VADpRCdMAcXpmxo3Ya49F8whTZqhN6OcWhoKzWWv3Ci+wk5zMBqwxZrXPCPmcLPfEMEF
         ZeIeEi6SRyRWIspHMTbADzF67cJcZ61CSRtAeQZI63Ww3fWRpUDhRyZ1xj6gq2CRQ5EG
         Lv1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734533940; x=1735138740;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=idHXEvLLy2mDizWltND5EhS5SGdeBni13+lqGt1+LxU=;
        b=pfxCbxRaXznYjkMtsNKoO/c+IqEl1a3OE6Kh4merw7/R52eIRSP4POfEQNxFiBp5pm
         Y3kMojAohDfd6DziChbyWof7lKFqKn2rCkzJdYj5YuSO3QGlIWEYlqYsRo7EBsnyF7fq
         d2240gBLqe3xHGG3uWiEVVjPHqRP1WcKDHxxlgzQwv28saYRTTLDoZ1SZ6+IiHZBNRxZ
         Jht9l/yneFXFyk3msGuPDSgEmwHxt+Z//ReeEvJRPMcwzEbFuQvjzywOkIrxBwcc0Lfe
         gBeJGXkvnITj1QvYCO4S/NF02xZ8RX7QKykOxgBkyhSkp+hkRGFMt1CwnIWSy1C2kY8F
         /Bmw==
X-Forwarded-Encrypted: i=1; AJvYcCUB329ljIfU5/LGVs6azG+DKRQuC9SQLwM1b0lmoe1AwE10Nsw3rVpUen8aY6X1gnmLw1TzTy8PUXjs2Uw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFISga7wIWy2no/nDnQEmpTt6zwSI9JMEfE1laJI04qIYndC2A
	x9yBCCgZcvx1v0rLJ0bbXNkvmSgrzkgpsPL68ld2Z8O2J30sKAIE8xfb99s9afwiA6K9tFMWa5T
	cLyg0CzkpBQ==
X-Google-Smtp-Source: AGHT+IH+9zaQOVFuVfKtcWUDrT45GIKtZMxkPrMnUP9HyJ02nWCkBrRH3WyfgoYhgFwBe/w1jpoWPWajtTkyMg==
X-Received: from wmin8.prod.google.com ([2002:a7b:cbc8:0:b0:434:a346:77e5])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3c98:b0:434:9936:c823 with SMTP id 5b1f17b1804b1-43655395610mr28336945e9.18.1734533940792;
 Wed, 18 Dec 2024 06:59:00 -0800 (PST)
Date: Wed, 18 Dec 2024 14:58:55 +0000
In-Reply-To: <20241218-objtool-strict-v2-0-a5297c961434@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241218-objtool-strict-v2-0-a5297c961434@google.com>
X-Mailer: b4 0.15-dev
Message-ID: <20241218-objtool-strict-v2-1-a5297c961434@google.com>
Subject: [PATCH v2 1/2] objtool: Add --Werror
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
index 4ce176ad411fb12a10101bbedbb6180275941b4b..7c73517dc11c98cd7163f96dc8f4158389d58428 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -4941,10 +4941,7 @@ int check(struct objtool_file *file)
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


