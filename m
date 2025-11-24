Return-Path: <linux-kbuild+bounces-9789-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3645EC7EAC6
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Nov 2025 01:24:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 450273A56F8
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Nov 2025 00:23:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C6E078F51;
	Mon, 24 Nov 2025 00:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MxJ4OgUv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E655139FD9
	for <linux-kbuild@vger.kernel.org>; Mon, 24 Nov 2025 00:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763943811; cv=none; b=upx7cjQKKp0GTdzZ8ie2+AYMhq++d1fb8Sq9szKy+7gGHXAqNZ3QTPgxcKmDM6eJjAV+eWisVdrHGqC98bdTybuAQv+A14Ryaqdt2wezV1pUjX/+u4izt1NJWGbd30Q45Hjn9NCTGUFAwVGu26s5BIl+VLt5NEPbQeo3S4fn5EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763943811; c=relaxed/simple;
	bh=sTkBdKF2Bl395/5OqRTBusVdJ6qB+Rw9uaO1n0TJDaU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GiHSkbVTxCVVka3FY0tjify2F2/LR+DINIBB8dlyTLSPiAIqf1mnwutfPkfQPAm+GAxn67WJ+aOkBqM1XaTXf8ZJ63tSurRFRNfJH1tAfRvOO8Xhc+HAeGSXenG6t5G1Ms+j0d4GX3n7g4X3DGHcmajmtEmR7685plS3R5iMbwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MxJ4OgUv; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5959187c5a9so2888112e87.1
        for <linux-kbuild@vger.kernel.org>; Sun, 23 Nov 2025 16:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763943806; x=1764548606; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2GKE54eSllGJNXgg9hY2liAKdUIlhKXmX5Ag1NTay1Y=;
        b=MxJ4OgUv1qC201EOX+3Aj/psHUa96b89BKpFq3WoQDRGW3KqnaU3M/9nxOgIcoJUIi
         InigXf27PljNPhwGlp91tJ+6Z/YHuGwZJha04wGqNLJFeye8VRr2Z0/LRLv5BxzDkRXQ
         /EjxmpXEW/96qe0nu3Idg9GKOn4yPBTB7HgAYG1epoGkuaLcWYmI515aXhfpE/kravM0
         ziY+2bz4eqEiecV5H4dAgZgSx4jAKJ680FU5DTF3LAUYs8/V1vOaZHQ4gwu+UUnW2ej4
         WKJ1ef1sTZfnEcaxpRmtrqj8TdKzNN0J+bzC3N1i8E4VKzX4t2IJYjvcwQKVOlrmEkYo
         TUyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763943806; x=1764548606;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2GKE54eSllGJNXgg9hY2liAKdUIlhKXmX5Ag1NTay1Y=;
        b=o8vy24trm134XA6rAfbxOZbr339iPxL0L1bIObPE4TkZKqCPmfmd7wR81sTIEzSiMX
         uyhZJJ1oT2o9gbd/TqArp3I5Et69QFfWxYNv2hIRFpdxAyjfLSxEGfX4UOOHFRQl+Emz
         dn0lqK/X4WoEq6uvRIxpzUUu4NP6JRhPPah/nlPVUKqYs7tLbiqDsBiJZSGeRqxa5Uiy
         ORjAqh1oLHt38/5WxlTPFUUdo/hoYgvOO5eDZSU8URlhmQaOk+coCgirOr+H/K8K9Wt5
         1agOK4zqcCzD8FcE8zCgs4TA+ItGNnqre0WqgmTY4cX9Iw73PEG+jm/+Bn0uZ1K/o4HG
         w3Fw==
X-Gm-Message-State: AOJu0YzsN4k6MgslEY7ePUoFg3Y48H/V+tJ3aMPTyVuMLUS61Kc7JxdR
	JTJbAIHJ0k20YJvblXJ3iRIBlT5ofReMmSyR212xkvl1Bo7tghpenowt
X-Gm-Gg: ASbGnctKoyXCYFm7uSNFURoorJHEYlCNQaW5BRGcHJo3YwRluHchoASeFaqc7t68WoF
	eC9G/5H1d8BwK5e1qzqSsrpEoECfocxrDTr7Q/3faOw9ViBGG+PmXAZutC8URiJpmJUlU+1NMRC
	NZAtW4Gqay5NX8RB2xfmsxePa43v2kV7Pako/zIoBPJKOr8fGjU/hwshPHZb1v4YYStXV1HrW20
	jdSp8VnupNq/vtjrqFA+NVL/5IFQt4KPsLVw8/zFm7vS5mo1XDytT4nKVjbZkSVJHgsbmEX0IVn
	rjFqXNW3X56/Pls6DGu+ANXvrf4dWPeztGyaGsB6nPynBtkgPRdKWQzwv6dSEGuMRa6wKI7bVXx
	GuBD7L+/VuDc3IyVFKY7xwsHNNufCBHkuBYqjwXcFzJEs9XDxIQnPKvmaP7I0yW/RxuQw1g==
X-Google-Smtp-Source: AGHT+IEWwT4/ncaiOLuV73qylxP6v1jd62XgFGSBRwTlD52FtVaOl9gnPmEY64M2GGXzMxQbpMXxnA==
X-Received: by 2002:a05:6512:3188:b0:595:7e9c:cdfa with SMTP id 2adb3069b0e04-596a3eb5e25mr3770473e87.6.1763943805776;
        Sun, 23 Nov 2025 16:23:25 -0800 (PST)
Received: from minun.felixc.at ([2a01:4f9:6b:1cc4::2])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-5969dbd095dsm3708266e87.97.2025.11.23.16.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 16:23:25 -0800 (PST)
From: Asuna Yang <spriteovo@gmail.com>
X-Google-Original-From: Asuna Yang <SpriteOvO@gmail.com>
Date: Mon, 24 Nov 2025 01:23:22 +0100
Subject: [PATCH v4 2/4] rust: generate a fatal error if BINDGEN_TARGET is
 undefined
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251124-gcc-rust-v4-v4-2-4e06e07421ae@gmail.com>
References: <20251124-gcc-rust-v4-v4-0-4e06e07421ae@gmail.com>
In-Reply-To: <20251124-gcc-rust-v4-v4-0-4e06e07421ae@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Vivian Wang <wangruikang@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>, 
 Jason Montleon <jmontleo@redhat.com>, Conor Dooley <conor@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Asuna Yang <SpriteOvO@gmail.com>
X-Mailer: b4 0.14.3

Generate a friendly fatal error if the target triplet is undefined for
bindgen, rather than having the compiler generate obscure error messages
during the build stage.

This piece of code is copied from `scripts/Makefile.clang`.

Signed-off-by: Asuna Yang <SpriteOvO@gmail.com>
---
 scripts/Makefile.rust | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/Makefile.rust b/scripts/Makefile.rust
index 5c12b4b8c8b6..b219244cd051 100644
--- a/scripts/Makefile.rust
+++ b/scripts/Makefile.rust
@@ -6,4 +6,8 @@ BINDGEN_TARGET_loongarch	:= loongarch64-linux-gnusf
 BINDGEN_TARGET_um	:= $(BINDGEN_TARGET_$(SUBARCH))
 BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
 
+ifeq ($(BINDGEN_TARGET),)
+$(error add '--target=' option to scripts/Makefile.rust)
+else
 export BINDGEN_TARGET
+endif

-- 
2.51.1


