Return-Path: <linux-kbuild+bounces-12157-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qD3hGgk8wWkZRwQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12157-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 14:11:37 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5192F2918
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 14:11:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 846B5308334E
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 13:02:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B20F1CAA68;
	Mon, 23 Mar 2026 13:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XZRvS2W0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF5945948;
	Mon, 23 Mar 2026 13:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774270964; cv=none; b=IyE65ldSRugVMxV6vCuR+p4UFJIWXUexdk7FkjmgjLgKQZoEix9EB/zlwPEBKf49Hnc2Ed4zyPtS5sKcCU0C7Y3J4+evWhJNd4kI7Ch7YWc8Pf7zCszKNwqx/I4cOqDWj91qzljkOEnxwVDHSRnM7ygnolRjq57SyZHqD+LlZg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774270964; c=relaxed/simple;
	bh=dGugYsSSm0m+CsRJX9rAmm9p56BnzRQocyVfqD5UzNA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XbXIaI2Bqr6XDDgLdYNcZmV2pEYX83L8ascmzdXX6TNXFY7cyV3Q7pIXHnnC9FOuBltKz7SMHHtFc45HXQgj7VZHZMUywOpfttx5LfeEcBlkKNdD0njw1qoPE8GDvUVVd5p5DjGwSJzm+HUC11O0CMlMFFZf0R3wG86iNCWeQ88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XZRvS2W0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 933D6C2BCB9;
	Mon, 23 Mar 2026 13:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774270963;
	bh=dGugYsSSm0m+CsRJX9rAmm9p56BnzRQocyVfqD5UzNA=;
	h=From:To:Cc:Subject:Date:From;
	b=XZRvS2W0yDwJGkYRoGtIMBrCwJq8z7PVHuP4SrwWTsSj7js/eOHCF0+0VTnxbRk6u
	 jbnqa3DX7i884VhLZ+Mx2FU+fLpvNjKr64y8f3BN+zucXHT1qVSseWLcyFsoMmnMd4
	 Ly41hAmEGdIMJH0Lv0SRXZvDLGxV0Cq2lusVcgA7f5SpxkTtisX5X9DZuadXumJVPK
	 0FcfdE0UYfQ4f8esGYigOANzfFQVrvhcBodrQAjwVdEKOUk5a8fQJ52wdYFKBFcUkH
	 tziWh6WNVUJ4k8RUwH8hCtfhjHCN5sAzxeQ/tWuV+0umzz3Dr5G9x90eBrGLwg/PWX
	 Xoa9n7tq/KBXQ==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <christian@brauner.io>,
	Carlos Llamas <cmllamas@google.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org,
	Aaron Ballman <aaron@aaronballman.com>,
	Bill Wendling <isanbard@gmail.com>,
	Cole Nixon <nixontcole@gmail.com>,
	Connor Kuehl <cipkuehl@gmail.com>,
	Fangrui Song <i@maskray.me>,
	James Foster <jafosterja@gmail.com>,
	Jeff Takahashi <jeffrey.takahashi@gmail.com>,
	Jordan Cantrell <jordan.cantrell@mail.com>,
	Matthew Maurer <mmaurer@google.com>,
	Nikk Forbus <nicholas.forbus@gmail.com>,
	Qing Zhao <qing.zhao@oracle.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Tim Pugh <nwtpugh@gmail.com>,
	Kees Cook <kees@kernel.org>
Subject: [PATCH v2] rust: allow Clang-native `RANDSTRUCT` configs
Date: Mon, 23 Mar 2026 14:02:24 +0100
Message-ID: <20260323130224.165738-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,gmail.com,google.com,lists.linux.dev,aaronballman.com,maskray.me,mail.com,oracle.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[37];
	TAGGED_FROM(0.00)[bounces-12157-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ojeda@kernel.org,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3E5192F2918
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The kernel supports `RANDSTRUCT_FULL` with Clang 16+, and `bindgen`
(which uses `libclang` under the hood) inherits the information, so the
generated bindings look correct.

For instance, running:

    bindgen x.h -- -frandomize-layout-seed=100

with:

    struct S1 {
        int a;
        int b;
    };

    struct S2 {
        int a;
        int b;
    } __attribute__((randomize_layout));

    struct S3 {
        void (*a)(void);
        void (*b)(void);
    };

    struct S4 {
        void (*a)(void);
        void (*b)(void);
    } __attribute__((no_randomize_layout));

may swap `S2`'s and `S3`'s members, but not `S1`'s nor `S4`'s:

    pub struct S1 {
        pub a: ::std::os::raw::c_int,
        pub b: ::std::os::raw::c_int,
    }

    pub struct S2 {
        pub b: ::std::os::raw::c_int,
        pub a: ::std::os::raw::c_int,
    }

    pub struct S3 {
        pub b: ::std::option::Option<unsafe extern "C" fn()>,
        pub a: ::std::option::Option<unsafe extern "C" fn()>,
    }

    pub struct S4 {
        pub a: ::std::option::Option<unsafe extern "C" fn()>,
        pub b: ::std::option::Option<unsafe extern "C" fn()>,
    }

Thus allow those configurations by requiring a Clang compiler to use
`RANDSTRUCT`. In addition, remove the `!GCC_PLUGIN_RANDSTRUCT` check
since it is not needed.

A simpler alternative would be to remove the `!RANDSTRUCT` check (keeping
the `!GCC_PLUGIN_RANDSTRUCT` one). However, if in the future GCC starts
supporting `RANDSTRUCT` natively, it would be likely that it would not
work unless GCC and Clang agree on the exact semantics of the flag. And,
as far as I can see, so far the randomization in Clang does not seem to be
guaranteed to remain stable across versions or platforms, i.e. only for a
given compiler Clang binary, given it is not documented and that LLVM's
`HEAD` has the revert in place for the expected field names in the test
(LLVM commit 8dbc6b560055 ("Revert "[randstruct] Check final randomized
layout ordering"")) [1][2]. And the GCC plugin definitely does not match,
e.g. its RNG is different (`std::mt19937` vs Bob Jenkins').

And given it is not supposed to be guaranteed to remain stable across
versions, it is a good idea to match the Clang and `bindgen`'s
`libclang` versions -- we already have a warning for that in
`scripts/rust_is_available.sh`. In the future, it would also be good to
have a build test to double-check layouts do actually match (but that
is true regardless of this particular feature).

Finally, make a few required small changes to take into account the
anonymous struct used in `randomized_struct_fields_*` in `struct
task_struct`.

[ Andreas writes:

    Tested with the rust null block driver patch series [1]. I did a
    few functional verification tests and a set of performance tests.

    For the rnull driver, enabling randstruct with this patch gives no
    statistically significant change to the average performance of the set
    of 120 workloads that we publish on [2]. Individual configurations see
    around 10% change in throughput, both directions.

    Link: https://lore.kernel.org/rust-for-linux/20260216-rnull-v6-19-rc5-send-v1-0-de9a7af4b469@kernel.org/ [1]
    Link: https://rust-for-linux.com/null-block-driver [2]

        - Miguel ]

Cc: Aaron Ballman <aaron@aaronballman.com>
Cc: Bill Wendling <isanbard@gmail.com>
Cc: Cole Nixon <nixontcole@gmail.com>
Cc: Connor Kuehl <cipkuehl@gmail.com>
Cc: Fangrui Song <i@maskray.me>
Cc: James Foster <jafosterja@gmail.com>
Cc: Jeff Takahashi <jeffrey.takahashi@gmail.com>
Cc: Jordan Cantrell <jordan.cantrell@mail.com>
Cc: Justin Stitt <justinstitt@google.com>
Cc: Matthew Maurer <mmaurer@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>
Cc: Nikk Forbus <nicholas.forbus@gmail.com>
Cc: Qing Zhao <qing.zhao@oracle.com>
Cc: Sami Tolvanen <samitolvanen@google.com>
Cc: Tim Pugh <nwtpugh@gmail.com>
Link: https://reviews.llvm.org/D121556
Link: https://github.com/llvm/llvm-project/commit/8dbc6b560055ff5068ff45b550482ba62c36b5a5 [1]
Link: https://reviews.llvm.org/D124199 [2]
Reviewed-by: Kees Cook <kees@kernel.org>
Tested-by: Andreas Hindborg <a.hindborg@kernel.org>
Link: https://patch.msgid.link/20241119185747.862544-1-ojeda@kernel.org
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
Ok, here is a rebased one in case it helps. Nowadays we have a couple
more instances in Binder.

I ran all the KUnit tests (nowadays we have way more compared to the
days of v1) with a bunch of debug options and for a few architectures.
Also did a run of all released Rust versions with x86_64. It would still
be nice to get more actual testing like Andreas' did with his driver,
but we will probably only get that if we actually go ahead...

Kees: do you want to do the other change directly?

 drivers/android/binder/deferred_close.rs | 29 ++++++++++++++++++---
 init/Kconfig                             |  3 +--
 rust/kernel/task.rs                      | 33 +++++++++++++++++++++---
 3 files changed, 57 insertions(+), 8 deletions(-)

diff --git a/drivers/android/binder/deferred_close.rs b/drivers/android/binder/deferred_close.rs
index ac895c04d0cb..edda56b7c4c0 100644
--- a/drivers/android/binder/deferred_close.rs
+++ b/drivers/android/binder/deferred_close.rs
@@ -69,9 +69,20 @@ pub(crate) fn close_fd(self, fd: u32) -> Result<(), DeferredFdCloseError> {
         // Task works are not available on kthreads.
         let current = kernel::current!();

-        // Check if this is a kthread.
         // SAFETY: Reading `flags` from a task is always okay.
-        if unsafe { ((*current.as_ptr()).flags & bindings::PF_KTHREAD) != 0 } {
+        let flags = unsafe {
+            #[cfg(not(CONFIG_RANDSTRUCT))]
+            {
+                (*current.as_ptr()).flags
+            }
+            #[cfg(CONFIG_RANDSTRUCT)]
+            {
+                (*current.as_ptr()).__bindgen_anon_1.flags
+            }
+        };
+
+        // Check if this is a kthread.
+        if (flags & bindings::PF_KTHREAD) != 0 {
             return Err(DeferredFdCloseError::TaskWorkUnavailable);
         }

@@ -135,6 +146,18 @@ pub(crate) fn close_fd(self, fd: u32) -> Result<(), DeferredFdCloseError> {
         // SAFETY: The `file` pointer points at a file with a non-zero refcount.
         unsafe { bindings::get_file(file) };

+        // SAFETY: Reading `files` from a task is always okay.
+        let files = unsafe {
+            #[cfg(not(CONFIG_RANDSTRUCT))]
+            {
+                (*current).files
+            }
+            #[cfg(CONFIG_RANDSTRUCT)]
+            {
+                (*current).__bindgen_anon_1.files
+            }
+        };
+
         // This method closes the fd, consuming one of our two refcounts. There could be active
         // light refcounts created from that fd, so we must ensure that the file has a positive
         // refcount for the duration of those active light refcounts. We do that by holding on to
@@ -145,7 +168,7 @@ pub(crate) fn close_fd(self, fd: u32) -> Result<(), DeferredFdCloseError> {
         // `current->files`.
         //
         // Note: fl_owner_t is currently a void pointer.
-        unsafe { bindings::filp_close(file, (*current).files as bindings::fl_owner_t) };
+        unsafe { bindings::filp_close(file, files as bindings::fl_owner_t) };

         // We update the file pointer that the task work is supposed to fput. This transfers
         // ownership of our last refcount.
diff --git a/init/Kconfig b/init/Kconfig
index 444ce811ea67..d3d0e8c95fb3 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -2173,8 +2173,7 @@ config RUST
 	depends on RUST_IS_AVAILABLE
 	select EXTENDED_MODVERSIONS if MODVERSIONS
 	depends on !MODVERSIONS || GENDWARFKSYMS
-	depends on !GCC_PLUGIN_RANDSTRUCT
-	depends on !RANDSTRUCT
+	depends on !RANDSTRUCT || CC_IS_CLANG
 	depends on !DEBUG_INFO_BTF || (PAHOLE_HAS_LANG_EXCLUDE && !LTO)
 	depends on !CFI || HAVE_CFI_ICALL_NORMALIZE_INTEGERS_RUSTC
 	select CFI_ICALL_NORMALIZE_INTEGERS if CFI
diff --git a/rust/kernel/task.rs b/rust/kernel/task.rs
index 049c8a4d45d8..a533f5be2469 100644
--- a/rust/kernel/task.rs
+++ b/rust/kernel/task.rs
@@ -207,7 +207,16 @@ pub fn as_ptr(&self) -> *mut bindings::task_struct {
     pub fn pid(&self) -> Pid {
         // SAFETY: The pid of a task never changes after initialization, so reading this field is
         // not a data race.
-        unsafe { *ptr::addr_of!((*self.as_ptr()).pid) }
+        unsafe {
+            #[cfg(not(CONFIG_RANDSTRUCT))]
+            {
+                *ptr::addr_of!((*self.as_ptr()).pid)
+            }
+            #[cfg(CONFIG_RANDSTRUCT)]
+            {
+                *ptr::addr_of!((*self.as_ptr()).__bindgen_anon_1.pid)
+            }
+        }
     }

     /// Returns the UID of the given task.
@@ -278,7 +287,16 @@ impl CurrentTask {
     pub fn mm(&self) -> Option<&MmWithUser> {
         // SAFETY: The `mm` field of `current` is not modified from other threads, so reading it is
         // not a data race.
-        let mm = unsafe { (*self.as_ptr()).mm };
+        let mm = unsafe {
+            #[cfg(not(CONFIG_RANDSTRUCT))]
+            {
+                (*self.as_ptr()).mm
+            }
+            #[cfg(CONFIG_RANDSTRUCT)]
+            {
+                (*self.as_ptr()).__bindgen_anon_1.mm
+            }
+        };

         if mm.is_null() {
             return None;
@@ -337,7 +355,16 @@ pub fn active_pid_ns(&self) -> Option<&PidNamespace> {
     pub fn group_leader(&self) -> &Task {
         // SAFETY: The group leader of a task never changes while the task is running, and `self`
         // is the current task, which is guaranteed running.
-        let ptr = unsafe { (*self.as_ptr()).group_leader };
+        let ptr = unsafe {
+            #[cfg(not(CONFIG_RANDSTRUCT))]
+            {
+                (*self.as_ptr()).group_leader
+            }
+            #[cfg(CONFIG_RANDSTRUCT)]
+            {
+                (*self.as_ptr()).__bindgen_anon_1.group_leader
+            }
+        };

         // SAFETY: `current->group_leader` stays valid for at least the duration in which `current`
         // is running, and the signature of this function ensures that the returned `&Task` can

base-commit: bf074eb6891be799174ff42e0051492681fdc045
--
2.53.0

