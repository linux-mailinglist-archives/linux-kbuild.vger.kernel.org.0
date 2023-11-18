Return-Path: <linux-kbuild+bounces-45-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D7C7EFD47
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Nov 2023 03:58:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 29B34B20C23
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Nov 2023 02:58:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAF3115CA;
	Sat, 18 Nov 2023 02:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tuNl5Lb5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3182610CE
	for <linux-kbuild@vger.kernel.org>; Fri, 17 Nov 2023 18:58:07 -0800 (PST)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-daee86e2d70so3209868276.0
        for <linux-kbuild@vger.kernel.org>; Fri, 17 Nov 2023 18:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1700276286; x=1700881086; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QcqINJQ5diQHGOPsun01LVrGFl32Nw5/hV5eaRRLRg8=;
        b=tuNl5Lb5paQT0f052qeluQ+0tAGSdmaA/l4/8oASX0hOCpYfkhl30eZ7b/IQL0wQQl
         zXSOKlZy8pE3mjni/S0A1F5EC95HJ4exsuFi76fQR9wU8gCyEANaDN1uJCGtM+CVSacm
         Z8q6Hbo9ARDcAp+A/s/EunkKfcR2wB4oySt8s1gG2LUiDe+FKWGoZdaDO5ZQOXug2G9q
         AW5U9X6Kq5bYFCfDjkmoZuI2Eyj1kbJKSy2gL1Js6nep5EbeGxQRfDz4tA8gHABKUNhX
         bQu3MYQ0gPMUWFcNMtBdWx5FJM4FfstCMUkGb2jOaGTqGJs25RCPBbK4R9z0+K6CP2EN
         wAUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700276286; x=1700881086;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QcqINJQ5diQHGOPsun01LVrGFl32Nw5/hV5eaRRLRg8=;
        b=qXCZpF83z9RyId2Ty2tgKdbe+D9yMeqvDuMPPqdxuhGx30W0i1eMsvqv6Sy837K85k
         RXs9I3Q0oQiB6D+Lch7w6Do7sXoDRb84PVt+4sn3h8Im7qcifgRjoTeHT/gaLFJonSFt
         wQEAskgqTpDpKMYedQRajA+J9sIAerwY77CYPCW3bMlFcW1brFJlptZ2jE9wxzh9ouom
         z895X7Y07Vs3XOTBOQuzpuOGIlq4y1ebctIdyXEgwJYcX2wlD5Vjfw6PYr+VHODfWLLN
         9iYptmU5EhTdoDb+hShIZnMgeUX6e5Oh+qsVlOyf38wNQyRllQo32lkoGaaEHRobT3AZ
         +DIg==
X-Gm-Message-State: AOJu0YxE9avgCYY2Bb9e7F0fyvGWhphoVtSY6SCvjiFQkHgcnFR8SziE
	bd4LJW/nJzocZOZaTuGpIVX7Uqe3hmXB
X-Google-Smtp-Source: AGHT+IEipLfYfNhkIRCz9BLTKi/Q07W5+qhbxpM56Qf4WuGm87G6Dh+mgTSQvuA9zn4iAz2ODTBXSWhTbmQj
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a25:abe3:0:b0:d9c:c9a8:8c27 with SMTP id
 v90-20020a25abe3000000b00d9cc9a88c27mr27045ybi.13.1700276286411; Fri, 17 Nov
 2023 18:58:06 -0800 (PST)
Date: Sat, 18 Nov 2023 02:54:41 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0.rc0.421.g78406f8d94-goog
Message-ID: <20231118025748.2778044-1-mmaurer@google.com>
Subject: [PATCH v2 0/5] MODVERSIONS + RUST Redux
From: Matthew Maurer <mmaurer@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Luis Chamberlain <mcgrof@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Laura Abbott <laura@labbott.name>, Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="UTF-8"

The goal of this patch series is to allow MODVERSIONS and RUST to be
enabled simultaneously. The primary issue with doing this at the moment
is that Rust uses some extremely long symbol names - for those
unfamiliar with Rust, it may be helpful to think of some of the mangled
C++ names you may have seen in binaries in the past.

Previously, Gary Guo attempted to accomplish this by modifying the
existing modversion format [1] to support variable-length symbol names.
This was unfortunately considered to be a potential userspace break
because kmod tools inspect this kernel module metadata. Masahiro Yamada
suggested [2] that this could instead be done with a section per-field.
This gives us the ability to be more flexible with this format in the
future, as a new field or additional information will be in a new
section which userspace tools will not yet attempt to read.

In the previous version of this patchset, Luis Chamberlain suggested [3]
I move validation out of the version checking and into the elf validity
checker, and also add kernel-docs over there. I found
elf_validity_cached_copy to be fairly dense and difficult to directly
describe, so I refactored it into easier to explain pieces. In the
process, I found a few missing checks and added those as well. See
[PATCH 2/5] for more details. If this is too much, I'm more than happy
to drop this patch from the series in favor of just adding the
kernel-doc to the original code, but figured I'd offer it up in case the
added clarity and checks were valuable.

[1] https://lore.kernel.org/lkml/20230111161155.1349375-1-gary@garyguo.net/
[2] https://lore.kernel.org/lkml/CAK7LNATsuszFR7JB5ZkqVS1W=hWr9=E7bTf+MvgJ+NXT3aZNwg@mail.gmail.com/
[3] https://lore.kernel.org/lkml/ZVZNh%2FPA5HiVRkeb@bombadil.infradead.org/

Matthew Maurer (5):
  export_report: Rehabilitate script
  modules: Refactor + kdoc elf_validity_cached_copy
  modpost: Extended modversion support
  rust: Allow MODVERSIONS
  export_report: Use new version info format

 arch/powerpc/kernel/module_64.c |  25 +-
 init/Kconfig                    |   1 -
 kernel/module/internal.h        |  18 +-
 kernel/module/main.c            | 663 +++++++++++++++++++++++++-------
 kernel/module/version.c         |  43 +++
 scripts/export_report.pl        |  17 +-
 scripts/mod/modpost.c           |  37 +-
 7 files changed, 642 insertions(+), 162 deletions(-)

-- 
2.43.0.rc0.421.g78406f8d94-goog


