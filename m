Return-Path: <linux-kbuild+bounces-2158-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A87290B8A8
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Jun 2024 19:58:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EF20EB2315F
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Jun 2024 17:58:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F2F51922C7;
	Mon, 17 Jun 2024 17:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WMZm+8B1"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FC918FC96
	for <linux-kbuild@vger.kernel.org>; Mon, 17 Jun 2024 17:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718647109; cv=none; b=cu6JHTscvO9Iy9W4bkG2ZKy1wFTcQE/4rBHGo2xhMNpJKz0pgc01J0pEU8SedKSzRGTTIECQofhwJrG7udG+ZV9BFHZT7EFo5l6v7/mGUbVZ1rqpbaHD/kXRnNiiJPwfJ8gcLsasOmMYlCje5fdBKQwDFcfDeUUoicb1978Bh8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718647109; c=relaxed/simple;
	bh=tXPKxVYsjjJsY1k10biTjwWu9hPJ9D/IhHpy6cm2zjA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Fsz7fOQN6hZOn0RvFbbGlRU988xVG2Ao752P3O2SOwhz+6rOzKDK21vBVZjxDInW7SbD4ZoZEc+br3cMF/ky2UUQJvxkkfvpn5DYZYi29CfPTEjEfg4SnEJZW+Q5IMJ2cEUzZOBiLxbHxbiNGLjbVkjuPCyGovvYltxd4L1R1Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WMZm+8B1; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dff166b6847so5652674276.2
        for <linux-kbuild@vger.kernel.org>; Mon, 17 Jun 2024 10:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718647106; x=1719251906; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tE8iwa2ZayN0y+FsAJoQxOYNFCmll9YcgC2KyKrqU8w=;
        b=WMZm+8B1Z1BLoRI1fIsjTFn4tEPZkQGTyZA+vSsfQTDVAtQEYQer9iN7xLVx05J4jW
         beNpt5uExS1Qg91VBvEFbDEFaPpKtbDhri4lBLJbKHPa7LqDlLyprrG+zi1PgiYkTyc0
         f37gMbR4rE51FxCecca5uw2aO+G8mpG0vBEpvVv2A59rKFifHHXls+0AfzFhng7wadp/
         zB8VwHi0DOVAdmfzf5O2jQZLRa5rqN4HO8jxzeMhZveUC6FVCcoSgVL+e1qg23l+r2gF
         azys4+izrdrXE8j47K8LBDlGvZGAPZ6ZPG7P7FDo2aPd9mTAO1ELdkwqABMgZv6C6gYI
         D76Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718647106; x=1719251906;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tE8iwa2ZayN0y+FsAJoQxOYNFCmll9YcgC2KyKrqU8w=;
        b=bV2hFBh96sLM05LKiVLgbYLcOqaKWOGXt2qgFkAXzPQmzO2mzsw6K6OL/YmyOomD4r
         jMOkoFQ2YBCZAW0SIWkA2S/yAMhQBUbexd/5tBe+EoOEwjj5CIEw6uzHgt1rJJOhhI5n
         x++rSiX3GqKyxAoyJsH8isUVEjUuF3utM3VJJ0/gWW+8QnEBSV0iwUrHLJDQNriioml8
         HIBieXGtuUzZDTSf/O8UaLhQzeY4556GG9sGchITezv1oPWCzglZWMgyFrLCkBrYdSS5
         cSWF5ccL855ixbSJLofaD54kVcXh/4s/ggyBa91D6otTIrsv/lJV4XQhycAlGj0i+3Bc
         Xv4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUcokGJUQiKKMOVuYdLt0p0cDNK2tAJjC9/0deQm6RHFX23bLn1IOikk0bY2R5VHDj8d7aiTVVzfVwqqrwBAOHYlp0Pr5UM8pPV3aWi
X-Gm-Message-State: AOJu0YyDicFIEa6sKmS03yiuRfaXjzESuXoo1Ogr5QTwtt3m6E9/MkOm
	WcXyIox6fPlsk6prsC/pHbKjLTU62PK3f0V4uv4UrlXZYIhy144YXjzJ2zmJsZ2gtwOFsmOleCi
	WhDp7UUF9Ymy3YNmmTFGUS5lwew==
X-Google-Smtp-Source: AGHT+IGGiudEmyxQxxClQZhcBXAIKfShE/2fjOTgqifTILv3lcTryYRr7+QwmmD2B8/WoEMY5JxgXGuQKOchzSuPpZo=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a05:6902:726:b0:dfa:fda1:51d with
 SMTP id 3f1490d57ef6-dff15396b94mr1172855276.7.1718647105713; Mon, 17 Jun
 2024 10:58:25 -0700 (PDT)
Date: Mon, 17 Jun 2024 17:58:19 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=4931; i=samitolvanen@google.com;
 h=from:subject; bh=tXPKxVYsjjJsY1k10biTjwWu9hPJ9D/IhHpy6cm2zjA=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBmcHk6Z/HYbC7sBepRQ7DF3vVZPcrV2Gjy8PSbj
 8YYRZQ0CNWJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZnB5OgAKCRBMtfaEi7xW
 7me9C/9DTozoMNdY+G6oQtTtSWOgmdsJksSv/d5t7KR/HA+5t36B8GQs1ja7yUu/07ZOFuQ9uMb
 zJMIsw0QnLiQIbFlFxK9F7RSyuJcvb0xvAsQxoXFxHAOpqAkrsGTZh3x1Bj+tUBGoD5Yq8pKEuw
 F1xoQcyiroztYeuP5Ief6RwPZM4YQ8hTirr+08vrIA/M0VmTubz5/rKImANntU6lLTFApi+t3wv
 ezyk3Ok35Oz+5UXbgkEwxKvveXvU3YRMfYYvx+Si10MOGiANCmB10vdGtxZy+elsOusi5y8Ueef
 Tf3F5C6Z1R/kjvLZBqxKZo9jAWFDUskMkD75p79vOsle8o9zSnhiksZWJAobBlP/LYw8XinML3L
 NcTAlLWyH+8iZOw/mGF5DxlkiwLP3RYL0TChn64Ao1dA9s62dKkya1i5E9bDfcGhQaBvb6JVi63 6nDHreFm0Ha9rxDNxGgjBgZ6yvtO6h/AEwcYYim+anhu+3Xq5+PU6olV6pb9ggAbOQVqI=
X-Mailer: git-send-email 2.45.2.627.g7a2c4fd464-goog
Message-ID: <20240617175818.58219-17-samitolvanen@google.com>
Subject: [PATCH 00/15] Implement MODVERSIONS for Rust
From: Sami Tolvanen <samitolvanen@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi folks,

This series implements CONFIG_MODVERSIONS for Rust, an important
feature for distributions like Android that want to ship Rust
kernel modules, and depend on modversions to help ensure module ABI
compatibility.

There have been earlier proposals [1][2] that would allow Rust
modules to coexist with modversions, but none that actually implement
symbol versioning. Unlike C, Rust source code doesn't have sufficient
information about the final ABI, as the compiler has considerable
freedom in adjusting structure layout for improved performance [3],
for example, which makes using a source code parser like genksyms
a non-starter. Based on Matt's suggestion and previous feedback
from maintainers, this series uses DWARF debugging information for
computing versions. DWARF is an established and relatively stable
format, which includes all the necessary ABI details, and adding a
CONFIG_DEBUG_INFO dependency for Rust symbol versioning seems like a
reasonable trade-off.

The first 12 patches of this series add a small tool for computing
symbol versions from DWARF, called gendwarfksyms. When passed a list
of exported symbols, the tool generates an expanded type string
for each symbol, and computes symbol CRCs similarly to genksyms.
gendwarfksyms is written in C and uses libdw to process DWARF, mainly
because of the existing support for C host tools that use elfutils
(e.g., objtool).

Another compatibility issue is fitting the extremely long mangled
Rust symbol names into struct modversion_info, which can only hold
55-character names (on 64-bit systems). Previous proposals suggested
changing the structure to support longer names, but the conclusion was
that we cannot break userspace tools that parse the version table.

The next two patches of the series implement support for hashed
symbol names in struct modversion_info, where names longer than 55
characters are hashed, and the hash is stored in the name field. To
avoid breaking userspace tools, the binary hash is prefixed with a
null-terminated string containing the name of the hash function. While
userspace tools can later be updated to potentially produce more
useful information about the long symbols, this allows them to
continue working in the meantime.

The final patch allows CONFIG_MODVERSIONS to be selected with Rust,
provided that debugging information is also available.

[1] https://lore.kernel.org/lkml/20230111161155.1349375-1-gary@garyguo.net/
[2] https://lore.kernel.org/rust-for-linux/20231118025748.2778044-1-mmaurer@google.com/
[3] https://lore.kernel.org/rust-for-linux/CAGSQo005hRiUZdeppCifDqG9zFDJRwahpBLE4x7-MyfJscn7tQ@mail.gmail.com/

Sami


Sami Tolvanen (15):
  tools: Add gendwarfksyms
  gendwarfksyms: Add symbol list input handling
  gendwarfksyms: Add CRC calculation
  gendwarfksyms: Expand base_type
  gendwarfksyms: Add a cache
  gendwarfksyms: Expand type modifiers and typedefs
  gendwarfksyms: Add pretty-printing
  gendwarfksyms: Expand subroutine_type
  gendwarfksyms: Expand array_type
  gendwarfksyms: Expand structure types
  gendwarfksyms: Limit structure expansion
  gendwarfksyms: Add inline debugging
  modpost: Add support for hashing long symbol names
  module: Support hashed symbol names when checking modversions
  kbuild: Use gendwarfksyms to generate Rust symbol versions

 Makefile                            |   6 +
 init/Kconfig                        |   2 +-
 kernel/module/version.c             |  38 +-
 rust/Makefile                       |  30 +-
 scripts/mod/Makefile                |   4 +-
 scripts/mod/modpost.c               |  20 +-
 scripts/mod/modpost.h               |  20 +
 scripts/mod/symhash.c               | 327 +++++++++++++
 tools/Makefile                      |  11 +-
 tools/gendwarfksyms/Build           |   5 +
 tools/gendwarfksyms/Makefile        |  49 ++
 tools/gendwarfksyms/cache.c         | 209 +++++++++
 tools/gendwarfksyms/crc32.c         |  69 +++
 tools/gendwarfksyms/crc32.h         |  34 ++
 tools/gendwarfksyms/gendwarfksyms.c | 141 ++++++
 tools/gendwarfksyms/gendwarfksyms.h | 173 +++++++
 tools/gendwarfksyms/symbols.c       | 193 ++++++++
 tools/gendwarfksyms/types.c         | 697 ++++++++++++++++++++++++++++
 18 files changed, 2008 insertions(+), 20 deletions(-)
 create mode 100644 scripts/mod/symhash.c
 create mode 100644 tools/gendwarfksyms/Build
 create mode 100644 tools/gendwarfksyms/Makefile
 create mode 100644 tools/gendwarfksyms/cache.c
 create mode 100644 tools/gendwarfksyms/crc32.c
 create mode 100644 tools/gendwarfksyms/crc32.h
 create mode 100644 tools/gendwarfksyms/gendwarfksyms.c
 create mode 100644 tools/gendwarfksyms/gendwarfksyms.h
 create mode 100644 tools/gendwarfksyms/symbols.c
 create mode 100644 tools/gendwarfksyms/types.c


base-commit: 6ba59ff4227927d3a8530fc2973b80e94b54d58f
-- 
2.45.2.627.g7a2c4fd464-goog


