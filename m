Return-Path: <linux-kbuild+bounces-5232-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E46AE9FB4E8
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Dec 2024 21:13:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F39C16552F
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Dec 2024 20:13:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 306A91C6F55;
	Mon, 23 Dec 2024 20:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h1BoIt5M"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8011C07FB
	for <linux-kbuild@vger.kernel.org>; Mon, 23 Dec 2024 20:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734984817; cv=none; b=Ulh1cVBv/OvpIAnadfsfYTnqhRzPMBjIc5jzly2PJsFLSwTSkwfcmyyf26Lveb5HWuzqngZnYFTr3maTLfx6GE/+TdqPEtyE73HLZ0xLjX+tcIMkjHtMZvSA+SJWIj7Hytsq5ZBTB6rhQZ4sUfaOdEl5NtiKRyx2FPFwi2dkt6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734984817; c=relaxed/simple;
	bh=5Mq/Lod+CoUzVKEXAaI/Rh1aSJTk5krQ5RmABX4wMn8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=GoJCnKg3PVUV5FwHo2FdPG2VSb60fpjgQmRy7Pm3JEsvZlxUTHROpL7QL4B7w0GEL6Fb8DPffVguhSFDvJxQYt4dN8lmSNDTqcklaa0/yNDqx2ilkbpEExgzeXlIHJDmyOBkfjB9T/Y6D8kKMUPPMtjEVfa5HOiQoTqaj6go9wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h1BoIt5M; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2163dc0f689so67280425ad.1
        for <linux-kbuild@vger.kernel.org>; Mon, 23 Dec 2024 12:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734984814; x=1735589614; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NdmPC/Cg+VRgcBcF/g9ZlGzIAQfrdNiF/rJDE7UZdnU=;
        b=h1BoIt5M2FYZwfIPv/v7SpyGr8HbqIkJ8viaxey0gjR6j65SlattqoalI3GdoEVSBV
         awYFavCmXhCY70T8JNG9/Rx+DWxVXyS29pA2+aaPREvC+Ir+V9sFDAmKtQWoyWRXOxwx
         opViHlqtertBeFK6N59n/HCuXcZs8ShlftSyclRyQoJZvTTDSh84sdfakIZSDS0AGXLv
         U+/4Vuhxo9a/ul+EERK9COJHJym39B0YluHJb1rEDUF6iOry3dnEe0dbv5SMgA2umKkB
         deGpWW/WP/NFH53Sg99EoBAQZWHeTItyPmgMFk91Xbm51OuJdVt2+/K/EJXnTv7CgfN/
         9p4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734984814; x=1735589614;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NdmPC/Cg+VRgcBcF/g9ZlGzIAQfrdNiF/rJDE7UZdnU=;
        b=mFs9QPfjuIbZH39FnGwnDJldes5bgFnWrasOTZwxjNdhTx13peAJZBuog6bSKMgoOR
         Afp88l2dCl4DUvoS0C1OXuZRKzyacoV/a9YV68yGFvHHOyw9bdqHw2859aHhXq+aHHvH
         ryOM1HpohAnCKrf7LwTGcXcpKA/bv5NSR3iaGI4B5lPvd3TCKjWz6wgzYb+8Mbyw3Y8a
         j2fBqR1OcDIpQUaVMAC0eCtWnuNLUMs2VKERn5FkUOTIcqmBxt/jUGBE8udnXqJcx0QE
         FeqXERBwCHrfXbpTqoR2nforjAjXls2tj6ZA1fq2XgEvsoBdv6aBcgj5igMhd71GVv6a
         Zypg==
X-Forwarded-Encrypted: i=1; AJvYcCUwHKctMuHm52sKqlZCNmqnmnItQgs7RvxLlRoCRWibzUldn8O2apwkiXGpXWi4Wn1/MxVIjFPlWMDnbWI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyCbCIyJJ+oWiH1FfLL67cywKG7AlAfbhqsaRcsfM5rlYT5Z7V
	Doz7u7cSm5rbAZGwg5+xW6ipTitk1eIdWxgiaDud7vYfS4sq8vHoBXQwiLa7TOq036jstJt/UxN
	DeLbwQA==
X-Google-Smtp-Source: AGHT+IHDdiQ8BcHRE1C+R/Gh/AVZ73dfmTeKtGuVX3u4tRShWf7DEBJfeyF3UjMT6m/kMUX66xFU/0X+ljnD
X-Received: from pfxa2.prod.google.com ([2002:a05:6a00:1d02:b0:725:eb13:8be8])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:998b:b0:1e0:b5ae:8fc1
 with SMTP id adf61e73a8af0-1e5e0484570mr22771345637.13.1734984814435; Mon, 23
 Dec 2024 12:13:34 -0800 (PST)
Date: Mon, 23 Dec 2024 20:13:29 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGrEaWcC/43Q32rDIBQG8FcJXs/iv9QYxth7jF2YeGyFGjdNQ
 0fpu+8kLSyjHezyiP78vnMmBXKAQtrqTDJMoYQ04MD5U0X6vR12QIPDAyKYUJwJQeE0wuDA0Zj
 cBHl+UKjVnVLOd957TvDpRwYfTov79o6zzynScZ/BrjBeC8mNqDeyqZWQjHIaoz1myK+7lHYH2
 PQp3rQMn0cMN15JEqEUu2Rrq+dFEyhxpuV2I4xhjWyoYLTYGMZ0mOwAw8p8mdHOFqA44I22GrA
 VvTqCkTnxPpQx5a9lMZNePr2tQD5ewaQpo1Ia3eAupNRyXWIWp2alYNvHSoOKkbZ34Leih+ZOM T8K/zOLQaXrmWLSs1p1/k7h7D8MZ+gwb3WtvHcAvztdLpdvuKtXlEACAAA=
X-Change-Id: 20241022-extended-modversions-a7b44dfbfff1
X-Mailer: b4 0.15-dev
Message-ID: <20241223-extended-modversions-v11-0-221d184ee9a7@google.com>
Subject: [PATCH v11 0/5] Extended MODVERSIONS Support
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

This series depends upon DWARF-based versions [1].

[1] https://lore.kernel.org/lkml/20241219210736.2990838-20-samitolvanen@google.com/	
[2] https://lore.kernel.org/lkml/20240605032120.3179157-1-song@kernel.org/
[3] https://lore.kernel.org/lkml/ZoxbEEsK40ASi1cY@bombadil.infradead.org/
[4] https://lore.kernel.org/lkml/0b2697fd-7ab4-469f-83a6-ec9ebc701ba0@suse.com/

Changes in v11:
- Fixed documentation about where strings are stored per Petr's
  suggestion.
- Rebased on to the latest version of Sami's series on linux-next

v10: https://lore.kernel.org/r/20241123-extended-modversions-v10-0-0fa754ffdee3@google.com
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
base-commit: b2c5bc987160cbc8478b982991f34f53189af909
change-id: 20241022-extended-modversions-a7b44dfbfff1
prerequisite-message-id: <20241219210736.2990838-20-samitolvanen@google.com>
prerequisite-patch-id: 8a6a82b2f1858ee1483f41a1aa72c8cb030559ac
prerequisite-patch-id: 5b22bc2e7f592e464d5d1dd4341efa2fb2afb9d0
prerequisite-patch-id: 220585cf1a8d66ec722cf1d6ec474af6dc3b6a02
prerequisite-patch-id: 8ae7cb66d809f902968f81354706edeb99a3d3fa
prerequisite-patch-id: 4d6a826429c519b581d01215e1d9c7373fdfd8c6
prerequisite-patch-id: 0dcd84187b222adf52696dbcab303d683d087dd2
prerequisite-patch-id: 0abe8634eb844a85e8dc51c1cd3970cf96cc494a
prerequisite-patch-id: 5fabb630792f9304f200b5996314f3c2ae4c83ae
prerequisite-patch-id: 2772364d4b2132c9ede451f320162fc40c6f3d09
prerequisite-patch-id: a5cf20d27871bf63be64ac79cc81e5eb9d117b89
prerequisite-patch-id: 930230702709fe769b171a8ae94955e5d1de13ea
prerequisite-patch-id: b43c0bc886a312e3b14be04a8fdad25badf4d834
prerequisite-patch-id: 839b0c4859bdc8447d67bfe4b09f762140e747e7
prerequisite-patch-id: 3c55d1e58a1d7aebfc3ea85ef5497a7262022040
prerequisite-patch-id: 5a190c60e140cdf33caf4f4da03186a2bd75a531
prerequisite-patch-id: 57d2fe708769154a6494fb1fece56911dea00687
prerequisite-patch-id: 7e046331b05c61a87e1adc923b763b68a580cd03
prerequisite-patch-id: 91c6131ab67a6f0fd8cf8bc95fa45144a868f095

Best regards,
-- 
Matthew Maurer <mmaurer@google.com>


