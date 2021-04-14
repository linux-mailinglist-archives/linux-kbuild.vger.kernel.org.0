Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F54E35FB08
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Apr 2021 20:50:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353078AbhDNSsH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 14 Apr 2021 14:48:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:49640 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1353112AbhDNSrd (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Apr 2021 14:47:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A9E62611AD;
        Wed, 14 Apr 2021 18:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618426026;
        bh=W5RbR3CJAVl9eT8TMMCzKfR1WAFRCJjwmOGEpitrDa0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NT5zjP2RzdoGcOjytt+jBOW6FbBGQzMQDpxKxyXTWOv9F+6Q7WzH4ChpY3GjjeiGZ
         vG4sPgENcGENJ7mTZlrBICckHj+GeZEE4lqoVkbNzA+fY+OXWQ+71mboGGkylGQAlo
         c5BQNqBYAMS8T9wW3XM2Ox9/cbSxJrkcdGFzr0lgo4LB+IMddZ0jjVpt02JQQ0pyXU
         xBCedtk7HcyrIhbqoSiGHFkxqLgGDRRuVM1mN++YQIdxGyTgwzbpN4i8Blg6PphRL+
         mviVqmVavKi21eJTPXniToya31Ui1kLO9kevM3TtYMVSDQQidURdbSNE8tyj9pCK5C
         /6q/cBMTndBgA==
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
Subject: [PATCH 12/13] Rust: add abstractions for Binder (WIP)
Date:   Wed, 14 Apr 2021 20:46:03 +0200
Message-Id: <20210414184604.23473-13-ojeda@kernel.org>
In-Reply-To: <20210414184604.23473-1-ojeda@kernel.org>
References: <20210414184604.23473-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Miguel Ojeda <ojeda@kernel.org>

These abstractions are work in progress. They are needed for
the next commit, which is the one intended to be reviewed.

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
 rust/kernel/lib.rs         |   4 +
 rust/kernel/linked_list.rs | 245 +++++++++++++++++++++++++
 rust/kernel/pages.rs       | 173 ++++++++++++++++++
 rust/kernel/raw_list.rs    | 361 +++++++++++++++++++++++++++++++++++++
 4 files changed, 783 insertions(+)
 create mode 100644 rust/kernel/linked_list.rs
 create mode 100644 rust/kernel/pages.rs
 create mode 100644 rust/kernel/raw_list.rs

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 9a06bd60d5c1..c9ffeaae18a0 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -41,6 +41,10 @@ pub mod chrdev;
 mod error;
 pub mod file_operations;
 pub mod miscdev;
+pub mod pages;
+
+pub mod linked_list;
+mod raw_list;
 
 #[doc(hidden)]
 pub mod module_param;
diff --git a/rust/kernel/linked_list.rs b/rust/kernel/linked_list.rs
new file mode 100644
index 000000000000..5b0b811eae22
--- /dev/null
+++ b/rust/kernel/linked_list.rs
@@ -0,0 +1,245 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Linked lists.
+//!
+//! TODO: This module is a work in progress.
+
+use alloc::{boxed::Box, sync::Arc};
+use core::ptr::NonNull;
+
+pub use crate::raw_list::{Cursor, GetLinks, Links};
+use crate::{raw_list, raw_list::RawList};
+
+// TODO: Use the one from `kernel::file_operations::PointerWrapper` instead.
+/// Wraps an object to be inserted in a linked list.
+pub trait Wrapper<T: ?Sized> {
+    /// Converts the wrapped object into a pointer that represents it.
+    fn into_pointer(self) -> NonNull<T>;
+
+    /// Converts the object back from the pointer representation.
+    ///
+    /// # Safety
+    ///
+    /// The passed pointer must come from a previous call to [`Wrapper::into_pointer()`].
+    unsafe fn from_pointer(ptr: NonNull<T>) -> Self;
+
+    /// Returns a reference to the wrapped object.
+    fn as_ref(&self) -> &T;
+}
+
+impl<T: ?Sized> Wrapper<T> for Box<T> {
+    fn into_pointer(self) -> NonNull<T> {
+        NonNull::new(Box::into_raw(self)).unwrap()
+    }
+
+    unsafe fn from_pointer(ptr: NonNull<T>) -> Self {
+        Box::from_raw(ptr.as_ptr())
+    }
+
+    fn as_ref(&self) -> &T {
+        AsRef::as_ref(self)
+    }
+}
+
+impl<T: ?Sized> Wrapper<T> for Arc<T> {
+    fn into_pointer(self) -> NonNull<T> {
+        NonNull::new(Arc::into_raw(self) as _).unwrap()
+    }
+
+    unsafe fn from_pointer(ptr: NonNull<T>) -> Self {
+        Arc::from_raw(ptr.as_ptr())
+    }
+
+    fn as_ref(&self) -> &T {
+        AsRef::as_ref(self)
+    }
+}
+
+impl<T: ?Sized> Wrapper<T> for &T {
+    fn into_pointer(self) -> NonNull<T> {
+        NonNull::from(self)
+    }
+
+    unsafe fn from_pointer(ptr: NonNull<T>) -> Self {
+        &*ptr.as_ptr()
+    }
+
+    fn as_ref(&self) -> &T {
+        self
+    }
+}
+
+/// A descriptor of wrapped list elements.
+pub trait GetLinksWrapped: GetLinks {
+    /// Specifies which wrapper (e.g., `Box` and `Arc`) wraps the list entries.
+    type Wrapped: Wrapper<Self::EntryType>;
+}
+
+impl<T: ?Sized> GetLinksWrapped for Box<T>
+where
+    Box<T>: GetLinks,
+{
+    type Wrapped = Box<<Box<T> as GetLinks>::EntryType>;
+}
+
+impl<T: GetLinks + ?Sized> GetLinks for Box<T> {
+    type EntryType = T::EntryType;
+    fn get_links(data: &Self::EntryType) -> &Links<Self::EntryType> {
+        <T as GetLinks>::get_links(data)
+    }
+}
+
+impl<T: ?Sized> GetLinksWrapped for Arc<T>
+where
+    Arc<T>: GetLinks,
+{
+    type Wrapped = Arc<<Arc<T> as GetLinks>::EntryType>;
+}
+
+impl<T: GetLinks + ?Sized> GetLinks for Arc<T> {
+    type EntryType = T::EntryType;
+    fn get_links(data: &Self::EntryType) -> &Links<Self::EntryType> {
+        <T as GetLinks>::get_links(data)
+    }
+}
+
+/// A linked list.
+///
+/// Elements in the list are wrapped and ownership is transferred to the list while the element is
+/// in the list.
+pub struct List<G: GetLinksWrapped> {
+    list: RawList<G>,
+}
+
+impl<G: GetLinksWrapped> List<G> {
+    /// Constructs a new empty linked list.
+    pub fn new() -> Self {
+        Self {
+            list: RawList::new(),
+        }
+    }
+
+    /// Returns whether the list is empty.
+    pub fn is_empty(&self) -> bool {
+        self.list.is_empty()
+    }
+
+    /// Adds the given object to the end (back) of the list.
+    ///
+    /// It is dropped if it's already on this (or another) list; this can happen for
+    /// reference-counted objects, so dropping means decrementing the reference count.
+    pub fn push_back(&mut self, data: G::Wrapped) {
+        let ptr = data.into_pointer();
+
+        // SAFETY: We took ownership of the entry, so it is safe to insert it.
+        if !unsafe { self.list.push_back(ptr.as_ref()) } {
+            // If insertion failed, rebuild object so that it can be freed.
+            // SAFETY: We just called `into_pointer` above.
+            unsafe { G::Wrapped::from_pointer(ptr) };
+        }
+    }
+
+    /// Inserts the given object after `existing`.
+    ///
+    /// It is dropped if it's already on this (or another) list; this can happen for
+    /// reference-counted objects, so dropping means decrementing the reference count.
+    ///
+    /// # Safety
+    ///
+    /// Callers must ensure that `existing` points to a valid entry that is on the list.
+    pub unsafe fn insert_after(&mut self, existing: NonNull<G::EntryType>, data: G::Wrapped) {
+        let ptr = data.into_pointer();
+        let entry = &*existing.as_ptr();
+        if !self.list.insert_after(entry, ptr.as_ref()) {
+            // If insertion failed, rebuild object so that it can be freed.
+            G::Wrapped::from_pointer(ptr);
+        }
+    }
+
+    /// Removes the given entry.
+    ///
+    /// # Safety
+    ///
+    /// Callers must ensure that `data` is either on this list or in no list. It being on another
+    /// list leads to memory unsafety.
+    pub unsafe fn remove(&mut self, data: &G::Wrapped) -> Option<G::Wrapped> {
+        let entry_ref = Wrapper::as_ref(data);
+        if self.list.remove(entry_ref) {
+            Some(G::Wrapped::from_pointer(NonNull::from(entry_ref)))
+        } else {
+            None
+        }
+    }
+
+    /// Removes the element currently at the front of the list and returns it.
+    ///
+    /// Returns `None` if the list is empty.
+    pub fn pop_front(&mut self) -> Option<G::Wrapped> {
+        let front = self.list.pop_front()?;
+        // SAFETY: Elements on the list were inserted after a call to `into_pointer `.
+        Some(unsafe { G::Wrapped::from_pointer(front) })
+    }
+
+    /// Returns a cursor starting on the first (front) element of the list.
+    pub fn cursor_front(&self) -> Cursor<'_, G> {
+        self.list.cursor_front()
+    }
+
+    /// Returns a mutable cursor starting on the first (front) element of the list.
+    pub fn cursor_front_mut(&mut self) -> CursorMut<'_, G> {
+        CursorMut::new(self.list.cursor_front_mut())
+    }
+}
+
+impl<G: GetLinksWrapped> Default for List<G> {
+    fn default() -> Self {
+        Self::new()
+    }
+}
+
+impl<G: GetLinksWrapped> Drop for List<G> {
+    fn drop(&mut self) {
+        while self.pop_front().is_some() {}
+    }
+}
+
+/// A list cursor that allows traversing a linked list and inspecting & mutating elements.
+pub struct CursorMut<'a, G: GetLinksWrapped> {
+    cursor: raw_list::CursorMut<'a, G>,
+}
+
+impl<'a, G: GetLinksWrapped> CursorMut<'a, G> {
+    fn new(cursor: raw_list::CursorMut<'a, G>) -> Self {
+        Self { cursor }
+    }
+
+    /// Returns the element the cursor is currently positioned on.
+    pub fn current(&mut self) -> Option<&mut G::EntryType> {
+        self.cursor.current()
+    }
+
+    /// Removes the element the cursor is currently positioned on.
+    ///
+    /// After removal, it advances the cursor to the next element.
+    pub fn remove_current(&mut self) -> Option<G::Wrapped> {
+        let ptr = self.cursor.remove_current()?;
+
+        // SAFETY: Elements on the list were inserted after a call to `into_pointer `.
+        Some(unsafe { G::Wrapped::from_pointer(ptr) })
+    }
+
+    /// Returns the element immediately after the one the cursor is positioned on.
+    pub fn peek_next(&mut self) -> Option<&mut G::EntryType> {
+        self.cursor.peek_next()
+    }
+
+    /// Returns the element immediately before the one the cursor is positioned on.
+    pub fn peek_prev(&mut self) -> Option<&mut G::EntryType> {
+        self.cursor.peek_prev()
+    }
+
+    /// Moves the cursor to the next element.
+    pub fn move_next(&mut self) {
+        self.cursor.move_next();
+    }
+}
diff --git a/rust/kernel/pages.rs b/rust/kernel/pages.rs
new file mode 100644
index 000000000000..0426d411470d
--- /dev/null
+++ b/rust/kernel/pages.rs
@@ -0,0 +1,173 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Kernel page allocation and management.
+//!
+//! TODO: This module is a work in progress.
+
+use crate::{bindings, c_types, user_ptr::UserSlicePtrReader, Error, KernelResult, PAGE_SIZE};
+use core::{marker::PhantomData, ptr};
+
+extern "C" {
+    #[allow(improper_ctypes)]
+    fn rust_helper_alloc_pages(
+        gfp_mask: bindings::gfp_t,
+        order: c_types::c_uint,
+    ) -> *mut bindings::page;
+
+    #[allow(improper_ctypes)]
+    fn rust_helper_kmap(page: *mut bindings::page) -> *mut c_types::c_void;
+
+    #[allow(improper_ctypes)]
+    fn rust_helper_kunmap(page: *mut bindings::page);
+}
+
+/// A set of physical pages.
+///
+/// `Pages` holds a reference to a set of pages of order `ORDER`. Having the order as a generic
+/// const allows the struct to have the same size as a pointer.
+///
+/// # Invariants
+///
+/// The pointer [`Pages::pages`] is valid and points to 2^ORDER pages.
+pub struct Pages<const ORDER: u32> {
+    pages: *mut bindings::page,
+}
+
+impl<const ORDER: u32> Pages<ORDER> {
+    /// Allocates a new set of contiguous pages.
+    pub fn new() -> KernelResult<Self> {
+        // TODO: Consider whether we want to allow callers to specify flags.
+        // SAFETY: This only allocates pages. We check that it succeeds in the next statement.
+        let pages = unsafe {
+            rust_helper_alloc_pages(
+                bindings::GFP_KERNEL | bindings::__GFP_ZERO | bindings::__GFP_HIGHMEM,
+                ORDER,
+            )
+        };
+        if pages.is_null() {
+            return Err(Error::ENOMEM);
+        }
+        // INVARIANTS: We checked that the allocation above succeeded>
+        Ok(Self { pages })
+    }
+
+    /// Maps a single page at the given address in the given VM area.
+    ///
+    /// This is only meant to be used by pages of order 0.
+    pub fn insert_page(&self, vma: &mut bindings::vm_area_struct, address: usize) -> KernelResult {
+        if ORDER != 0 {
+            return Err(Error::EINVAL);
+        }
+
+        // SAFETY: We check above that the allocation is of order 0. The range of `address` is
+        // already checked by `vm_insert_page`.
+        let ret = unsafe { bindings::vm_insert_page(vma, address as _, self.pages) };
+        if ret != 0 {
+            Err(Error::from_kernel_errno(ret))
+        } else {
+            Ok(())
+        }
+    }
+
+    /// Copies data from the given [`UserSlicePtrReader`] into the pages.
+    pub fn copy_into_page(
+        &self,
+        reader: &mut UserSlicePtrReader,
+        offset: usize,
+        len: usize,
+    ) -> KernelResult {
+        // TODO: For now this only works on the first page.
+        let end = offset.checked_add(len).ok_or(Error::EINVAL)?;
+        if end > PAGE_SIZE {
+            return Err(Error::EINVAL);
+        }
+
+        let mapping = self.kmap(0).ok_or(Error::EINVAL)?;
+
+        // SAFETY: We ensured that the buffer was valid with the check above.
+        unsafe { reader.read_raw((mapping.ptr as usize + offset) as _, len) }?;
+        Ok(())
+    }
+
+    /// Maps the pages and reads from them into the given buffer.
+    ///
+    /// # Safety
+    ///
+    /// Callers must ensure that the destination buffer is valid for the given length.
+    /// Additionally, if the raw buffer is intended to be recast, they must ensure that the data
+    /// can be safely cast; [`crate::user_ptr::ReadableFromBytes`] has more details about it.
+    pub unsafe fn read(&self, dest: *mut u8, offset: usize, len: usize) -> KernelResult {
+        // TODO: For now this only works on the first page.
+        let end = offset.checked_add(len).ok_or(Error::EINVAL)?;
+        if end > PAGE_SIZE {
+            return Err(Error::EINVAL);
+        }
+
+        let mapping = self.kmap(0).ok_or(Error::EINVAL)?;
+        ptr::copy((mapping.ptr as *mut u8).add(offset), dest, len);
+        Ok(())
+    }
+
+    /// Maps the pages and writes into them from the given bufer.
+    ///
+    /// # Safety
+    ///
+    /// Callers must ensure that the buffer is valid for the given length. Additionally, if the
+    /// page is (or will be) mapped by userspace, they must ensure that no kernel data is leaked
+    /// through padding if it was cast from another type; [`crate::user_ptr::WritableToBytes`] has
+    /// more details about it.
+    pub unsafe fn write(&self, src: *const u8, offset: usize, len: usize) -> KernelResult {
+        // TODO: For now this only works on the first page.
+        let end = offset.checked_add(len).ok_or(Error::EINVAL)?;
+        if end > PAGE_SIZE {
+            return Err(Error::EINVAL);
+        }
+
+        let mapping = self.kmap(0).ok_or(Error::EINVAL)?;
+        ptr::copy(src, (mapping.ptr as *mut u8).add(offset), len);
+        Ok(())
+    }
+
+    /// Maps the page at index `index`.
+    fn kmap(&self, index: usize) -> Option<PageMapping> {
+        if index >= 1usize << ORDER {
+            return None;
+        }
+
+        // SAFETY: We checked above that `index` is within range.
+        let page = unsafe { self.pages.add(index) };
+
+        // SAFETY: `page` is valid based on the checks above.
+        let ptr = unsafe { rust_helper_kmap(page) };
+        if ptr.is_null() {
+            return None;
+        }
+
+        Some(PageMapping {
+            page,
+            ptr,
+            _phantom: PhantomData,
+        })
+    }
+}
+
+impl<const ORDER: u32> Drop for Pages<ORDER> {
+    fn drop(&mut self) {
+        // SAFETY: By the type invariants, we know the pages are allocated with the given order.
+        unsafe { bindings::__free_pages(self.pages, ORDER) };
+    }
+}
+
+struct PageMapping<'a> {
+    page: *mut bindings::page,
+    ptr: *mut c_types::c_void,
+    _phantom: PhantomData<&'a i32>,
+}
+
+impl Drop for PageMapping<'_> {
+    fn drop(&mut self) {
+        // SAFETY: An instance of `PageMapping` is created only when `kmap` succeeded for the given
+        // page, so it is safe to unmap it here.
+        unsafe { rust_helper_kunmap(self.page) };
+    }
+}
diff --git a/rust/kernel/raw_list.rs b/rust/kernel/raw_list.rs
new file mode 100644
index 000000000000..0202b44d560a
--- /dev/null
+++ b/rust/kernel/raw_list.rs
@@ -0,0 +1,361 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Raw lists.
+//!
+//! TODO: This module is a work in progress.
+
+use core::{
+    cell::UnsafeCell,
+    ptr,
+    ptr::NonNull,
+    sync::atomic::{AtomicBool, Ordering},
+};
+
+/// A descriptor of list elements.
+///
+/// It describes the type of list elements and provides a function to determine how to get the
+/// links to be used on a list.
+///
+/// A type that may be in multiple lists simultaneously neneds to implement one of these for each
+/// simultaneous list.
+pub trait GetLinks {
+    /// The type of the entries in the list.
+    type EntryType: ?Sized;
+
+    /// Returns the links to be used when linking an entry within a list.
+    fn get_links(data: &Self::EntryType) -> &Links<Self::EntryType>;
+}
+
+/// The links used to link an object on a linked list.
+///
+/// Instances of this type are usually embedded in structures and returned in calls to
+/// [`GetLinks::get_links`].
+pub struct Links<T: ?Sized> {
+    inserted: AtomicBool,
+    entry: UnsafeCell<ListEntry<T>>,
+}
+
+impl<T: ?Sized> Links<T> {
+    /// Constructs a new [`Links`] instance that isn't inserted on any lists yet.
+    pub fn new() -> Self {
+        Self {
+            inserted: AtomicBool::new(false),
+            entry: UnsafeCell::new(ListEntry::new()),
+        }
+    }
+
+    fn acquire_for_insertion(&self) -> bool {
+        self.inserted
+            .compare_exchange(false, true, Ordering::Acquire, Ordering::Relaxed)
+            .is_ok()
+    }
+
+    fn release_after_removal(&self) {
+        self.inserted.store(false, Ordering::Release);
+    }
+}
+
+impl<T: ?Sized> Default for Links<T> {
+    fn default() -> Self {
+        Self::new()
+    }
+}
+
+struct ListEntry<T: ?Sized> {
+    next: Option<NonNull<T>>,
+    prev: Option<NonNull<T>>,
+}
+
+impl<T: ?Sized> ListEntry<T> {
+    fn new() -> Self {
+        Self {
+            next: None,
+            prev: None,
+        }
+    }
+}
+
+/// A linked list.
+///
+/// # Invariants
+///
+/// The links of objects added to a list are owned by the list.
+pub(crate) struct RawList<G: GetLinks> {
+    head: Option<NonNull<G::EntryType>>,
+}
+
+impl<G: GetLinks> RawList<G> {
+    pub(crate) fn new() -> Self {
+        Self { head: None }
+    }
+
+    pub(crate) fn is_empty(&self) -> bool {
+        self.head.is_none()
+    }
+
+    fn insert_after_priv(
+        &mut self,
+        existing: &G::EntryType,
+        new_entry: &mut ListEntry<G::EntryType>,
+        new_ptr: Option<NonNull<G::EntryType>>,
+    ) {
+        {
+            // SAFETY: It's safe to get the previous entry of `existing` because the list cannot
+            // change.
+            let existing_links = unsafe { &mut *G::get_links(existing).entry.get() };
+            new_entry.next = existing_links.next;
+            existing_links.next = new_ptr;
+        }
+
+        new_entry.prev = Some(NonNull::from(existing));
+
+        // SAFETY: It's safe to get the next entry of `existing` because the list cannot change.
+        let next_links =
+            unsafe { &mut *G::get_links(new_entry.next.unwrap().as_ref()).entry.get() };
+        next_links.prev = new_ptr;
+    }
+
+    /// Inserts the given object after `existing`.
+    ///
+    /// # Safety
+    ///
+    /// Callers must ensure that `existing` points to a valid entry that is on the list.
+    pub(crate) unsafe fn insert_after(
+        &mut self,
+        existing: &G::EntryType,
+        new: &G::EntryType,
+    ) -> bool {
+        let links = G::get_links(new);
+        if !links.acquire_for_insertion() {
+            // Nothing to do if already inserted.
+            return false;
+        }
+
+        // SAFETY: The links are now owned by the list, so it is safe to get a mutable reference.
+        let new_entry = &mut *links.entry.get();
+        self.insert_after_priv(existing, new_entry, Some(NonNull::from(new)));
+        true
+    }
+
+    fn push_back_internal(&mut self, new: &G::EntryType) -> bool {
+        let links = G::get_links(new);
+        if !links.acquire_for_insertion() {
+            // Nothing to do if already inserted.
+            return false;
+        }
+
+        // SAFETY: The links are now owned by the list, so it is safe to get a mutable reference.
+        let new_entry = unsafe { &mut *links.entry.get() };
+        let new_ptr = Some(NonNull::from(new));
+        match self.back() {
+            // SAFETY: `back` is valid as the list cannot change.
+            Some(back) => self.insert_after_priv(unsafe { back.as_ref() }, new_entry, new_ptr),
+            None => {
+                self.head = new_ptr;
+                new_entry.next = new_ptr;
+                new_entry.prev = new_ptr;
+            }
+        }
+        true
+    }
+
+    pub(crate) unsafe fn push_back(&mut self, new: &G::EntryType) -> bool {
+        self.push_back_internal(new)
+    }
+
+    fn remove_internal(&mut self, data: &G::EntryType) -> bool {
+        let links = G::get_links(data);
+
+        // SAFETY: The links are now owned by the list, so it is safe to get a mutable reference.
+        let entry = unsafe { &mut *links.entry.get() };
+        let next = if let Some(next) = entry.next {
+            next
+        } else {
+            // Nothing to do if the entry is not on the list.
+            return false;
+        };
+
+        if ptr::eq(data, next.as_ptr()) {
+            // We're removing the only element.
+            self.head = None
+        } else {
+            // Update the head if we're removing it.
+            if let Some(raw_head) = self.head {
+                if ptr::eq(data, raw_head.as_ptr()) {
+                    self.head = Some(next);
+                }
+            }
+
+            // SAFETY: It's safe to get the previous entry because the list cannot change.
+            unsafe { &mut *G::get_links(entry.prev.unwrap().as_ref()).entry.get() }.next =
+                entry.next;
+
+            // SAFETY: It's safe to get the next entry because the list cannot change.
+            unsafe { &mut *G::get_links(next.as_ref()).entry.get() }.prev = entry.prev;
+        }
+
+        // Reset the links of the element we're removing so that we know it's not on any list.
+        entry.next = None;
+        entry.prev = None;
+        links.release_after_removal();
+        true
+    }
+
+    /// Removes the given entry.
+    ///
+    /// # Safety
+    ///
+    /// Callers must ensure that `data` is either on this list or in no list. It being on another
+    /// list leads to memory unsafety.
+    pub(crate) unsafe fn remove(&mut self, data: &G::EntryType) -> bool {
+        self.remove_internal(data)
+    }
+
+    fn pop_front_internal(&mut self) -> Option<NonNull<G::EntryType>> {
+        let head = self.head?;
+        // SAFETY: The head is on the list as we just got it from there and it cannot change.
+        unsafe { self.remove(head.as_ref()) };
+        Some(head)
+    }
+
+    pub(crate) fn pop_front(&mut self) -> Option<NonNull<G::EntryType>> {
+        self.pop_front_internal()
+    }
+
+    pub(crate) fn front(&self) -> Option<NonNull<G::EntryType>> {
+        self.head
+    }
+
+    pub(crate) fn back(&self) -> Option<NonNull<G::EntryType>> {
+        // SAFETY: The links of head are owned by the list, so it is safe to get a reference.
+        unsafe { &*G::get_links(self.head?.as_ref()).entry.get() }.prev
+    }
+
+    pub(crate) fn cursor_front(&self) -> Cursor<'_, G> {
+        Cursor::new(self, self.front())
+    }
+
+    pub(crate) fn cursor_front_mut(&mut self) -> CursorMut<'_, G> {
+        CursorMut::new(self, self.front())
+    }
+}
+
+struct CommonCursor<G: GetLinks> {
+    cur: Option<NonNull<G::EntryType>>,
+}
+
+impl<G: GetLinks> CommonCursor<G> {
+    fn new(cur: Option<NonNull<G::EntryType>>) -> Self {
+        Self { cur }
+    }
+
+    fn move_next(&mut self, list: &RawList<G>) {
+        match self.cur.take() {
+            None => self.cur = list.head,
+            Some(cur) => {
+                if let Some(head) = list.head {
+                    // SAFETY: We have a shared ref to the linked list, so the links can't change.
+                    let links = unsafe { &*G::get_links(cur.as_ref()).entry.get() };
+                    if links.next.unwrap() != head {
+                        self.cur = links.next;
+                    }
+                }
+            }
+        }
+    }
+
+    fn move_prev(&mut self, list: &RawList<G>) {
+        match list.head {
+            None => self.cur = None,
+            Some(head) => {
+                let next = match self.cur.take() {
+                    None => head,
+                    Some(cur) => {
+                        if cur == head {
+                            return;
+                        }
+                        cur
+                    }
+                };
+                // SAFETY: There's a shared ref to the list, so the links can't change.
+                let links = unsafe { &*G::get_links(next.as_ref()).entry.get() };
+                self.cur = links.prev;
+            }
+        }
+    }
+}
+
+/// A list cursor that allows traversing a linked list and inspecting elements.
+pub struct Cursor<'a, G: GetLinks> {
+    cursor: CommonCursor<G>,
+    list: &'a RawList<G>,
+}
+
+impl<'a, G: GetLinks> Cursor<'a, G> {
+    fn new(list: &'a RawList<G>, cur: Option<NonNull<G::EntryType>>) -> Self {
+        Self {
+            list,
+            cursor: CommonCursor::new(cur),
+        }
+    }
+
+    /// Returns the element the cursor is currently positioned on.
+    pub fn current(&self) -> Option<&'a G::EntryType> {
+        let cur = self.cursor.cur?;
+        // SAFETY: Objects must be kept alive while on the list.
+        Some(unsafe { &*cur.as_ptr() })
+    }
+
+    /// Moves the cursor to the next element.
+    pub fn move_next(&mut self) {
+        self.cursor.move_next(self.list);
+    }
+}
+
+pub(crate) struct CursorMut<'a, G: GetLinks> {
+    cursor: CommonCursor<G>,
+    list: &'a mut RawList<G>,
+}
+
+impl<'a, G: GetLinks> CursorMut<'a, G> {
+    fn new(list: &'a mut RawList<G>, cur: Option<NonNull<G::EntryType>>) -> Self {
+        Self {
+            list,
+            cursor: CommonCursor::new(cur),
+        }
+    }
+
+    pub(crate) fn current(&mut self) -> Option<&mut G::EntryType> {
+        let cur = self.cursor.cur?;
+        // SAFETY: Objects must be kept alive while on the list.
+        Some(unsafe { &mut *cur.as_ptr() })
+    }
+
+    /// Removes the entry the cursor is pointing to and advances the cursor to the next entry. It
+    /// returns a raw pointer to the removed element (if one is removed).
+    pub(crate) fn remove_current(&mut self) -> Option<NonNull<G::EntryType>> {
+        let entry = self.cursor.cur?;
+        self.cursor.move_next(self.list);
+        // SAFETY: The entry is on the list as we just got it from there and it cannot change.
+        unsafe { self.list.remove(entry.as_ref()) };
+        Some(entry)
+    }
+
+    pub(crate) fn peek_next(&mut self) -> Option<&mut G::EntryType> {
+        let mut new = CommonCursor::new(self.cursor.cur);
+        new.move_next(self.list);
+        // SAFETY: Objects must be kept alive while on the list.
+        Some(unsafe { &mut *new.cur?.as_ptr() })
+    }
+
+    pub(crate) fn peek_prev(&mut self) -> Option<&mut G::EntryType> {
+        let mut new = CommonCursor::new(self.cursor.cur);
+        new.move_prev(self.list);
+        // SAFETY: Objects must be kept alive while on the list.
+        Some(unsafe { &mut *new.cur?.as_ptr() })
+    }
+
+    pub(crate) fn move_next(&mut self) {
+        self.cursor.move_next(self.list);
+    }
+}
-- 
2.17.1

