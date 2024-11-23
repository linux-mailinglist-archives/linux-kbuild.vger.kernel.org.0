Return-Path: <linux-kbuild+bounces-4811-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 261C49D6738
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 Nov 2024 03:42:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6938EB218DE
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 Nov 2024 02:42:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 439EB81AC8;
	Sat, 23 Nov 2024 02:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4CinfWNH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E69033986
	for <linux-kbuild@vger.kernel.org>; Sat, 23 Nov 2024 02:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732329741; cv=none; b=OOhbObGFzMZb8B3mqwm8bq2/lrNg17n5cajAAXPQHR8Y4cWfuxNuVMyWYIPDvbw1LmoFaQYCKAVSBR8GrFfKykz4kNE35tDedjgjRrPu/ozNFFOKKUZ2PY66lrw8BiG9tjeIbUNf30kagkdBy+Iyzg6EhijvZIeePpOH2m0M6H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732329741; c=relaxed/simple;
	bh=tiuVMoJVl9iIcfkunBRqigJ/o5Br1JocmVkYy3ouOGU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=ciseLz0529lNiIc3aRhzBHFbEB9s6NdyKMD+Ry+rvld3+dzkzTsluu+ReWAaSDxgGppqIWB0YKJIbdI6F0A2LL6OFtBLHAxwC6yAxAEAm9vjZU9AIGmC4XiiURKKmo6waaaEYhB7yUtA0xcP5X+WtBofz/y5AGKdK6xtxGcSKd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4CinfWNH; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6ee6122ea3fso47555417b3.1
        for <linux-kbuild@vger.kernel.org>; Fri, 22 Nov 2024 18:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732329738; x=1732934538; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=p7xX/47Vl0a27UdyPMbMgcO/jFPicE3KTPvW/80RrhM=;
        b=4CinfWNHk6pCcLJq8zPesnHPQLwtSVk/NBXYp7XYu1jSWZsG15WRYLXRjdOv1peHnx
         iQYiz3WSbLBQlNFn+9/KyfzdwoGwTx4Zeji4nrTRwhK4+oD4jigBUPq3ltrlMwFq+IbJ
         Yk1sNXb8WvwlAzGJyDC0jRyKon6DOLI6nu/Dx5Gn0P3M5SpreIgs9tLgwL+t2siSgBHb
         MNZPA9p4R92RB0aWOOq1BLR2v8ocjdx6lkgyCNF69I20Dok4WClR1TW9P8rFs5lj5kLS
         mMIL/xfKdF8fXQmcNEcb2gfe0de17z8qY4qJ4OcSfV2dHxJgAiuF2f8pv8r0cMCfd0Y0
         mw4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732329738; x=1732934538;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p7xX/47Vl0a27UdyPMbMgcO/jFPicE3KTPvW/80RrhM=;
        b=VgaOv8gj5Z+wpGN1jHCshHeUsf0KJJHme1MNK28yFFyvAJrHXUfT7mfFxAHxw50Yrw
         oNMHWlp7C4xPNFEiNiSD46QAE6honxql6JJMgF+46xO3LGob8v+lkDbbqbA50oz+nEBv
         f5hFLVL4LK/ASTX9a+ngkZDwc1Ysie2aKxtjnKAF5ScDTTsCj07MXNoqZwpI0nLrYh1z
         QlxM04gX4s7B6MbKFiVZcsPCQJEoQsKEkx/yvnLMZUOrHefskxxqAbWJRFrmGoaePbiZ
         6njdsCO1+CiRDY9KRg+ttlR/FnhCKUBfFtzWIy1Z6kSKzX0KkXUNdj65VpmwqX2BxEBR
         tZoA==
X-Forwarded-Encrypted: i=1; AJvYcCUPTKw69LP/ALQ0nBAouMvwRArY6GBL9bBcvl+sXgTqjAL8UTgWH2mrbCsWgqe14r/I95aedkG88klu4Lc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0x59UhSWFTS4Ct5OuNjkF1nC3iki1t45T1ZCd4eLcGZxA5+jz
	GNmmoh6ir2Em8TfMlWJSp/JChXi84J8vP0IJUzsybMwyRmvivDl+T8lFlh+TaJKs7Zi5IlJofUf
	diVWzBA==
X-Google-Smtp-Source: AGHT+IF1odZohGo0x5FmKnqA49SMz0WdtMATqtl5lIeEom9DctKrWPpJ8V6oI2GJwQjn5JiiVICykStr2Ivh
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:690c:7089:b0:6eb:ac7:b4bc with SMTP id
 00721157ae682-6eee08aa74fmr44677b3.2.1732329738069; Fri, 22 Nov 2024 18:42:18
 -0800 (PST)
Date: Sat, 23 Nov 2024 02:42:14 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAZBQWcC/3XQ0U7EIBAF0F9peHY2MFBLG2P8D+MDbYcuyVIUu
 s2azf67tDaxxvVxCBzu3CtLFB0l1hRXFml2yYUxD4I/FKw7mnEgcH0+YMhRCY4IdJlo7KkHH/q
 Z4vIggalapXrbWmsFy0/fI1l3Wd3XtzzbGDxMx0hmh4kSpaixPEhdKpQcBHhvzpHiyxDCcKJDF
 /ymRfo453DTN8k8pWTWbE3xtGoCBXKFyA8oKy20AOSQjHdTOM1mpHFnPi9oaxJBHvKNphjzVrA
 5yJbER5emED/XYuZq/XSrQN6vYK6Ag5R1pXMXUlZyv8Qiznqn5G3vKzortTRdT/YRO9J/lPpHE f9mqbPSdlxxaXmpWvtLud1uX7n+fg/4AQAA
X-Change-Id: 20241022-extended-modversions-a7b44dfbfff1
X-Mailer: b4 0.15-dev
Message-ID: <20241123-extended-modversions-v10-0-0fa754ffdee3@google.com>
Subject: [PATCH v10 0/5] Extended MODVERSIONS Support
From: Matthew Maurer <mmaurer@google.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Jonathan Corbet <corbet@lwn.net>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

This patch series is intended for use alongside the Implement DWARF
modversions series [1] to enable RUST and MODVERSIONS at the same
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

Emitting the existing format is now guarded by CONFIG_BASIC_MODVERSIONS,
but it is enabled by default when MODVERSIONS is enabled and must be
explicitly disabled by the user.

Disabling CONFIG_BASIC_MODVERSIONS may cause some userspace tools to be
unable to retrieve CRCs until they are patched to understand the new
location. Even with CONFIG_BASIC_MODVERSIONS enabled, those tools will
be unable to read the CRCs for long symbols until they are updated to
read the new format. This is not expected to interfere with normal
operation, as the primary use for CRCs embedded in the module is
load-time verification by the kernel. Recording and monitoring of CRCs
is typically done through Module.symvers.

Selecting RUST and MODVERSIONS is now possible if GENDWARFKSYMS is
selected, and will implicitly select EXTENDED_MODVERSIONS.

This series depends upon the module verification refactor patches [5]
that were split off of v5 (now in modules-next)
and DWARF-based versions [1].

[1] https://lore.kernel.org/all/20241121204220.2378181-20-samitolvanen@google.com/	
[2] https://lore.kernel.org/lkml/20240605032120.3179157-1-song@kernel.org/
[3] https://lore.kernel.org/lkml/ZoxbEEsK40ASi1cY@bombadil.infradead.org/
[4] https://lore.kernel.org/lkml/0b2697fd-7ab4-469f-83a6-ec9ebc701ba0@suse.com/
[5] https://lore.kernel.org/linux-modules/20241015231651.3851138-1-mmaurer@google.com/T/#t

Changes in v10:
- Fixed accidental selects / default confusion in previous patch
- Re-ran tests (check for section presence in Y/Y, Y/N, N/Y, N/N, check
  all module kinds load)

v9: https://lore.kernel.org/r/20241123-extended-modversions-v9-0-bc0403f054bf@google.com
- Rebased onto the latest version of Sami's series, on top of linux-next
- Added BASIC_MODVERSIONS to allow using *only* EXTENDED_MODVERSIONS
- Documented where symbol data is stored and format limitations

v8: https://lore.kernel.org/r/20241030-extended-modversions-v8-0-93acdef62ce8@google.com
- Rebased onto latest version of Sami's series, on top of v6.12-rc5
- Pass --stable when KBUILD_GENDWARFKSYMS_STABLE is set.
- Flipped MODVERSIONS/GENDWARFKSYMS order in deps for CONFIG_RUST
- Picked up trailers

v7: https://lore.kernel.org/r/20241023-extended-modversions-v7-0-339787b43373@google.com
- Fix modpost to detect EXTENDED_MODVERSIONS based on a flag
- Drop patches to fix export_report.pl
- Switch from conditional compilation in .mod.c to conditional emission
  in modpost
- Factored extended modversion emission into its own function
- Allow RUST + MODVERSIONS if GENDWARFKSYMS is enabled by selecting
  EXTENDED_MODVERSIONS

v6: https://lore.kernel.org/lkml/20241015231925.3854230-1-mmaurer@google.com/
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

--
2.47.0.rc1.288.g06298d1525-goog

---
Matthew Maurer (4):
      modules: Support extended MODVERSIONS info
      modpost: Produce extended MODVERSIONS information
      modules: Allow extended modversions without basic MODVERSIONS
      Documentation/kbuild: Document storage of symbol information

Sami Tolvanen (1):
      rust: Use gendwarfksyms + extended modversions for CONFIG_MODVERSIONS

 Documentation/kbuild/modules.rst | 20 +++++++++
 arch/powerpc/kernel/module_64.c  | 24 ++++++++++-
 init/Kconfig                     |  3 +-
 kernel/module/Kconfig            | 25 +++++++++++
 kernel/module/internal.h         | 11 +++++
 kernel/module/main.c             | 92 ++++++++++++++++++++++++++++++++++++----
 kernel/module/version.c          | 45 ++++++++++++++++++++
 rust/Makefile                    | 34 ++++++++++++++-
 scripts/Makefile.modpost         |  2 +
 scripts/mod/modpost.c            | 70 +++++++++++++++++++++++++++---
 10 files changed, 308 insertions(+), 18 deletions(-)
---
base-commit: 96ba0247d78ef4078e1de58b7e73715b93ee2c0b
change-id: 20241022-extended-modversions-a7b44dfbfff1
prerequisite-message-id: <20241121204220.2378181-20-samitolvanen@google.com>
prerequisite-patch-id: 43f1286f3e4b991fda2aa093539631a01fadf5fb
prerequisite-patch-id: 32a05b89083cfed15e5b877664b0c8138c40d09b
prerequisite-patch-id: e192e2a692c40d96cba919e3baae68c441ab25e4
prerequisite-patch-id: 50e884d28c720e90f201aae7801590d19736541b
prerequisite-patch-id: 4d6a826429c519b581d01215e1d9c7373fdfd8c6
prerequisite-patch-id: 0dcd84187b222adf52696dbcab303d683d087dd2
prerequisite-patch-id: 0abe8634eb844a85e8dc51c1cd3970cf96cc494a
prerequisite-patch-id: 5fabb630792f9304f200b5996314f3c2ae4c83ae
prerequisite-patch-id: ff82b9794147dc28504e46a0170cd269623e73bf
prerequisite-patch-id: a5cf20d27871bf63be64ac79cc81e5eb9d117b89
prerequisite-patch-id: 2a317596a3288f9b8e06d73df53737bbfafb1d16
prerequisite-patch-id: cac33b6e6672cf3f9f7f798a928ce7b147db271d
prerequisite-patch-id: 62664c468be8afff72a3edaf2c1bcd2f4936a1b2
prerequisite-patch-id: 5157d0421200858de3cc449bf39b3513efba3b24
prerequisite-patch-id: 5a190c60e140cdf33caf4f4da03186a2bd75a531
prerequisite-patch-id: 57d2fe708769154a6494fb1fece56911dea00687
prerequisite-patch-id: 25255d6bc70d3ba38e45fb6a2c13038df293bd9e
prerequisite-patch-id: 91c6131ab67a6f0fd8cf8bc95fa45144a868f095

Best regards,
-- 
Matthew Maurer <mmaurer@google.com>


