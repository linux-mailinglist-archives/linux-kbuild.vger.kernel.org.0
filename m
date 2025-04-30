Return-Path: <linux-kbuild+bounces-6820-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 35802AA578D
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Apr 2025 23:41:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1F4A1C06C36
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Apr 2025 21:41:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D850283FD7;
	Wed, 30 Apr 2025 21:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="f3ei+D/N"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2912222A0
	for <linux-kbuild@vger.kernel.org>; Wed, 30 Apr 2025 21:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746049257; cv=none; b=R/XZhGhsDmtTNfavrlEG4IpVAUu/vcwzaVUmDLfy64KONFI5yk8Tf2mvnUhPvR3irTK179/03V6nyO+GwEMzOKjc9XMIQDUAZyQoRtS2fsYWQBaiE3lk8avBEZ7WDEoKj0qqya+lTvetqFNu7WdDx4mdxd5/tshdw10H/2P9hAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746049257; c=relaxed/simple;
	bh=FbnolmAa1ihzTPwaP2gNpvYM8Cq8h/hbym23Rvf/YdI=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=GmuhN4XY/CFRMDD1d1uQ3IHr0Bl/+NVegZxuJFZ48MWgxLuUiEnNU+Jb0Swv5zcdnsrYpC/ACHnU8pKA+MCAUB9xBQLXnrbBPJAhQ/NDgD37TYldDhElfcPOJBv4wXVKroDGHAy1esCbWoc9KlfFNLDcpC+15nEEAvS3WxjUTuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=f3ei+D/N; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-3055f2e1486so495459a91.0
        for <linux-kbuild@vger.kernel.org>; Wed, 30 Apr 2025 14:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746049255; x=1746654055; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ltTv4znqsFQ85Lzp8jrl6i/DISWTecXsf7/GiAae7us=;
        b=f3ei+D/Nik7TI4zx8EFgb27snP7VJstw6HjDKfke3GuxbplEYqEUM08B0bpMlAbbY/
         k9ZTI/VTUtThc9zWi/UNgl9hnzkCbkBSB7r3hGOsMH63DXfleS6TFhjLhoTVNMaNU2rd
         jWII2AopLfdn+btxmr2+7WnkyQWo1ihjNtGjBYJQHl/RYs+pjG7wXwSdnisQ55CKnKVa
         hiqhfAuSvZmC6eZapZJM3lrzIMKcG/BmueFs5mmw+8+LLywFQYH2ppUX3YlaSo3mH5lF
         NAbZJZkwTHC+6MIS0qqRfd4kztsVw9qZeax8GdSvIqxkxyUxuSxGnvisZaju9Pgy0oki
         1mRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746049255; x=1746654055;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ltTv4znqsFQ85Lzp8jrl6i/DISWTecXsf7/GiAae7us=;
        b=pZDtx6FKhCqk6tsgwq5kpKexHZS9LRU78dZyuq9EjaLJN5PtwXi4qvdBnsADDRCzWd
         QuTd/jImm0QGyxmuup3umVWSV3MQ1O2ns3ca+ndfocNym34IReiPaAGkSoKHHufjMbK6
         dRj9Eh20XGM06bu0bQqcYQLNOWSEleLxJSFalCRxCo0hltjwIFOEp1pKLzDK9x+htcjA
         HEYo3+RZxY2SR1QDP/COZ+ybRq7oO9TTKs1FM+U7BG9cerHuCw3bScXub/X+QJMv+pNv
         i/B0T0cqxennQ7z8L0+BEkYE7J5WROCyoio/fGeHoEmht36kDxfAMuf8Nk2/gT4EgbrQ
         g+HQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMvGGNpeTi+Ybl7rbOJPBMHP0UhmUP4NxPeVbCd/UTYLRk4SghB7suHGQGqakv9zznUBqwj8qcYd3niZA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrSzCJX4o5loZzZ8R88zYWD9f9hLkGmNOSvuUe+A0Kmr34npPB
	DaH7IX2fbOGaq9Ofy0B7yhk7oCyPHL0gNh4ya0vACiv5FX8+XwE5ZUtMaKHXS5hJFI5W3U7a9iT
	6d+I96ST09HaPsaN6Snft/6I0iQ==
X-Google-Smtp-Source: AGHT+IHOigGLKmP0bsX9ImdviZNTFg2SnFjPl4mnMIE6/Erbd6Dr1d6kRq9Sy7Ge7gO2BpFsO/mUA7OMoOWGCp+XeY4=
X-Received: from pjbnw8.prod.google.com ([2002:a17:90b:2548:b0:2fa:a101:755])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2dc2:b0:2ee:74a1:fba2 with SMTP id 98e67ed59e1d1-30a344217cemr6007965a91.20.1746049254932;
 Wed, 30 Apr 2025 14:40:54 -0700 (PDT)
Date: Wed, 30 Apr 2025 21:40:50 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=1542; i=samitolvanen@google.com;
 h=from:subject; bh=FbnolmAa1ihzTPwaP2gNpvYM8Cq8h/hbym23Rvf/YdI=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDBlCMx4GKL7vEF2bPrtkEQfv1EXfPAxi2h7J8B7JcDs1p
 U9kxV6ejlIWBjEOBlkxRZaWr6u37v7ulPrqc5EEzBxWJpAhDFycAjAROS1Ghvdmq58a7jbavC5V
 zVZ7ncbiVZIiGuWvfpe/MrK9fSX48lKGvyIxWcXNT1mrgu8nSCzisd6e17umJ/W0aX9Ykku498k f/AA=
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250430214049.2658716-6-samitolvanen@google.com>
Subject: [PATCH 0/4] gendwarfksyms: Add more kABI rules
From: Sami Tolvanen <samitolvanen@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@samsung.com>, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

While looking deeper into the genksyms hacks that have been
needed during Android's 5.10 and 5.15 GKI lifecycles so far,
we found a few instances that are not covered by the existing
gendwarfksyms kABI stability rules. The first case involved
appending new members to a partially opaque data structure, and
the second case completely changing opaque types due to a large
backport that was necessary for both stability and security.

These patches add rules that allow distribution maintainers
to deal with structure size changes, and as a last resort, to
completely override a type string used for version calculation.

Sami


---

Sami Tolvanen (4):
  gendwarfksyms: Clean up kABI rule look-ups
  gendwarfksyms: Add a kABI rule to override byte_size attributes
  gendwarfksyms: Add a kABI rule to override type strings
  Documentation/kbuild: Add new gendwarfksyms kABI rules

 Documentation/kbuild/gendwarfksyms.rst   | 103 ++++++++++++++--
 scripts/gendwarfksyms/dwarf.c            |  14 ++-
 scripts/gendwarfksyms/examples/kabi.h    |  21 +++-
 scripts/gendwarfksyms/examples/kabi_ex.c |   7 ++
 scripts/gendwarfksyms/examples/kabi_ex.h | 101 +++++++++++++++-
 scripts/gendwarfksyms/gendwarfksyms.h    |   2 +
 scripts/gendwarfksyms/kabi.c             | 143 ++++++++++++++---------
 scripts/gendwarfksyms/types.c            | 141 +++++++++++++++++++---
 8 files changed, 452 insertions(+), 80 deletions(-)


base-commit: b4432656b36e5cc1d50a1f2dc15357543add530e
-- 
2.49.0.906.g1f30a19c02-goog


