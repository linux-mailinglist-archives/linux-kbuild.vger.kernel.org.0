Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92D871A2B8D
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Apr 2020 23:56:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726801AbgDHV4B (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 8 Apr 2020 17:56:01 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:43829 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726799AbgDHV4B (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 Apr 2020 17:56:01 -0400
Received: by mail-pl1-f194.google.com with SMTP id z6so1542877plk.10;
        Wed, 08 Apr 2020 14:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VzlrZXajPq/Q9/A0Br6uZT9Mu/rEfEvc46s5pTwJWdc=;
        b=BFz+SMP9Ddmm64qrdzEjVVbe3XsyaOcg9+iSWUs/1mHnAItFt2eTonvtcFJ6jkKLvN
         iFIbl9SAi70x2NSnNQPgdGyyQ/3CSFqCsLmomBkocmkWfUsbUuJpf1Pb3RalPq1ewCFV
         v/its7Eqb5qnPS4Dj+g5w1/hNfnudGAkarYfODo1IrG6JDanf58XtVUGNpcbQNFfxvrB
         trAPmdnCESgQ7X3K5sFW1RfpceHCFGOg+vRhHdJcHwi8jyuqFGEk5a8xBVKw702qwNKB
         pn8oK5uXJsjtB8BsvOXn1mIKFYy1S83riWFIS6eUZug6TNGYs/6JEUIAPK/jCxywULUX
         2RRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VzlrZXajPq/Q9/A0Br6uZT9Mu/rEfEvc46s5pTwJWdc=;
        b=AwOd7098fqy3GRAlKYpvJNG6dZR99cF6DeD3CaQb7+I67T4+AuyOAP3KQKe62dJSdJ
         6Q2Evp7LZW0C5lEauVedmIVQTvf6A74GZN+VcEV12bAER8VhiRofnPOgirG7Hg/C6Aoo
         5eyZlXvptiulcPffHPnPzuUgumlQHHb0t8WxeOufGrhsFwqsnvn6qip8CIKLRipJtgi4
         1Ux83brx5q3zMeZ0Y+hJoT1wXRqOKLS3UoFWPwg1GkG60EkmKIBznFIY4Cs15WtV7qNA
         2vL2jRYSwIx7xVmJ0nSxq/Tf7q0bgv0izFflu3wNQajBnYoTeKK5cswpI3YveCvoRihn
         vIxw==
X-Gm-Message-State: AGi0PuaCBXRrSvnVN8dwsxqnJf8EJ07BRDHtHXU9G5GKbBzdWoh0HBdc
        JmQxRvSk5k2C3rEoQ6sJOLs=
X-Google-Smtp-Source: APiQypKySnKUa36HTZwFXbusNB6a1Pil7hyn/jX1eAcEd8u8iUwP6k+qrU/aw1jiyTsgpetSjnMFxg==
X-Received: by 2002:a17:90b:296:: with SMTP id az22mr6903046pjb.191.1586382959707;
        Wed, 08 Apr 2020 14:55:59 -0700 (PDT)
Received: from nickserv.localdomain (c-73-222-55-223.hsd1.ca.comcast.net. [73.222.55.223])
        by smtp.gmail.com with ESMTPSA id ci13sm459604pjb.16.2020.04.08.14.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 14:55:59 -0700 (PDT)
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
        mingo@kernel.org, Patrick Williams <patrick@stwcx.xyz>,
        Sedat Dilek <sedat.dilek@gmail.com>
Subject: [PATCH v5 2/8] lib: prepare xxhash for preboot environment
Date:   Wed,  8 Apr 2020 14:57:05 -0700
Message-Id: <20200408215711.137639-3-nickrterrell@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200408215711.137639-1-nickrterrell@gmail.com>
References: <20200408215711.137639-1-nickrterrell@gmail.com>
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

Reviewed-by: Kees Cook <keescook@chromium.org>
Tested-by: Sedat Dilek <sedat.dilek@gmail.com>
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
2.26.0

