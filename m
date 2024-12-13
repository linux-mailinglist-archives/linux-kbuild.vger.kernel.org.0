Return-Path: <linux-kbuild+bounces-5108-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3F79F0B24
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Dec 2024 12:32:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DA4F16786D
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Dec 2024 11:31:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C51F1DEFE6;
	Fri, 13 Dec 2024 11:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RVgj51vX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875C41DED69
	for <linux-kbuild@vger.kernel.org>; Fri, 13 Dec 2024 11:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734089508; cv=none; b=hWDXxrc25eB2QPcTlZTbsYJKxBA7YzL9KEJcmgFAyMXJKXoA+6eTWlZltPbmRokZXyfEbTxmd8nxW6Ojat1+rlHF5E4QM+pplCcl9x+CJwZBerDElA4FkqPKXDRiJaYkYOJSfavaIlVGJMSlL/iBAFhzmuJq7b34XTzIR58UApQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734089508; c=relaxed/simple;
	bh=W5a6cB3UwDzqNZzNyudbL0vrce+OJhsWIXfqpLMWLp4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=FY8RDVmWbJUJhmt3CIZtHiCWWfVIAhZOGFih507xLCQNVqAGsbeRFLCAtBo2Vc9y2rEh6qCEpdcAYmhvx3jl0rNzAZKwMFm6ERc+Ek3fOD/u5QvTSTj7HyZ5vcUnGIn9U6BqAYeGbdM3BbWX7lhyjFhDO2e6S11+UlKC5L/G59Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RVgj51vX; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-436219070b4so9599175e9.1
        for <linux-kbuild@vger.kernel.org>; Fri, 13 Dec 2024 03:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734089505; x=1734694305; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YYg3mLaT+yQeqG6suEsFLVIzOR+x8TvXmVVEyODmCqI=;
        b=RVgj51vX+BEe/H6ue0PjgZxpTsmN5DjjorSXFEoJxubXrU5RDp9VCZBqe4r+ImguQB
         56yejCXvfh77Z9yQY6NDsPzKS+xjLPPiLi1b7LFMDtrYIrWJuQC4/48IdNhZI/ETdvJC
         R5KMS7DLSVyD8NLuvNaJuCUIJ4XwavWE5mXwTgJbAHyZef91SuvNLW0XO4AblKqd7QKr
         nTd2RGC2oK5DqxXij2VlS8Vv8MRr2j2aD2peUvtJoEk0Ptlw1QAZHhh8ReKPDralAOjB
         PTPPGG4JFO8vYSf10G/djepglVQOggzLjj+ZYCzo6pZZtwAiCLJmkTCLSyW9hhTooQSk
         b7ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734089505; x=1734694305;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YYg3mLaT+yQeqG6suEsFLVIzOR+x8TvXmVVEyODmCqI=;
        b=s/h8pZVHmBsasqMzjaPZH3CVhcbSOP8LZAnrYq0gFVGWX9l5kASqXPCP06Gy6L7OlZ
         e/uZ6QQ00aghQTVVizMYxXl3jNpgRT2199GRxBqDUptC2u4Lgkwm6EYF3oFUPdh8NJ4H
         qU4ty+JTbsXTtA6R1+qpBppEPBXWYmf+qNez8DW8azJCi1v1tyZCpqFd+mxQo8Z4nvKr
         sGochS1LcRBkhdk++FAWLKNnhIZbBoavjDXIuuB+7DYped6ZN7EJQfOfBrGendIyZO+A
         CXDAy2MErp/k5wMIxeTR+o/rpAALdWp68J0MyXrr31pEfbdZ2B9HC9dvrAUpuGKNKskc
         wWEw==
X-Forwarded-Encrypted: i=1; AJvYcCVwzSPL3Cg7Dy8bhT14oAbkqo7AkVPn7aHbmsnX5Gg7Hx/OLo5wVf+fcgIFsfVi2DAE33uWu7WIvSehb0g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIi8MYfbZOVtVezYqegVc5wBHsL4KgCUpoUeoHjzJxNWS0ssIy
	oc1du5GoeKHpqy6FIy4eWc6Kpz9NNacxS5GXyFOMVn0wMAwGkDtpHKFQJxLni9pjDOnyI8WN91o
	RgGc/USPJ4w==
X-Google-Smtp-Source: AGHT+IEjuiLNGvyLP68ZBdiqZu95bXV2VW9PMTOSrerlRMjeGJtcFoJW1KVAmnQA4sURFOaBmw4QHXvsK+priQ==
X-Received: from wmbdx22.prod.google.com ([2002:a05:600c:63d6:b0:436:3ea:c491])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:378f:b0:436:1b7a:c0b4 with SMTP id 5b1f17b1804b1-4362aa1475cmr15538375e9.1.1734089505114;
 Fri, 13 Dec 2024 03:31:45 -0800 (PST)
Date: Fri, 13 Dec 2024 11:31:29 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABEbXGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDI0Nj3fykrJL8/Bzd4pKizOQS3eQky0SDRHNTQ2PLVCWgpoKi1LTMCrC B0bG1tQD+88SeYAAAAA==
X-Change-Id: 20241213-objtool-strict-cb9a0a75139e
X-Mailer: b4 0.15-dev
Message-ID: <20241213-objtool-strict-v1-0-fd388f9d971f@google.com>
Subject: [PATCH 0/2] objtool: Add option to fail build on vmlinux warnings
From: Brendan Jackman <jackmanb@google.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Brendan Jackman <jackmanb@google.com>
Content-Type: text/plain; charset="utf-8"

This adds an option to objtool to exit with an error when it enounters
warnings.

Then, it adds a config to enable that flag on vmlinux. This enables you
to fail the build e.g. when noinstr is violated.

Signed-off-by: Brendan Jackman <jackmanb@google.com>
---
Brendan Jackman (2):
      objtool: Add --fail-on-warn
      kbuild: Add option to fail build on vmlinux objtool issues

 lib/Kconfig.debug                       | 11 +++++++++++
 scripts/Makefile.vmlinux_o              |  1 +
 tools/objtool/builtin-check.c           |  6 ++++++
 tools/objtool/check.c                   |  7 ++-----
 tools/objtool/include/objtool/builtin.h |  1 +
 5 files changed, 21 insertions(+), 5 deletions(-)
---
base-commit: f932fb9b40749d1c9a539d89bb3e288c077aafe5
change-id: 20241213-objtool-strict-cb9a0a75139e

Best regards,
-- 
Brendan Jackman <jackmanb@google.com>


