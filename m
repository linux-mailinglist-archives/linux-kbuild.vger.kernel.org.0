Return-Path: <linux-kbuild+bounces-2538-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBD8931BE4
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Jul 2024 22:34:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 517871C21371
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Jul 2024 20:34:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CEFF13B293;
	Mon, 15 Jul 2024 20:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XqTeeruq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3313513A242
	for <linux-kbuild@vger.kernel.org>; Mon, 15 Jul 2024 20:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721075629; cv=none; b=XAV9JsQ65s7a/bz4pfPIxdxLXCtYy8oC8Dzu0fLphtgqRfmkhWFU9zp2Mpog2vDmogcZO6URXPLIAVQgxmoSlWuLXi2XV3U6pHjd9Qcqhlr1DkF6hV6Gd5a/lzOCVnB5jJsk1YVrJy+K+q0XS6GsmoCJpNFPXZEv+fcxZhw1EtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721075629; c=relaxed/simple;
	bh=/P/116+9w2mLwcmHBm363843CFQCaXKMH8KT9sO7LCM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VG7WVoXdU/s08qoFBM+H+9v8uj+uJcr8yiJFrf44qJ/hh6kbv+/NBjBRvCTuBhn44/RuSC1JkGykB2F79Xzq6qENY//W4yrF7Cd427ljrTsxGjjTMPqOgE3aD8MOipYPCFDCX5t3LASJivAg4pH5SNJNL/D5+4uWCxQUTrGnvZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XqTeeruq; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7035c367c4cso2887475a34.2
        for <linux-kbuild@vger.kernel.org>; Mon, 15 Jul 2024 13:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1721075626; x=1721680426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vhoTCz3ni+xQlYfh7VRKBvmVoq1WWvZ0esQtm7KJcwE=;
        b=XqTeeruq0NwBZEHbNW2sa6MHrkJaITLqBq4b/OfuQ1Iar2+P0RKKDsCooG4ZML2T/A
         PtiQcWl579WHv31nPcM+lw+QW+/m9gxiz1IqpdCcuBqFzE9u4L52eOkITQSdBIGxMxFT
         p5+5kVM42HWf1cb8SnUurgVmncFXWApZx/Uk8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721075626; x=1721680426;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vhoTCz3ni+xQlYfh7VRKBvmVoq1WWvZ0esQtm7KJcwE=;
        b=KXmH6aaiCgfcU4EkSgTgE+lMrTAM/UDNUE3e4wt0n7McN//rvT9v+w/KiGQrBsQdxy
         Ok54PkV5zBbMKYNtmxj/5kBKVuuUenPcBzEk1PmcbhCczHkeNQKF/ejhtYMUp6bCYfO/
         j1GbtyN6lSw7uuV07L6LXovX1Iisqz13BlgkcOBRXYD+o+yfAMb7VobZOs2V6LKjyesr
         +PBfI5htBuxvPPmIlayaEmpG6jqI3vH54P2QcqXk7SY6gt3Wu7Ye+LZn/xc7WzhGFUZx
         Qw21X4+U2+vDI7zuB0eBoRMDKtZ957lWP3b+GBbMWKZ59e8t2dj7obHNgx+1HknQpRD3
         FhIA==
X-Forwarded-Encrypted: i=1; AJvYcCV4o6fvixZc/vSmRsYcHGg7pq1rbGMe8iWp2cikSHs39vM/TkC9aVG2Uew60fnSBJkgXPVvatwTVK0k9il1cGgchq4uGAaMn2fUo+oZ
X-Gm-Message-State: AOJu0YyRr2Za9ELaER/WkNHGlZHL6L0SsBttDnJJIEqbBsxLLZm54Fi6
	HmPy+9rzIG33bM9FgOYm8niptFVxcCyJPbu8gQBX1ybMS8XJFccj1I7C8oxzCg==
X-Google-Smtp-Source: AGHT+IHcn5p8vEjNS+lWRQm20XAqutHOXOnvYwxx+SYs1VpO68BVua/mUl9IF1f4mgS/bxtzmg33QQ==
X-Received: by 2002:a05:6830:3806:b0:703:6340:b5b2 with SMTP id 46e09a7af769-708d9948aedmr223075a34.14.1721075626272;
        Mon, 15 Jul 2024 13:33:46 -0700 (PDT)
Received: from localhost ([2620:15c:9d:2:9b77:1ea5:9de2:19a3])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-78e39fdcbc7sm3069914a12.92.2024.07.15.13.33.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jul 2024 13:33:45 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Arnaldo Carvalho de Melo <acme@redhat.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Thomas Richter <tmricht@linux.ibm.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	bpf@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH v4 0/3] tools build: Incorrect fixdep dependencies
Date: Mon, 15 Jul 2024 13:32:41 -0700
Message-ID: <20240715203325.3832977-1-briannorris@chromium.org>
X-Mailer: git-send-email 2.45.2.993.g49e7a77208-goog
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

Changes in v4:
 - update tools/lib/bpf/.gitignore to exclude 'fixdep'
 - update tools/lib/bpf `make clean` target for fixdep
 - combine $(SHARED_OBJDIR) and $(STATIC_OBJDIR) rules

Changes in v3:
 - Drop unnecessary tools/build/Build

Changes in v2:
 - also fix libbpf shared library rules
 - ensure OUTPUT is always set, and always an absolute path
 - add backup $(Q) definition in tools/build/Makefile.include

Brian Norris (3):
  tools build: Correct libsubcmd fixdep dependencies
  tools build: Avoid circular .fixdep-in.o.cmd issues
  tools build: Correct bpf fixdep dependencies

 tools/build/Build            |  3 ---
 tools/build/Makefile         | 11 ++---------
 tools/build/Makefile.include | 12 +++++++++++-
 tools/lib/bpf/.gitignore     |  1 +
 tools/lib/bpf/Makefile       | 13 ++++++++++---
 tools/lib/subcmd/Makefile    |  2 +-
 6 files changed, 25 insertions(+), 17 deletions(-)
 delete mode 100644 tools/build/Build

-- 
2.45.2.993.g49e7a77208-goog


