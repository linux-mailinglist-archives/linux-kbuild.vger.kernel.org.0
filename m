Return-Path: <linux-kbuild+bounces-2302-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B240891EBD2
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Jul 2024 02:32:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70703283D4C
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Jul 2024 00:32:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 246573C38;
	Tue,  2 Jul 2024 00:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TadceGcS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610C7383
	for <linux-kbuild@vger.kernel.org>; Tue,  2 Jul 2024 00:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719880316; cv=none; b=W+CCBV930YbVlKpcu8Vbfo14hNQNpBQP7aqzLwh2YCm4KTEWwbwU9kS45avjsPXhG33dXkdECiKQ5xcdSDXcgW+g6A11QJn8ybSXMDCBFdCVWYVhV0D0ggZeR4Dd0IZeuHQA+kODXtkuKqL8IKRsnI3IM/NdcHXvcqqCkmC/fO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719880316; c=relaxed/simple;
	bh=qLQf0CVR5JUqHpKxNCt8TQc9aEbcxmuLQam92qG1+68=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WWIjBt9qD4eZ7GAc+OMH6SoR3gIc1x4Bltpwr47pgfOeTvSM3DMr+QIyRJQPMiS5m+fT8bOt5CIihl5ZuOKDGUfJe11MD7xc6r1tJUHmvDgxFWsiCTT0hh2QtfUuPoqMN+8V/X5R6sDDZyJig7B5AwZgP1zblyrILm8WKsx54V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TadceGcS; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-701ef03185fso2064790a34.0
        for <linux-kbuild@vger.kernel.org>; Mon, 01 Jul 2024 17:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1719880312; x=1720485112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sdizYQHOdkDm7056vUMEU6wUps2ltp149WdDOrN6TkY=;
        b=TadceGcSiuj1MosBPFeqwUDUBSgelhOH0qTU1DJImx25L705K6wYdbFH4iGc7Vw6LF
         tVmxHiD0v7EaqJln7D0G1Jt0y6OXgV7I/Ox76IGL+B5rrL+OPsVf1QrxLmQRPjrur3iA
         tzbiOda9tvmJgJzdpvUU5wyIjbkvn5A7xcD4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719880312; x=1720485112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sdizYQHOdkDm7056vUMEU6wUps2ltp149WdDOrN6TkY=;
        b=iwop4zPYPd896UcYId3rNpIkrm0b9rqIRzEdvL5mmI79hgOnychM5akzMY9wBgIUXq
         evvMmpMW4XoiGwHO5Ir5BvySDjXs3mNDWcQy/A5z788U0WxQXEUY/tb1+2iQm0jPCCfU
         t8/hQnDCnRX2PZcg8YEHgJXHyCa11gfsBMlZWnYgfuQA0zpNn+Syg3SeIReM+Kzn+e3R
         jkV8nOe1FgasGp6+v/QjrNJSDJUYVIZ0VnAE/cbDc8US0urIBVZda6ib1P6px+iSweb8
         eep9elPryWdXggWIc+U+v7NfaTIG2XoCTK+IpaIpHrbzjZHmQw2QvsnhT6EWovAXT9ho
         xDxg==
X-Forwarded-Encrypted: i=1; AJvYcCWJuf7fvl5BjrH43nUIVdH5quJzEAXPdhj3SHZmwWUxF5ER/xuGEHJc4YRnpCM2FZS/q35aPKF09Nz+oXttRZUcFa4YI5cjiU9f690D
X-Gm-Message-State: AOJu0YwbtVbPRUoKJDKD2jWi/xyfOjbb2yKHAmG8qsTRrvzKiDPn8RYP
	dcCuHFHyk1M91WBGlI4rPMiBI6LCrqjhsJWqgiVhDmmavUoV1u4h/H1xCJdjwg==
X-Google-Smtp-Source: AGHT+IFm95zOi+dbh9XAZw0ozUTy2kx3MdibUvrnQRCXXUdROROISk/reLFRPr0QMNLQb7xYnBFuEg==
X-Received: by 2002:a05:6870:b155:b0:23c:bc3a:6ccb with SMTP id 586e51a60fabf-25db33bc10emr7113651fac.19.1719880312512;
        Mon, 01 Jul 2024 17:31:52 -0700 (PDT)
Received: from localhost ([2620:15c:9d:2:32ea:b45d:f22f:94c0])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-70802568f18sm7161266b3a.76.2024.07.01.17.31.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jul 2024 17:31:52 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Arnaldo Carvalho de Melo <acme@redhat.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Thomas Richter <tmricht@linux.ibm.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH 0/3] tools build: Incorrect fixdep dependencies
Date: Mon,  1 Jul 2024 17:29:14 -0700
Message-ID: <20240702003119.3641219-1-briannorris@chromium.org>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

The following series consists of a few bugfixes on the topic of "misuse
of fixdep in the tools/ build tree." There is no listed maintainer for
tools/build, but there are for tools/bpf and tools/objtool, which are
the main pieces that affect most users, because they're built as part of
the main kernel build. I've addressed this series to a selection of
those maintainers, and those that have previously applied build changes
in tools/. I hope one of you can apply this series, pending favorable
review. Or feel free to point me to a different set of maintainers.

This patch series came out of poking around some build errors seen by me
and my coworkers, and I found that there were rather similar reports a
while back here:

    Subject: possible dependency error?
    https://lore.kernel.org/all/ZGVi9HbI43R5trN8@bhelgaas/

I reported some findings to that thread; see also subsequent discussion:

    https://lore.kernel.org/all/Zk-C5Eg84yt6_nml@google.com/

One element of that discussion: these problems are already solved
consistently in Kbuild. tools/build purposely borrows some from Kbuild,
but also purposely does not actually use Kbuild. While it'd make my life
easier if tools/ would just adopt Kbuild (at least for the tools which
are built during kernel builds), I've chosen a path that I hope will
yield less resistance -- simply hacking up the existing tools/ build
without major changes to its design.

NB: I've also CC'd Kbuild folks, since Masahiro has already been so
helpful here, but note that this is not really a "kbuild" patch series.

Regards,
Brian


Brian Norris (3):
  tools build: Correct libsubcmd fixdep dependencies
  tools build: Avoid circular .fixdep-in.o.cmd issues
  tools build: Correct bpf fixdep dependencies

 tools/build/Makefile         | 11 ++---------
 tools/build/Makefile.include | 10 +++++++++-
 tools/lib/bpf/Makefile       |  6 +++++-
 tools/lib/subcmd/Makefile    |  2 +-
 4 files changed, 17 insertions(+), 12 deletions(-)

-- 
2.45.2.803.g4e1b14247a-goog


