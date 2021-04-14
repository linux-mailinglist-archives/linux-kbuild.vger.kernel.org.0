Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 945C135FB01
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Apr 2021 20:50:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347069AbhDNSr1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 14 Apr 2021 14:47:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:49476 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229701AbhDNSrU (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Apr 2021 14:47:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AD09761164;
        Wed, 14 Apr 2021 18:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618426018;
        bh=XJiJJuVwnvQcSLswwknj9/tLNfz/b73hBs7niCKIbBg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PiJ9YJ4wgh8W+55FH9RAXv9Hv+cpVoZAJxlpwLtEr8Om0QOxNHpSC+fCBCi1Rn4En
         8qi1F4Oe1BgtippF8RdbM68ccPdZeSlkz+4RsLVJcAbd762gq6dfkZKoR2mU3nqAC1
         oTYlMm4AwE2AmcC8/OJtY+o6q5V8q9+e4GvjJ6YZ8AQ14P+nSiP43cThCuLHDRN8U3
         5eZ8Gb7uxsrVQBSZYx4Jn9jt+ccuiEI0bBrrrSLkopAGKriY3g+0GbQDfPAXf2M0hc
         OBwGvO4spjUaZz7HNKakzFHxnz2NDkfWe3owbaxpcwNUBU+VuQzf3Vh/ShIrz3wKx8
         L1969oHp47Dig==
From:   ojeda@kernel.org
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
Subject: [PATCH 09/13] Samples: Rust examples
Date:   Wed, 14 Apr 2021 20:46:00 +0200
Message-Id: <20210414184604.23473-10-ojeda@kernel.org>
In-Reply-To: <20210414184604.23473-1-ojeda@kernel.org>
References: <20210414184604.23473-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Miguel Ojeda <ojeda@kernel.org>

A set of Rust modules that showcase how Rust modules look like
and how to use the abstracted kernel features.

At the moment we also use them as poor man's tests in our CI.
However, we plan to implement a proper testing framework.

The semaphore sample comes with a C version for comparison.

Co-developed-by: Alex Gaynor <alex.gaynor@gmail.com>
Signed-off-by: Alex Gaynor <alex.gaynor@gmail.com>
Co-developed-by: Geoffrey Thomas <geofft@ldpreload.com>
Signed-off-by: Geoffrey Thomas <geofft@ldpreload.com>
Co-developed-by: Finn Behrens <me@kloenk.de>
Signed-off-by: Finn Behrens <me@kloenk.de>
Co-developed-by: Adam Bratschi-Kaye <ark.email@gmail.com>
Signed-off-by: Adam Bratschi-Kaye <ark.email@gmail.com>
Co-developed-by: Wedson Almeida Filho <wedsonaf@google.com>
Signed-off-by: Wedson Almeida Filho <wedsonaf@google.com>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 samples/Kconfig                        |   2 +
 samples/Makefile                       |   1 +
 samples/rust/Kconfig                   | 103 ++++++++++++
 samples/rust/Makefile                  |  11 ++
 samples/rust/rust_chrdev.rs            |  66 ++++++++
 samples/rust/rust_minimal.rs           |  40 +++++
 samples/rust/rust_miscdev.rs           | 145 +++++++++++++++++
 samples/rust/rust_module_parameters.rs |  72 +++++++++
 samples/rust/rust_print.rs             |  58 +++++++
 samples/rust/rust_semaphore.rs         | 178 +++++++++++++++++++++
 samples/rust/rust_semaphore_c.c        | 212 +++++++++++++++++++++++++
 samples/rust/rust_stack_probing.rs     |  42 +++++
 samples/rust/rust_sync.rs              |  84 ++++++++++
 13 files changed, 1014 insertions(+)
 create mode 100644 samples/rust/Kconfig
 create mode 100644 samples/rust/Makefile
 create mode 100644 samples/rust/rust_chrdev.rs
 create mode 100644 samples/rust/rust_minimal.rs
 create mode 100644 samples/rust/rust_miscdev.rs
 create mode 100644 samples/rust/rust_module_parameters.rs
 create mode 100644 samples/rust/rust_print.rs
 create mode 100644 samples/rust/rust_semaphore.rs
 create mode 100644 samples/rust/rust_semaphore_c.c
 create mode 100644 samples/rust/rust_stack_probing.rs
 create mode 100644 samples/rust/rust_sync.rs

diff --git a/samples/Kconfig b/samples/Kconfig
index e76cdfc50e25..f1f8ba9bee82 100644
--- a/samples/Kconfig
+++ b/samples/Kconfig
@@ -216,4 +216,6 @@ config SAMPLE_WATCH_QUEUE
 	  Build example userspace program to use the new mount_notify(),
 	  sb_notify() syscalls and the KEYCTL_WATCH_KEY keyctl() function.
 
+source "samples/rust/Kconfig"
+
 endif # SAMPLES
diff --git a/samples/Makefile b/samples/Makefile
index c3392a595e4b..68ba3b3da044 100644
--- a/samples/Makefile
+++ b/samples/Makefile
@@ -29,3 +29,4 @@ obj-$(CONFIG_SAMPLE_INTEL_MEI)		+= mei/
 subdir-$(CONFIG_SAMPLE_WATCHDOG)	+= watchdog
 subdir-$(CONFIG_SAMPLE_WATCH_QUEUE)	+= watch_queue
 obj-$(CONFIG_DEBUG_KMEMLEAK_TEST)	+= kmemleak/
+obj-$(CONFIG_SAMPLES_RUST)		+= rust/
diff --git a/samples/rust/Kconfig b/samples/rust/Kconfig
new file mode 100644
index 000000000000..8eb5d5ebdf00
--- /dev/null
+++ b/samples/rust/Kconfig
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: GPL-2.0
+
+menuconfig SAMPLES_RUST
+	bool "Rust samples"
+	depends on RUST
+	help
+	  You can build sample Rust kernel code here.
+
+	  If unsure, say N.
+
+if SAMPLES_RUST
+
+config SAMPLE_RUST_MINIMAL
+	tristate "Minimal"
+	help
+	  This option builds the Rust minimal module sample.
+
+	  To compile this as a module, choose M here:
+	  the module will be called rust_minimal.
+
+	  If unsure, say N.
+
+config SAMPLE_RUST_PRINT
+	tristate "Printing macros"
+	help
+	  This option builds the Rust printing macros sample.
+
+	  To compile this as a module, choose M here:
+	  the module will be called rust_print.
+
+	  If unsure, say N.
+
+config SAMPLE_RUST_MODULE_PARAMETERS
+	tristate "Module parameters"
+	help
+	  This option builds the Rust module parameters sample.
+
+	  To compile this as a module, choose M here:
+	  the module will be called rust_module_parameters.
+
+	  If unsure, say N.
+
+config SAMPLE_RUST_SYNC
+	tristate "Synchronisation primitives"
+	help
+	  This option builds the Rust synchronisation primitives sample.
+
+	  To compile this as a module, choose M here:
+	  the module will be called rust_sync.
+
+	  If unsure, say N.
+
+config SAMPLE_RUST_CHRDEV
+	tristate "Character device"
+	help
+	  This option builds the Rust character device sample.
+
+	  To compile this as a module, choose M here:
+	  the module will be called rust_chrdev.
+
+	  If unsure, say N.
+
+config SAMPLE_RUST_MISCDEV
+	tristate "Miscellaneous device"
+	help
+	  This option builds the Rust miscellaneous device sample.
+
+	  To compile this as a module, choose M here:
+	  the module will be called rust_miscdev.
+
+	  If unsure, say N.
+
+config SAMPLE_RUST_STACK_PROBING
+	tristate "Stack probing"
+	help
+	  This option builds the Rust stack probing sample.
+
+	  To compile this as a module, choose M here:
+	  the module will be called rust_stack_probing.
+
+	  If unsure, say N.
+
+config SAMPLE_RUST_SEMAPHORE
+	tristate "Semaphore"
+	help
+	  This option builds the Rust semaphore sample.
+
+	  To compile this as a module, choose M here:
+	  the module will be called rust_semaphore.
+
+	  If unsure, say N.
+
+config SAMPLE_RUST_SEMAPHORE_C
+	tristate "Semaphore (in C, for comparison)"
+	help
+	  This option builds the Rust semaphore sample (in C, for comparison).
+
+	  To compile this as a module, choose M here:
+	  the module will be called rust_semaphore_c.
+
+	  If unsure, say N.
+
+endif # SAMPLES_RUST
diff --git a/samples/rust/Makefile b/samples/rust/Makefile
new file mode 100644
index 000000000000..c53a71999d8f
--- /dev/null
+++ b/samples/rust/Makefile
@@ -0,0 +1,11 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_SAMPLE_RUST_MINIMAL)		+= rust_minimal.o
+obj-$(CONFIG_SAMPLE_RUST_PRINT)			+= rust_print.o
+obj-$(CONFIG_SAMPLE_RUST_MODULE_PARAMETERS)	+= rust_module_parameters.o
+obj-$(CONFIG_SAMPLE_RUST_SYNC)			+= rust_sync.o
+obj-$(CONFIG_SAMPLE_RUST_CHRDEV)		+= rust_chrdev.o
+obj-$(CONFIG_SAMPLE_RUST_MISCDEV)		+= rust_miscdev.o
+obj-$(CONFIG_SAMPLE_RUST_STACK_PROBING)		+= rust_stack_probing.o
+obj-$(CONFIG_SAMPLE_RUST_SEMAPHORE)		+= rust_semaphore.o
+obj-$(CONFIG_SAMPLE_RUST_SEMAPHORE_C)		+= rust_semaphore_c.o
diff --git a/samples/rust/rust_chrdev.rs b/samples/rust/rust_chrdev.rs
new file mode 100644
index 000000000000..e3231c4f4504
--- /dev/null
+++ b/samples/rust/rust_chrdev.rs
@@ -0,0 +1,66 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Rust character device sample
+
+#![no_std]
+#![feature(allocator_api, global_asm)]
+
+use alloc::boxed::Box;
+use core::pin::Pin;
+use kernel::prelude::*;
+use kernel::{
+    chrdev, cstr,
+    file_operations::{FileOpener, FileOperations},
+};
+
+module! {
+    type: RustChrdev,
+    name: b"rust_chrdev",
+    author: b"Rust for Linux Contributors",
+    description: b"Rust character device sample",
+    license: b"GPL v2",
+    params: {
+    },
+}
+
+struct RustFile;
+
+impl FileOpener<()> for RustFile {
+    fn open(_ctx: &()) -> KernelResult<Self::Wrapper> {
+        pr_info!("rust file was opened!\n");
+        Ok(Box::try_new(Self)?)
+    }
+}
+
+impl FileOperations for RustFile {
+    type Wrapper = Box<Self>;
+
+    kernel::declare_file_operations!();
+}
+
+struct RustChrdev {
+    _dev: Pin<Box<chrdev::Registration<2>>>,
+}
+
+impl KernelModule for RustChrdev {
+    fn init() -> KernelResult<Self> {
+        pr_info!("Rust character device sample (init)\n");
+
+        let mut chrdev_reg =
+            chrdev::Registration::new_pinned(cstr!("rust_chrdev"), 0, &THIS_MODULE)?;
+
+        // Register the same kind of device twice, we're just demonstrating
+        // that you can use multiple minors. There are two minors in this case
+        // because its type is `chrdev::Registration<2>`
+        chrdev_reg.as_mut().register::<RustFile>()?;
+        chrdev_reg.as_mut().register::<RustFile>()?;
+
+        Ok(RustChrdev { _dev: chrdev_reg })
+    }
+}
+
+impl Drop for RustChrdev {
+    fn drop(&mut self) {
+        pr_info!("Rust character device sample (exit)\n");
+    }
+}
diff --git a/samples/rust/rust_minimal.rs b/samples/rust/rust_minimal.rs
new file mode 100644
index 000000000000..21627ce5656e
--- /dev/null
+++ b/samples/rust/rust_minimal.rs
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Rust minimal sample
+
+#![no_std]
+#![feature(allocator_api, global_asm)]
+
+use kernel::prelude::*;
+
+module! {
+    type: RustMinimal,
+    name: b"rust_minimal",
+    author: b"Rust for Linux Contributors",
+    description: b"Rust minimal sample",
+    license: b"GPL v2",
+    params: {
+    },
+}
+
+struct RustMinimal {
+    message: String,
+}
+
+impl KernelModule for RustMinimal {
+    fn init() -> KernelResult<Self> {
+        pr_info!("Rust minimal sample (init)\n");
+        pr_info!("Am I built-in? {}\n", !cfg!(MODULE));
+
+        Ok(RustMinimal {
+            message: "on the heap!".to_owned(),
+        })
+    }
+}
+
+impl Drop for RustMinimal {
+    fn drop(&mut self) {
+        pr_info!("My message is {}\n", self.message);
+        pr_info!("Rust minimal sample (exit)\n");
+    }
+}
diff --git a/samples/rust/rust_miscdev.rs b/samples/rust/rust_miscdev.rs
new file mode 100644
index 000000000000..3d48f1e2fad3
--- /dev/null
+++ b/samples/rust/rust_miscdev.rs
@@ -0,0 +1,145 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Rust miscellaneous device sample
+
+#![no_std]
+#![feature(allocator_api, global_asm)]
+
+use alloc::{boxed::Box, sync::Arc};
+use core::pin::Pin;
+use kernel::prelude::*;
+use kernel::{
+    cstr,
+    file_operations::{File, FileOpener, FileOperations},
+    miscdev,
+    sync::{CondVar, Mutex},
+    user_ptr::{UserSlicePtrReader, UserSlicePtrWriter},
+    Error,
+};
+
+module! {
+    type: RustMiscdev,
+    name: b"rust_miscdev",
+    author: b"Rust for Linux Contributors",
+    description: b"Rust miscellaneous device sample",
+    license: b"GPL v2",
+    params: {
+    },
+}
+
+const MAX_TOKENS: usize = 3;
+
+struct SharedStateInner {
+    token_count: usize,
+}
+
+struct SharedState {
+    state_changed: CondVar,
+    inner: Mutex<SharedStateInner>,
+}
+
+impl SharedState {
+    fn try_new() -> KernelResult<Arc<Self>> {
+        let state = Arc::try_new(Self {
+            // SAFETY: `condvar_init!` is called below.
+            state_changed: unsafe { CondVar::new() },
+            // SAFETY: `mutex_init!` is called below.
+            inner: unsafe { Mutex::new(SharedStateInner { token_count: 0 }) },
+        })?;
+        // SAFETY: `state_changed` is pinned behind `Arc`.
+        let state_changed = unsafe { Pin::new_unchecked(&state.state_changed) };
+        kernel::condvar_init!(state_changed, "SharedState::state_changed");
+        // SAFETY: `inner` is pinned behind `Arc`.
+        let inner = unsafe { Pin::new_unchecked(&state.inner) };
+        kernel::mutex_init!(inner, "SharedState::inner");
+        Ok(state)
+    }
+}
+
+struct Token {
+    shared: Arc<SharedState>,
+}
+
+impl FileOpener<Arc<SharedState>> for Token {
+    fn open(shared: &Arc<SharedState>) -> KernelResult<Self::Wrapper> {
+        Ok(Box::try_new(Self {
+            shared: shared.clone(),
+        })?)
+    }
+}
+
+impl FileOperations for Token {
+    type Wrapper = Box<Self>;
+
+    kernel::declare_file_operations!(read, write);
+
+    fn read(&self, _: &File, data: &mut UserSlicePtrWriter, offset: u64) -> KernelResult<usize> {
+        // Succeed if the caller doesn't provide a buffer or if not at the start.
+        if data.is_empty() || offset != 0 {
+            return Ok(0);
+        }
+
+        {
+            let mut inner = self.shared.inner.lock();
+
+            // Wait until we are allowed to decrement the token count or a signal arrives.
+            while inner.token_count == 0 {
+                if self.shared.state_changed.wait(&mut inner) {
+                    return Err(Error::EINTR);
+                }
+            }
+
+            // Consume a token.
+            inner.token_count -= 1;
+        }
+
+        // Notify a possible writer waiting.
+        self.shared.state_changed.notify_all();
+
+        // Write a one-byte 1 to the reader.
+        data.write_slice(&[1u8; 1])?;
+        Ok(1)
+    }
+
+    fn write(&self, data: &mut UserSlicePtrReader, _offset: u64) -> KernelResult<usize> {
+        {
+            let mut inner = self.shared.inner.lock();
+
+            // Wait until we are allowed to increment the token count or a signal arrives.
+            while inner.token_count == MAX_TOKENS {
+                if self.shared.state_changed.wait(&mut inner) {
+                    return Err(Error::EINTR);
+                }
+            }
+
+            // Increment the number of token so that a reader can be released.
+            inner.token_count += 1;
+        }
+
+        // Notify a possible reader waiting.
+        self.shared.state_changed.notify_all();
+        Ok(data.len())
+    }
+}
+
+struct RustMiscdev {
+    _dev: Pin<Box<miscdev::Registration<Arc<SharedState>>>>,
+}
+
+impl KernelModule for RustMiscdev {
+    fn init() -> KernelResult<Self> {
+        pr_info!("Rust miscellaneous device sample (init)\n");
+
+        let state = SharedState::try_new()?;
+
+        Ok(RustMiscdev {
+            _dev: miscdev::Registration::new_pinned::<Token>(cstr!("rust_miscdev"), None, state)?,
+        })
+    }
+}
+
+impl Drop for RustMiscdev {
+    fn drop(&mut self) {
+        pr_info!("Rust miscellaneous device sample (exit)\n");
+    }
+}
diff --git a/samples/rust/rust_module_parameters.rs b/samples/rust/rust_module_parameters.rs
new file mode 100644
index 000000000000..d9b6de695384
--- /dev/null
+++ b/samples/rust/rust_module_parameters.rs
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Rust module parameters sample
+
+#![no_std]
+#![feature(allocator_api, global_asm)]
+
+use kernel::prelude::*;
+
+module! {
+    type: RustModuleParameters,
+    name: b"rust_module_parameters",
+    author: b"Rust for Linux Contributors",
+    description: b"Rust module parameters sample",
+    license: b"GPL v2",
+    params: {
+        my_bool: bool {
+            default: true,
+            permissions: 0,
+            description: b"Example of bool",
+        },
+        my_i32: i32 {
+            default: 42,
+            permissions: 0o644,
+            description: b"Example of i32",
+        },
+        my_str: str {
+            default: b"default str val",
+            permissions: 0o644,
+            description: b"Example of a string param",
+        },
+        my_usize: usize {
+            default: 42,
+            permissions: 0o644,
+            description: b"Example of usize",
+        },
+        my_array: ArrayParam<i32, 3> {
+            default: [0, 1],
+            permissions: 0,
+            description: b"Example of array",
+        },
+    },
+}
+
+struct RustModuleParameters;
+
+impl KernelModule for RustModuleParameters {
+    fn init() -> KernelResult<Self> {
+        pr_info!("Rust module parameters sample (init)\n");
+
+        {
+            let lock = THIS_MODULE.kernel_param_lock();
+            pr_info!("Parameters:\n");
+            pr_info!("  my_bool:    {}\n", my_bool.read());
+            pr_info!("  my_i32:     {}\n", my_i32.read(&lock));
+            pr_info!(
+                "  my_str:     {}\n",
+                core::str::from_utf8(my_str.read(&lock))?
+            );
+            pr_info!("  my_usize:   {}\n", my_usize.read(&lock));
+            pr_info!("  my_array:   {:?}\n", my_array.read());
+        }
+
+        Ok(RustModuleParameters)
+    }
+}
+
+impl Drop for RustModuleParameters {
+    fn drop(&mut self) {
+        pr_info!("Rust module parameters sample (exit)\n");
+    }
+}
diff --git a/samples/rust/rust_print.rs b/samples/rust/rust_print.rs
new file mode 100644
index 000000000000..ddfac800f425
--- /dev/null
+++ b/samples/rust/rust_print.rs
@@ -0,0 +1,58 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Rust printing macros sample
+
+#![no_std]
+#![feature(allocator_api, global_asm)]
+
+use kernel::prelude::*;
+
+module! {
+    type: RustPrint,
+    name: b"rust_print",
+    author: b"Rust for Linux Contributors",
+    description: b"Rust printing macros sample",
+    license: b"GPL v2",
+    params: {
+    },
+}
+
+struct RustPrint;
+
+impl KernelModule for RustPrint {
+    fn init() -> KernelResult<Self> {
+        pr_info!("Rust printing macros sample (init)\n");
+
+        pr_emerg!("Emergency message (level 0) without args\n");
+        pr_alert!("Alert message (level 1) without args\n");
+        pr_crit!("Critical message (level 2) without args\n");
+        pr_err!("Error message (level 3) without args\n");
+        pr_warn!("Warning message (level 4) without args\n");
+        pr_notice!("Notice message (level 5) without args\n");
+        pr_info!("Info message (level 6) without args\n");
+
+        pr_info!("A line that");
+        pr_cont!(" is continued");
+        pr_cont!(" without args\n");
+
+        pr_emerg!("{} message (level {}) with args\n", "Emergency", 0);
+        pr_alert!("{} message (level {}) with args\n", "Alert", 1);
+        pr_crit!("{} message (level {}) with args\n", "Critical", 2);
+        pr_err!("{} message (level {}) with args\n", "Error", 3);
+        pr_warn!("{} message (level {}) with args\n", "Warning", 4);
+        pr_notice!("{} message (level {}) with args\n", "Notice", 5);
+        pr_info!("{} message (level {}) with args\n", "Info", 6);
+
+        pr_info!("A {} that", "line");
+        pr_cont!(" is {}", "continued");
+        pr_cont!(" with {}\n", "args");
+
+        Ok(RustPrint)
+    }
+}
+
+impl Drop for RustPrint {
+    fn drop(&mut self) {
+        pr_info!("Rust printing macros sample (exit)\n");
+    }
+}
diff --git a/samples/rust/rust_semaphore.rs b/samples/rust/rust_semaphore.rs
new file mode 100644
index 000000000000..b7300d2aab6d
--- /dev/null
+++ b/samples/rust/rust_semaphore.rs
@@ -0,0 +1,178 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Rust semaphore sample
+//!
+//! A counting semaphore that can be used by userspace.
+//!
+//! The count is incremented by writes to the device. A write of `n` bytes results in an increment
+//! of `n`. It is decremented by reads; each read results in the count being decremented by 1. If
+//! the count is already zero, a read will block until another write increments it.
+//!
+//! This can be used in user space from the shell for example  as follows (assuming a node called
+//! `semaphore`): `cat semaphore` decrements the count by 1 (waiting for it to become non-zero
+//! before decrementing); `echo -n 123 > semaphore` increments the semaphore by 3, potentially
+//! unblocking up to 3 blocked readers.
+
+#![no_std]
+#![feature(allocator_api, global_asm)]
+
+use alloc::{boxed::Box, sync::Arc};
+use core::{
+    pin::Pin,
+    sync::atomic::{AtomicU64, Ordering},
+};
+use kernel::{
+    condvar_init, cstr, declare_file_operations,
+    file_operations::{File, FileOpener, FileOperations, IoctlCommand, IoctlHandler},
+    miscdev::Registration,
+    mutex_init,
+    prelude::*,
+    sync::{CondVar, Mutex},
+    user_ptr::{UserSlicePtrReader, UserSlicePtrWriter},
+    Error,
+};
+
+module! {
+    type: RustSemaphore,
+    name: b"rust_semaphore",
+    author: b"Rust for Linux Contributors",
+    description: b"Rust semaphore sample",
+    license: b"GPL v2",
+    params: {},
+}
+
+struct SemaphoreInner {
+    count: usize,
+    max_seen: usize,
+}
+
+struct Semaphore {
+    changed: CondVar,
+    inner: Mutex<SemaphoreInner>,
+}
+
+struct FileState {
+    read_count: AtomicU64,
+    shared: Arc<Semaphore>,
+}
+
+impl FileState {
+    fn consume(&self) -> KernelResult {
+        let mut inner = self.shared.inner.lock();
+        while inner.count == 0 {
+            if self.shared.changed.wait(&mut inner) {
+                return Err(Error::EINTR);
+            }
+        }
+        inner.count -= 1;
+        Ok(())
+    }
+}
+
+impl FileOpener<Arc<Semaphore>> for FileState {
+    fn open(shared: &Arc<Semaphore>) -> KernelResult<Box<Self>> {
+        Ok(Box::try_new(Self {
+            read_count: AtomicU64::new(0),
+            shared: shared.clone(),
+        })?)
+    }
+}
+
+impl FileOperations for FileState {
+    type Wrapper = Box<Self>;
+
+    declare_file_operations!(read, write, ioctl);
+
+    fn read(&self, _: &File, data: &mut UserSlicePtrWriter, offset: u64) -> KernelResult<usize> {
+        if data.is_empty() || offset > 0 {
+            return Ok(0);
+        }
+        self.consume()?;
+        data.write_slice(&[0u8; 1])?;
+        self.read_count.fetch_add(1, Ordering::Relaxed);
+        Ok(1)
+    }
+
+    fn write(&self, data: &mut UserSlicePtrReader, _offset: u64) -> KernelResult<usize> {
+        {
+            let mut inner = self.shared.inner.lock();
+            inner.count = inner.count.saturating_add(data.len());
+            if inner.count > inner.max_seen {
+                inner.max_seen = inner.count;
+            }
+        }
+
+        self.shared.changed.notify_all();
+        Ok(data.len())
+    }
+
+    fn ioctl(&self, file: &File, cmd: &mut IoctlCommand) -> KernelResult<i32> {
+        cmd.dispatch(self, file)
+    }
+
+    fn release(_obj: Box<Self>, _file: &File) {}
+}
+
+struct RustSemaphore {
+    _dev: Pin<Box<Registration<Arc<Semaphore>>>>,
+}
+
+impl KernelModule for RustSemaphore {
+    fn init() -> KernelResult<Self> {
+        pr_info!("Rust semaphore sample (init)\n");
+
+        let sema = Arc::try_new(Semaphore {
+            // SAFETY: `condvar_init!` is called below.
+            changed: unsafe { CondVar::new() },
+
+            // SAFETY: `mutex_init!` is called below.
+            inner: unsafe {
+                Mutex::new(SemaphoreInner {
+                    count: 0,
+                    max_seen: 0,
+                })
+            },
+        })?;
+
+        // SAFETY: `changed` is pinned behind `Arc`.
+        condvar_init!(Pin::new_unchecked(&sema.changed), "Semaphore::changed");
+
+        // SAFETY: `inner` is pinned behind `Arc`.
+        mutex_init!(Pin::new_unchecked(&sema.inner), "Semaphore::inner");
+
+        Ok(Self {
+            _dev: Registration::new_pinned::<FileState>(cstr!("rust_semaphore"), None, sema)?,
+        })
+    }
+}
+
+impl Drop for RustSemaphore {
+    fn drop(&mut self) {
+        pr_info!("Rust semaphore sample (exit)\n");
+    }
+}
+
+const IOCTL_GET_READ_COUNT: u32 = 0x80086301;
+const IOCTL_SET_READ_COUNT: u32 = 0x40086301;
+
+impl IoctlHandler for FileState {
+    fn read(&self, _: &File, cmd: u32, writer: &mut UserSlicePtrWriter) -> KernelResult<i32> {
+        match cmd {
+            IOCTL_GET_READ_COUNT => {
+                writer.write(&self.read_count.load(Ordering::Relaxed))?;
+                Ok(0)
+            }
+            _ => Err(Error::EINVAL),
+        }
+    }
+
+    fn write(&self, _: &File, cmd: u32, reader: &mut UserSlicePtrReader) -> KernelResult<i32> {
+        match cmd {
+            IOCTL_SET_READ_COUNT => {
+                self.read_count.store(reader.read()?, Ordering::Relaxed);
+                Ok(0)
+            }
+            _ => Err(Error::EINVAL),
+        }
+    }
+}
diff --git a/samples/rust/rust_semaphore_c.c b/samples/rust/rust_semaphore_c.c
new file mode 100644
index 000000000000..cdc121d4030d
--- /dev/null
+++ b/samples/rust/rust_semaphore_c.c
@@ -0,0 +1,212 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Rust semaphore sample (in C, for comparison)
+ *
+ * This is a C implementation of `rust_semaphore.rs`. Refer to the description
+ * in that file for details on the device.
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/miscdevice.h>
+#include <linux/module.h>
+#include <linux/fs.h>
+#include <linux/slab.h>
+#include <linux/refcount.h>
+#include <linux/wait.h>
+
+#define IOCTL_GET_READ_COUNT _IOR('c', 1, u64)
+#define IOCTL_SET_READ_COUNT _IOW('c', 1, u64)
+
+struct semaphore_state {
+	struct kref ref;
+	struct miscdevice miscdev;
+	wait_queue_head_t changed;
+	struct mutex mutex;
+	size_t count;
+	size_t max_seen;
+};
+
+struct file_state {
+	atomic64_t read_count;
+	struct semaphore_state *shared;
+};
+
+static int semaphore_consume(struct semaphore_state *state)
+{
+	DEFINE_WAIT(wait);
+
+	mutex_lock(&state->mutex);
+	while (state->count == 0) {
+		prepare_to_wait(&state->changed, &wait, TASK_INTERRUPTIBLE);
+		mutex_unlock(&state->mutex);
+		schedule();
+		finish_wait(&state->changed, &wait);
+		if (signal_pending(current))
+			return -EINTR;
+		mutex_lock(&state->mutex);
+	}
+
+	state->count--;
+	mutex_unlock(&state->mutex);
+
+	return 0;
+}
+
+static int semaphore_open(struct inode *nodp, struct file *filp)
+{
+	struct semaphore_state *shared =
+		container_of(filp->private_data, struct semaphore_state, miscdev);
+	struct file_state *state;
+
+	state = kzalloc(sizeof(*state), GFP_KERNEL);
+	if (!state)
+		return -ENOMEM;
+
+	kref_get(&shared->ref);
+	state->shared = shared;
+	atomic64_set(&state->read_count, 0);
+
+	filp->private_data = state;
+
+	return 0;
+}
+
+static ssize_t semaphore_write(struct file *filp, const char __user *buffer, size_t count,
+			       loff_t *ppos)
+{
+	struct file_state *state = filp->private_data;
+	struct semaphore_state *shared = state->shared;
+
+	mutex_lock(&shared->mutex);
+
+	shared->count += count;
+	if (shared->count < count)
+		shared->count = SIZE_MAX;
+
+	if (shared->count > shared->max_seen)
+		shared->max_seen = shared->count;
+
+	mutex_unlock(&shared->mutex);
+
+	wake_up_all(&shared->changed);
+
+	return count;
+}
+
+static ssize_t semaphore_read(struct file *filp, char __user *buffer,
+			      size_t count, loff_t *ppos)
+{
+	struct file_state *state = filp->private_data;
+	char c = 0;
+	int ret;
+
+	if (count == 0 || *ppos > 0)
+		return 0;
+
+	ret = semaphore_consume(state->shared);
+	if (ret)
+		return ret;
+
+	if (copy_to_user(buffer, &c, sizeof(c)))
+		return -EFAULT;
+
+	atomic64_add(1, &state->read_count);
+	*ppos += 1;
+	return 1;
+}
+
+static long semaphore_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
+{
+	struct file_state *state = filp->private_data;
+	void __user *buffer = (void __user *)arg;
+	u64 value;
+
+	switch (cmd) {
+	case IOCTL_GET_READ_COUNT:
+		value = atomic64_read(&state->read_count);
+		if (copy_to_user(buffer, &value, sizeof(value)))
+			return -EFAULT;
+		return 0;
+	case IOCTL_SET_READ_COUNT:
+		if (copy_from_user(&value, buffer, sizeof(value)))
+			return -EFAULT;
+		atomic64_set(&state->read_count, value);
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static void semaphore_free(struct kref *kref)
+{
+	struct semaphore_state *device;
+
+	device = container_of(kref, struct semaphore_state, ref);
+	kfree(device);
+}
+
+static int semaphore_release(struct inode *nodp, struct file *filp)
+{
+	struct file_state *state = filp->private_data;
+
+	kref_put(&state->shared->ref, semaphore_free);
+	kfree(state);
+	return 0;
+}
+
+static const struct file_operations semaphore_fops = {
+	.owner = THIS_MODULE,
+	.open = semaphore_open,
+	.read = semaphore_read,
+	.write = semaphore_write,
+	.compat_ioctl = semaphore_ioctl,
+	.release = semaphore_release,
+};
+
+static struct semaphore_state *device;
+
+static int __init semaphore_init(void)
+{
+	int ret;
+	struct semaphore_state *state;
+
+	pr_info("Rust semaphore sample (in C, for comparison) (init)\n");
+
+	state = kzalloc(sizeof(*state), GFP_KERNEL);
+	if (!state)
+		return -ENOMEM;
+
+	mutex_init(&state->mutex);
+	kref_init(&state->ref);
+	init_waitqueue_head(&state->changed);
+
+	state->miscdev.fops = &semaphore_fops;
+	state->miscdev.minor = MISC_DYNAMIC_MINOR;
+	state->miscdev.name = "semaphore";
+
+	ret = misc_register(&state->miscdev);
+	if (ret < 0) {
+		kfree(state);
+		return ret;
+	}
+
+	device = state;
+
+	return 0;
+}
+
+static void __exit semaphore_exit(void)
+{
+	pr_info("Rust semaphore sample (in C, for comparison) (exit)\n");
+
+	misc_deregister(&device->miscdev);
+	kref_put(&device->ref, semaphore_free);
+}
+
+module_init(semaphore_init);
+module_exit(semaphore_exit);
+
+MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("Rust for Linux Contributors");
+MODULE_DESCRIPTION("Rust semaphore sample (in C, for comparison)");
diff --git a/samples/rust/rust_stack_probing.rs b/samples/rust/rust_stack_probing.rs
new file mode 100644
index 000000000000..f99277354565
--- /dev/null
+++ b/samples/rust/rust_stack_probing.rs
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Rust stack probing sample
+
+#![no_std]
+#![feature(allocator_api, global_asm)]
+#![feature(test)]
+
+use kernel::prelude::*;
+
+module! {
+    type: RustStackProbing,
+    name: b"rust_stack_probing",
+    author: b"Rust for Linux Contributors",
+    description: b"Rust stack probing sample",
+    license: b"GPL v2",
+    params: {
+    },
+}
+
+struct RustStackProbing;
+
+impl KernelModule for RustStackProbing {
+    fn init() -> KernelResult<Self> {
+        pr_info!("Rust stack probing sample (init)\n");
+
+        // Including this large variable on the stack will trigger
+        // stack probing on the supported archs.
+        // This will verify that stack probing does not lead to
+        // any errors if we need to link `__rust_probestack`.
+        let x: [u64; 514] = core::hint::black_box([5; 514]);
+        pr_info!("Large array has length: {}\n", x.len());
+
+        Ok(RustStackProbing)
+    }
+}
+
+impl Drop for RustStackProbing {
+    fn drop(&mut self) {
+        pr_info!("Rust stack probing sample (exit)\n");
+    }
+}
diff --git a/samples/rust/rust_sync.rs b/samples/rust/rust_sync.rs
new file mode 100644
index 000000000000..a921bfd7d55f
--- /dev/null
+++ b/samples/rust/rust_sync.rs
@@ -0,0 +1,84 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Rust synchronisation primitives sample
+
+#![no_std]
+#![feature(allocator_api, global_asm)]
+
+use alloc::boxed::Box;
+use core::pin::Pin;
+use kernel::prelude::*;
+use kernel::{
+    condvar_init, mutex_init, spinlock_init,
+    sync::{CondVar, Mutex, SpinLock},
+};
+
+module! {
+    type: RustSync,
+    name: b"rust_sync",
+    author: b"Rust for Linux Contributors",
+    description: b"Rust synchronisation primitives sample",
+    license: b"GPL v2",
+    params: {
+    },
+}
+
+struct RustSync;
+
+impl KernelModule for RustSync {
+    fn init() -> KernelResult<Self> {
+        pr_info!("Rust synchronisation primitives sample (init)\n");
+
+        // Test mutexes.
+        {
+            // SAFETY: `init` is called below.
+            let data = Pin::from(Box::try_new(unsafe { Mutex::new(0) })?);
+            mutex_init!(data.as_ref(), "RustSync::init::data1");
+            *data.lock() = 10;
+            pr_info!("Value: {}\n", *data.lock());
+
+            // SAFETY: `init` is called below.
+            let cv = Pin::from(Box::try_new(unsafe { CondVar::new() })?);
+            condvar_init!(cv.as_ref(), "RustSync::init::cv1");
+            {
+                let mut guard = data.lock();
+                while *guard != 10 {
+                    let _ = cv.wait(&mut guard);
+                }
+            }
+            cv.notify_one();
+            cv.notify_all();
+            cv.free_waiters();
+        }
+
+        // Test spinlocks.
+        {
+            // SAFETY: `init` is called below.
+            let data = Pin::from(Box::try_new(unsafe { SpinLock::new(0) })?);
+            spinlock_init!(data.as_ref(), "RustSync::init::data2");
+            *data.lock() = 10;
+            pr_info!("Value: {}\n", *data.lock());
+
+            // SAFETY: `init` is called below.
+            let cv = Pin::from(Box::try_new(unsafe { CondVar::new() })?);
+            condvar_init!(cv.as_ref(), "RustSync::init::cv2");
+            {
+                let mut guard = data.lock();
+                while *guard != 10 {
+                    let _ = cv.wait(&mut guard);
+                }
+            }
+            cv.notify_one();
+            cv.notify_all();
+            cv.free_waiters();
+        }
+
+        Ok(RustSync)
+    }
+}
+
+impl Drop for RustSync {
+    fn drop(&mut self) {
+        pr_info!("Rust synchronisation primitives sample (exit)\n");
+    }
+}
-- 
2.17.1

