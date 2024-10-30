Return-Path: <linux-kbuild+bounces-4430-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2510F9B703C
	for <lists+linux-kbuild@lfdr.de>; Thu, 31 Oct 2024 00:05:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 126011C21463
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Oct 2024 23:05:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B99A71E260C;
	Wed, 30 Oct 2024 23:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aDg7weAd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCFC1C461C
	for <linux-kbuild@vger.kernel.org>; Wed, 30 Oct 2024 23:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730329509; cv=none; b=DwqffOUZXrbx6lUwLiwqHtL0Fj1uR+SsE+XnIvuJEmVZJtfPT2sWb5HNOxqxy/HvSV+B5wLYBKU5SL3D50n08xcm5ZXSDgvRWSx/Elg7tdMK/IZODRbn+L5/cX0XlEaHnS+LoBOc8QV5m5AEakHmO6i7Ij6u565qKTk8LH5BXIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730329509; c=relaxed/simple;
	bh=caVe8KUg4p0c7ymHU2yLmoxpVlKecGLB8YQ6QefrTCo=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=PcAH3XhrlbjmApkPF/Cov5EsGNxENmLh7iodTaN1+okAtBqB12hc6Zy4SvFRa8Dzv/zjr15UoT+G0pgI8TMFBRCOV+5Bl6q+MyJag81ZG+T4rvYM6sa3xWgYWEIQzAWpSCecI1kU86xS8QHMf9B4Bpom/uQVWpk3JSM6o3rLxFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aDg7weAd; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6e7e7568ed3so20916227b3.1
        for <linux-kbuild@vger.kernel.org>; Wed, 30 Oct 2024 16:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730329506; x=1730934306; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mwCfAovhpPAvFtkBAaRUtvlrChVtTdt/SXipMI6/liY=;
        b=aDg7weAdvelrTfNpX+eJjZap/wLk5M04DDdxiJAKoBWzl0Y3/0+ufbcv+nSkUwaoH6
         McQZK4antoPiegc2gP1vM5CjYspOYntqmuRsWSsX4o4Z0QX4L73Pwnl8KNzUTLd/cQ30
         FsQJx8k12yScffjv0pQ/WVocINDwjGdrDwF22r6oj1x40jCH+bUOm6TBW1L8Xzag3xV5
         yZT3CUKE4J4j6+cX465GxsUjzh17tYHu/L7HzvJyMiJJG0TDmnHXleztPJ/YKoFQDCqU
         zn/Qq7JW85wzpQdqrdv030d4+VEM2Ov3sdUnilJtNQAG5H4Z8RZ1zk2nv3wf/bZPRyEt
         l/Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730329506; x=1730934306;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mwCfAovhpPAvFtkBAaRUtvlrChVtTdt/SXipMI6/liY=;
        b=HZfCdh+kAuh1WRQ4vpi6P2QQcFAPS0bQ0LobEOnuiQ3OjAwYGuYXJo8oantf/K5PUy
         kK+HNNxuma6gLPgxe0ti26RGb7qQYemF9enVziAqxvw+kWIHuNmWrh1DgySsA0+UFzAH
         UC40IeS6gVEBSU2EbTLNJ8BeGUj2t4m+VphpkyWS81iyYWFYsrRtAxMZ4QPbxLZsF8D2
         qSQMk08gogjU5mb/ggaFOlA1EE0ULjFWgfc4CkJLzazZwa/of3aSlsBpUF3iADrtV92a
         c4O0iW245xTlM/Z5C2nTicRvMH5KfuoHti6i5H9JRSUk8QLNHxwSCNwlF9Dsn+/6NU66
         43fA==
X-Forwarded-Encrypted: i=1; AJvYcCVY7wtSG74WJKZ8imyypjFBGe8YD6HwK/rcq4ngyO8ZMeh/LIS2/+ih9LPdqGM00RItmA1WduonuvXW5pA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiXorsibO3lDIot8DngoHIKxJ9aUA/gz5HXg9Ffzh9HL0qIT5P
	mTUaI/46T7/agL3xLTNqx8U0ic4FO65PfOE536gK0uCfHWj63IbYaeVexr+9EkMG0DrnQCox8rG
	m0R010g==
X-Google-Smtp-Source: AGHT+IEVxCPJ8KY+daO6sXzeep+OX1tLKz9cP/KzhVx9mKCU3r73WaJnmvG2rqaP9yNNj71dEIj2Eigx8el+
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a25:ad54:0:b0:e2b:db24:905e with SMTP id
 3f1490d57ef6-e30e8da06f9mr779276.5.1730329506200; Wed, 30 Oct 2024 16:05:06
 -0700 (PDT)
Date: Wed, 30 Oct 2024 23:05:01 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJ67ImcC/22QzW6DMBCEXwX53EX+wZigqup7VDkYWBNLMU5tY
 qWKePcamgOquO1IO59m5kkiBouRtMWTBEw2Wj9l0bwVpL/oaUSwQ9aEU14xyjngY8ZpwAGcHxK
 G9T+CVl1VDaYzxjCSrbeAxj427Nc5axO8g/kSUO9gTHLBTlyWopEVFxQYOKfvAcPn6P14xbL37
 kUL+H3P2eY/JHEYo96ytcX7jlZLttIYE80h7WPFHZgFZYoyWpdM5qsWwBlE7ezsr0lPOP1HdDo iZJE/2iJlG4fQS7JWvdg4+/CzDZrUlva1nTjeLimgIMRJNXlEIZTYtz8vy/ILqBzHl6QBAAA=
X-Change-Id: 20241022-extended-modversions-a7b44dfbfff1
X-Mailer: b4 0.15-dev
Message-ID: <20241030-extended-modversions-v8-0-93acdef62ce8@google.com>
Subject: [PATCH v8 0/3] Extended MODVERSIONS Support
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
	Trevor Gross <tmgross@umich.edu>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Matthew Maurer <mmaurer@google.com>
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

Selecting RUST and MODVERSIONS is now possible if GENDWARFKSYMS is
selected, and will implicitly select EXTENDED_MODVERSIONS.

This series depends upon the module verification refactor patches [5]
that were split off of v5, and DWARF-based versions [1].

[1] https://lore.kernel.org/lkml/20241030170106.1501763-21-samitolvanen@google.com/
[2] https://lore.kernel.org/lkml/20240605032120.3179157-1-song@kernel.org/
[3] https://lore.kernel.org/lkml/ZoxbEEsK40ASi1cY@bombadil.infradead.org/
[4] https://lore.kernel.org/lkml/0b2697fd-7ab4-469f-83a6-ec9ebc701ba0@suse.com/
[5] https://lore.kernel.org/linux-modules/20241015231651.3851138-1-mmaurer@google.com/T/#t

Changes in v8:
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
Matthew Maurer (2):
      modules: Support extended MODVERSIONS info
      modpost: Produce extended MODVERSIONS information

Sami Tolvanen (1):
      rust: Use gendwarfksyms + extended modversions for CONFIG_MODVERSIONS

 arch/powerpc/kernel/module_64.c | 24 ++++++++++-
 init/Kconfig                    |  3 +-
 kernel/module/Kconfig           | 10 +++++
 kernel/module/internal.h        | 11 +++++
 kernel/module/main.c            | 92 +++++++++++++++++++++++++++++++++++++----
 kernel/module/version.c         | 45 ++++++++++++++++++++
 rust/Makefile                   | 33 ++++++++++++++-
 scripts/Makefile.modpost        |  1 +
 scripts/mod/modpost.c           | 65 +++++++++++++++++++++++++++--
 9 files changed, 267 insertions(+), 17 deletions(-)
---
base-commit: ac746e6156c4d6d7b46ba2102acf644ea2aa4aac
change-id: 20241022-extended-modversions-a7b44dfbfff1
prerequisite-message-id: <20241015231651.3851138-1-mmaurer@google.com>
prerequisite-patch-id: 7b7bf0c0c0f484703e29a452dc99dc99711c051b
prerequisite-patch-id: 8cc51bc35ddd4c268b5ccba4c3a74af3dbee8bee
prerequisite-patch-id: 0c4fded10660440fc59e256d6456ac865b70f04b
prerequisite-patch-id: 121f9313b4bde4e374ba37132fbf36e435f7ada5
prerequisite-patch-id: bbd158ee717130fd5d5fc4b7c0613d89c2adcc45
prerequisite-patch-id: af83141b7e527e3d1936326e3c9996bddfa45642
prerequisite-patch-id: 61a51b5c2ab3dc55031fcb2a2b56b4b44b9fabd3
prerequisite-patch-id: 63b4bdc24ff078bd48b8dcec28a334042450796e
prerequisite-patch-id: 429739b875bf7400ece44ec2529f43051b43dd45
prerequisite-patch-id: 55a19e6365f3d60ac5dbea13e320ece71538de25
prerequisite-patch-id: d5ab8e10e837e8193c265dc8548b97655a56db27
prerequisite-patch-id: e2f5364a0c5f3c9341aaa183f97fb7544b1c9dba
prerequisite-message-id: <20241030170106.1501763-21-samitolvanen@google.com>
prerequisite-patch-id: 08b46e0d1e37c262c08da6db4a87728d7b3047cc
prerequisite-patch-id: 0a1e1ac99f325f4df27bd35f00bd4914f5386cb9
prerequisite-patch-id: 32a05b89083cfed15e5b877664b0c8138c40d09b
prerequisite-patch-id: e192e2a692c40d96cba919e3baae68c441ab25e4
prerequisite-patch-id: 50e884d28c720e90f201aae7801590d19736541b
prerequisite-patch-id: 4d6a826429c519b581d01215e1d9c7373fdfd8c6
prerequisite-patch-id: 0dcd84187b222adf52696dbcab303d683d087dd2
prerequisite-patch-id: 0abe8634eb844a85e8dc51c1cd3970cf96cc494a
prerequisite-patch-id: 5fabb630792f9304f200b5996314f3c2ae4c83ae
prerequisite-patch-id: 4859bef5bb0f6b2142bd7a0e89973f7a79009624
prerequisite-patch-id: a5cf20d27871bf63be64ac79cc81e5eb9d117b89
prerequisite-patch-id: f9cacaf82d1f2a93ade313c44269fb871e7b9ce2
prerequisite-patch-id: 9fcea62d87a577d69ec262fe76b81c889c1bdf92
prerequisite-patch-id: 310f411df60af62002a3898eafe60c1687c0e9b8
prerequisite-patch-id: c21f85ffe5c7684c1ffc87af716e2e50498d5c92
prerequisite-patch-id: a372f88626c3dda51eab6c6af132a76141ff20cc
prerequisite-patch-id: 57d2fe708769154a6494fb1fece56911dea00687
prerequisite-patch-id: e5fb35555f6a95bc9953bddebba0612f422146c4
prerequisite-patch-id: 624e6794e5003cff734873894c2343595b45244b

Best regards,
-- 
Matthew Maurer <mmaurer@google.com>


