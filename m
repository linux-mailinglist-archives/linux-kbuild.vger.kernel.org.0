Return-Path: <linux-kbuild+bounces-5341-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35584A00CC7
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Jan 2025 18:37:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4BC381884216
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Jan 2025 17:37:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78DE21FBEB7;
	Fri,  3 Jan 2025 17:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fY+dRqo0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0DB1FBE83
	for <linux-kbuild@vger.kernel.org>; Fri,  3 Jan 2025 17:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735925827; cv=none; b=UyWAioU5mKwbcptcdQMuMYD9PZiAXb27O4G/ERGikk/zwm6qsUGUw6nMPzg8zmUTqcfMiJpjMagMB2MKR1Zqnk18argpwcDlCOyU2TvIbNFLluO9ctGmcsdZAxgJCXGIbwa1JCRAXhhZak3HZ+HEvmGcG/RkOomM1K4VjgvkqXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735925827; c=relaxed/simple;
	bh=XUMV+IjWjR/mKf9NiCzOf1drW24QFbqJW9dlnkh30k0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=J4PjZtppXHLdSGaPE2j1Dg8topAEeZV7uo0Yp5u7zKjLId5bW26lR3klugqv6i5PnANfRO+huc1bFs8+xEqLhGlcSFZkhLII+Ei9ryNw88jmI2SNEsQYAgtxgAZ9o1WTnwNVM83YJ82f+jGacjKYI+EMNJwguIlSNmbwIn+c3TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fY+dRqo0; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ef91d5c863so17668859a91.2
        for <linux-kbuild@vger.kernel.org>; Fri, 03 Jan 2025 09:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735925825; x=1736530625; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=U4VY60Cjwm6tFflvWLW60lsCJrk0mhJyf0v7/Cd8Kfg=;
        b=fY+dRqo0vLCsstcWtK/bFtCe7FISr5n59XZD63MAMsqVN1DZ7mmHHPLaX8RW6E0Q3R
         dQWxPNOVx/42Pe0LnZMyt3Vi7eOfqMn6KnpMuoIySc5yl8ZQ/jOz3tgFnavgrZU7ewCW
         xDo92gIioCvWk9SlGy1FmCkhzcd1t6B6gjedEIbCMwrnBD/VxxSQ/3L5Yrag/OLpP03M
         FiDjdRBVYwoY5gmkJhhplDanT2NtGqdyjdstGa2DnaEJtlKT0tiFjEkPZHZoF49hzydi
         08/K/LwUc19NGpO0j7EDi2U1xYKBAjX3AipSUsg5uBz2MdmO/I0k6FPSO/DS3hg0xvZM
         U61Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735925825; x=1736530625;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U4VY60Cjwm6tFflvWLW60lsCJrk0mhJyf0v7/Cd8Kfg=;
        b=cVghZDUlahbFhtgIl3dPNVfS81VetxUJNljBAvCy/tJDKa0P+Bir5lHL+g/1K3iQyg
         uXql5upE12NFCW84HfUbDlZwLpUFv1Cis0GiofFMOPGjRaI7kVb7/fcV9RJq5etx7OyB
         6ue4J9qRdvqKfBlKPh/oXXToZUAMlXMqjNB/iJapqp9Iti/+JKfyUT8qjEFB8Y+U4UxM
         0xZ0OUL3rKs9wpZfEqh80JZgfpWd29J0dZpK1Jc4wyfDCeBp4j9s+bUcKC08Ia/R20C+
         iyHHWzMDYgm1+P2sGRXBCSguTCPwZYWaKUZnHFtbOJ7kBWhtbVmYaKZsAPOz+UI0/7xR
         09xg==
X-Forwarded-Encrypted: i=1; AJvYcCWo1B6OaTHeLBXvYvd51kwYKDAbaKsTrOeE6PyfzgVwx3mHoMb711OJU2hIgAtdGec3obwDqIDWKYbURoQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyC/28H04gS8DO/AgjHG+YAVZ8sGD+MI5ZRGOp45Cq8TQ7HfY/K
	WLq4Dyt6BzMoOf3khDm6J/OfVsvXQyOB95QBUnVfJNc+tIF6/JRqhiiJiPQRZ4OfOJlmmx5Ytjz
	fMwmC/Q==
X-Google-Smtp-Source: AGHT+IE5XOXP4u3YrND5atQkifC8UR4hESmT1MwaKDDcIFcvmI5+502564uEtsesNkW/cFlPCKUocxo+NW50
X-Received: from pjur4.prod.google.com ([2002:a17:90a:d404:b0:2ea:448a:8cd1])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2c83:b0:2ee:693e:ed7a
 with SMTP id 98e67ed59e1d1-2f452eed943mr76372036a91.35.1735925824912; Fri, 03
 Jan 2025 09:37:04 -0800 (PST)
Date: Fri, 03 Jan 2025 17:37:00 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADwgeGcC/43Q0WqDMBQG4FcRrxfJOYmalDH6HmMXUU+qrJots
 dJS+u6LrlBHW9jlCTkf//nPaSDfUUg3yTn1NHWhc0McQLwkad2aYUesa+JDihwlcERGx5GGhhr
 Wu2YiPy8EZspKysZW1lpI4+qXJ9sdF/f9I87Wu56NrSezwiBHARrzTKhcouAMWN+bgye/3Tm32
 1NWu/6qefo+xHDjL5n2FIJZsm2S10VDVJDLgosMUUhUctZMMG3n3Wn7SX6gfeb87m0GH6zHIMB
 LUWSoNVdCMeQsmL4b3X4yAw2rSAtRmUAsDvHHJhliKewag6fzwW0XRudPS69TuWS+NigeNziVj
 DMhdKlilUKUYt3BLE5qpcSyHisqKlqYuiFbYE3qTtE3BZ5m0VGpai65sDyXlb1TgP+HAR4dbk2 ZS2sbovubAG4OPncgOojQgJJE2pT3Dq6cp+UAzo4uTGG4zSGHP87lcvkBCzwpvA8DAAA=
X-Change-Id: 20241022-extended-modversions-a7b44dfbfff1
X-Mailer: b4 0.15-dev
Message-ID: <20250103-extended-modversions-v13-0-35d87c65ee04@google.com>
Subject: [PATCH v13 0/5] Extended MODVERSIONS Support
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

This series depends upon DWARF-based versions [1] and Masahiro's u32
fixup patch [5].

[1] https://lore.kernel.org/lkml/20241219210736.2990838-20-samitolvanen@google.com/	
[2] https://lore.kernel.org/lkml/20240605032120.3179157-1-song@kernel.org/
[3] https://lore.kernel.org/lkml/ZoxbEEsK40ASi1cY@bombadil.infradead.org/
[4] https://lore.kernel.org/lkml/0b2697fd-7ab4-469f-83a6-ec9ebc701ba0@suse.com/
[5] https://lore.kernel.org/linux-kbuild/20241228154603.2234284-1-masahiroy@kernel.org

Changes in v13:
- Fixed up missed s32 usage (Thanks Sami).

v12: https://lore.kernel.org/r/20241230-extended-modversions-v12-0-296a6a0f5151@google.com
- Rebased on top of Masahiro's cleanup patch
- Switched modpost to Masahiro's new types, including using u32 instead
  of s32
- Eliminated comment noise per Masahiro's suggestion
- Fixed typo in patch 3 commit message
- Set default of BASIC_MODVERSIONS to y instead of MODVERSIONS, per
  Masahiro's suggestion

v11: https://lore.kernel.org/r/20241223-extended-modversions-v11-0-221d184ee9a7@google.com
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
 scripts/mod/modpost.c            | 69 +++++++++++++++++++++++++++---
 10 files changed, 307 insertions(+), 18 deletions(-)
---
base-commit: b2c5bc987160cbc8478b982991f34f53189af909
change-id: 20241022-extended-modversions-a7b44dfbfff1
prerequisite-message-id: <20241228154603.2234284-1-masahiroy@kernel.org>
prerequisite-patch-id: d5b0940f47a19d475020f6fd2e916703b803a137
prerequisite-patch-id: a8ac50c440ac3247c60227d2ea2c10f3d3e433c1
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


