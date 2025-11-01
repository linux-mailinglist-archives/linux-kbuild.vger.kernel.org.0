Return-Path: <linux-kbuild+bounces-9357-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D47E6C28811
	for <lists+linux-kbuild@lfdr.de>; Sat, 01 Nov 2025 22:39:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86FC63B13D2
	for <lists+linux-kbuild@lfdr.de>; Sat,  1 Nov 2025 21:39:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 681902727FE;
	Sat,  1 Nov 2025 21:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UDVNjc+2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3166E18991E;
	Sat,  1 Nov 2025 21:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762033156; cv=none; b=PV59gDI03uZ/gStl8vtx7pjoiaQMqXWpHQzuHFcDG4CoptqB+4IxdVbkgef5QkeEGReq3Y//Qy9zYZVrgMkDXsu8ZrcPuP9wXxwYBAgP0BWCPRFCIH9e1vBqiqAexuFNW81sgzqwXxeRpBnPHLYsdBy5t5tIy7g+o0a2bRS9kWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762033156; c=relaxed/simple;
	bh=PIbJrvVkofSgsg6Fu78fTICs5kcAQfLLG7Xmzmf8J8Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AUVLpY30ZuYd5IqI3/6JWaQgjjy8ooYgDp1tm4COqt+ogDAd+dR8DkfOy56nr6aNMgsOJCut0tq3ooGINHQpbSxQAiOHfyVYGpWFnbHPNgwbN/e98rzi+FbXBKzKjJVJXnmKu7FiNjVMjvAvB6LN9x0SlOnyQwWb8cMokFXnJ6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UDVNjc+2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6D18C4CEF1;
	Sat,  1 Nov 2025 21:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762033155;
	bh=PIbJrvVkofSgsg6Fu78fTICs5kcAQfLLG7Xmzmf8J8Y=;
	h=Date:Reply-To:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UDVNjc+2AK9PR0FV8xZY9ymslhNnyJD424G+Zdxnl4Rj05k5XKLUiaoNJjWByy13y
	 ++e10JG9YTqAcrpU8SxfIf4R7ElkmwOVpCAB5yP9S4jQkENw99DcsDGpAbJFGyBaAR
	 1DYZHcyo2+Cr1IkAjZg9GQW+ZX6dp7TRjBSDtHc3HiW/UcKkNS+0ecgEeoHenLEfj0
	 RnY4dcHMRSw9YiJXL4aslwNTdsTgqEL4bvxceClNFHvDCL3gAizz+IY10GIb+DvLOI
	 w8JoPvfVJ55+fxWgschILny744ODKOcFa/++e9AttrhF9m6QeOFQCv7NCdotHcf8SV
	 +JXABEc/qgrzQ==
Message-ID: <49af6d76-bcb7-4343-8903-390040e2c49b@kernel.org>
Date: Sat, 1 Nov 2025 22:39:08 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Daniel Gomez <da.gomez@kernel.org>
Subject: Re: [PATCH v18 0/7] rust: extend `module!` macro with integer
 parameter support
To: Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda
 <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Alice Ryhl <aliceryhl@google.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Trevor Gross <tmgross@umich.edu>, Adam Bratschi-Kaye
 <ark.email@gmail.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>,
 Daniel Gomez <da.gomez@samsung.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 Greg KH <gregkh@linuxfoundation.org>, Fiona Behrens <me@kloenk.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, linux-modules@vger.kernel.org
References: <20250924-module-params-v3-v18-0-bf512c35d910@kernel.org>
Content-Language: en-US
From: Daniel Gomez <da.gomez@kernel.org>
Organization: kernel.org
In-Reply-To: <20250924-module-params-v3-v18-0-bf512c35d910@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/09/2025 14.39, Andreas Hindborg wrote:
> Extend the `module!` macro with support module parameters. Also add some
> string to integer parsing functions.
> 
> Based on the original module parameter support by Miguel [1],
> later extended and generalized by Adam for more types [2][3].
> Originally tracked at [4].
> 
> Link: https://github.com/Rust-for-Linux/linux/pull/7 [1]
> Link: https://github.com/Rust-for-Linux/linux/pull/82 [2]
> Link: https://github.com/Rust-for-Linux/linux/pull/87 [3]
> Link: https://github.com/Rust-for-Linux/linux/issues/11 [4]
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

I tested this series with rust_minimal module. They LGTM,

Tested-by: Daniel Gomez <da.gomez@samsung.com>

The patches did not apply cleanly to v6.18-rc3, at least not when using b4.
However, when applying them to the base commit and then rebasing onto v6.18-rc3,
I didn't see any conflicts.

I've created a temporary branch with this rebase here:

https://git.kernel.org/pub/scm/linux/kernel/git/modules/linux.git/log/?h=rebase/20250924-module-params-v3-v18-0-bf512c35d910@kernel.org

Can you take a look when you can? I'll merge this shortly after checking with
Uwe, as there are some minor conflicts with his tree.

+ Uwe

These are the conflicts I see when merging the patch series from Michal [1]
(Introduce import_ns support for Rust). I believe these are trivial things that
we will get notified from linux-next merging. But let me know what you think as
you have requested in that thread.

[1] Link: https://lore.kernel.org/all/20251028-pwm_fixes-v1-0-25a532d31998@samsung.com/

...
Applying: rust: macros: Add support for 'imports_ns' to module!
Patch failed at 0008 rust: macros: Add support for 'imports_ns' to module!
error: patch failed: rust/macros/module.rs:98
error: rust/macros/module.rs: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
hint: When you have resolved this problem, run "git am --continue".
hint: If you prefer to skip this patch, run "git am --skip" instead.
hint: To restore the original branch and stop patching, run "git am --abort".
hint: Disable this message with "git config set advice.mergeConflict false"

git am --show-current-patch=diff
---
 rust/macros/module.rs | 8 ++++++++
 1 file changed, 8 insertions(+)
---
 rust/macros/module.rs | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/rust/macros/module.rs b/rust/macros/module.rs
index 5ee54a00c0b65699596e660b2d4d60e64be2a50c..408cd115487514c8be79724d901c676435696376 100644
--- a/rust/macros/module.rs
+++ b/rust/macros/module.rs
@@ -98,6 +98,7 @@ struct ModuleInfo {
     description: Option<String>,
     alias: Option<Vec<String>>,
     firmware: Option<Vec<String>>,
+    imports_ns: Option<Vec<String>>,
 }

 impl ModuleInfo {
@@ -112,6 +113,7 @@ fn parse(it: &mut token_stream::IntoIter) -> Self {
             "license",
             "alias",
             "firmware",
+            "imports_ns",
         ];
         const REQUIRED_KEYS: &[&str] = &["type", "name", "license"];
         let mut seen_keys = Vec::new();
@@ -137,6 +139,7 @@ fn parse(it: &mut token_stream::IntoIter) -> Self {
                 "license" => info.license = expect_string_ascii(it),
                 "alias" => info.alias = Some(expect_string_array(it)),
                 "firmware" => info.firmware = Some(expect_string_array(it)),
+                "imports_ns" => info.imports_ns = Some(expect_string_array(it)),
                 _ => panic!("Unknown key \"{key}\". Valid keys are: {EXPECTED_KEYS:?}."),
             }

@@ -195,6 +198,11 @@ pub(crate) fn module(ts: TokenStream) -> TokenStream {
             modinfo.emit("firmware", &fw);
         }
     }
+    if let Some(imports) = info.imports_ns {
+        for ns in imports {
+            modinfo.emit("import_ns", &ns);
+        }
+    }

     // Built-in modules also export the `file` modinfo string.
     let file =

