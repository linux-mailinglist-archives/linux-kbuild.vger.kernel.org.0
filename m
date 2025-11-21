Return-Path: <linux-kbuild+bounces-9741-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 691E8C7764A
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Nov 2025 06:36:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1317735ADE6
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Nov 2025 05:36:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B8C223D7E6;
	Fri, 21 Nov 2025 05:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZQc4wtAs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEAA1C5D59;
	Fri, 21 Nov 2025 05:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763703412; cv=none; b=US7112I/FFGXVDXVlB7cI9OvUs9uNwC/kdC8nBumNE3iiqN3CmMp6yAcIDxjnA9Cxcdkwzrxxk/E0lDKcZFLkEDNREb+WoQ7fASuR6zP7OjooqQHEtCX/t30mWM7+y4f1F3wb51OtEZZM53NC4J1o5hPrmuf+X/0REAjHcqMC1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763703412; c=relaxed/simple;
	bh=2VrQ38FIFiWwiH1vGJJMobf1X4chDQ5tZJgj+nFSGbQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SgcvdbsZj+t+dUH8Yx8GNwgVTNvV5hECdanqiGrCCrh/I2tCBiTvl6OBqxr74AgDh11w3iyumYAxJiEksgVVte9Ft4pncgqsQ3XZeS4PwD6JLJf/2vRsCitg885OXbaa2tYkDAcZYUaJaTh3Le/Bitzf8+P2WAiZ2ghOXWJvkHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZQc4wtAs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03665C4CEF1;
	Fri, 21 Nov 2025 05:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763703411;
	bh=2VrQ38FIFiWwiH1vGJJMobf1X4chDQ5tZJgj+nFSGbQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZQc4wtAsuIpBtcwWZgBOwB4qL0RwjV4q084aoXi/NEl8mSpkum2EsivBgIr0w6ttj
	 KKRp5gSTpHUQYHrEPYpsq1ZRHUwrfuNDngjdavrcvNBRkE0UL9WM5s5O0sik7ObCMF
	 ea0kTuqqumFobMEHud62Pd6xdXppRYhB0brZ+dSIckRYNJWWPCPPKhfhwTcBxwZbiN
	 AVabAWWVl6wFw3rZTw/ADUAcbE+Spv5VtdsJZi40lczK+dHn41GfPeolKDuSPQlGNt
	 /diSv0K/68TCTYA68ODMitehUX4vVy+OSlmDgJX/cOBM2YyOVqyYdb+v5jVh3nEbdA
	 /lX1FgLN8tOcg==
From: Miguel Ojeda <ojeda@kernel.org>
To: y.j3ms.n@gmail.com
Cc: a.hindborg@kernel.org,
	alex.gaynor@gmail.com,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	dakr@kernel.org,
	gary@garyguo.net,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lossin@kernel.org,
	nathan@kernel.org,
	nicolas@fjasle.eu,
	ojeda@kernel.org,
	patches@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu
Subject: Re: [PATCH 00/18] `syn` support
Date: Fri, 21 Nov 2025 06:36:33 +0100
Message-ID: <20251121053633.1594703-1-ojeda@kernel.org>
In-Reply-To: <20251121043750.298843-1-y.j3ms.n@gmail.com>
References: <20251121043750.298843-1-y.j3ms.n@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 21 Nov 2025 04:37:47 +0000 Jesung Yang <y.j3ms.n@gmail.com> wrote:
>
> I'd appreciate any guidance on steps I might be missing. Thanks in
> advance!

For using (all of) them from `macros`, you would need [1].

Maybe I should just put it on top of this series for convenience.

Cheers,
Miguel

diff --git a/rust/Makefile b/rust/Makefile
index 984aec608c27..640e51129be0 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -187,7 +187,7 @@ rustdoc-syn: $(src)/syn/lib.rs rustdoc-clean rustdoc-quote FORCE

 rustdoc-macros: private rustdoc_host = yes
 rustdoc-macros: private rustc_target_flags = --crate-type proc-macro \
-    --extern proc_macro
+    --extern proc_macro --extern proc_macro2 --extern quote --extern syn
 rustdoc-macros: $(src)/macros/lib.rs rustdoc-clean rustdoc-proc_macro2 \
     rustdoc-quote rustdoc-syn FORCE
        +$(call if_changed,rustdoc)
@@ -265,9 +265,11 @@ rusttestlib-syn: private rustc_target_flags = $(syn-flags)
 rusttestlib-syn: $(src)/syn/lib.rs rusttestlib-quote FORCE
        +$(call if_changed,rustc_test_library)

-rusttestlib-macros: private rustc_target_flags = --extern proc_macro
+rusttestlib-macros: private rustc_target_flags = --extern proc_macro \
+    --extern proc_macro2 --extern quote --extern syn
 rusttestlib-macros: private rustc_test_library_proc = yes
-rusttestlib-macros: $(src)/macros/lib.rs FORCE
+rusttestlib-macros: $(src)/macros/lib.rs \
+    rusttestlib-proc_macro2 rusttestlib-quote rusttestlib-syn FORCE
        +$(call if_changed,rustc_test_library)

 rusttestlib-pin_init_internal: private rustc_target_flags = --cfg kernel \
@@ -348,7 +350,8 @@ quiet_cmd_rustc_test = $(RUSTC_OR_CLIPPY_QUIET) T  $<
 rusttest: rusttest-macros

 rusttest-macros: private rustc_target_flags = --extern proc_macro \
-       --extern macros --extern kernel --extern pin_init
+       --extern macros --extern kernel --extern pin_init \
+       --extern proc_macro2 --extern quote --extern syn
 rusttest-macros: private rustdoc_test_target_flags = --crate-type proc-macro
 rusttest-macros: $(src)/macros/lib.rs \
     rusttestlib-macros rusttestlib-kernel rusttestlib-pin_init FORCE
@@ -538,6 +541,8 @@ quiet_cmd_rustc_procmacro = $(RUSTC_OR_CLIPPY_QUIET) P $@
                @$(objtree)/include/generated/rustc_cfg $<

 # Procedural macros can only be used with the `rustc` that compiled it.
+$(obj)/$(libmacros_name): private rustc_target_flags = \
+    --extern proc_macro2 --extern quote --extern syn
 $(obj)/$(libmacros_name): $(src)/macros/lib.rs $(obj)/libproc_macro2.rlib \
     $(obj)/libquote.rlib $(obj)/libsyn.rlib FORCE
        +$(call if_changed_dep,rustc_procmacro)

