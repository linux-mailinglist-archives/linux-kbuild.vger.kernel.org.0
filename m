Return-Path: <linux-kbuild+bounces-4137-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB6599FC4E
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Oct 2024 01:20:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E71742872BA
	for <lists+linux-kbuild@lfdr.de>; Tue, 15 Oct 2024 23:19:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D10CB19C542;
	Tue, 15 Oct 2024 23:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RMAVXh/i"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220FB1D63E7
	for <linux-kbuild@vger.kernel.org>; Tue, 15 Oct 2024 23:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729034372; cv=none; b=tg/ng5OXjr4ZAzDySyWQOTNhdZVqZ5+6mn5w/LglyPdqZKGRSkK0zQWKbU61GHM0ZDU2aQrjzTTdgju2XDGINlywTRdw35wFb6682moxjLPWoHvaW9arQPcKZWGQgDopmNqtSPJfxK40eTiFXiDw9eJuYCW1Rzw75vzj3pvM6co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729034372; c=relaxed/simple;
	bh=+F2VbNZf1bhZ2UaA03ZPHWNIFVcKxoyVzX20irGYaCE=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=DvzADyhILbr7Rwm+x3Yz+7jKoUSpHG4iHNiE4WhLruxjPWVikovDPinQWtwjOMFu4jC34BnBr4hh+U/Pwg6cS4T6gTFlN+q1nSYjm7nbXWbf02jI+0dzcS7u8OZrjEvvyqVV9PAe044FRpZZpy99SK/uw7XOajJeBnjhh/nxFUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RMAVXh/i; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6e32f43c797so3646947b3.1
        for <linux-kbuild@vger.kernel.org>; Tue, 15 Oct 2024 16:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729034370; x=1729639170; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mrJp4iFzpg7dOEUx5ArGmKTsHqr2X7jfl/sNyFyGR+8=;
        b=RMAVXh/i+YxZUiL1R8LbIDXsHEKlAJ/NHlsL1aDYu9x+gmO4FZazS36eCS3efXDkgU
         M/wv5Q2AXyzyMyaMqIyYnMi/YjWhlFo2UdGLIw9wnb1Ue6kHlrzuq3qEzySB/RRxeha6
         762HKR5PMGmkPVBj2m7suAC7WyBAa7kw7b2CPRPk6U+QoHfZMcHsmdXhlTIg8CI+9Awi
         Ngvcy+tClp4DbCU87qTwclBNgCyeSNr1fAEBzPyApkMtQiGRRpRTICINlm6TFWh87iAP
         HRQ6NbWhcvuScilDW4IbaokzusUI39jC+SuU3oYqGPO7e43znALB2tG9RiQkZHnENqMB
         geNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729034370; x=1729639170;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mrJp4iFzpg7dOEUx5ArGmKTsHqr2X7jfl/sNyFyGR+8=;
        b=JJlsfe6H2L4glMTqLZroLcd65QbYxNTUime1iN5BojuhXCDul4emcMtg6DasPnZJ0G
         Stk8rEb7XIudjThdYQ8YUm25SQzI8WWdCeSwG48j0NhF/YC1gufH6XWkZkH2eDnCyYjP
         w9I2P3ujnLr6rtIcFJtldpJzg2Rd9lJGzcMOpPK6lEmWYfBOFyos3JGf8WbJ8zaEdll7
         3veA4OSAe9QgRBvSeVel1ihG5X71vGdsj5rShn86w5divPOsUnT3aXyPXGuNs9rAkcZH
         TXab1Dpcet96G69Y9SIEjfpw3X//5mxBJDEfmjZawMB+478f7CtXZu38zE6Tn/Jhd9QI
         KQpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUI64X7frre/uhKmMDHqFLbfgQmiNT8xgwv32HzID8hmXh1CYj3ymD6ulBAyW15pl0katg4FqONakAYNPw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8lKJUA/08gKGh+KRCKWnMvM2Rd1aUqGZ6TVKPizusYT9h3ArP
	xXs3mh3CCpbrfgTfVkIQbUfh4Ol1emok27I3ZXVpjyZgVL0H4iFKwp/9wBeXspaMIxcuk4x9bWQ
	FjZ/G8Q==
X-Google-Smtp-Source: AGHT+IGjGandx9utSrvuA6uN/UlbhV0NFNsrW9jxyZLY7Y/xUho6mObXEYFljDf/DSG5duM/8SOImAxH4q50
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:690c:7005:b0:6d3:e7e6:8460 with SMTP
 id 00721157ae682-6e3d35ac029mr391157b3.1.1729034370036; Tue, 15 Oct 2024
 16:19:30 -0700 (PDT)
Date: Tue, 15 Oct 2024 23:18:55 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241015231925.3854230-1-mmaurer@google.com>
Subject: [PATCH v6 0/5] Extended MODVERSIONS Support
From: Matthew Maurer <mmaurer@google.com>
To: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org, 
	gary@garyguo.net, mcgrof@kernel.org, Alex Gaynor <alex.gaynor@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, neal@gompa.dev, marcan@marcan.st, j@jannau.net, 
	asahi@lists.linux.dev, linux-modules@vger.kernel.org, samitolvanen@google.com, 
	Matthew Maurer <mmaurer@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>
Content-Type: text/plain; charset="UTF-8"

This patch series is intended for use alongside the Implement
MODVERSIONS for RUST [1] series as a replacement for the symbol name
hashing approach used there to enable RUST and MODVERSIONS at the same
time.

Elsewhere, we've seen a desire for long symbol name support for LTO
symbol names [2], and the previous series came up [3] as a possible
solution rather than hashing, which some have objected [4] to.

This series adds a MODVERSIONS format which uses a section per column.
This avoids userspace tools breaking if we need to make a similar change
to the format in the future - we would do so by adding a new section,
rather than editing the struct definition. In the new format, the name
section is formatted as a concatenated sequence of NUL-terminated
strings, which allows for arbitrary length names.

Emitting the extended format is guarded by CONFIG_EXTENDED_MODVERSIONS,
but the kernel always knows how to validate both the original and
extended formats.

If you are testing this patch alongside RUST by manually removing the
!MODVERSIONS restriction (this series doesn't remove it, because the
CRCs don't mean what we'd want them to yet, we need the DWARF patch for
that) and have kernel hardening enabled, you may need the CPU
Mitigations [5] series. Without it, the foo.mod.o file produced by the
C compiler will reference __x86_return_thunk, but foo.o will not.
This means that the version table will not contain a version for
__x86_return_thunk, but foo.ko will reference it, which will result
in a version check failure.

This series depends upon the module verification refactor patches [6]
that were split off of v5.

[1] https://lore.kernel.org/all/20240617175818.58219-17-samitolvanen@google.com/
[2] https://lore.kernel.org/lkml/20240605032120.3179157-1-song@kernel.org/
[3] https://lore.kernel.org/lkml/ZoxbEEsK40ASi1cY@bombadil.infradead.org/
[4] https://lore.kernel.org/lkml/0b2697fd-7ab4-469f-83a6-ec9ebc701ba0@suse.com/
[5] https://lore.kernel.org/all/20240725183325.122827-1-ojeda@kernel.org/
[6] https://lore.kernel.org/linux-modules/20241015231651.3851138-1-mmaurer@google.com/T/#t

Changes in v6:
- Splits verification refactor Luis requested out to a separate change
- Clarifies commits around export_report.pl repairs
- Add CONFIG_EXTENDED_MODVERSIONS to control whether extended
  information is included in the module, per Luis's request.

v5: https://lore.kernel.org/all/20240925233854.90072-1-mmaurer@google.com/
- Addresses Sami's comments from v3 that I missed in v4 (missing early
  return, extra parens)

v4: https://lore.kernel.org/asahi/20240924212024.540574-1-mmaurer@google.com/
- Fix incorrect dot munging in PPC

v3: https://lore.kernel.org/lkml/87le0w2hop.fsf@mail.lhotse/T/
- Split up the module verification refactor into smaller patches, per
  Greg K-H's suggestion.

v2: https://lore.kernel.org/all/20231118025748.2778044-1-mmaurer@google.com/
- Add loading/verification refactor before modifying, per Luis's request

v1: https://lore.kernel.org/rust-for-linux/20231115185858.2110875-1-mmaurer@google.com/ 


Matthew Maurer (5):
  export_report: Rehabilitate script
  modules: Support extended MODVERSIONS info
  export_report: Tolerate additional `.mod.c` content
  modpost: Produce extended MODVERSIONS information
  export_report: Use new version info format

 arch/powerpc/kernel/module_64.c | 23 ++++++++-
 kernel/module/Kconfig           |  8 +++
 kernel/module/internal.h        | 11 ++++
 kernel/module/main.c            | 92 ++++++++++++++++++++++++++++++---
 kernel/module/version.c         | 45 ++++++++++++++++
 scripts/export_report.pl        | 17 +++---
 scripts/mod/modpost.c           | 41 +++++++++++++++
 7 files changed, 220 insertions(+), 17 deletions(-)

-- 
2.47.0.rc1.288.g06298d1525-goog


