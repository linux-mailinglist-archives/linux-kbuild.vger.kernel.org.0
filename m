Return-Path: <linux-kbuild+bounces-712-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 87449841180
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Jan 2024 19:01:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D3E81F2422B
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Jan 2024 18:01:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EACA83F9F3;
	Mon, 29 Jan 2024 18:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BQOUHIJz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4446F76028
	for <linux-kbuild@vger.kernel.org>; Mon, 29 Jan 2024 18:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706551249; cv=none; b=DTPHjyjKaRRpJJGRLVp+Lyd2BfT0mS2L0jlRavVMEWfvVPD6e5hpxLoVE1ytw8GAPsF45lYVLK8Cl9Y/7ATccHqmhOLXMK6nIfnkF32MuGg+NG8z1MiZ0td7FHoCDrRPtLbF+fR9PvJiIW8Fk1jvo/6RG1jXmP2srk6JlaDnCas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706551249; c=relaxed/simple;
	bh=yH6x7koGVyqkzXPlS5DuuMQ7rErHxIAyUsPCshZXJqo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MctCPxCqQ42liZX3P3HxUpsi0DwWHaQRdDhdBYBJe2UxJq+dVptfziUPkoSmXeZ6y/aaMyuGp/UBDz58egStcLx3HwWYB53a1koqQyp9V3um+640M1/sLjSydYDfxVn8lSJxfkOPtmOLAgARafbxkFFbtBjVCCgR9Oa60zTg09Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BQOUHIJz; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d750660a0aso12214805ad.0
        for <linux-kbuild@vger.kernel.org>; Mon, 29 Jan 2024 10:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706551247; x=1707156047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O9sYK7z3WbbgkknvMvwfZX35RqRNyf5Py+2kBlCGv4k=;
        b=BQOUHIJzk7qIgxq0A48NuWzrXBkZnfWYkpwALRhYZJsy3S4r402LiU83b3Uw9iB+W6
         2fy8oiGgfNKqTNELeQr/9IPNBRKSCX8IIeqX4DQVBuGhnlr+VhJ8iuLrFyIJJpS/pbyj
         Uw2wIRhXe/dDzB+ZIvUMoJIxaEahmAo8HmTgE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706551247; x=1707156047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O9sYK7z3WbbgkknvMvwfZX35RqRNyf5Py+2kBlCGv4k=;
        b=gVxpnqOVNkRxKThTPZTs6sy6FwtMNeIUfQ1OFxJk1Ghw7ZZrKUCiTiDusk9yO3DN9z
         fwhYIhGPxkKc1jtc44tYNFuPpTt+FhdGnIzAPbVVSFOzkd8pIZnN6uNttZFb+CEKBe7R
         4QNKBn37LClZTn9AB3DBuq1u9QrhfSeOWmabg2VwrDTirmm/v4d4Jt+BaDGfNHRK6uPd
         wFSTL62Kjm7RG1oE3f0JOdfrWHgxrEyGalVyIPbjX18fi0ihan/iB5pII75e7XXZE8sf
         KHhgUVbH2Bc8ktdAB/r8h2WO3/XLVXKCMMFHd0TDGad3zn4Pu+iIN6LUMCB37Zdjodym
         EpdA==
X-Gm-Message-State: AOJu0YwgpGZlrDgD6E1GAesuJwfgUiv/MmVSZWzeJpmZrFfDFcs0ahQO
	SeglYgqxMxWRC+MPsWfzr664jUBh6BcDwLTLzVFyQa0rCaI9ULsngEIdaDMaIQ==
X-Google-Smtp-Source: AGHT+IEc+tDx6sfLTEL1mhumbCvDSbuCKsykyNGM2srfWvMprXBfegwjmTD5lvLJxAzPxS4f7WeABA==
X-Received: by 2002:a17:903:451:b0:1d9:1e1:76b3 with SMTP id iw17-20020a170903045100b001d901e176b3mr199139plb.107.1706551247632;
        Mon, 29 Jan 2024 10:00:47 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id l4-20020a170902d04400b001d8dd45b9b1sm2374739pll.134.2024.01.29.10.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 10:00:47 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Marco Elver <elver@google.com>
Cc: Kees Cook <keescook@chromium.org>,
	Fangrui Song <maskray@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev,
	Andrey Konovalov <andreyknvl@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH 1/6] ubsan: Use Clang's -fsanitize-trap=undefined option
Date: Mon, 29 Jan 2024 10:00:38 -0800
Message-Id: <20240129180046.3774731-1-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240129175033.work.813-kees@kernel.org>
References: <20240129175033.work.813-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1398; i=keescook@chromium.org;
 h=from:subject; bh=yH6x7koGVyqkzXPlS5DuuMQ7rErHxIAyUsPCshZXJqo=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlt+fKRyYbL1VJp1m0ZRn8657+TY/Q9I2OhsIfr
 Nhr+eEyD8qJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZbfnygAKCRCJcvTf3G3A
 JvvwD/4oBxFkh5fzUJffPCV7wy9Y6k2huiVfHjonoBRkDeyjaKqfQYTecCk/CL+c+TO65fhCT+q
 xqSs2LGuFyyj7eOZGVYhpL+fAeyXp00kJeJ9NO48Zit8cDCVOojomAjG68UBgx7SMDH9RrcGsCW
 zKM1fWgaWgs6y6q25ikHsKAQ7cGyV/ccKJlhd1//ttzhOufRHmHl1LFtqGGHwgaNA3VNKoFSbJ9
 Oj0pG0RrZWSc1cUZWHhw6X12fopRpJKdMPethlAGh8DSRUCH+Qp8S+c4Uvx5Kbflb28/q/w+1P/
 zUabY1h1VH0yC8NAe8xOBilIj5KXfjjkMAMF02LmZMDFPbVbAfTarNEBT3anpykg4TB6OjJUpeG
 JnnqzvSGbO9iveLeJWaN+9nR2qFV59NSmvyvLnIMvYf3heAJYgWyf1Ac10HNTUVuyPrvlLDm7f+
 rfpkI7Xd3lzR/l64/lRkqWcSDg+ZtSkQW+h1T6/5rzYkoxhC9BeJ5hl3PCuFtAgF1VmSVbnqkCE
 HVawUkwEyNpURWxmfTF7cmTDPpYe2V7SoUU+viFzi+mDZoSumju/sQWzFqG5usxniFDaa3H0Gse
 h84FxDEHMfFv3vs75+fQ00Ra4GKbQta90pHtfeZtrlf9zymnXZw60aQCN1CQRLFQL4eGd8FHP4d U4aVwGwI1l81C6w==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Clang changed the way it enables UBSan trapping mode. Update the Makefile
logic to discover it.

Suggested-by: Fangrui Song <maskray@google.com>
Link: https://lore.kernel.org/lkml/CAFP8O3JivZh+AAV7N90Nk7U2BHRNST6MRP0zHtfQ-Vj0m4+pDA@mail.gmail.com/
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nicolas Schier <nicolas@fjasle.eu>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: Bill Wendling <morbo@google.com>
Cc: Justin Stitt <justinstitt@google.com>
Cc: linux-kbuild@vger.kernel.org
Cc: llvm@lists.linux.dev
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 scripts/Makefile.ubsan | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.ubsan b/scripts/Makefile.ubsan
index 4749865c1b2c..7cf42231042b 100644
--- a/scripts/Makefile.ubsan
+++ b/scripts/Makefile.ubsan
@@ -10,6 +10,6 @@ ubsan-cflags-$(CONFIG_UBSAN_DIV_ZERO)		+= -fsanitize=integer-divide-by-zero
 ubsan-cflags-$(CONFIG_UBSAN_UNREACHABLE)	+= -fsanitize=unreachable
 ubsan-cflags-$(CONFIG_UBSAN_BOOL)		+= -fsanitize=bool
 ubsan-cflags-$(CONFIG_UBSAN_ENUM)		+= -fsanitize=enum
-ubsan-cflags-$(CONFIG_UBSAN_TRAP)		+= -fsanitize-undefined-trap-on-error
+ubsan-cflags-$(CONFIG_UBSAN_TRAP)		+= $(call cc-option,-fsanitize-trap=undefined,-fsanitize-undefined-trap-on-error)
 
 export CFLAGS_UBSAN := $(ubsan-cflags-y)
-- 
2.34.1


