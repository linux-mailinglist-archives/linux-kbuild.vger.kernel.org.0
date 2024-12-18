Return-Path: <linux-kbuild+bounces-5174-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F299F6934
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Dec 2024 15:59:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D02D5165972
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Dec 2024 14:59:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3674F1D45FC;
	Wed, 18 Dec 2024 14:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SHGuTMh9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F251C5CCF
	for <linux-kbuild@vger.kernel.org>; Wed, 18 Dec 2024 14:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734533942; cv=none; b=oNDBoXpKxE0rkC88gKI4Sw+7qYUzC907mmDKEcvdQNZo0Ucn3sknAPuIDP2KouNTz5OZbvqwF7HffMhv1KQar1BhJtI8A6Jmwqn0nlZ+DYf4Dp/ktl6sK9H0Cx8gP/kPM7Lz9lXfIKOjFUVIv0GE1Bm+q69cCHZE4rMr0dd6Bnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734533942; c=relaxed/simple;
	bh=xp4u6J4S2fo04lYMg0pHM5DJh83KxPqEi5yKcxypUdc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=K/b9KLw9r8CDcAgi2EztkIWhEUp4MXjFbtluTxEIt9NYefMg9z9Mid7fztI7pFNCgH/EY2UQ4bB4ohHmUbEGbULyMXvnTznM7gGiyqsgxy7j+bfhCJ1XZjP70X59Kr2Ea8O40kOYMDUlv7S4aF2auN9g9sRo8SjzmEYC84MJKJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SHGuTMh9; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43651b1ba8aso10082835e9.1
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Dec 2024 06:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734533939; x=1735138739; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cm3Ofc/SDirhT5KA+IaN9979CRz0zsIiKJmOw5DAz8Q=;
        b=SHGuTMh9SUUKVeOPrWCcvTXcQCWVYHHlbtcRuQK8dFfa4XuHQqfT8e+Vj4WQ+WC2cj
         p1Y+YFQOPf1CGQL5qZljmE7a+0qraCl1Vc3mSJC6HK0gD4aX71olNNUCgE0fDl4ROVn8
         dRDlwXhpsNnxA6bAp3PgQM6RPA10vjaQXkK+SE8MloxcWzz/Xlm61ER/aWaDQ6rhJum+
         PH1jzsRJrrGcP/6sq+VVdkKxSNc9+6JPiFWZUG61n9r6DBOuaV/hQv7lF+FJ+MH5/jkR
         /neAXgiB/Q5QWxMair24kZjvyXgzEfdBAzIsC5Yn1wPvBvXgrPl/Exxnay6Xju5HnfxK
         tAKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734533939; x=1735138739;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cm3Ofc/SDirhT5KA+IaN9979CRz0zsIiKJmOw5DAz8Q=;
        b=P2NmDt3wKYXgEEDWPhVO5JkN886xg5//gHM2tvEPisvifj9wK8AQTvWRCTHQ+AqaAu
         Bw7BW5XKqJb/qflgkgFSvhsljK/DAT0tq/7nDOg+Bz6EPbjm5S9iquIoWbrVGGapKI24
         s0Kowg2mBLSh73I2EiDWIIqxwjvnvbVRDNL5CJ0WkYHOThvRF+JFRE9qslYH3l8iq4TO
         hqm0N6359tPW38ilqImlRMprZTd/iV4NGpqSHEZ4o4v7qaYKVjsNbxAQNT3eTCNZ/1g/
         JVXg5P0skakBiMey1KfAHeZO59aMmA351FhghfgeXNjplFAFUjo2V3UzbBufpb8mpScX
         URgg==
X-Forwarded-Encrypted: i=1; AJvYcCVgsIxakLNqHzWZBuSLgylI5idIhcOdZG72DNiS5Y8dG7DX67SHs/DM0hMLfsvpOWquN9DxE4KT7h7HNcc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd5FF/6oyI+hIYxXvjsH30hqpOnT10eYpF7I91TX8dCdlNZnk7
	eup1rW7cE29+JwBlC1bBBhTnB3PL/Akbpw3wqJC0YgmXgnQ2LW/p6qlsJQ7lLR51kei0xIM8WlV
	0HnQiZJTdtg==
X-Google-Smtp-Source: AGHT+IGeD09j9800wD0MLOMW6LkxU2A3V3S9mmxN6q3XAT1WFpRqsSJyZEx604jHX6pIVdCbJLRGw2uDmGJx3w==
X-Received: from wmbha8.prod.google.com ([2002:a05:600c:8608:b0:434:f801:bf67])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:190f:b0:435:306:e5e0 with SMTP id 5b1f17b1804b1-436553e9caemr23272605e9.23.1734533938865;
 Wed, 18 Dec 2024 06:58:58 -0800 (PST)
Date: Wed, 18 Dec 2024 14:58:54 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAC7jYmcC/3XMQQ6CMBCF4auQWVtDiwbqynsYFqWdwhhkSNsQD
 endrexd/i953w4RA2GEW7VDwI0i8VJCnSqwk1lGFORKg6rVRSrZCB6eiXkWMQWySdhBm9q0V9l ohHJaA3p6H+CjLz1RTBw+h7/J3/qX2qSohXdN13ntdCv9fWQeZzxbfkGfc/4CUX1Ucq0AAAA=
X-Change-Id: 20241213-objtool-strict-cb9a0a75139e
X-Mailer: b4 0.15-dev
Message-ID: <20241218-objtool-strict-v2-0-a5297c961434@google.com>
Subject: [PATCH v2 0/2] objtool: Add option to fail build on vmlinux warnings
From: Brendan Jackman <jackmanb@google.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Brendan Jackman <jackmanb@google.com>
Content-Type: text/plain; charset="utf-8"

This adds an option to objtool to exit with an error when it enounters
warnings.

Then, it adds a config to enable that flag. This enables you to fail
the build e.g. when noinstr is violated.

Signed-off-by: Brendan Jackman <jackmanb@google.com>
---
Changes in v2:
- Renamed flag/config to -Werror/CONFIG_*_WERROR
- Applied to all objool runs instead of just vmlinux.
- Link to v1: https://lore.kernel.org/r/20241213-objtool-strict-v1-0-fd388f9d971f@google.com

---
Brendan Jackman (2):
      objtool: Add --Werror
      kbuild: Add option to fail build on vmlinux objtool issues

 lib/Kconfig.debug                       | 10 ++++++++++
 scripts/Makefile.lib                    |  1 +
 tools/objtool/builtin-check.c           |  6 ++++++
 tools/objtool/check.c                   |  7 ++-----
 tools/objtool/include/objtool/builtin.h |  1 +
 5 files changed, 20 insertions(+), 5 deletions(-)
---
base-commit: f932fb9b40749d1c9a539d89bb3e288c077aafe5
change-id: 20241213-objtool-strict-cb9a0a75139e

Best regards,
-- 
Brendan Jackman <jackmanb@google.com>


