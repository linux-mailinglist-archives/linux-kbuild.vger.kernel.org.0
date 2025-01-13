Return-Path: <linux-kbuild+bounces-5444-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F2192A0B902
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jan 2025 15:05:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 15E6A16273B
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jan 2025 14:05:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37AF7C8C5;
	Mon, 13 Jan 2025 14:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YzBXd5QE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D95E23A596
	for <linux-kbuild@vger.kernel.org>; Mon, 13 Jan 2025 14:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736777121; cv=none; b=bTNWqeiIiRg1NJkuockTSLEfylvoUYjh7lUGYJw/o72m9+b/P0rvvAldmmOvMf0I9Dy5mSXV8De5ZzJ7LEE+4FaXUYN/gClSbDwMeWHDu5CkQRTKfabKKySBmhhGTq6mjgYDpLXhzYRy8Dxw8+Q9GfiQ/mwI4pq9XBTjlmUdsZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736777121; c=relaxed/simple;
	bh=gO/8J/cQRXjcuDP1EJsE6pnQtB2Qy5fCBCr+iI2Sk5c=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=AYWYVmi9PKtZAbSMwS7pLdiJTt5htLpOXWpGiiHJDKUI9EeStwj9uC/Z9a0Z5VUekWFEp/X7YfarmprHs0BiRuMkqJCN0GJ+1lz1Zg99HzsfF2ZJxR1h3fbJxk3ZJYoW+4HNu56IxryEtrThOwffAkPPDTvpKHnVpvP2+43KJRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YzBXd5QE; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-436289a570eso8836755e9.0
        for <linux-kbuild@vger.kernel.org>; Mon, 13 Jan 2025 06:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736777118; x=1737381918; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Dfo4oX/BMGDbvIJtZ76PsfXRgJUXY5vfxcXUvy8HGnQ=;
        b=YzBXd5QEgvwFJLTiUKNaUDa/erpngUMXc9EJGNxF2dItJoRV24Ml1p/fBCZ5MJcanf
         Rjeg8FibJb4yAcczSLxyGlg8vbyxf5M5/gNuC9anVXHXz7FfPytPbUusYclV6d+A8Cei
         lMvtaYpkLv8UX+CkQvl1RnqTIvFfh58W3JdwzvDmPoFiz4/dI1oVW6J5o1YSMCMDY/Tt
         5HSFQRVgkI+bKBQnuMkjqcXFFMiKTFkCX1XnwX66f20yMt0jMFXprYMu45IhHQGKWjIb
         3mH58OZLDbH1c3wdE3VdHyYJoNGL3GCTgPGw0N047NvIiSo8bXLyhcblgxMtac1xMJOU
         aWZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736777118; x=1737381918;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dfo4oX/BMGDbvIJtZ76PsfXRgJUXY5vfxcXUvy8HGnQ=;
        b=HRPLJl+hhpLvCsedOHIbNsKtLxCbOl3JamWUETQ52e4+U7fpNzGTFKVrVt5kisR2w0
         TukCE56PRFUEl6WFmdGnoukShRdLi5BWhdypHLxAwx9k0sJjHrkzqpPhfMIPDsE2/YBp
         KXzdpGJz+fwwJ9sn7TS5bd2ZVJrSMDzhibKTw/vndxdmRYLB9oHkJCTDdMwLeK8VyBjk
         lJtGs+Chh/7lTXpS+RjHQAUnpcuP350kc4PvZNw3bo+eU0BoW6CqHT24byL+QlPr2B5V
         NNYrp4s5VBfKRJDNoBcI9v3xHgWZrhlbjQjk/Jzh0go24LHKUSk2+8I5a8VYnv6mHn3u
         xzmg==
X-Forwarded-Encrypted: i=1; AJvYcCWVOYjXhUgLNxbE76NBwDw4nAd2Qi6s/TlJkJ+rhDUE2MkurIjoNKGF4Ei8ZtVhWoumreCJorvi9hxGOnw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOOtDM92TFV+ggdSON017egfPjaBA4e7z9oooKD/wwC4o4385t
	hIxqpwmbyaWj7wDZoSLNyrgA3zQgnSxgA3JgLkdsNZ4gBmybYMHmaK6dvGh1ndDkdL6jE/uRk0o
	heGXvl86Rog==
X-Google-Smtp-Source: AGHT+IGOoECf3G0M0NKp++Pn4xaXGqawpm8taxtYJwFW0LtWotR6u137j1I6Dp8watb54Cge9WWyWJ04Qrr8Jw==
X-Received: from wmqe1.prod.google.com ([2002:a05:600c:4e41:b0:434:a050:ddcf])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f47:b0:431:542d:2599 with SMTP id 5b1f17b1804b1-436e26e1f6dmr172942555e9.22.1736777117897;
 Mon, 13 Jan 2025 06:05:17 -0800 (PST)
Date: Mon, 13 Jan 2025 14:05:14 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJodhWcC/3XMQQ6CMBCF4auQrq2hLQh15T2Mi1KmMEYZ0zaNh
 nB3CyuNcfle8v0zC+ARAjsWM/OQMCBNeahdwexopgE49nkzWcpKSKE4dddIdOMherSR206b0jS
 1UBpYRg8PDp9b8HzJe8QQyb+2fhLr+zeVBC+561XbOt3rRrjTQDTcYG/pztZWkp++/fEye1NL3 Vh9EJWqvvyyLG+yDzQG7QAAAA==
X-Change-Id: 20241213-objtool-strict-cb9a0a75139e
X-Mailer: b4 0.15-dev
Message-ID: <20250113-objtool-strict-v3-0-8b51f94957fb@google.com>
Subject: [PATCH v3 0/2] objtool: Add option to fail build on vmlinux warnings
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

When that happens, you also get a more verbose log, for example when
failing noisntr validation it dumps disassembly of the offending code.

Signed-off-by: Brendan Jackman <jackmanb@google.com>
---
Changes in v3:
- Added --verbose to objtool args (equivalent to OBJTOOL_VERBOSE=1, which
  Josh Poimboeuf suggested).
- Link to v2: https://lore.kernel.org/r/20241218-objtool-strict-v2-0-a5297c961434@google.com

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
base-commit: 5bc55a333a2f7316b58edc7573e8e893f7acb532
change-id: 20241213-objtool-strict-cb9a0a75139e

Best regards,
-- 
Brendan Jackman <jackmanb@google.com>


