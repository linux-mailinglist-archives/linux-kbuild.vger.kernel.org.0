Return-Path: <linux-kbuild+bounces-5708-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97165A2FFF5
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Feb 2025 02:12:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D43E37A1530
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Feb 2025 01:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEAD64206B;
	Tue, 11 Feb 2025 01:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="OdWpWA0T"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-io1-f99.google.com (mail-io1-f99.google.com [209.85.166.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2960C1531E3
	for <linux-kbuild@vger.kernel.org>; Tue, 11 Feb 2025 01:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739236322; cv=none; b=c6cpBYaxTFj7YJG1LjW/LRvAwKviq/ErtXh11zMZ3/f2EFoW2vGj8qRJGwKbhZkO6Foph0IZxjzIUOXPjvQJgDC1c8c9BXNlFkflYHilIbdcQU18YPz/8EYlKAH74Q6tFCJk86tU2aW/ijq+j2EMn/QxjWmzRcq0ptSWGloy5lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739236322; c=relaxed/simple;
	bh=g/noERQDq7d3U6Ma4Fn7xReDrj4YGnz4ZQGgA10y69c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XDU6AIcYfLCP+PFFZj9NzefCofbfT1EcS/r8vEibIa4n+wGuoCJ5Ahb3d+ETB6dJnwfDz7UHdznvWJYuFXOdNNjNej7MzL9bZ+ba3/Zaeb2u3TpHvuzDyLrC32SztIpFo4ZK9MC4HuGO7K7oKq+LEmFTxulPF0cwq2mwIkOw0sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=OdWpWA0T; arc=none smtp.client-ip=209.85.166.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Received: by mail-io1-f99.google.com with SMTP id ca18e2360f4ac-85517db52a2so46352939f.3
        for <linux-kbuild@vger.kernel.org>; Mon, 10 Feb 2025 17:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1739236320; x=1739841120; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O70H49KnO/iTJGFotW0mEj8/jWZEIV28fdVh/IR/6/E=;
        b=OdWpWA0TlIBQOIFQJBwDRjvznfmZmhOiNK3KOxyyopNB+GFPCPAfGDUU3tjPhkN1/8
         GvMacJmHYGVuNPJ9zOmeo6gKwjeBudzAw1HtxVa/fQkEAyZaLMxv37wNNV7HfBACqqGT
         Tabi1TlEA48vuLyb9qk2OTJtIi+4M/DGa4Gdr1n7vv6RFHKAHulyUOrgKraCIIxQLW1C
         oTZ7bDhsSKExw63f0WjjKmtToudR/BdVnnLtaeVe5g517WWg8IwhlTcRAzA3MU6m/3IG
         c5rUFw57ewO6hf8Iio7ZIX367KET+z+jqmcSGseH0g5cZCcG0i4cIz92YTE+/KoTPV01
         9y1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739236320; x=1739841120;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O70H49KnO/iTJGFotW0mEj8/jWZEIV28fdVh/IR/6/E=;
        b=dBJJ3pSz0iR6BzsOxTQO3fznm8RodWVV7nB2VCLXMc4Igtx6QiwmcF1ZFiglxsoogF
         i7In4h4APBW/ge5/wVtvVik2cjyDKRGdpXhMUYHSwDUW3IfxecY6FiENcHcmQNDnDL7P
         JsvtFnAJkv3nU5PjkWZLHVoaIMXyku2nyOH2rUnGzf/L0ugHH+gZ4N57hQoVnS41rdOK
         5WEQu/ScVt+A3RZLRrXiA3wvVjws+ze1sPBgsLTKpJJsaPBkHnTHaM7nImIK5Th7Ppp1
         GsGoxt1xIBe3iQRKd7FU8xF1+jG6JzNb/5ebPSX6gyy6kA1gGF2hTnE9cHT9bb8llXZL
         QM8A==
X-Forwarded-Encrypted: i=1; AJvYcCVTog+0GOZ+lsd0KBEXvblubPaciFBmgXHr8e1GbxSIjwlv89q8dl7/pLFjQS/Uuc0foqftDCFZBx0JchU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg5RIRVxj7XCCgaB9dj2ci+A9VLNG8F3Qj9A8CizPZLmTo+5Sk
	wL9C3AVHLavZQ8zgcw6mZ9kESHUcQ6Nr+ryD06YaZ3zp5n5GREWCbFYX1oSsU3ZlW0JvImOPMXt
	TJix4c7A1oa3nrf55W36GcbLv9/61t1Y8
X-Gm-Gg: ASbGnctLRTMZ1hB/TYcj2XrASd7N9d8ckzyUe0cE16lSHY+FIp6N+1LPSSIRNcEJFQH
	N6VtyDsReRcwV2t088Bjjwfrh3MgCZJcYFAcvJqrZ4R9OlO8hopWCoSTWwCpHpHN5fnOUP6AYrC
	EI91oP6sSBOoyK2LDtYdGcY+FziWLtfe7s/FnA10Cs50OIXGyn2GsaSPNkQ8qDwuKIFWHeaGR0F
	pRfVhH/Kpr4QDEsYm/QHByOEGHfPFBzMPPxa5PX/FAvOaXBPAl17B5SSOyEAstOaEc2WTbNscf6
	zu4O+m5s08tvC8D9agDUjNh//RkvtoHmOuI5EWg=
X-Google-Smtp-Source: AGHT+IG6O+AN1U3sZMcatB1hM1FGij2aDZGaRc7jMjvTAiqUW4G2q47Va8jeHyuKzb4Oif7zx7YE/+Zv23hH
X-Received: by 2002:a05:6602:164e:b0:855:3ed8:ee82 with SMTP id ca18e2360f4ac-8553ed9b680mr338725539f.7.1739236320124;
        Mon, 10 Feb 2025 17:12:00 -0800 (PST)
Received: from c7-smtp-2023.dev.purestorage.com ([208.88.159.129])
        by smtp-relay.gmail.com with ESMTPS id ca18e2360f4ac-8552f1ff0b2sm13543939f.12.2025.02.10.17.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 17:12:00 -0800 (PST)
X-Relaying-Domain: purestorage.com
Received: from dev-ushankar.dev.purestorage.com (dev-ushankar.dev.purestorage.com [10.7.70.36])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 6539D3404FD;
	Mon, 10 Feb 2025 18:11:58 -0700 (MST)
Received: by dev-ushankar.dev.purestorage.com (Postfix, from userid 1557716368)
	id 66EABE40ECA; Mon, 10 Feb 2025 18:11:58 -0700 (MST)
From: Uday Shankar <ushankar@purestorage.com>
Date: Mon, 10 Feb 2025 18:11:54 -0700
Subject: [PATCH 1/2] scripts: make python shebangs specific about desired
 version
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-debuginfo-v1-1-368feb58292a@purestorage.com>
References: <20250210-debuginfo-v1-0-368feb58292a@purestorage.com>
In-Reply-To: <20250210-debuginfo-v1-0-368feb58292a@purestorage.com>
To: Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
Cc: linux-trace-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 Uday Shankar <ushankar@purestorage.com>
X-Mailer: b4 0.14.2

The RPM packaging tools like to make sure that all packaged python
scripts have version-unambiguous shebangs. Be more specific about the
desired python version in a couple of places to avoid having to disable
these checks in make rpm-pkg.

Signed-off-by: Uday Shankar <ushankar@purestorage.com>
---
 scripts/show_delta                | 2 +-
 scripts/tracing/draw_functrace.py | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/show_delta b/scripts/show_delta
index 291ad65e30894645205101e3f31f2e38e90e172e..3755b6c6e55704ef08c2483ab44793adab78f76c 100755
--- a/scripts/show_delta
+++ b/scripts/show_delta
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 # SPDX-License-Identifier: GPL-2.0-only
 #
 # show_deltas: Read list of printk messages instrumented with
diff --git a/scripts/tracing/draw_functrace.py b/scripts/tracing/draw_functrace.py
index 42fa8730094166b5883aaa92b0e2c32e0268b120..97594b65f8ce9b1ade7f08b6b95eee6a1383fec7 100755
--- a/scripts/tracing/draw_functrace.py
+++ b/scripts/tracing/draw_functrace.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 # SPDX-License-Identifier: GPL-2.0-only
 
 """

-- 
2.34.1


