Return-Path: <linux-kbuild+bounces-1493-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BC44589DE96
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Apr 2024 17:17:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0B915B2A952
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Apr 2024 15:02:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51C6380619;
	Tue,  9 Apr 2024 15:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DoVWC4q2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A531304AA
	for <linux-kbuild@vger.kernel.org>; Tue,  9 Apr 2024 15:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712674905; cv=none; b=qdbxcLN2NFtQ2T/cMKvypcFB+D66cxfxq4MCh/4S8tkZUZJQCQ0RoOjfsMJXzTy+n9x9993MydPe0aIMBBILbHnAWEp4XcsrMi7iRpihxSx/qI7o9e1hrv7eAh+ZDJAc0igL9N4D4tpIj8387waR1mdj72YL5xDh9cROqjb242k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712674905; c=relaxed/simple;
	bh=alFFKiP7O8OXDXrwrinQEc5sBVduOBPmxmITpEnO00Y=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=IsfUlxgomKKw8tOxW/1+nAIn3gchRyh2qJejPGGL2zcNvHOv8Fl6GVdmmR+AvQ1rMro2iArDjijFwGg0QpODhM2yhVwyLMIzY6xzRhXAUiJzG4jvSc4RVX7psGT09Uo4SeRaq64Cc32gkswW5l6pY9UbgLh6X0puTEcbCoeJ/ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DoVWC4q2; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-343e775c794so2210020f8f.0
        for <linux-kbuild@vger.kernel.org>; Tue, 09 Apr 2024 08:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712674900; x=1713279700; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tfocfhDuzyWI0gzZPzgtgcqFin70HaxvYji+27WTX8o=;
        b=DoVWC4q2NOqBhhc41O2uVHSuJ/yMC5YkEeJOHGGzWx+TO7zr9ViDNe+rAlG+wdndQk
         nJCske8OCx5PxFjoP1GZoPORoE1KZu1dBdf6b53iYN8ESZBuuokmG+7VSAwiSfZO+cUW
         9oUbnNnzzaGh18ayAzLd0NAMcRGV8TSlriXGpE2FWtoc3Q8UEa/NrMj+HZRGp3QGEgA6
         KBECNGU4vzu8L44TIJFLbscw0GmdkWRZ1qOr0BzoguYZ6IGD7Fqz3wZLTQVMiU5GoJ04
         VS6GskQOf00uHpsR0vAgBzPRCuSKZ1VgQtA5CuT6GequamaGwANBwc+ZTlXl9Wxxwo57
         ArmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712674900; x=1713279700;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tfocfhDuzyWI0gzZPzgtgcqFin70HaxvYji+27WTX8o=;
        b=fzP0YshuXfIlv1tmfh3XzBcdC3s1qbdZDZQpv548BjE6uOH9MMGOMZQQFvxerCz8dN
         ytOPimQ+CbfJ0/tt5/p9igIps7doYeC/xp4cOrpyRo3wr36LAYhvQxVIkHWrls88DLEz
         PiT2lpA5XQyWPziiRfm6zJil0kpW05vaEi5AbshAczT0vaXyjjUO5RqyFgcC40jN7DM1
         eS8rSNvgLsdXkq+ICYk2qxCeu4BjUoG2WYRKXVR7Mrh/cwkEPzjs+PCQcZfe6ALZlIZA
         /VP4saSxkktV9J07DHUI1rLwTnFWwzLXh6qad1SGkgBLq8XZZ0icJzLP2K29v7We2TAJ
         y+Rg==
X-Forwarded-Encrypted: i=1; AJvYcCWJ4gxqaE2XGiOj0n+HOLSy0Qq7wnSDVOTTkc46GrijkMistsS9WuBIv5sulhGvu1iuKqUrNhQ99FVe7Ym7OVYHD5Wm+ecZUWINjiYM
X-Gm-Message-State: AOJu0YwIIWLJdOWOIDTi1FUt9ISNcpBbpYHOlGLRv91Zj+GlSwziiRVY
	yERqs7PC1XJdKYxSUFIgX8utKNFZ0ePvVe0/pcqvyG9ayz+RgFGegEZBO9p7RNaEQnC6/A==
X-Google-Smtp-Source: AGHT+IFYuevMhVCNS8J4a0W+Y4P/tX4ObfbT6n8GZHMYJQGV+TZpStj+eAbIHkNNPAqkAizanpcTzDes
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:118a])
 (user=ardb job=sendgmr) by 2002:adf:fcd0:0:b0:343:3f5b:8be5 with SMTP id
 f16-20020adffcd0000000b003433f5b8be5mr25778wrs.5.1712674900036; Tue, 09 Apr
 2024 08:01:40 -0700 (PDT)
Date: Tue,  9 Apr 2024 17:01:33 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1943; i=ardb@kernel.org;
 h=from:subject; bh=vvI7uP53jbbpjHBqTcIzGIhjjZ2G0+4ci+o39TUrohg=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIU00wkfJaMX8/7u/nL26uVyuuT46dDI7j0x7Ta/W0beLi
 zK9y9w6SlkYxDgYZMUUWQRm/3238/REqVrnWbIwc1iZQIYwcHEKwESS9jP8L0m8H9OefeJLbG/7
 hGtcCW9eBda5aPCvW5W/wpw9al/8R0aG+zYX6vKnHOW6oeDcYh3n9k9mXqGwfnv4p0ifvsL85FN MAA==
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
Message-ID: <20240409150132.4097042-5-ardb+git@google.com>
Subject: [PATCH v2 0/3] kbuild: Avoid weak external linkage where possible
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Martin KaFai Lau <martin.lau@linux.dev>, linux-arch@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, bpf@vger.kernel.org, 
	Andrii Nakryiko <andrii@kernel.org>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Weak external linkage is intended for cases where a symbol reference
can remain unsatisfied in the final link. Taking the address of such a
symbol should yield NULL if the reference was not satisfied.

Given that ordinary RIP or PC relative references cannot produce NULL,
some kind of indirection is always needed in such cases, and in position
independent code, this results in a GOT entry. In ordinary code, it is
arch specific but amounts to the same thing.

While unavoidable in some cases, weak references are currently also used
to declare symbols that are always defined in the final link, but not in
the first linker pass. This means we end up with worse codegen for no
good reason. So let's clean this up, by providing preliminary
definitions that are only used as a fallback.

Changes since v1:
- update second occurrence of BTF start/end markers
- drop NULL check of __start_BTF[] which is no longer meaningful
- avoid the preliminary BTF symbols if CONFIG_DEBUG_INFO_BTF is not set
- add Andrii's ack to patch #3
- patches #1 and #2 unchanged

Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Martin KaFai Lau <martin.lau@linux.dev>
Cc: linux-arch@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org
Cc: bpf@vger.kernel.org
Cc: Andrii Nakryiko <andrii@kernel.org>

Ard Biesheuvel (3):
  kallsyms: Avoid weak references for kallsyms symbols
  vmlinux: Avoid weak reference to notes section
  btf: Avoid weak external references

 include/asm-generic/vmlinux.lds.h | 28 ++++++++++++++++++
 kernel/bpf/btf.c                  |  4 +--
 kernel/bpf/sysfs_btf.c            |  6 ++--
 kernel/kallsyms.c                 |  6 ----
 kernel/kallsyms_internal.h        | 30 ++++++++------------
 kernel/ksysfs.c                   |  4 +--
 lib/buildid.c                     |  4 +--
 7 files changed, 49 insertions(+), 33 deletions(-)

-- 
2.44.0.478.gd926399ef9-goog


