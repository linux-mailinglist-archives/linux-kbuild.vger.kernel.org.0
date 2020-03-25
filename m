Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 845CA19317C
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Mar 2020 20:58:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727460AbgCYT6p (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 25 Mar 2020 15:58:45 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:39406 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727374AbgCYT6p (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 25 Mar 2020 15:58:45 -0400
Received: by mail-pf1-f193.google.com with SMTP id d25so1575560pfn.6;
        Wed, 25 Mar 2020 12:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dx+n8puhlRmbKDc8b4HkmMUgqteeC5ShLbEc3T9QjIY=;
        b=k+NQYyA3Zg5MBLMRE6KUEzLejiIdHQfU+uXs2A8ZMFWjrOnjoEg+bxcQAO79u7B/NA
         yzgy6DqaIJReGGF62fNTZv+R+1GH/AnvWEpDDMUdeU/TtHOFEh0aC/s/xD3engxKNSJZ
         omKromx/kw7A0UE8U3F9K+pya5fYIujZG0pGGTzAlOZPrKzG6U5ZWn66zQAnDAWZWY48
         fUdsbmwxCu1sxfC2gpNNLyVHnWevu9ndFV4DY1HVWJ8lDpze4xDpEvUBCf4FR25ek9rg
         /wEPhFRTnMjOWFfl8zW4hOxKjs/BlWyu6+hovuOv+LhtDyjhWji0Q+pvpiltrWSU1oS9
         9wyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dx+n8puhlRmbKDc8b4HkmMUgqteeC5ShLbEc3T9QjIY=;
        b=GAZwPwioxrRtgixnrtuRSIYyF5j20w1qsdKhProuNJl8166mNtPKpX7d2+OLf/+qFg
         SYpYe3076av9i5bqjH0qgQKBJJ4+gXsdnnR6+EZsMm67tt+dCGA8tRdAf1C13zzKjB3L
         NF5kNhfzct8E+7QRabSTM+iNQK6XfNUT9c4q8VsCrEXRzb3kFEx0ARtLr2Ff1PxCmKRX
         aleHtfsbj4ILMyAw38gRbXpGDWanYNWhUnBcShuho+F95Wlj8vJdv97S7Hvynb10pH+l
         P98we+nZCsF76TpjFFNjGnM7KJGGUidtVa6V+8IdWa+3560JxiVnhi5SQ2fH9UlsZj20
         QIKg==
X-Gm-Message-State: ANhLgQ2r9jdBJiFeEhPVaMeiLpxcrFycuxt09vkS9R3EhaommiQFniwF
        l9VmNq6+B4fRoVOfWwqNJTg=
X-Google-Smtp-Source: ADFU+vtBOkgNJTHKN6lZpxsIPg1XCJAjWI5CyGVisGg1k/8oplc2BVDRHSmKQZbtAAba3GNK6Uv6oQ==
X-Received: by 2002:a63:5050:: with SMTP id q16mr4676262pgl.118.1585166324278;
        Wed, 25 Mar 2020 12:58:44 -0700 (PDT)
Received: from nickserv.localdomain (c-67-188-225-242.hsd1.ca.comcast.net. [67.188.225.242])
        by smtp.gmail.com with ESMTPSA id d7sm19341374pfr.17.2020.03.25.12.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2020 12:58:43 -0700 (PDT)
From:   Nick Terrell <nickrterrell@gmail.com>
To:     Nick Terrell <terrelln@fb.com>
Cc:     linux-kernel@vger.kernel.org, Chris Mason <clm@fb.com>,
        linux-kbuild@vger.kernel.org, x86@kernel.org,
        gregkh@linuxfoundation.org, Petr Malat <oss@malat.biz>,
        Kees Cook <keescook@chromium.org>,
        Kernel Team <Kernel-team@fb.com>,
        Nick Terrell <nickrterrell@gmail.com>,
        Adam Borowski <kilobyte@angband.pl>,
        Patrick Williams <patrickw3@fb.com>, rmikey@fb.com,
        mingo@kernel.org, Patrick Williams <patrick@stwcx.xyz>
Subject: [PATCH v3 2/8] lib: prepare xxhash for preboot environment
Date:   Wed, 25 Mar 2020 12:58:43 -0700
Message-Id: <20200325195849.407900-3-nickrterrell@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200325195849.407900-1-nickrterrell@gmail.com>
References: <20200325195849.407900-1-nickrterrell@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Nick Terrell <terrelln@fb.com>

Don't export symbols if XXH_PREBOOT is defined.

This change is necessary to get xxhash to work in a preboot environment,
which is needed to support zstd-compressed kernels.

Signed-off-by: Nick Terrell <terrelln@fb.com>
---
 lib/xxhash.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/lib/xxhash.c b/lib/xxhash.c
index aa61e2a3802f..b4364e011392 100644
--- a/lib/xxhash.c
+++ b/lib/xxhash.c
@@ -80,13 +80,11 @@ void xxh32_copy_state(struct xxh32_state *dst, const struct xxh32_state *src)
 {
 	memcpy(dst, src, sizeof(*dst));
 }
-EXPORT_SYMBOL(xxh32_copy_state);
 
 void xxh64_copy_state(struct xxh64_state *dst, const struct xxh64_state *src)
 {
 	memcpy(dst, src, sizeof(*dst));
 }
-EXPORT_SYMBOL(xxh64_copy_state);
 
 /*-***************************
  * Simple Hash Functions
@@ -151,7 +149,6 @@ uint32_t xxh32(const void *input, const size_t len, const uint32_t seed)
 
 	return h32;
 }
-EXPORT_SYMBOL(xxh32);
 
 static uint64_t xxh64_round(uint64_t acc, const uint64_t input)
 {
@@ -234,7 +231,6 @@ uint64_t xxh64(const void *input, const size_t len, const uint64_t seed)
 
 	return h64;
 }
-EXPORT_SYMBOL(xxh64);
 
 /*-**************************************************
  * Advanced Hash Functions
@@ -251,7 +247,6 @@ void xxh32_reset(struct xxh32_state *statePtr, const uint32_t seed)
 	state.v4 = seed - PRIME32_1;
 	memcpy(statePtr, &state, sizeof(state));
 }
-EXPORT_SYMBOL(xxh32_reset);
 
 void xxh64_reset(struct xxh64_state *statePtr, const uint64_t seed)
 {
@@ -265,7 +260,6 @@ void xxh64_reset(struct xxh64_state *statePtr, const uint64_t seed)
 	state.v4 = seed - PRIME64_1;
 	memcpy(statePtr, &state, sizeof(state));
 }
-EXPORT_SYMBOL(xxh64_reset);
 
 int xxh32_update(struct xxh32_state *state, const void *input, const size_t len)
 {
@@ -334,7 +328,6 @@ int xxh32_update(struct xxh32_state *state, const void *input, const size_t len)
 
 	return 0;
 }
-EXPORT_SYMBOL(xxh32_update);
 
 uint32_t xxh32_digest(const struct xxh32_state *state)
 {
@@ -372,7 +365,6 @@ uint32_t xxh32_digest(const struct xxh32_state *state)
 
 	return h32;
 }
-EXPORT_SYMBOL(xxh32_digest);
 
 int xxh64_update(struct xxh64_state *state, const void *input, const size_t len)
 {
@@ -439,7 +431,6 @@ int xxh64_update(struct xxh64_state *state, const void *input, const size_t len)
 
 	return 0;
 }
-EXPORT_SYMBOL(xxh64_update);
 
 uint64_t xxh64_digest(const struct xxh64_state *state)
 {
@@ -494,7 +485,19 @@ uint64_t xxh64_digest(const struct xxh64_state *state)
 
 	return h64;
 }
+
+#ifndef XXH_PREBOOT
+EXPORT_SYMBOL(xxh32_copy_state);
+EXPORT_SYMBOL(xxh64_copy_state);
+EXPORT_SYMBOL(xxh32);
+EXPORT_SYMBOL(xxh64);
+EXPORT_SYMBOL(xxh32_reset);
+EXPORT_SYMBOL(xxh64_reset);
+EXPORT_SYMBOL(xxh32_update);
+EXPORT_SYMBOL(xxh32_digest);
+EXPORT_SYMBOL(xxh64_update);
 EXPORT_SYMBOL(xxh64_digest);
 
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_DESCRIPTION("xxHash");
+#endif
-- 
2.25.1

