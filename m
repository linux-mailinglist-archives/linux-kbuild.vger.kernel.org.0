Return-Path: <linux-kbuild+bounces-9684-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A177C70995
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Nov 2025 19:14:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id E26BE2F77B
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Nov 2025 18:14:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D63DD368267;
	Wed, 19 Nov 2025 18:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jWBuzbhK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B143538A7
	for <linux-kbuild@vger.kernel.org>; Wed, 19 Nov 2025 18:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763576071; cv=none; b=F2uT065Ile4zzCPcO1MipFtyYIcT2Tu7kXOClnjHxquCJH1UVHmL/ZdVRLP4el9nuSapzGwTfpm/iyosSTOyBWF7MQJjuTOKiu2F0po+Is0AvpXOnHEYT2X0QIh1w5+gjBX8SGFRkdq6T/EcH7h4+7nmosRpDXYOYu5DEP4iQvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763576071; c=relaxed/simple;
	bh=fOaYndhzO7GXOWo11e/wLosmESF6vtdq2dn5BPwRTXU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u/EFRD9MiKvmHGqZHvXbNuBpBtG/1EjUXNxdNrE3ctlmH5a457CZ90vFhyNpJ1+D0n5qVhI6VWFJFrzkBDZIM9v+FtW6zkRgfchV8DiDGnaVcbVmCp29jMzoa623vFbahMIj5FkE/VcHtSWfbANv8gqhdBixBPygihgj37lWdPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jWBuzbhK; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-4336f8e97c3so257585ab.3
        for <linux-kbuild@vger.kernel.org>; Wed, 19 Nov 2025 10:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763576055; x=1764180855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RPirOi0w0Cb/s6FnCbMEuNgCnH0qPfOw0gyvUWbzUDU=;
        b=jWBuzbhKm7GmCR4B66v1R+1kHtaBSiBzlrhRU4GLgcpLANPgD/EM4Td1RUcdi9wae8
         SJioEUcQO6Sf41HoOUwf/ZkZOwuR7VXC0DoIBNFepXtNw0BEEeGGGJGeTdmi5FlgBGoH
         52CZHvipqomWdrTxgOkCcWmRCx/ahmCblq+x0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763576055; x=1764180855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RPirOi0w0Cb/s6FnCbMEuNgCnH0qPfOw0gyvUWbzUDU=;
        b=vNHCc/ENkl6LpPb9/Vo+2iA9SBwsFq8OAVbomyrczolUsRD4zD6AV+Hx34T8PP/jw5
         qNAneQjmzjVUSYFlmW5oFA2WgijL3fIz7hA34LAR9esL5DRVpzthQclmjKUp/0tuk+ly
         8l955NDIFXrnlFuq/yleZOVQpTEfqL4LJjseAmmvOXNz8ECzr5gBXKMTjweyicWrlxB5
         8wN6NT4QV4YMKpSgpoC/l/94/uEffOEP24L6DLG8vwBp8r9wmtUwOJjk++lVpqjmWcsG
         eLoFH8Xlk4wKvy53hz9aHLuluvtRyrwRRkVg/87x/SQTilsT8g4pJRBqZQXnO0er+zbL
         h2iw==
X-Forwarded-Encrypted: i=1; AJvYcCV12+MRvyi+3liaSWRxYZi858lh9bVc5zTfKe/5y2CJhOnwhTvZZ4kLt3LDWSTluPg5676qqBWtqBviD1I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRw7avNjPBs489C9rXpO+8yWJpPat+Q2Qa1VRgrk/kZOatWpmx
	NRIezqHi7cfpugV0Hr7h7EgfZGy5xkRJJjGrWN+Tn+SLS/DLiOyfkZ+u0iT6q+v5kg==
X-Gm-Gg: ASbGnctDpO0qLs6HA6rsJaWTKUzv8YnkXX0V2TTJVojbApjADzncifjGfT9OI8yl9cU
	SDS6a/yDMaXdI2ffjLRRjcWSFXMXGfDJQak7IJYZcJjGg3ZlfxJL4wlz7kq5D+EC5epuOk4lhHM
	0Ea/pekbNO/s8Sm1j5ZNR8x4T7cu/Aybvo9EyZpBYvy9yFW47eqU1GIfqGI+mQgVwmpTfdMr//S
	ni/FXmHM6saAWj9lhAfX1RHmAeq6Bre0Dmhax8EoRqV36YZxPBP5z/1bzVUL67cS3JULSxbg1sK
	IZRfggrkz0qarwXD/LoZJQaeVgfsDW6tBHHzXg+9P0AGBTJ7GJaH5C9DQjZUELl0t60ZsJW83Qv
	slRmGBFKCV/HdCt5oxAA7RIU0GXIQgUEhhtTuN80Ty6wMPRhpGt9AfkNx0hxtmBJNeQ7nVbGice
	2rcnMn
X-Google-Smtp-Source: AGHT+IEqawcvOIPqsXpALDErL/1Go+TjtEXbiX8/+Jw/9VSxcMjIN9Ju3r68ajG6bVKTrOJBVHHikA==
X-Received: by 2002:a05:6e02:3398:b0:433:7f13:3a8c with SMTP id e9e14a558f8ab-435a902d081mr4341845ab.16.1763576054629;
        Wed, 19 Nov 2025 10:14:14 -0800 (PST)
Received: from chromium.org ([73.34.74.121])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-949385ae254sm4838639f.1.2025.11.19.10.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 10:14:12 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Tom Rini <trini@konsulko.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	=?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Simon Glass <sjg@chromium.org>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Tamir Duberstein <tamird@gmail.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v6 5/8] kbuild: Split out module targets into a variable
Date: Wed, 19 Nov 2025 11:13:26 -0700
Message-ID: <20251119181333.991099-6-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119181333.991099-1-sjg@chromium.org>
References: <20251119181333.991099-1-sjg@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a modules-targets variable to list the targets which cause modules
to be built, since we want to add a conditional target.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

(no changes since v5)

Changes in v5:
- Add a new patch to split out module targets into a variable

 Makefile | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 638bc09a546a..8cd46222fc48 100644
--- a/Makefile
+++ b/Makefile
@@ -772,7 +772,12 @@ endif
 # in addition to whatever we do anyway.
 # Just "make" or "make all" shall build modules as well
 
-ifneq ($(filter all modules nsdeps compile_commands.json clang-%,$(MAKECMDGOALS)),)
+modules-targets := all
+modules-targets += modules
+modules-targets += nsdeps
+modules-targets += compile_commands.json
+modules-targets += clang-%
+ifneq ($(filter $(modules-targets),$(MAKECMDGOALS)),)
   KBUILD_MODULES := y
 endif
 
-- 
2.43.0


