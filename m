Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C86519A4C6
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2020 07:38:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731792AbgDAFif (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 1 Apr 2020 01:38:35 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:36496 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731589AbgDAFif (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 Apr 2020 01:38:35 -0400
Received: by mail-pl1-f196.google.com with SMTP id g2so9166941plo.3;
        Tue, 31 Mar 2020 22:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VzlrZXajPq/Q9/A0Br6uZT9Mu/rEfEvc46s5pTwJWdc=;
        b=GfSPYsdJm+BFpKl5mRbvUih0yWsgEJGXPVEixKGBV+8xNwWX+WJQFbXeLs6FTFUsEh
         XYQ38kwChg6NSA5gg99BWcB1ZvWUgbXMYyvWwVxonFkImaB0SBCuBGgaRwfX6M2CYUc2
         s5Doh5xUew8B5/7ajRsQkd6pD7v8OXSLS2U0plpujWAm+avaaZF7IDfX5S/9TCeOSdx0
         xmJYjJucBRs2GUa2PRix5wGJjJkqGoiy1HNoxlUTRv7h41hpFDwj3NuTp/AsgJniQJKF
         q32PFjiZA4dE0o9V+4+va4+kSCmCV6WFkYWvQJBHnRXvv49PtcMpzVgOAGy+pUG+nSWV
         S+ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VzlrZXajPq/Q9/A0Br6uZT9Mu/rEfEvc46s5pTwJWdc=;
        b=Eq9AxdB9sBTMOZJo4d9+XiHXY9w2WSYeL+Vbe17VcoCNMFBC4rTWAY5/ufbA8hCZ6a
         ZO6RfwFVdteEdjjcLHejn9dH9GHu/ew5HQvAkaW0VOh2IsaP3CzA8CiL+RUVpgDZzdHL
         mhJvpNHQdqA6eeUPh6kWuP6jxaKOz6XhrtJxuPJNLUgf1YhGjBN5sPLJqsVcKLD4gLDf
         iL0lx+5PMpLOa1b7Ub8XhOh3TQixmQ9oBvDPhpRU1BquvG13P8OMnjIMXCNsLJKcP74H
         SSp6pK6vqZq/dRRM4FtDs6804GSIiV5r9nZFy7tnm5C9clAVRCyK2wSi+c5jd1f4xGEn
         grig==
X-Gm-Message-State: AGi0Pubg4Zd/mic7pmZXfvg9DCsekLDboD3kOGzaQniVFsRLpBr0EPCL
        cyIC5AEcmYX82UBjQF0NiX4E9JnUjNiv2w==
X-Google-Smtp-Source: APiQypL7TODPhJDvx71gb6TUHINj/0o4VpOp/43y48iemJZRs66XBjsvrQ6M2U+FQcAu2Zp3xUe7Jw==
X-Received: by 2002:a17:902:32b:: with SMTP id 40mr7244607pld.22.1585719514388;
        Tue, 31 Mar 2020 22:38:34 -0700 (PDT)
Received: from nickserv.localdomain (c-67-188-225-242.hsd1.ca.comcast.net. [67.188.225.242])
        by smtp.gmail.com with ESMTPSA id w69sm683077pfc.52.2020.03.31.22.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2020 22:38:33 -0700 (PDT)
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
Subject: [PATCH v4 2/8] lib: prepare xxhash for preboot environment
Date:   Tue, 31 Mar 2020 22:39:07 -0700
Message-Id: <20200401053913.216783-3-nickrterrell@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200401053913.216783-1-nickrterrell@gmail.com>
References: <20200401053913.216783-1-nickrterrell@gmail.com>
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

