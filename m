Return-Path: <linux-kbuild+bounces-905-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4279A852780
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Feb 2024 03:28:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC7361F22E6E
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Feb 2024 02:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBC202F2F;
	Tue, 13 Feb 2024 02:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hrV6v3ow"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D5317CE;
	Tue, 13 Feb 2024 02:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707791330; cv=none; b=tcsqYTlwsi6Z24h5kudlEtacEI8P5EcxiZC2YXDWWCiV0gJYZBVA7CxNweBfm5RY1t9gq2yZzde7CFKjUOOkdIcIXxP35G15S2DKgoS/JnPkm8AvtFNM8PLGzxDMd0zftvsFutmvOYmLBXIv+f6oKF76gMQIn9wBk9brLicnV8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707791330; c=relaxed/simple;
	bh=lS7jLHLrY8Ciy5hAj58zcA0N7SPeX/1bhP9tKSiltgo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CP+y2Qu2cdYaMS2OAePFGJITg7FzG+be8HKhacjPJPiQ4S5oHod0SF3sJjCXFRi/C+/Mat4q+XxBEOj42hLLpC6q51Y7UJSfmDQvtiXcmznrDWcwzxIhKhvFD1XM5iwZMmXWOl3VpYflpjDbkmCMRBBUUO1dl2Z7yv58ImyFWuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hrV6v3ow; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-2185d368211so2524769fac.3;
        Mon, 12 Feb 2024 18:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707791328; x=1708396128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f/OmXCx8g8elO8SoedySQ4pLKPgoxvCMvmMdcFHXu4s=;
        b=hrV6v3owivT9zE9Vy0+OpBJhp+CuLxms/yFLApzdGgkH44mhl7i9JNNpKhTnkzS0jE
         XbbrvDwq6LR8ASsdyjbWfQVb13jSspU6SqpUA82UZFhM6TPZ16R38/rb3fmKh1H9rMK/
         X2S5JqzqbQdCcMG2UP8fNUaneAGe/bQT/Jl1241tBXrTbFI1/6UDxH/aCCJmxsuW4OHm
         SFSc++bIiTUnUvVCEbcz0jWlbIfMYrR0//v8LJCGqZqGE3JiCZe5Q/vQ9v3nH5zbqzNC
         tPhv7ZkzXvLeUDL0am/oE0R4AUDKkoEaBwJy+nPqUidCEuaOx83O5IiNQLjOMYgsTBCH
         1Vzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707791328; x=1708396128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f/OmXCx8g8elO8SoedySQ4pLKPgoxvCMvmMdcFHXu4s=;
        b=KCUWIrdbzRtDx7CrG5LglklocQlicHqlmrLmwbgIK3CcCZFeUmWoAY0WQljAtiICvH
         PZE9YBbKND7p4jxYLVcse8Y9Aq5JM9oauMUIT9+f7Zgqyeu5NiCBb706U8ZpjUUQHwYo
         asDGLTIjoorkMX1epmALXKHGn/Qtc2Hmaga18FXgPyP46b40afj12fgeNNuuu9xdSF/5
         aIjDRmjIg1UcfxJjTZhnoROdSFv82c9aC+vnWOBUnaKqtFO4KC6lpGGR5UVrBQHpgaoo
         vLcNDKYEK+46vgZTNKYXY7Mv7yWmz+t0ZRKvKDQ1Z52ChciyV7+XB+vbPJwARTuJS6Of
         lc7w==
X-Gm-Message-State: AOJu0Yyo6YDLVBFfrtLFQafP0psdZob2BAR1a4j6nXGjX1pHoRux0dId
	+UsyDcEIi8gGF3VlWM9p2rg5rdef0+RyoJOZ+SR044WXIVXA+gdx
X-Google-Smtp-Source: AGHT+IFYE7I8Dz7ov5LfZYYYrsOfOjyDP4rG/WT2wczaUt7Dgw8hcpzrYmz6aIurdM+JQ9/CSsvUjg==
X-Received: by 2002:a05:6871:29e:b0:219:92b2:d2cf with SMTP id i30-20020a056871029e00b0021992b2d2cfmr10616708oae.27.1707791328369;
        Mon, 12 Feb 2024 18:28:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV5Y0UHdG6DgUZwiOuH/Mdr3BAT4veNANsUUPQjuqvFL+K8mT+mGuzm6hZA1vBJ9qfWluwPSx6wZORKT9+4/9mdoZnmvScFYsocx+msYPh2yBq/VS8/JhtZnHC1GMGSLoD+Lu8sKjudVeNVZ50GwVZLQV2MWzhUhHyN/eFEe0us562vuywl5GTgR3V0/jGsn7Tax6wAyGtlLsK26HOAp83q1wfDW8dGu3KLL+OY8XLhPIUJZyJi/zlQ6/uR0VdXJabCNCJzz0mR09KFFAXrHfuzFxvF7vUa9IOGF+l9kd0jRXnJZMD63iyI7j7YV22Dcl9GCxYGTK/9wd2njqdB6hfWFK58gA0jtbP0PmUfk5CHSdbLjhKqcyjxStNnSZUmA73YhK/sOUwH/2g1VLrRLdAugJApLg==
Received: from my-computer.uh.edu ([129.7.0.170])
        by smtp.googlemail.com with ESMTPSA id z9-20020a056870514900b002198ca39e99sm1659648oak.17.2024.02.12.18.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 18:28:48 -0800 (PST)
From: Andrew Ballance <andrewjballance@gmail.com>
To: masahiroy@kernel.org
Cc: andrewjballance@gmail.com,
	justinstitt@google.com,
	linux-kbuild@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	morbo@google.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	nicolas@fjasle.eu,
	skhan@linuxfoundation.org
Subject: [PATCH v2] gen_compile_commands: fix invalid escape sequence warning
Date: Mon, 12 Feb 2024 20:25:52 -0600
Message-ID: <20240213022552.754830-1-andrewjballance@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAK7LNARaW1V5X79BFW5_YTKY+n+OSp+_ACpRxpiw+VOJ+2hf=g@mail.gmail.com>
References: <CAK7LNARaW1V5X79BFW5_YTKY+n+OSp+_ACpRxpiw+VOJ+2hf=g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

with python 12.1 '\#' results in this warning
    SyntaxWarning: invalid escape sequence '\#'

Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
---
 scripts/clang-tools/gen_compile_commands.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-tools/gen_compile_commands.py
index 5dea4479240b..93f64095fda9 100755
--- a/scripts/clang-tools/gen_compile_commands.py
+++ b/scripts/clang-tools/gen_compile_commands.py
@@ -170,7 +170,7 @@ def process_line(root_directory, command_prefix, file_path):
     # escape the pound sign '#', either as '\#' or '$(pound)' (depending on the
     # kernel version). The compile_commands.json file is not interepreted
     # by Make, so this code replaces the escaped version with '#'.
-    prefix = command_prefix.replace('\#', '#').replace('$(pound)', '#')
+    prefix = command_prefix.replace('\\#', '#').replace('$(pound)', '#')
 
     # Return the canonical path, eliminating any symbolic links encountered in the path.
     abs_path = os.path.realpath(os.path.join(root_directory, file_path))
-- 
2.43.0


