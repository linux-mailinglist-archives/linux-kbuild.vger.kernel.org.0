Return-Path: <linux-kbuild+bounces-2322-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 504AD924B20
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Jul 2024 00:06:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5B336B252FC
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Jul 2024 22:06:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F07E1B11F2;
	Tue,  2 Jul 2024 21:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nQ5/FDKQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250401AEFDA
	for <linux-kbuild@vger.kernel.org>; Tue,  2 Jul 2024 21:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719957542; cv=none; b=WrMujB3utFVt6FbsZ81jRWRGxiy1Pl/VQw7EaDBOhRUEnrs6c7vHItJtgM6pWHlnqmqKc4tQIhzhSK6qoB424mf0ZxQ6OA69IRy0jXZRUU04L+OE4DKwYjF50FfGHfgwnTrpi9iKuCRhuJ/TImZkIClAGl+YQFwQTEX/4DY5ZMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719957542; c=relaxed/simple;
	bh=M01YDRrouAlAzlCLyGiYQynak61DO+REujqSpJFVxvc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OfnezreWzXnW/sMcGaRt42lehKt7jkT96wy3ETUCnvt/tvwgevqmuQjUKlvDi1e622WuadZP4GDwtnox6h+rfbq+H+2y1DGVx4FdBzlfUE9rtRn5VysXMIIkgpsLS4keqgjULfqWH+MCrZtdW19AtX0zfFNRwZHCYuZcV9GOLGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nQ5/FDKQ; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2c8e422c40cso2821725a91.2
        for <linux-kbuild@vger.kernel.org>; Tue, 02 Jul 2024 14:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1719957540; x=1720562340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FT7lewTlvqPcebAQ7sdKPrt4rD1V8IX/L9ApopkhaiM=;
        b=nQ5/FDKQuDGFbq6YERjqmx1aCEazsTVlIGLTAQdSU91Lz1MtBNw0Mo2hwYFWH/7xHz
         /YXLhTgI7uG88EpaDtc6KqoUjp0fRtnaNmlS5YMOFj70eV+xUjiO6aHHdPkZtfljT4VJ
         gt+ylu+d9ehfwRHPlWmTaw/wtbvJaFrUDJBJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719957540; x=1720562340;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FT7lewTlvqPcebAQ7sdKPrt4rD1V8IX/L9ApopkhaiM=;
        b=NIfRI1gi96OvdH4/NQES2nl710wW/nCiBYaSZZmMa9bYid/R89k4LJNvwMnojmnsou
         KXGjAO5J/GQENVrmfp6cvmZp78IMgkwAHNfevOVG+Sx3mHBLVfJrKfuKFROzSik68Is1
         8eMuzAtZP2nFNPdc4XKI7kXLx0i9TxoMDtX0OflqE8oqAZNQzb5AfUe1XDJDV8+Oc4Gw
         gl23HP8JMDGCnOaaqNfbhY9ethCogzmAjJOQRhF1sFsQIXd9ZLZHONHkFB/aHQtpe3EH
         H3NoId/vOvvvxXCvlyvUXCO9yQ5hdJZ9ibIZWSGY8M9++Ir2JL9T2YLlH48PUIEyt6XD
         y68g==
X-Forwarded-Encrypted: i=1; AJvYcCXfx5tWD9u0Y8OgFBc3LX7qqRCzYb9leYZHvtmn+VHnQTaW+fkx29hfpuFNg29QvsD8XTF/uH985ZZbQobX54eJziNKuIHTi0uripZv
X-Gm-Message-State: AOJu0Yx4nepYBXju7gZ9OKWW/TRh0z/8jgmzMhmCsbImllPOoiMeORiK
	C1oOd96eP+YegHE9DXfdFmVwJ6abx4DCErVEOL8P8xx+0oDZayU8wdQoWqbcyw==
X-Google-Smtp-Source: AGHT+IGeWRRAgVyeKiau5CRBkZj201MTdIub9SKabxaU3j/E01KOBS3aEn2OeI76DdOYFGg5Zmz1pw==
X-Received: by 2002:a05:6a20:7350:b0:1bd:207a:da31 with SMTP id adf61e73a8af0-1bef613f4b2mr10203315637.23.1719957540361;
        Tue, 02 Jul 2024 14:59:00 -0700 (PDT)
Received: from localhost ([2620:15c:9d:2:5fa9:4b10:46fe:4740])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-7080246f656sm9018274b3a.65.2024.07.02.14.58.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jul 2024 14:58:59 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Arnaldo Carvalho de Melo <acme@redhat.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Thomas Richter <tmricht@linux.ibm.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH v2 0/3] tools build: Incorrect fixdep dependencies
Date: Tue,  2 Jul 2024 14:58:36 -0700
Message-ID: <20240702215854.408532-1-briannorris@chromium.org>
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

Changes in v2:
 - also fix libbpf shared library rules
 - ensure OUTPUT is always set in lib/bpf, and always an absolute path
 - add backup $(Q) definition in tools/build/Makefile.include

Brian Norris (3):
  tools build: Correct libsubcmd fixdep dependencies
  tools build: Avoid circular .fixdep-in.o.cmd issues
  tools build: Correct bpf fixdep dependencies

 tools/build/Makefile         | 11 ++---------
 tools/build/Makefile.include | 12 +++++++++++-
 tools/lib/bpf/Makefile       | 14 ++++++++++++--
 tools/lib/subcmd/Makefile    |  2 +-
 4 files changed, 26 insertions(+), 13 deletions(-)

-- 
2.45.2.803.g4e1b14247a-goog


