Return-Path: <linux-kbuild+bounces-8655-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D9BB3B952
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 Aug 2025 12:54:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9666A1B27D99
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 Aug 2025 10:54:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 725783101CE;
	Fri, 29 Aug 2025 10:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hK53H9p0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9528B30AD0C
	for <linux-kbuild@vger.kernel.org>; Fri, 29 Aug 2025 10:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756464873; cv=none; b=c5WAQL/UrHuaUcPTNKVxpGDTG8E8YwFDd0PZN/tpQ17l4lV1Semf5t8nCxHY7t27U2kcnS0/+hA08aIs4naC0aWNEQCyocFSmpNfDppItad0NV13sNRaWW6ZiFn9yfZ4IQBdjh0CjeLZkM/AkGDl46PgZK2D4pop0lN+oYZPoiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756464873; c=relaxed/simple;
	bh=/4lgxBFBXe5YAPib3n1NIP7CqiEc2ADQutfeyO4Ql5Y=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=rqoNaQEmQpuujU7d9ZbxPCY4vvskjo7QXFlrkEdlqqF3jxfJlFxUorCumwvHoYHe9zw3YSFPOLvVf6AViwo/O7gln9SGe3KmBXAlGyZou/RDL79VgAgtHHF8xCqT8L8IwGTNudNIKM2DXDJITwXHSVaIE0O0Ph+sCcidqfCPOZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hK53H9p0; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-61c2762067cso1620826a12.3
        for <linux-kbuild@vger.kernel.org>; Fri, 29 Aug 2025 03:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756464870; x=1757069670; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MTstZdg+IFpEL06up0r6KWAqHR4urEga4onDvlcfI9I=;
        b=hK53H9p0jcRVdPqya+uPKYsE+UI/HdLXDRLCNBvBXr/qtQhbeadQ34xmHQ5+KrWo38
         2Eq6Zx/T66K3xPnqPPLNag/u3kRggtaGRg8JtFtS+gm3/9TTQ0TQbNBufUJuqrdYoOPP
         mzTLCIWeI9A1JE7QxxE644QpdfTi9XUZe2PA0F7BIhA6h7Ddxp4kPsYQs+yeQIBIRwE5
         S+0r1HiyQxsc+QnXAcpq+ArS98QUIe3ZYEtWx2jSKhNdFnEPyCvSGTt5bjw+KrXMImPA
         x1HZv2BN/142pZqv1+aPhUlBGMUli+0E05BHAEqaqXJUIGi9Jp/PdVRzIqjqYaR5KOEA
         B36A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756464870; x=1757069670;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MTstZdg+IFpEL06up0r6KWAqHR4urEga4onDvlcfI9I=;
        b=lVhixGL7j4HAv2J+LaiKn41vT/1NsrrdlPNpaXOZZGJMmEv3hatTGnr/x62JprtCVc
         SNXeqsiRceEoK0wsib2cPW2IaYRTXRFkvSvLK3+DLwswShQyA6Ei13i3tEOWKJ7oXELP
         Tn9MXwvhGky2Y5Rre44cerWc3GlV2o/TBeRsCmbE1mhf/Yg6ZuYigL3NcfTKJoMgI+XK
         XB/u3CXRzDazInFxy0RUSrqLBFPvad+P5EzhF1rPaVD6UlQN3gzFVos+rJUQfRxFGVFt
         C033KrvizOeu474yXfRs1qJloj4Mc7kTklbd6bZ8H3sBFL639BLfD+QHyTR+6bEZLRw5
         WZnA==
X-Forwarded-Encrypted: i=1; AJvYcCUWKG+wOMcSBM3Ziuc5C0F+0gwir1SoAU5mx+DmWzEDFHXL5GapilHHozxQBrnIApZTnC0GseYfGcWfVH4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyP+OXebiD96qMEF5751DSCUt08YgpOGNpZVdWvFNV5KOvL1k6n
	sHEh/g7FmNrfWwv7TgAnsEAfTHiAoYT6FvHEK7ROizJmNHSMI5upHgXIkfQJ7Fo2ZIKX6JNuRUs
	kq/PVi5HKSswn0Rl76g==
X-Google-Smtp-Source: AGHT+IGyBZPYAxC2QPneWYAvzHS6WMIz8B1nFWUJPBrnRl3yjjUsDZG3jLzbCQ+RMfQCg25v3V4Tuq3Js9lkLiA=
X-Received: from edf12.prod.google.com ([2002:a05:6402:21cc:b0:61c:f8dd:a29])
 (user=sidnayyar job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:5c8:b0:61c:d4c2:bcfc with SMTP id 4fb4d7f45d1cf-61cd4c2c9aamr4614283a12.18.1756464869977;
 Fri, 29 Aug 2025 03:54:29 -0700 (PDT)
Date: Fri, 29 Aug 2025 10:54:08 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.338.gd7d06c2dae-goog
Message-ID: <20250829105418.3053274-1-sidnayyar@google.com>
Subject: [RFC PATCH 00/10] scalable symbol flags with __kflagstab
From: Siddharth Nayyar <sidnayyar@google.com>
To: Nathan Chancellor <nathan@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>
Cc: Nicolas Schier <nicolas.schier@linux.dev>, Petr Pavlu <petr.pavlu@suse.com>, 
	Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Siddharth Nayyar <sidnayyar@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi everyone,

This patch series proposes a new, scalable mechanism to represent
boolean flags for exported kernel symbols.

Problem Statement:

The core architectural issue with kernel symbol flags is our reliance on
splitting the main symbol table, ksymtab. To handle a single boolean
property, such as GPL-only, all exported symbols are split across two
separate tables: __ksymtab and __ksymtab_gpl.

This design forces the module loader to perform a separate search on
each of these tables for every symbol it needs, for vmlinux and for all
previously loaded modules.

This approach is fundamentally not scalable. If we were to introduce a
second flag, we would need four distinct symbol tables. For n boolean
flags, this model requires an exponential growth to 2^n tables,
dramatically increasing complexity.

Another consequence of this fragmentation is degraded performance. For
example, a binary search on the symbol table of vmlinux, that would take
only 14 comparison steps (assuming ~2^14 or 16K symbols) in a unified
table, can require up to 26 steps when spread across two tables
(assuming both tables have ~2^13 symbols). This performance penalty
worsens as more flags are added.

Proposed Solution:

This series introduces a __kflagstab section to store symbol flags in a
dedicated data structure, similar to how CRCs are handled in the
__kcrctab.

The flags for a given symbol in __kflagstab will be located at the same
index as the symbol's entry in __ksymtab and its CRC in __kcrctab. This
design decouples the flags from the symbol table itself, allowing us to
maintain a single, sorted __ksymtab. As a result, the symbol search
remains an efficient, single lookup, regardless of the number of flags
we add in the future.

The motivation for this change comes from the Android kernel, which uses
an additional symbol flag to restrict the use of certain exported
symbols by unsigned modules, thereby enhancing kernel security. This
__kflagstab can be implemented as a bitmap to efficiently manage which
symbols are available for general use versus those restricted to signed
modules only.

Patch Series Overview:

* Patch 1-8: Introduce the __kflagstab, migrate the existing GPL-only
  flag to this new mechanism, and clean up the old __ksymtab_gpl
  infrastructure.
* Patch 9-10: Add a "symbol import protection" flag,
  which disallows unsigned modules from importing symbols marked with
  this flag.

This is an RFC, and I am seeking feedback on the overall approach and
implementation before moving forward.

Thanks,
Siddharth Nayyar

Siddharth Nayyar (10):
  define kernel symbol flags
  linker: add kflagstab section to vmlinux and modules
  modpost: create entries for kflagstab
  module loader: use kflagstab instead of *_gpl sections
  modpost: put all exported symbols in ksymtab section
  module loader: remove references of *_gpl sections
  linker: remove *_gpl sections from vmlinux and modules
  remove references to *_gpl sections in documentation
  modpost: add symbol import protection flag to kflagstab
  module loader: enforce symbol import protection

 Documentation/kbuild/modules.rst  |   6 +-
 include/asm-generic/vmlinux.lds.h |  21 +++----
 include/linux/export-internal.h   |  28 ++++++---
 include/linux/module.h            |   4 +-
 include/linux/module_symbol.h     |   6 ++
 kernel/module/internal.h          |   5 +-
 kernel/module/main.c              | 101 ++++++++++++++----------------
 scripts/mod/modpost.c             |  27 ++++++--
 scripts/module.lds.S              |   3 +-
 9 files changed, 107 insertions(+), 94 deletions(-)

-- 
2.51.0.338.gd7d06c2dae-goog


