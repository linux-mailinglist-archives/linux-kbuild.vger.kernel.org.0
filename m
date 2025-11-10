Return-Path: <linux-kbuild+bounces-9481-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9FFC45C10
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 10:54:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 879534EBF51
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 09:52:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02399302CBF;
	Mon, 10 Nov 2025 09:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ikn3IG08"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4617301701;
	Mon, 10 Nov 2025 09:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762768303; cv=none; b=Yzl7fHySMKdv25UxpAzp9/Cw13f3kfPFZ9/sgxUf160+XVL0LvUymeMORYY9yzEMVB3NvytVUffFt1szLa7lbKO+TULWcfYOAJnWaibCyh7QyahEuAoPbyyJb3McCE5xhT7mkgrKn8Aq1xK+Acf6fQuBtBxaGsWvqrUT9qlEmaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762768303; c=relaxed/simple;
	bh=2PIj85dMXevvPehaFqZoYuiShPrLeSXLFoKU5BNxx6I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZOdaoeCxNWFCXNS+Zn98Cdeyq38J+0e4rqa5ijSI2DBT4t8MSHJQWwduF3vkcW4z8xvlYb9NzWHZJOC35lAledvtjyzB7sP1FCMxc70QBa1Sskwdw3FoqpXx7dQ4r3Kyf72zSbUnVkJquEjHUjAM9R6s24kwpKLb2HezurbvLCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ikn3IG08; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68A22C116D0;
	Mon, 10 Nov 2025 09:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762768303;
	bh=2PIj85dMXevvPehaFqZoYuiShPrLeSXLFoKU5BNxx6I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ikn3IG08QEls/T2DemIPhSs2jIOT0W+bcHGWoHOK6gxVeHNE9MGjzUdVwGmCbUee/
	 GjjUApfyKELKpr8iAxGqvSmb2fWiT7zCeTigNT2s1ydsi4ptWvGTSxhq+bz/FycPod
	 oc4Qm/31Dg9kHzU+2/bMCv2yI3P1KL/LbvKCZVuO8bnHjEPGKfZJFOXI6FEID/OD6l
	 J9ZKMZVZBrDiaZiI2er6OyxA1hLkY2c4nkU3/G0sUpdaDgAf5bfZo7Zx7qhvlfkkMy
	 iwq2qe/VSemYaF1QTlTosW7ARpXhId/YKKMbJ9x7vLiWADraVQcGWRd4jLSwYrfKJE
	 DB5ecq9LFrDFQ==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev
Subject: [PATCH 10/18] rust: quote: import crate
Date: Mon, 10 Nov 2025 10:50:15 +0100
Message-ID: <20251110095025.1475896-11-ojeda@kernel.org>
In-Reply-To: <20251110095025.1475896-1-ojeda@kernel.org>
References: <20251110095025.1475896-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is a subset of the Rust `quote` crate, version 1.0.40 (released
2025-03-12), licensed under "Apache-2.0 OR MIT", from:

    https://github.com/dtolnay/quote/raw/1.0.40/src

The files are copied as-is, with no modifications whatsoever (not even
adding the SPDX identifiers).

For copyright details, please see:

    https://github.com/dtolnay/quote/blob/1.0.40/README.md#license
    https://github.com/dtolnay/quote/blob/1.0.40/LICENSE-APACHE
    https://github.com/dtolnay/quote/blob/1.0.40/LICENSE-MIT

The next patch modifies these files as needed for use within the
kernel. This patch split allows reviewers to double-check the import
and to clearly see the differences introduced.

The following script may be used to verify the contents:

    for path in $(cd rust/quote/ && find . -type f -name '*.rs'); do
        curl --silent --show-error --location \
            https://github.com/dtolnay/quote/raw/1.0.40/src/$path \
            | diff --unified rust/quote/$path - && echo $path: OK
    done

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/quote/ext.rs            |  110 +++
 rust/quote/format.rs         |  168 ++++
 rust/quote/ident_fragment.rs |   88 ++
 rust/quote/lib.rs            | 1454 ++++++++++++++++++++++++++++++++++
 rust/quote/runtime.rs        |  492 ++++++++++++
 rust/quote/spanned.rs        |   50 ++
 rust/quote/to_tokens.rs      |  271 +++++++
 7 files changed, 2633 insertions(+)
 create mode 100644 rust/quote/ext.rs
 create mode 100644 rust/quote/format.rs
 create mode 100644 rust/quote/ident_fragment.rs
 create mode 100644 rust/quote/lib.rs
 create mode 100644 rust/quote/runtime.rs
 create mode 100644 rust/quote/spanned.rs
 create mode 100644 rust/quote/to_tokens.rs

diff --git a/rust/quote/ext.rs b/rust/quote/ext.rs
new file mode 100644
index 000000000000..92c2315b182d
--- /dev/null
+++ b/rust/quote/ext.rs
@@ -0,0 +1,110 @@
+use super::ToTokens;
+use core::iter;
+use proc_macro2::{TokenStream, TokenTree};
+
+/// TokenStream extension trait with methods for appending tokens.
+///
+/// This trait is sealed and cannot be implemented outside of the `quote` crate.
+pub trait TokenStreamExt: private::Sealed {
+    /// For use by `ToTokens` implementations.
+    ///
+    /// Appends the token specified to this list of tokens.
+    fn append<U>(&mut self, token: U)
+    where
+        U: Into<TokenTree>;
+
+    /// For use by `ToTokens` implementations.
+    ///
+    /// ```
+    /// # use quote::{quote, TokenStreamExt, ToTokens};
+    /// # use proc_macro2::TokenStream;
+    /// #
+    /// struct X;
+    ///
+    /// impl ToTokens for X {
+    ///     fn to_tokens(&self, tokens: &mut TokenStream) {
+    ///         tokens.append_all(&[true, false]);
+    ///     }
+    /// }
+    ///
+    /// let tokens = quote!(#X);
+    /// assert_eq!(tokens.to_string(), "true false");
+    /// ```
+    fn append_all<I>(&mut self, iter: I)
+    where
+        I: IntoIterator,
+        I::Item: ToTokens;
+
+    /// For use by `ToTokens` implementations.
+    ///
+    /// Appends all of the items in the iterator `I`, separated by the tokens
+    /// `U`.
+    fn append_separated<I, U>(&mut self, iter: I, op: U)
+    where
+        I: IntoIterator,
+        I::Item: ToTokens,
+        U: ToTokens;
+
+    /// For use by `ToTokens` implementations.
+    ///
+    /// Appends all tokens in the iterator `I`, appending `U` after each
+    /// element, including after the last element of the iterator.
+    fn append_terminated<I, U>(&mut self, iter: I, term: U)
+    where
+        I: IntoIterator,
+        I::Item: ToTokens,
+        U: ToTokens;
+}
+
+impl TokenStreamExt for TokenStream {
+    fn append<U>(&mut self, token: U)
+    where
+        U: Into<TokenTree>,
+    {
+        self.extend(iter::once(token.into()));
+    }
+
+    fn append_all<I>(&mut self, iter: I)
+    where
+        I: IntoIterator,
+        I::Item: ToTokens,
+    {
+        for token in iter {
+            token.to_tokens(self);
+        }
+    }
+
+    fn append_separated<I, U>(&mut self, iter: I, op: U)
+    where
+        I: IntoIterator,
+        I::Item: ToTokens,
+        U: ToTokens,
+    {
+        for (i, token) in iter.into_iter().enumerate() {
+            if i > 0 {
+                op.to_tokens(self);
+            }
+            token.to_tokens(self);
+        }
+    }
+
+    fn append_terminated<I, U>(&mut self, iter: I, term: U)
+    where
+        I: IntoIterator,
+        I::Item: ToTokens,
+        U: ToTokens,
+    {
+        for token in iter {
+            token.to_tokens(self);
+            term.to_tokens(self);
+        }
+    }
+}
+
+mod private {
+    use proc_macro2::TokenStream;
+
+    pub trait Sealed {}
+
+    impl Sealed for TokenStream {}
+}
diff --git a/rust/quote/format.rs b/rust/quote/format.rs
new file mode 100644
index 000000000000..ec0bbf38ba37
--- /dev/null
+++ b/rust/quote/format.rs
@@ -0,0 +1,168 @@
+/// Formatting macro for constructing `Ident`s.
+///
+/// <br>
+///
+/// # Syntax
+///
+/// Syntax is copied from the [`format!`] macro, supporting both positional and
+/// named arguments.
+///
+/// Only a limited set of formatting traits are supported. The current mapping
+/// of format types to traits is:
+///
+/// * `{}` ⇒ [`IdentFragment`]
+/// * `{:o}` ⇒ [`Octal`](std::fmt::Octal)
+/// * `{:x}` ⇒ [`LowerHex`](std::fmt::LowerHex)
+/// * `{:X}` ⇒ [`UpperHex`](std::fmt::UpperHex)
+/// * `{:b}` ⇒ [`Binary`](std::fmt::Binary)
+///
+/// See [`std::fmt`] for more information.
+///
+/// <br>
+///
+/// # IdentFragment
+///
+/// Unlike `format!`, this macro uses the [`IdentFragment`] formatting trait by
+/// default. This trait is like `Display`, with a few differences:
+///
+/// * `IdentFragment` is only implemented for a limited set of types, such as
+///   unsigned integers and strings.
+/// * [`Ident`] arguments will have their `r#` prefixes stripped, if present.
+///
+/// [`IdentFragment`]: crate::IdentFragment
+/// [`Ident`]: proc_macro2::Ident
+///
+/// <br>
+///
+/// # Hygiene
+///
+/// The [`Span`] of the first `Ident` argument is used as the span of the final
+/// identifier, falling back to [`Span::call_site`] when no identifiers are
+/// provided.
+///
+/// ```
+/// # use quote::format_ident;
+/// # let ident = format_ident!("Ident");
+/// // If `ident` is an Ident, the span of `my_ident` will be inherited from it.
+/// let my_ident = format_ident!("My{}{}", ident, "IsCool");
+/// assert_eq!(my_ident, "MyIdentIsCool");
+/// ```
+///
+/// Alternatively, the span can be overridden by passing the `span` named
+/// argument.
+///
+/// ```
+/// # use quote::format_ident;
+/// # const IGNORE_TOKENS: &'static str = stringify! {
+/// let my_span = /* ... */;
+/// # };
+/// # let my_span = proc_macro2::Span::call_site();
+/// format_ident!("MyIdent", span = my_span);
+/// ```
+///
+/// [`Span`]: proc_macro2::Span
+/// [`Span::call_site`]: proc_macro2::Span::call_site
+///
+/// <p><br></p>
+///
+/// # Panics
+///
+/// This method will panic if the resulting formatted string is not a valid
+/// identifier.
+///
+/// <br>
+///
+/// # Examples
+///
+/// Composing raw and non-raw identifiers:
+/// ```
+/// # use quote::format_ident;
+/// let my_ident = format_ident!("My{}", "Ident");
+/// assert_eq!(my_ident, "MyIdent");
+///
+/// let raw = format_ident!("r#Raw");
+/// assert_eq!(raw, "r#Raw");
+///
+/// let my_ident_raw = format_ident!("{}Is{}", my_ident, raw);
+/// assert_eq!(my_ident_raw, "MyIdentIsRaw");
+/// ```
+///
+/// Integer formatting options:
+/// ```
+/// # use quote::format_ident;
+/// let num: u32 = 10;
+///
+/// let decimal = format_ident!("Id_{}", num);
+/// assert_eq!(decimal, "Id_10");
+///
+/// let octal = format_ident!("Id_{:o}", num);
+/// assert_eq!(octal, "Id_12");
+///
+/// let binary = format_ident!("Id_{:b}", num);
+/// assert_eq!(binary, "Id_1010");
+///
+/// let lower_hex = format_ident!("Id_{:x}", num);
+/// assert_eq!(lower_hex, "Id_a");
+///
+/// let upper_hex = format_ident!("Id_{:X}", num);
+/// assert_eq!(upper_hex, "Id_A");
+/// ```
+#[macro_export]
+macro_rules! format_ident {
+    ($fmt:expr) => {
+        $crate::format_ident_impl!([
+            $crate::__private::Option::None,
+            $fmt
+        ])
+    };
+
+    ($fmt:expr, $($rest:tt)*) => {
+        $crate::format_ident_impl!([
+            $crate::__private::Option::None,
+            $fmt
+        ] $($rest)*)
+    };
+}
+
+#[macro_export]
+#[doc(hidden)]
+macro_rules! format_ident_impl {
+    // Final state
+    ([$span:expr, $($fmt:tt)*]) => {
+        $crate::__private::mk_ident(
+            &$crate::__private::format!($($fmt)*),
+            $span,
+        )
+    };
+
+    // Span argument
+    ([$old:expr, $($fmt:tt)*] span = $span:expr) => {
+        $crate::format_ident_impl!([$old, $($fmt)*] span = $span,)
+    };
+    ([$old:expr, $($fmt:tt)*] span = $span:expr, $($rest:tt)*) => {
+        $crate::format_ident_impl!([
+            $crate::__private::Option::Some::<$crate::__private::Span>($span),
+            $($fmt)*
+        ] $($rest)*)
+    };
+
+    // Named argument
+    ([$span:expr, $($fmt:tt)*] $name:ident = $arg:expr) => {
+        $crate::format_ident_impl!([$span, $($fmt)*] $name = $arg,)
+    };
+    ([$span:expr, $($fmt:tt)*] $name:ident = $arg:expr, $($rest:tt)*) => {
+        match $crate::__private::IdentFragmentAdapter(&$arg) {
+            arg => $crate::format_ident_impl!([$span.or(arg.span()), $($fmt)*, $name = arg] $($rest)*),
+        }
+    };
+
+    // Positional argument
+    ([$span:expr, $($fmt:tt)*] $arg:expr) => {
+        $crate::format_ident_impl!([$span, $($fmt)*] $arg,)
+    };
+    ([$span:expr, $($fmt:tt)*] $arg:expr, $($rest:tt)*) => {
+        match $crate::__private::IdentFragmentAdapter(&$arg) {
+            arg => $crate::format_ident_impl!([$span.or(arg.span()), $($fmt)*, arg] $($rest)*),
+        }
+    };
+}
diff --git a/rust/quote/ident_fragment.rs b/rust/quote/ident_fragment.rs
new file mode 100644
index 000000000000..6c2a9a87acb4
--- /dev/null
+++ b/rust/quote/ident_fragment.rs
@@ -0,0 +1,88 @@
+use alloc::borrow::Cow;
+use core::fmt;
+use proc_macro2::{Ident, Span};
+
+/// Specialized formatting trait used by `format_ident!`.
+///
+/// [`Ident`] arguments formatted using this trait will have their `r#` prefix
+/// stripped, if present.
+///
+/// See [`format_ident!`] for more information.
+///
+/// [`format_ident!`]: crate::format_ident
+pub trait IdentFragment {
+    /// Format this value as an identifier fragment.
+    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result;
+
+    /// Span associated with this `IdentFragment`.
+    ///
+    /// If non-`None`, may be inherited by formatted identifiers.
+    fn span(&self) -> Option<Span> {
+        None
+    }
+}
+
+impl<T: IdentFragment + ?Sized> IdentFragment for &T {
+    fn span(&self) -> Option<Span> {
+        <T as IdentFragment>::span(*self)
+    }
+
+    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
+        IdentFragment::fmt(*self, f)
+    }
+}
+
+impl<T: IdentFragment + ?Sized> IdentFragment for &mut T {
+    fn span(&self) -> Option<Span> {
+        <T as IdentFragment>::span(*self)
+    }
+
+    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
+        IdentFragment::fmt(*self, f)
+    }
+}
+
+impl IdentFragment for Ident {
+    fn span(&self) -> Option<Span> {
+        Some(self.span())
+    }
+
+    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
+        let id = self.to_string();
+        if let Some(id) = id.strip_prefix("r#") {
+            fmt::Display::fmt(id, f)
+        } else {
+            fmt::Display::fmt(&id[..], f)
+        }
+    }
+}
+
+impl<T> IdentFragment for Cow<'_, T>
+where
+    T: IdentFragment + ToOwned + ?Sized,
+{
+    fn span(&self) -> Option<Span> {
+        T::span(self)
+    }
+
+    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
+        T::fmt(self, f)
+    }
+}
+
+// Limited set of types which this is implemented for, as we want to avoid types
+// which will often include non-identifier characters in their `Display` impl.
+macro_rules! ident_fragment_display {
+    ($($T:ty),*) => {
+        $(
+            impl IdentFragment for $T {
+                fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
+                    fmt::Display::fmt(self, f)
+                }
+            }
+        )*
+    };
+}
+
+ident_fragment_display!(bool, str, String, char);
+ident_fragment_display!(u8, u16, u32, u64, u128, usize);
diff --git a/rust/quote/lib.rs b/rust/quote/lib.rs
new file mode 100644
index 000000000000..0a12d607f279
--- /dev/null
+++ b/rust/quote/lib.rs
@@ -0,0 +1,1454 @@
+//! [![github]](https://github.com/dtolnay/quote)&ensp;[![crates-io]](https://crates.io/crates/quote)&ensp;[![docs-rs]](https://docs.rs/quote)
+//!
+//! [github]: https://img.shields.io/badge/github-8da0cb?style=for-the-badge&labelColor=555555&logo=github
+//! [crates-io]: https://img.shields.io/badge/crates.io-fc8d62?style=for-the-badge&labelColor=555555&logo=rust
+//! [docs-rs]: https://img.shields.io/badge/docs.rs-66c2a5?style=for-the-badge&labelColor=555555&logo=docs.rs
+//!
+//! <br>
+//!
+//! This crate provides the [`quote!`] macro for turning Rust syntax tree data
+//! structures into tokens of source code.
+//!
+//! Procedural macros in Rust receive a stream of tokens as input, execute
+//! arbitrary Rust code to determine how to manipulate those tokens, and produce
+//! a stream of tokens to hand back to the compiler to compile into the caller's
+//! crate. Quasi-quoting is a solution to one piece of that &mdash; producing
+//! tokens to return to the compiler.
+//!
+//! The idea of quasi-quoting is that we write *code* that we treat as *data*.
+//! Within the `quote!` macro, we can write what looks like code to our text
+//! editor or IDE. We get all the benefits of the editor's brace matching,
+//! syntax highlighting, indentation, and maybe autocompletion. But rather than
+//! compiling that as code into the current crate, we can treat it as data, pass
+//! it around, mutate it, and eventually hand it back to the compiler as tokens
+//! to compile into the macro caller's crate.
+//!
+//! This crate is motivated by the procedural macro use case, but is a
+//! general-purpose Rust quasi-quoting library and is not specific to procedural
+//! macros.
+//!
+//! ```toml
+//! [dependencies]
+//! quote = "1.0"
+//! ```
+//!
+//! <br>
+//!
+//! # Example
+//!
+//! The following quasi-quoted block of code is something you might find in [a]
+//! procedural macro having to do with data structure serialization. The `#var`
+//! syntax performs interpolation of runtime variables into the quoted tokens.
+//! Check out the documentation of the [`quote!`] macro for more detail about
+//! the syntax. See also the [`quote_spanned!`] macro which is important for
+//! implementing hygienic procedural macros.
+//!
+//! [a]: https://serde.rs/
+//!
+//! ```
+//! # use quote::quote;
+//! #
+//! # let generics = "";
+//! # let where_clause = "";
+//! # let field_ty = "";
+//! # let item_ty = "";
+//! # let path = "";
+//! # let value = "";
+//! #
+//! let tokens = quote! {
+//!     struct SerializeWith #generics #where_clause {
+//!         value: &'a #field_ty,
+//!         phantom: core::marker::PhantomData<#item_ty>,
+//!     }
+//!
+//!     impl #generics serde::Serialize for SerializeWith #generics #where_clause {
+//!         fn serialize<S>(&self, serializer: S) -> Result<S::Ok, S::Error>
+//!         where
+//!             S: serde::Serializer,
+//!         {
+//!             #path(self.value, serializer)
+//!         }
+//!     }
+//!
+//!     SerializeWith {
+//!         value: #value,
+//!         phantom: core::marker::PhantomData::<#item_ty>,
+//!     }
+//! };
+//! ```
+//!
+//! <br>
+//!
+//! # Non-macro code generators
+//!
+//! When using `quote` in a build.rs or main.rs and writing the output out to a
+//! file, consider having the code generator pass the tokens through
+//! [prettyplease] before writing. This way if an error occurs in the generated
+//! code it is convenient for a human to read and debug.
+//!
+//! [prettyplease]: https://github.com/dtolnay/prettyplease
+
+// Quote types in rustdoc of other crates get linked to here.
+#![doc(html_root_url = "https://docs.rs/quote/1.0.40")]
+#![allow(
+    clippy::doc_markdown,
+    clippy::elidable_lifetime_names,
+    clippy::missing_errors_doc,
+    clippy::missing_panics_doc,
+    clippy::module_name_repetitions,
+    clippy::needless_lifetimes,
+    // false positive https://github.com/rust-lang/rust-clippy/issues/6983
+    clippy::wrong_self_convention,
+)]
+
+extern crate alloc;
+
+#[cfg(feature = "proc-macro")]
+extern crate proc_macro;
+
+mod ext;
+mod format;
+mod ident_fragment;
+mod to_tokens;
+
+// Not public API.
+#[doc(hidden)]
+#[path = "runtime.rs"]
+pub mod __private;
+
+pub use crate::ext::TokenStreamExt;
+pub use crate::ident_fragment::IdentFragment;
+pub use crate::to_tokens::ToTokens;
+
+// Not public API.
+#[doc(hidden)]
+pub mod spanned;
+
+macro_rules! __quote {
+    ($quote:item) => {
+        /// The whole point.
+        ///
+        /// Performs variable interpolation against the input and produces it as
+        /// [`proc_macro2::TokenStream`].
+        ///
+        /// Note: for returning tokens to the compiler in a procedural macro, use
+        /// `.into()` on the result to convert to [`proc_macro::TokenStream`].
+        ///
+        /// <br>
+        ///
+        /// # Interpolation
+        ///
+        /// Variable interpolation is done with `#var` (similar to `$var` in
+        /// `macro_rules!` macros). This grabs the `var` variable that is currently in
+        /// scope and inserts it in that location in the output tokens. Any type
+        /// implementing the [`ToTokens`] trait can be interpolated. This includes most
+        /// Rust primitive types as well as most of the syntax tree types from the [Syn]
+        /// crate.
+        ///
+        /// [Syn]: https://github.com/dtolnay/syn
+        ///
+        /// Repetition is done using `#(...)*` or `#(...),*` again similar to
+        /// `macro_rules!`. This iterates through the elements of any variable
+        /// interpolated within the repetition and inserts a copy of the repetition body
+        /// for each one. The variables in an interpolation may be a `Vec`, slice,
+        /// `BTreeSet`, or any `Iterator`.
+        ///
+        /// - `#(#var)*` — no separators
+        /// - `#(#var),*` — the character before the asterisk is used as a separator
+        /// - `#( struct #var; )*` — the repetition can contain other tokens
+        /// - `#( #k => println!("{}", #v), )*` — even multiple interpolations
+        ///
+        /// <br>
+        ///
+        /// # Hygiene
+        ///
+        /// Any interpolated tokens preserve the `Span` information provided by their
+        /// `ToTokens` implementation. Tokens that originate within the `quote!`
+        /// invocation are spanned with [`Span::call_site()`].
+        ///
+        /// [`Span::call_site()`]: proc_macro2::Span::call_site
+        ///
+        /// A different span can be provided through the [`quote_spanned!`] macro.
+        ///
+        /// <br>
+        ///
+        /// # Return type
+        ///
+        /// The macro evaluates to an expression of type `proc_macro2::TokenStream`.
+        /// Meanwhile Rust procedural macros are expected to return the type
+        /// `proc_macro::TokenStream`.
+        ///
+        /// The difference between the two types is that `proc_macro` types are entirely
+        /// specific to procedural macros and cannot ever exist in code outside of a
+        /// procedural macro, while `proc_macro2` types may exist anywhere including
+        /// tests and non-macro code like main.rs and build.rs. This is why even the
+        /// procedural macro ecosystem is largely built around `proc_macro2`, because
+        /// that ensures the libraries are unit testable and accessible in non-macro
+        /// contexts.
+        ///
+        /// There is a [`From`]-conversion in both directions so returning the output of
+        /// `quote!` from a procedural macro usually looks like `tokens.into()` or
+        /// `proc_macro::TokenStream::from(tokens)`.
+        ///
+        /// <br>
+        ///
+        /// # Examples
+        ///
+        /// ### Procedural macro
+        ///
+        /// The structure of a basic procedural macro is as follows. Refer to the [Syn]
+        /// crate for further useful guidance on using `quote!` as part of a procedural
+        /// macro.
+        ///
+        /// [Syn]: https://github.com/dtolnay/syn
+        ///
+        /// ```
+        /// # #[cfg(any())]
+        /// extern crate proc_macro;
+        /// # extern crate proc_macro2;
+        ///
+        /// # #[cfg(any())]
+        /// use proc_macro::TokenStream;
+        /// # use proc_macro2::TokenStream;
+        /// use quote::quote;
+        ///
+        /// # const IGNORE_TOKENS: &'static str = stringify! {
+        /// #[proc_macro_derive(HeapSize)]
+        /// # };
+        /// pub fn derive_heap_size(input: TokenStream) -> TokenStream {
+        ///     // Parse the input and figure out what implementation to generate...
+        ///     # const IGNORE_TOKENS: &'static str = stringify! {
+        ///     let name = /* ... */;
+        ///     let expr = /* ... */;
+        ///     # };
+        ///     #
+        ///     # let name = 0;
+        ///     # let expr = 0;
+        ///
+        ///     let expanded = quote! {
+        ///         // The generated impl.
+        ///         impl heapsize::HeapSize for #name {
+        ///             fn heap_size_of_children(&self) -> usize {
+        ///                 #expr
+        ///             }
+        ///         }
+        ///     };
+        ///
+        ///     // Hand the output tokens back to the compiler.
+        ///     TokenStream::from(expanded)
+        /// }
+        /// ```
+        ///
+        /// <p><br></p>
+        ///
+        /// ### Combining quoted fragments
+        ///
+        /// Usually you don't end up constructing an entire final `TokenStream` in one
+        /// piece. Different parts may come from different helper functions. The tokens
+        /// produced by `quote!` themselves implement `ToTokens` and so can be
+        /// interpolated into later `quote!` invocations to build up a final result.
+        ///
+        /// ```
+        /// # use quote::quote;
+        /// #
+        /// let type_definition = quote! {...};
+        /// let methods = quote! {...};
+        ///
+        /// let tokens = quote! {
+        ///     #type_definition
+        ///     #methods
+        /// };
+        /// ```
+        ///
+        /// <p><br></p>
+        ///
+        /// ### Constructing identifiers
+        ///
+        /// Suppose we have an identifier `ident` which came from somewhere in a macro
+        /// input and we need to modify it in some way for the macro output. Let's
+        /// consider prepending the identifier with an underscore.
+        ///
+        /// Simply interpolating the identifier next to an underscore will not have the
+        /// behavior of concatenating them. The underscore and the identifier will
+        /// continue to be two separate tokens as if you had written `_ x`.
+        ///
+        /// ```
+        /// # use proc_macro2::{self as syn, Span};
+        /// # use quote::quote;
+        /// #
+        /// # let ident = syn::Ident::new("i", Span::call_site());
+        /// #
+        /// // incorrect
+        /// quote! {
+        ///     let mut _#ident = 0;
+        /// }
+        /// # ;
+        /// ```
+        ///
+        /// The solution is to build a new identifier token with the correct value. As
+        /// this is such a common case, the [`format_ident!`] macro provides a
+        /// convenient utility for doing so correctly.
+        ///
+        /// ```
+        /// # use proc_macro2::{Ident, Span};
+        /// # use quote::{format_ident, quote};
+        /// #
+        /// # let ident = Ident::new("i", Span::call_site());
+        /// #
+        /// let varname = format_ident!("_{}", ident);
+        /// quote! {
+        ///     let mut #varname = 0;
+        /// }
+        /// # ;
+        /// ```
+        ///
+        /// Alternatively, the APIs provided by Syn and proc-macro2 can be used to
+        /// directly build the identifier. This is roughly equivalent to the above, but
+        /// will not handle `ident` being a raw identifier.
+        ///
+        /// ```
+        /// # use proc_macro2::{self as syn, Span};
+        /// # use quote::quote;
+        /// #
+        /// # let ident = syn::Ident::new("i", Span::call_site());
+        /// #
+        /// let concatenated = format!("_{}", ident);
+        /// let varname = syn::Ident::new(&concatenated, ident.span());
+        /// quote! {
+        ///     let mut #varname = 0;
+        /// }
+        /// # ;
+        /// ```
+        ///
+        /// <p><br></p>
+        ///
+        /// ### Making method calls
+        ///
+        /// Let's say our macro requires some type specified in the macro input to have
+        /// a constructor called `new`. We have the type in a variable called
+        /// `field_type` of type `syn::Type` and want to invoke the constructor.
+        ///
+        /// ```
+        /// # use quote::quote;
+        /// #
+        /// # let field_type = quote!(...);
+        /// #
+        /// // incorrect
+        /// quote! {
+        ///     let value = #field_type::new();
+        /// }
+        /// # ;
+        /// ```
+        ///
+        /// This works only sometimes. If `field_type` is `String`, the expanded code
+        /// contains `String::new()` which is fine. But if `field_type` is something
+        /// like `Vec<i32>` then the expanded code is `Vec<i32>::new()` which is invalid
+        /// syntax. Ordinarily in handwritten Rust we would write `Vec::<i32>::new()`
+        /// but for macros often the following is more convenient.
+        ///
+        /// ```
+        /// # use quote::quote;
+        /// #
+        /// # let field_type = quote!(...);
+        /// #
+        /// quote! {
+        ///     let value = <#field_type>::new();
+        /// }
+        /// # ;
+        /// ```
+        ///
+        /// This expands to `<Vec<i32>>::new()` which behaves correctly.
+        ///
+        /// A similar pattern is appropriate for trait methods.
+        ///
+        /// ```
+        /// # use quote::quote;
+        /// #
+        /// # let field_type = quote!(...);
+        /// #
+        /// quote! {
+        ///     let value = <#field_type as core::default::Default>::default();
+        /// }
+        /// # ;
+        /// ```
+        ///
+        /// <p><br></p>
+        ///
+        /// ### Interpolating text inside of doc comments
+        ///
+        /// Neither doc comments nor string literals get interpolation behavior in
+        /// quote:
+        ///
+        /// ```compile_fail
+        /// quote! {
+        ///     /// try to interpolate: #ident
+        ///     ///
+        ///     /// ...
+        /// }
+        /// ```
+        ///
+        /// ```compile_fail
+        /// quote! {
+        ///     #[doc = "try to interpolate: #ident"]
+        /// }
+        /// ```
+        ///
+        /// Instead the best way to build doc comments that involve variables is by
+        /// formatting the doc string literal outside of quote.
+        ///
+        /// ```rust
+        /// # use proc_macro2::{Ident, Span};
+        /// # use quote::quote;
+        /// #
+        /// # const IGNORE: &str = stringify! {
+        /// let msg = format!(...);
+        /// # };
+        /// #
+        /// # let ident = Ident::new("var", Span::call_site());
+        /// # let msg = format!("try to interpolate: {}", ident);
+        /// quote! {
+        ///     #[doc = #msg]
+        ///     ///
+        ///     /// ...
+        /// }
+        /// # ;
+        /// ```
+        ///
+        /// <p><br></p>
+        ///
+        /// ### Indexing into a tuple struct
+        ///
+        /// When interpolating indices of a tuple or tuple struct, we need them not to
+        /// appears suffixed as integer literals by interpolating them as [`syn::Index`]
+        /// instead.
+        ///
+        /// [`syn::Index`]: https://docs.rs/syn/2.0/syn/struct.Index.html
+        ///
+        /// ```compile_fail
+        /// let i = 0usize..self.fields.len();
+        ///
+        /// // expands to 0 + self.0usize.heap_size() + self.1usize.heap_size() + ...
+        /// // which is not valid syntax
+        /// quote! {
+        ///     0 #( + self.#i.heap_size() )*
+        /// }
+        /// ```
+        ///
+        /// ```
+        /// # use proc_macro2::{Ident, TokenStream};
+        /// # use quote::quote;
+        /// #
+        /// # mod syn {
+        /// #     use proc_macro2::{Literal, TokenStream};
+        /// #     use quote::{ToTokens, TokenStreamExt};
+        /// #
+        /// #     pub struct Index(usize);
+        /// #
+        /// #     impl From<usize> for Index {
+        /// #         fn from(i: usize) -> Self {
+        /// #             Index(i)
+        /// #         }
+        /// #     }
+        /// #
+        /// #     impl ToTokens for Index {
+        /// #         fn to_tokens(&self, tokens: &mut TokenStream) {
+        /// #             tokens.append(Literal::usize_unsuffixed(self.0));
+        /// #         }
+        /// #     }
+        /// # }
+        /// #
+        /// # struct Struct {
+        /// #     fields: Vec<Ident>,
+        /// # }
+        /// #
+        /// # impl Struct {
+        /// #     fn example(&self) -> TokenStream {
+        /// let i = (0..self.fields.len()).map(syn::Index::from);
+        ///
+        /// // expands to 0 + self.0.heap_size() + self.1.heap_size() + ...
+        /// quote! {
+        ///     0 #( + self.#i.heap_size() )*
+        /// }
+        /// #     }
+        /// # }
+        /// ```
+        $quote
+    };
+}
+
+#[cfg(doc)]
+__quote![
+    #[macro_export]
+    macro_rules! quote {
+        ($($tt:tt)*) => {
+            ...
+        };
+    }
+];
+
+#[cfg(not(doc))]
+__quote![
+    #[macro_export]
+    macro_rules! quote {
+        () => {
+            $crate::__private::TokenStream::new()
+        };
+
+        // Special case rule for a single tt, for performance.
+        ($tt:tt) => {{
+            let mut _s = $crate::__private::TokenStream::new();
+            $crate::quote_token!{$tt _s}
+            _s
+        }};
+
+        // Special case rules for two tts, for performance.
+        (# $var:ident) => {{
+            let mut _s = $crate::__private::TokenStream::new();
+            $crate::ToTokens::to_tokens(&$var, &mut _s);
+            _s
+        }};
+        ($tt1:tt $tt2:tt) => {{
+            let mut _s = $crate::__private::TokenStream::new();
+            $crate::quote_token!{$tt1 _s}
+            $crate::quote_token!{$tt2 _s}
+            _s
+        }};
+
+        // Rule for any other number of tokens.
+        ($($tt:tt)*) => {{
+            let mut _s = $crate::__private::TokenStream::new();
+            $crate::quote_each_token!{_s $($tt)*}
+            _s
+        }};
+    }
+];
+
+macro_rules! __quote_spanned {
+    ($quote_spanned:item) => {
+        /// Same as `quote!`, but applies a given span to all tokens originating within
+        /// the macro invocation.
+        ///
+        /// <br>
+        ///
+        /// # Syntax
+        ///
+        /// A span expression of type [`Span`], followed by `=>`, followed by the tokens
+        /// to quote. The span expression should be brief &mdash; use a variable for
+        /// anything more than a few characters. There should be no space before the
+        /// `=>` token.
+        ///
+        /// [`Span`]: proc_macro2::Span
+        ///
+        /// ```
+        /// # use proc_macro2::Span;
+        /// # use quote::quote_spanned;
+        /// #
+        /// # const IGNORE_TOKENS: &'static str = stringify! {
+        /// let span = /* ... */;
+        /// # };
+        /// # let span = Span::call_site();
+        /// # let init = 0;
+        ///
+        /// // On one line, use parentheses.
+        /// let tokens = quote_spanned!(span=> Box::into_raw(Box::new(#init)));
+        ///
+        /// // On multiple lines, place the span at the top and use braces.
+        /// let tokens = quote_spanned! {span=>
+        ///     Box::into_raw(Box::new(#init))
+        /// };
+        /// ```
+        ///
+        /// The lack of space before the `=>` should look jarring to Rust programmers
+        /// and this is intentional. The formatting is designed to be visibly
+        /// off-balance and draw the eye a particular way, due to the span expression
+        /// being evaluated in the context of the procedural macro and the remaining
+        /// tokens being evaluated in the generated code.
+        ///
+        /// <br>
+        ///
+        /// # Hygiene
+        ///
+        /// Any interpolated tokens preserve the `Span` information provided by their
+        /// `ToTokens` implementation. Tokens that originate within the `quote_spanned!`
+        /// invocation are spanned with the given span argument.
+        ///
+        /// <br>
+        ///
+        /// # Example
+        ///
+        /// The following procedural macro code uses `quote_spanned!` to assert that a
+        /// particular Rust type implements the [`Sync`] trait so that references can be
+        /// safely shared between threads.
+        ///
+        /// ```
+        /// # use quote::{quote_spanned, TokenStreamExt, ToTokens};
+        /// # use proc_macro2::{Span, TokenStream};
+        /// #
+        /// # struct Type;
+        /// #
+        /// # impl Type {
+        /// #     fn span(&self) -> Span {
+        /// #         Span::call_site()
+        /// #     }
+        /// # }
+        /// #
+        /// # impl ToTokens for Type {
+        /// #     fn to_tokens(&self, _tokens: &mut TokenStream) {}
+        /// # }
+        /// #
+        /// # let ty = Type;
+        /// # let call_site = Span::call_site();
+        /// #
+        /// let ty_span = ty.span();
+        /// let assert_sync = quote_spanned! {ty_span=>
+        ///     struct _AssertSync where #ty: Sync;
+        /// };
+        /// ```
+        ///
+        /// If the assertion fails, the user will see an error like the following. The
+        /// input span of their type is highlighted in the error.
+        ///
+        /// ```text
+        /// error[E0277]: the trait bound `*const (): std::marker::Sync` is not satisfied
+        ///   --> src/main.rs:10:21
+        ///    |
+        /// 10 |     static ref PTR: *const () = &();
+        ///    |                     ^^^^^^^^^ `*const ()` cannot be shared between threads safely
+        /// ```
+        ///
+        /// In this example it is important for the where-clause to be spanned with the
+        /// line/column information of the user's input type so that error messages are
+        /// placed appropriately by the compiler.
+        $quote_spanned
+    };
+}
+
+#[cfg(doc)]
+__quote_spanned![
+    #[macro_export]
+    macro_rules! quote_spanned {
+        ($span:expr=> $($tt:tt)*) => {
+            ...
+        };
+    }
+];
+
+#[cfg(not(doc))]
+__quote_spanned![
+    #[macro_export]
+    macro_rules! quote_spanned {
+        ($span:expr=>) => {{
+            let _: $crate::__private::Span = $crate::__private::get_span($span).__into_span();
+            $crate::__private::TokenStream::new()
+        }};
+
+        // Special case rule for a single tt, for performance.
+        ($span:expr=> $tt:tt) => {{
+            let mut _s = $crate::__private::TokenStream::new();
+            let _span: $crate::__private::Span = $crate::__private::get_span($span).__into_span();
+            $crate::quote_token_spanned!{$tt _s _span}
+            _s
+        }};
+
+        // Special case rules for two tts, for performance.
+        ($span:expr=> # $var:ident) => {{
+            let mut _s = $crate::__private::TokenStream::new();
+            let _: $crate::__private::Span = $crate::__private::get_span($span).__into_span();
+            $crate::ToTokens::to_tokens(&$var, &mut _s);
+            _s
+        }};
+        ($span:expr=> $tt1:tt $tt2:tt) => {{
+            let mut _s = $crate::__private::TokenStream::new();
+            let _span: $crate::__private::Span = $crate::__private::get_span($span).__into_span();
+            $crate::quote_token_spanned!{$tt1 _s _span}
+            $crate::quote_token_spanned!{$tt2 _s _span}
+            _s
+        }};
+
+        // Rule for any other number of tokens.
+        ($span:expr=> $($tt:tt)*) => {{
+            let mut _s = $crate::__private::TokenStream::new();
+            let _span: $crate::__private::Span = $crate::__private::get_span($span).__into_span();
+            $crate::quote_each_token_spanned!{_s _span $($tt)*}
+            _s
+        }};
+    }
+];
+
+// Extract the names of all #metavariables and pass them to the $call macro.
+//
+// in:   pounded_var_names!(then!(...) a #b c #( #d )* #e)
+// out:  then!(... b);
+//       then!(... d);
+//       then!(... e);
+#[macro_export]
+#[doc(hidden)]
+macro_rules! pounded_var_names {
+    ($call:ident! $extra:tt $($tts:tt)*) => {
+        $crate::pounded_var_names_with_context!{$call! $extra
+            (@ $($tts)*)
+            ($($tts)* @)
+        }
+    };
+}
+
+#[macro_export]
+#[doc(hidden)]
+macro_rules! pounded_var_names_with_context {
+    ($call:ident! $extra:tt ($($b1:tt)*) ($($curr:tt)*)) => {
+        $(
+            $crate::pounded_var_with_context!{$call! $extra $b1 $curr}
+        )*
+    };
+}
+
+#[macro_export]
+#[doc(hidden)]
+macro_rules! pounded_var_with_context {
+    ($call:ident! $extra:tt $b1:tt ( $($inner:tt)* )) => {
+        $crate::pounded_var_names!{$call! $extra $($inner)*}
+    };
+
+    ($call:ident! $extra:tt $b1:tt [ $($inner:tt)* ]) => {
+        $crate::pounded_var_names!{$call! $extra $($inner)*}
+    };
+
+    ($call:ident! $extra:tt $b1:tt { $($inner:tt)* }) => {
+        $crate::pounded_var_names!{$call! $extra $($inner)*}
+    };
+
+    ($call:ident!($($extra:tt)*) # $var:ident) => {
+        $crate::$call!($($extra)* $var);
+    };
+
+    ($call:ident! $extra:tt $b1:tt $curr:tt) => {};
+}
+
+#[macro_export]
+#[doc(hidden)]
+macro_rules! quote_bind_into_iter {
+    ($has_iter:ident $var:ident) => {
+        // `mut` may be unused if $var occurs multiple times in the list.
+        #[allow(unused_mut)]
+        let (mut $var, i) = $var.quote_into_iter();
+        let $has_iter = $has_iter | i;
+    };
+}
+
+#[macro_export]
+#[doc(hidden)]
+macro_rules! quote_bind_next_or_break {
+    ($var:ident) => {
+        let $var = match $var.next() {
+            Some(_x) => $crate::__private::RepInterp(_x),
+            None => break,
+        };
+    };
+}
+
+// The obvious way to write this macro is as a tt muncher. This implementation
+// does something more complex for two reasons.
+//
+//   - With a tt muncher it's easy to hit Rust's built-in recursion_limit, which
+//     this implementation avoids because it isn't tail recursive.
+//
+//   - Compile times for a tt muncher are quadratic relative to the length of
+//     the input. This implementation is linear, so it will be faster
+//     (potentially much faster) for big inputs. However, the constant factors
+//     of this implementation are higher than that of a tt muncher, so it is
+//     somewhat slower than a tt muncher if there are many invocations with
+//     short inputs.
+//
+// An invocation like this:
+//
+//     quote_each_token!(_s a b c d e f g h i j);
+//
+// expands to this:
+//
+//     quote_tokens_with_context!(_s
+//         (@  @  @  @   @   @   a   b   c   d   e   f   g  h  i  j)
+//         (@  @  @  @   @   a   b   c   d   e   f   g   h  i  j  @)
+//         (@  @  @  @   a   b   c   d   e   f   g   h   i  j  @  @)
+//         (@  @  @ (a) (b) (c) (d) (e) (f) (g) (h) (i) (j) @  @  @)
+//         (@  @  a  b   c   d   e   f   g   h   i   j   @  @  @  @)
+//         (@  a  b  c   d   e   f   g   h   i   j   @   @  @  @  @)
+//         (a  b  c  d   e   f   g   h   i   j   @   @   @  @  @  @)
+//     );
+//
+// which gets transposed and expanded to this:
+//
+//     quote_token_with_context!(_s @ @ @  @  @ @ a);
+//     quote_token_with_context!(_s @ @ @  @  @ a b);
+//     quote_token_with_context!(_s @ @ @  @  a b c);
+//     quote_token_with_context!(_s @ @ @ (a) b c d);
+//     quote_token_with_context!(_s @ @ a (b) c d e);
+//     quote_token_with_context!(_s @ a b (c) d e f);
+//     quote_token_with_context!(_s a b c (d) e f g);
+//     quote_token_with_context!(_s b c d (e) f g h);
+//     quote_token_with_context!(_s c d e (f) g h i);
+//     quote_token_with_context!(_s d e f (g) h i j);
+//     quote_token_with_context!(_s e f g (h) i j @);
+//     quote_token_with_context!(_s f g h (i) j @ @);
+//     quote_token_with_context!(_s g h i (j) @ @ @);
+//     quote_token_with_context!(_s h i j  @  @ @ @);
+//     quote_token_with_context!(_s i j @  @  @ @ @);
+//     quote_token_with_context!(_s j @ @  @  @ @ @);
+//
+// Without having used muncher-style recursion, we get one invocation of
+// quote_token_with_context for each original tt, with three tts of context on
+// either side. This is enough for the longest possible interpolation form (a
+// repetition with separator, as in `# (#var) , *`) to be fully represented with
+// the first or last tt in the middle.
+//
+// The middle tt (surrounded by parentheses) is the tt being processed.
+//
+//   - When it is a `#`, quote_token_with_context can do an interpolation. The
+//     interpolation kind will depend on the three subsequent tts.
+//
+//   - When it is within a later part of an interpolation, it can be ignored
+//     because the interpolation has already been done.
+//
+//   - When it is not part of an interpolation it can be pushed as a single
+//     token into the output.
+//
+//   - When the middle token is an unparenthesized `@`, that call is one of the
+//     first 3 or last 3 calls of quote_token_with_context and does not
+//     correspond to one of the original input tokens, so turns into nothing.
+#[macro_export]
+#[doc(hidden)]
+macro_rules! quote_each_token {
+    ($tokens:ident $($tts:tt)*) => {
+        $crate::quote_tokens_with_context!{$tokens
+            (@ @ @ @ @ @ $($tts)*)
+            (@ @ @ @ @ $($tts)* @)
+            (@ @ @ @ $($tts)* @ @)
+            (@ @ @ $(($tts))* @ @ @)
+            (@ @ $($tts)* @ @ @ @)
+            (@ $($tts)* @ @ @ @ @)
+            ($($tts)* @ @ @ @ @ @)
+        }
+    };
+}
+
+// See the explanation on quote_each_token.
+#[macro_export]
+#[doc(hidden)]
+macro_rules! quote_each_token_spanned {
+    ($tokens:ident $span:ident $($tts:tt)*) => {
+        $crate::quote_tokens_with_context_spanned!{$tokens $span
+            (@ @ @ @ @ @ $($tts)*)
+            (@ @ @ @ @ $($tts)* @)
+            (@ @ @ @ $($tts)* @ @)
+            (@ @ @ $(($tts))* @ @ @)
+            (@ @ $($tts)* @ @ @ @)
+            (@ $($tts)* @ @ @ @ @)
+            ($($tts)* @ @ @ @ @ @)
+        }
+    };
+}
+
+// See the explanation on quote_each_token.
+#[macro_export]
+#[doc(hidden)]
+macro_rules! quote_tokens_with_context {
+    ($tokens:ident
+        ($($b3:tt)*) ($($b2:tt)*) ($($b1:tt)*)
+        ($($curr:tt)*)
+        ($($a1:tt)*) ($($a2:tt)*) ($($a3:tt)*)
+    ) => {
+        $(
+            $crate::quote_token_with_context!{$tokens $b3 $b2 $b1 $curr $a1 $a2 $a3}
+        )*
+    };
+}
+
+// See the explanation on quote_each_token.
+#[macro_export]
+#[doc(hidden)]
+macro_rules! quote_tokens_with_context_spanned {
+    ($tokens:ident $span:ident
+        ($($b3:tt)*) ($($b2:tt)*) ($($b1:tt)*)
+        ($($curr:tt)*)
+        ($($a1:tt)*) ($($a2:tt)*) ($($a3:tt)*)
+    ) => {
+        $(
+            $crate::quote_token_with_context_spanned!{$tokens $span $b3 $b2 $b1 $curr $a1 $a2 $a3}
+        )*
+    };
+}
+
+// See the explanation on quote_each_token.
+#[macro_export]
+#[doc(hidden)]
+macro_rules! quote_token_with_context {
+    // Unparenthesized `@` indicates this call does not correspond to one of the
+    // original input tokens. Ignore it.
+    ($tokens:ident $b3:tt $b2:tt $b1:tt @ $a1:tt $a2:tt $a3:tt) => {};
+
+    // A repetition with no separator.
+    ($tokens:ident $b3:tt $b2:tt $b1:tt (#) ( $($inner:tt)* ) * $a3:tt) => {{
+        use $crate::__private::ext::*;
+        let has_iter = $crate::__private::ThereIsNoIteratorInRepetition;
+        $crate::pounded_var_names!{quote_bind_into_iter!(has_iter) () $($inner)*}
+        let _: $crate::__private::HasIterator = has_iter;
+        // This is `while true` instead of `loop` because if there are no
+        // iterators used inside of this repetition then the body would not
+        // contain any `break`, so the compiler would emit unreachable code
+        // warnings on anything below the loop. We use has_iter to detect and
+        // fail to compile when there are no iterators, so here we just work
+        // around the unneeded extra warning.
+        while true {
+            $crate::pounded_var_names!{quote_bind_next_or_break!() () $($inner)*}
+            $crate::quote_each_token!{$tokens $($inner)*}
+        }
+    }};
+    // ... and one step later.
+    ($tokens:ident $b3:tt $b2:tt # (( $($inner:tt)* )) * $a2:tt $a3:tt) => {};
+    // ... and one step later.
+    ($tokens:ident $b3:tt # ( $($inner:tt)* ) (*) $a1:tt $a2:tt $a3:tt) => {};
+
+    // A repetition with separator.
+    ($tokens:ident $b3:tt $b2:tt $b1:tt (#) ( $($inner:tt)* ) $sep:tt *) => {{
+        use $crate::__private::ext::*;
+        let mut _i = 0usize;
+        let has_iter = $crate::__private::ThereIsNoIteratorInRepetition;
+        $crate::pounded_var_names!{quote_bind_into_iter!(has_iter) () $($inner)*}
+        let _: $crate::__private::HasIterator = has_iter;
+        while true {
+            $crate::pounded_var_names!{quote_bind_next_or_break!() () $($inner)*}
+            if _i > 0 {
+                $crate::quote_token!{$sep $tokens}
+            }
+            _i += 1;
+            $crate::quote_each_token!{$tokens $($inner)*}
+        }
+    }};
+    // ... and one step later.
+    ($tokens:ident $b3:tt $b2:tt # (( $($inner:tt)* )) $sep:tt * $a3:tt) => {};
+    // ... and one step later.
+    ($tokens:ident $b3:tt # ( $($inner:tt)* ) ($sep:tt) * $a2:tt $a3:tt) => {};
+    // (A special case for `#(var)**`, where the first `*` is treated as the
+    // repetition symbol and the second `*` is treated as an ordinary token.)
+    ($tokens:ident # ( $($inner:tt)* ) * (*) $a1:tt $a2:tt $a3:tt) => {
+        // https://github.com/dtolnay/quote/issues/130
+        $crate::quote_token!{* $tokens}
+    };
+    // ... and one step later.
+    ($tokens:ident # ( $($inner:tt)* ) $sep:tt (*) $a1:tt $a2:tt $a3:tt) => {};
+
+    // A non-repetition interpolation.
+    ($tokens:ident $b3:tt $b2:tt $b1:tt (#) $var:ident $a2:tt $a3:tt) => {
+        $crate::ToTokens::to_tokens(&$var, &mut $tokens);
+    };
+    // ... and one step later.
+    ($tokens:ident $b3:tt $b2:tt # ($var:ident) $a1:tt $a2:tt $a3:tt) => {};
+
+    // An ordinary token, not part of any interpolation.
+    ($tokens:ident $b3:tt $b2:tt $b1:tt ($curr:tt) $a1:tt $a2:tt $a3:tt) => {
+        $crate::quote_token!{$curr $tokens}
+    };
+}
+
+// See the explanation on quote_each_token, and on the individual rules of
+// quote_token_with_context.
+#[macro_export]
+#[doc(hidden)]
+macro_rules! quote_token_with_context_spanned {
+    ($tokens:ident $span:ident $b3:tt $b2:tt $b1:tt @ $a1:tt $a2:tt $a3:tt) => {};
+
+    ($tokens:ident $span:ident $b3:tt $b2:tt $b1:tt (#) ( $($inner:tt)* ) * $a3:tt) => {{
+        use $crate::__private::ext::*;
+        let has_iter = $crate::__private::ThereIsNoIteratorInRepetition;
+        $crate::pounded_var_names!{quote_bind_into_iter!(has_iter) () $($inner)*}
+        let _: $crate::__private::HasIterator = has_iter;
+        while true {
+            $crate::pounded_var_names!{quote_bind_next_or_break!() () $($inner)*}
+            $crate::quote_each_token_spanned!{$tokens $span $($inner)*}
+        }
+    }};
+    ($tokens:ident $span:ident $b3:tt $b2:tt # (( $($inner:tt)* )) * $a2:tt $a3:tt) => {};
+    ($tokens:ident $span:ident $b3:tt # ( $($inner:tt)* ) (*) $a1:tt $a2:tt $a3:tt) => {};
+
+    ($tokens:ident $span:ident $b3:tt $b2:tt $b1:tt (#) ( $($inner:tt)* ) $sep:tt *) => {{
+        use $crate::__private::ext::*;
+        let mut _i = 0usize;
+        let has_iter = $crate::__private::ThereIsNoIteratorInRepetition;
+        $crate::pounded_var_names!{quote_bind_into_iter!(has_iter) () $($inner)*}
+        let _: $crate::__private::HasIterator = has_iter;
+        while true {
+            $crate::pounded_var_names!{quote_bind_next_or_break!() () $($inner)*}
+            if _i > 0 {
+                $crate::quote_token_spanned!{$sep $tokens $span}
+            }
+            _i += 1;
+            $crate::quote_each_token_spanned!{$tokens $span $($inner)*}
+        }
+    }};
+    ($tokens:ident $span:ident $b3:tt $b2:tt # (( $($inner:tt)* )) $sep:tt * $a3:tt) => {};
+    ($tokens:ident $span:ident $b3:tt # ( $($inner:tt)* ) ($sep:tt) * $a2:tt $a3:tt) => {};
+    ($tokens:ident $span:ident # ( $($inner:tt)* ) * (*) $a1:tt $a2:tt $a3:tt) => {
+        // https://github.com/dtolnay/quote/issues/130
+        $crate::quote_token_spanned!{* $tokens $span}
+    };
+    ($tokens:ident $span:ident # ( $($inner:tt)* ) $sep:tt (*) $a1:tt $a2:tt $a3:tt) => {};
+
+    ($tokens:ident $span:ident $b3:tt $b2:tt $b1:tt (#) $var:ident $a2:tt $a3:tt) => {
+        $crate::ToTokens::to_tokens(&$var, &mut $tokens);
+    };
+    ($tokens:ident $span:ident $b3:tt $b2:tt # ($var:ident) $a1:tt $a2:tt $a3:tt) => {};
+
+    ($tokens:ident $span:ident $b3:tt $b2:tt $b1:tt ($curr:tt) $a1:tt $a2:tt $a3:tt) => {
+        $crate::quote_token_spanned!{$curr $tokens $span}
+    };
+}
+
+// These rules are ordered by approximate token frequency, at least for the
+// first 10 or so, to improve compile times. Having `ident` first is by far the
+// most important because it's typically 2-3x more common than the next most
+// common token.
+//
+// Separately, we put the token being matched in the very front so that failing
+// rules may fail to match as quickly as possible.
+#[macro_export]
+#[doc(hidden)]
+macro_rules! quote_token {
+    ($ident:ident $tokens:ident) => {
+        $crate::__private::push_ident(&mut $tokens, stringify!($ident));
+    };
+
+    (:: $tokens:ident) => {
+        $crate::__private::push_colon2(&mut $tokens);
+    };
+
+    (( $($inner:tt)* ) $tokens:ident) => {
+        $crate::__private::push_group(
+            &mut $tokens,
+            $crate::__private::Delimiter::Parenthesis,
+            $crate::quote!($($inner)*),
+        );
+    };
+
+    ([ $($inner:tt)* ] $tokens:ident) => {
+        $crate::__private::push_group(
+            &mut $tokens,
+            $crate::__private::Delimiter::Bracket,
+            $crate::quote!($($inner)*),
+        );
+    };
+
+    ({ $($inner:tt)* } $tokens:ident) => {
+        $crate::__private::push_group(
+            &mut $tokens,
+            $crate::__private::Delimiter::Brace,
+            $crate::quote!($($inner)*),
+        );
+    };
+
+    (# $tokens:ident) => {
+        $crate::__private::push_pound(&mut $tokens);
+    };
+
+    (, $tokens:ident) => {
+        $crate::__private::push_comma(&mut $tokens);
+    };
+
+    (. $tokens:ident) => {
+        $crate::__private::push_dot(&mut $tokens);
+    };
+
+    (; $tokens:ident) => {
+        $crate::__private::push_semi(&mut $tokens);
+    };
+
+    (: $tokens:ident) => {
+        $crate::__private::push_colon(&mut $tokens);
+    };
+
+    (+ $tokens:ident) => {
+        $crate::__private::push_add(&mut $tokens);
+    };
+
+    (+= $tokens:ident) => {
+        $crate::__private::push_add_eq(&mut $tokens);
+    };
+
+    (& $tokens:ident) => {
+        $crate::__private::push_and(&mut $tokens);
+    };
+
+    (&& $tokens:ident) => {
+        $crate::__private::push_and_and(&mut $tokens);
+    };
+
+    (&= $tokens:ident) => {
+        $crate::__private::push_and_eq(&mut $tokens);
+    };
+
+    (@ $tokens:ident) => {
+        $crate::__private::push_at(&mut $tokens);
+    };
+
+    (! $tokens:ident) => {
+        $crate::__private::push_bang(&mut $tokens);
+    };
+
+    (^ $tokens:ident) => {
+        $crate::__private::push_caret(&mut $tokens);
+    };
+
+    (^= $tokens:ident) => {
+        $crate::__private::push_caret_eq(&mut $tokens);
+    };
+
+    (/ $tokens:ident) => {
+        $crate::__private::push_div(&mut $tokens);
+    };
+
+    (/= $tokens:ident) => {
+        $crate::__private::push_div_eq(&mut $tokens);
+    };
+
+    (.. $tokens:ident) => {
+        $crate::__private::push_dot2(&mut $tokens);
+    };
+
+    (... $tokens:ident) => {
+        $crate::__private::push_dot3(&mut $tokens);
+    };
+
+    (..= $tokens:ident) => {
+        $crate::__private::push_dot_dot_eq(&mut $tokens);
+    };
+
+    (= $tokens:ident) => {
+        $crate::__private::push_eq(&mut $tokens);
+    };
+
+    (== $tokens:ident) => {
+        $crate::__private::push_eq_eq(&mut $tokens);
+    };
+
+    (>= $tokens:ident) => {
+        $crate::__private::push_ge(&mut $tokens);
+    };
+
+    (> $tokens:ident) => {
+        $crate::__private::push_gt(&mut $tokens);
+    };
+
+    (<= $tokens:ident) => {
+        $crate::__private::push_le(&mut $tokens);
+    };
+
+    (< $tokens:ident) => {
+        $crate::__private::push_lt(&mut $tokens);
+    };
+
+    (*= $tokens:ident) => {
+        $crate::__private::push_mul_eq(&mut $tokens);
+    };
+
+    (!= $tokens:ident) => {
+        $crate::__private::push_ne(&mut $tokens);
+    };
+
+    (| $tokens:ident) => {
+        $crate::__private::push_or(&mut $tokens);
+    };
+
+    (|= $tokens:ident) => {
+        $crate::__private::push_or_eq(&mut $tokens);
+    };
+
+    (|| $tokens:ident) => {
+        $crate::__private::push_or_or(&mut $tokens);
+    };
+
+    (? $tokens:ident) => {
+        $crate::__private::push_question(&mut $tokens);
+    };
+
+    (-> $tokens:ident) => {
+        $crate::__private::push_rarrow(&mut $tokens);
+    };
+
+    (<- $tokens:ident) => {
+        $crate::__private::push_larrow(&mut $tokens);
+    };
+
+    (% $tokens:ident) => {
+        $crate::__private::push_rem(&mut $tokens);
+    };
+
+    (%= $tokens:ident) => {
+        $crate::__private::push_rem_eq(&mut $tokens);
+    };
+
+    (=> $tokens:ident) => {
+        $crate::__private::push_fat_arrow(&mut $tokens);
+    };
+
+    (<< $tokens:ident) => {
+        $crate::__private::push_shl(&mut $tokens);
+    };
+
+    (<<= $tokens:ident) => {
+        $crate::__private::push_shl_eq(&mut $tokens);
+    };
+
+    (>> $tokens:ident) => {
+        $crate::__private::push_shr(&mut $tokens);
+    };
+
+    (>>= $tokens:ident) => {
+        $crate::__private::push_shr_eq(&mut $tokens);
+    };
+
+    (* $tokens:ident) => {
+        $crate::__private::push_star(&mut $tokens);
+    };
+
+    (- $tokens:ident) => {
+        $crate::__private::push_sub(&mut $tokens);
+    };
+
+    (-= $tokens:ident) => {
+        $crate::__private::push_sub_eq(&mut $tokens);
+    };
+
+    ($lifetime:lifetime $tokens:ident) => {
+        $crate::__private::push_lifetime(&mut $tokens, stringify!($lifetime));
+    };
+
+    (_ $tokens:ident) => {
+        $crate::__private::push_underscore(&mut $tokens);
+    };
+
+    ($other:tt $tokens:ident) => {
+        $crate::__private::parse(&mut $tokens, stringify!($other));
+    };
+}
+
+// See the comment above `quote_token!` about the rule ordering.
+#[macro_export]
+#[doc(hidden)]
+macro_rules! quote_token_spanned {
+    ($ident:ident $tokens:ident $span:ident) => {
+        $crate::__private::push_ident_spanned(&mut $tokens, $span, stringify!($ident));
+    };
+
+    (:: $tokens:ident $span:ident) => {
+        $crate::__private::push_colon2_spanned(&mut $tokens, $span);
+    };
+
+    (( $($inner:tt)* ) $tokens:ident $span:ident) => {
+        $crate::__private::push_group_spanned(
+            &mut $tokens,
+            $span,
+            $crate::__private::Delimiter::Parenthesis,
+            $crate::quote_spanned!($span=> $($inner)*),
+        );
+    };
+
+    ([ $($inner:tt)* ] $tokens:ident $span:ident) => {
+        $crate::__private::push_group_spanned(
+            &mut $tokens,
+            $span,
+            $crate::__private::Delimiter::Bracket,
+            $crate::quote_spanned!($span=> $($inner)*),
+        );
+    };
+
+    ({ $($inner:tt)* } $tokens:ident $span:ident) => {
+        $crate::__private::push_group_spanned(
+            &mut $tokens,
+            $span,
+            $crate::__private::Delimiter::Brace,
+            $crate::quote_spanned!($span=> $($inner)*),
+        );
+    };
+
+    (# $tokens:ident $span:ident) => {
+        $crate::__private::push_pound_spanned(&mut $tokens, $span);
+    };
+
+    (, $tokens:ident $span:ident) => {
+        $crate::__private::push_comma_spanned(&mut $tokens, $span);
+    };
+
+    (. $tokens:ident $span:ident) => {
+        $crate::__private::push_dot_spanned(&mut $tokens, $span);
+    };
+
+    (; $tokens:ident $span:ident) => {
+        $crate::__private::push_semi_spanned(&mut $tokens, $span);
+    };
+
+    (: $tokens:ident $span:ident) => {
+        $crate::__private::push_colon_spanned(&mut $tokens, $span);
+    };
+
+    (+ $tokens:ident $span:ident) => {
+        $crate::__private::push_add_spanned(&mut $tokens, $span);
+    };
+
+    (+= $tokens:ident $span:ident) => {
+        $crate::__private::push_add_eq_spanned(&mut $tokens, $span);
+    };
+
+    (& $tokens:ident $span:ident) => {
+        $crate::__private::push_and_spanned(&mut $tokens, $span);
+    };
+
+    (&& $tokens:ident $span:ident) => {
+        $crate::__private::push_and_and_spanned(&mut $tokens, $span);
+    };
+
+    (&= $tokens:ident $span:ident) => {
+        $crate::__private::push_and_eq_spanned(&mut $tokens, $span);
+    };
+
+    (@ $tokens:ident $span:ident) => {
+        $crate::__private::push_at_spanned(&mut $tokens, $span);
+    };
+
+    (! $tokens:ident $span:ident) => {
+        $crate::__private::push_bang_spanned(&mut $tokens, $span);
+    };
+
+    (^ $tokens:ident $span:ident) => {
+        $crate::__private::push_caret_spanned(&mut $tokens, $span);
+    };
+
+    (^= $tokens:ident $span:ident) => {
+        $crate::__private::push_caret_eq_spanned(&mut $tokens, $span);
+    };
+
+    (/ $tokens:ident $span:ident) => {
+        $crate::__private::push_div_spanned(&mut $tokens, $span);
+    };
+
+    (/= $tokens:ident $span:ident) => {
+        $crate::__private::push_div_eq_spanned(&mut $tokens, $span);
+    };
+
+    (.. $tokens:ident $span:ident) => {
+        $crate::__private::push_dot2_spanned(&mut $tokens, $span);
+    };
+
+    (... $tokens:ident $span:ident) => {
+        $crate::__private::push_dot3_spanned(&mut $tokens, $span);
+    };
+
+    (..= $tokens:ident $span:ident) => {
+        $crate::__private::push_dot_dot_eq_spanned(&mut $tokens, $span);
+    };
+
+    (= $tokens:ident $span:ident) => {
+        $crate::__private::push_eq_spanned(&mut $tokens, $span);
+    };
+
+    (== $tokens:ident $span:ident) => {
+        $crate::__private::push_eq_eq_spanned(&mut $tokens, $span);
+    };
+
+    (>= $tokens:ident $span:ident) => {
+        $crate::__private::push_ge_spanned(&mut $tokens, $span);
+    };
+
+    (> $tokens:ident $span:ident) => {
+        $crate::__private::push_gt_spanned(&mut $tokens, $span);
+    };
+
+    (<= $tokens:ident $span:ident) => {
+        $crate::__private::push_le_spanned(&mut $tokens, $span);
+    };
+
+    (< $tokens:ident $span:ident) => {
+        $crate::__private::push_lt_spanned(&mut $tokens, $span);
+    };
+
+    (*= $tokens:ident $span:ident) => {
+        $crate::__private::push_mul_eq_spanned(&mut $tokens, $span);
+    };
+
+    (!= $tokens:ident $span:ident) => {
+        $crate::__private::push_ne_spanned(&mut $tokens, $span);
+    };
+
+    (| $tokens:ident $span:ident) => {
+        $crate::__private::push_or_spanned(&mut $tokens, $span);
+    };
+
+    (|= $tokens:ident $span:ident) => {
+        $crate::__private::push_or_eq_spanned(&mut $tokens, $span);
+    };
+
+    (|| $tokens:ident $span:ident) => {
+        $crate::__private::push_or_or_spanned(&mut $tokens, $span);
+    };
+
+    (? $tokens:ident $span:ident) => {
+        $crate::__private::push_question_spanned(&mut $tokens, $span);
+    };
+
+    (-> $tokens:ident $span:ident) => {
+        $crate::__private::push_rarrow_spanned(&mut $tokens, $span);
+    };
+
+    (<- $tokens:ident $span:ident) => {
+        $crate::__private::push_larrow_spanned(&mut $tokens, $span);
+    };
+
+    (% $tokens:ident $span:ident) => {
+        $crate::__private::push_rem_spanned(&mut $tokens, $span);
+    };
+
+    (%= $tokens:ident $span:ident) => {
+        $crate::__private::push_rem_eq_spanned(&mut $tokens, $span);
+    };
+
+    (=> $tokens:ident $span:ident) => {
+        $crate::__private::push_fat_arrow_spanned(&mut $tokens, $span);
+    };
+
+    (<< $tokens:ident $span:ident) => {
+        $crate::__private::push_shl_spanned(&mut $tokens, $span);
+    };
+
+    (<<= $tokens:ident $span:ident) => {
+        $crate::__private::push_shl_eq_spanned(&mut $tokens, $span);
+    };
+
+    (>> $tokens:ident $span:ident) => {
+        $crate::__private::push_shr_spanned(&mut $tokens, $span);
+    };
+
+    (>>= $tokens:ident $span:ident) => {
+        $crate::__private::push_shr_eq_spanned(&mut $tokens, $span);
+    };
+
+    (* $tokens:ident $span:ident) => {
+        $crate::__private::push_star_spanned(&mut $tokens, $span);
+    };
+
+    (- $tokens:ident $span:ident) => {
+        $crate::__private::push_sub_spanned(&mut $tokens, $span);
+    };
+
+    (-= $tokens:ident $span:ident) => {
+        $crate::__private::push_sub_eq_spanned(&mut $tokens, $span);
+    };
+
+    ($lifetime:lifetime $tokens:ident $span:ident) => {
+        $crate::__private::push_lifetime_spanned(&mut $tokens, $span, stringify!($lifetime));
+    };
+
+    (_ $tokens:ident $span:ident) => {
+        $crate::__private::push_underscore_spanned(&mut $tokens, $span);
+    };
+
+    ($other:tt $tokens:ident $span:ident) => {
+        $crate::__private::parse_spanned(&mut $tokens, $span, stringify!($other));
+    };
+}
diff --git a/rust/quote/runtime.rs b/rust/quote/runtime.rs
new file mode 100644
index 000000000000..c704ca89411f
--- /dev/null
+++ b/rust/quote/runtime.rs
@@ -0,0 +1,492 @@
+use self::get_span::{GetSpan, GetSpanBase, GetSpanInner};
+use crate::{IdentFragment, ToTokens, TokenStreamExt};
+use core::fmt;
+use core::iter;
+use core::ops::BitOr;
+use proc_macro2::{Group, Ident, Punct, Spacing, TokenTree};
+
+#[doc(hidden)]
+pub use alloc::format;
+#[doc(hidden)]
+pub use core::option::Option;
+
+#[doc(hidden)]
+pub type Delimiter = proc_macro2::Delimiter;
+#[doc(hidden)]
+pub type Span = proc_macro2::Span;
+#[doc(hidden)]
+pub type TokenStream = proc_macro2::TokenStream;
+
+#[doc(hidden)]
+pub struct HasIterator; // True
+#[doc(hidden)]
+pub struct ThereIsNoIteratorInRepetition; // False
+
+impl BitOr<ThereIsNoIteratorInRepetition> for ThereIsNoIteratorInRepetition {
+    type Output = ThereIsNoIteratorInRepetition;
+    fn bitor(self, _rhs: ThereIsNoIteratorInRepetition) -> ThereIsNoIteratorInRepetition {
+        ThereIsNoIteratorInRepetition
+    }
+}
+
+impl BitOr<ThereIsNoIteratorInRepetition> for HasIterator {
+    type Output = HasIterator;
+    fn bitor(self, _rhs: ThereIsNoIteratorInRepetition) -> HasIterator {
+        HasIterator
+    }
+}
+
+impl BitOr<HasIterator> for ThereIsNoIteratorInRepetition {
+    type Output = HasIterator;
+    fn bitor(self, _rhs: HasIterator) -> HasIterator {
+        HasIterator
+    }
+}
+
+impl BitOr<HasIterator> for HasIterator {
+    type Output = HasIterator;
+    fn bitor(self, _rhs: HasIterator) -> HasIterator {
+        HasIterator
+    }
+}
+
+/// Extension traits used by the implementation of `quote!`. These are defined
+/// in separate traits, rather than as a single trait due to ambiguity issues.
+///
+/// These traits expose a `quote_into_iter` method which should allow calling
+/// whichever impl happens to be applicable. Calling that method repeatedly on
+/// the returned value should be idempotent.
+#[doc(hidden)]
+pub mod ext {
+    use super::RepInterp;
+    use super::{HasIterator as HasIter, ThereIsNoIteratorInRepetition as DoesNotHaveIter};
+    use crate::ToTokens;
+    use alloc::collections::btree_set::{self, BTreeSet};
+    use core::slice;
+
+    /// Extension trait providing the `quote_into_iter` method on iterators.
+    #[doc(hidden)]
+    pub trait RepIteratorExt: Iterator + Sized {
+        fn quote_into_iter(self) -> (Self, HasIter) {
+            (self, HasIter)
+        }
+    }
+
+    impl<T: Iterator> RepIteratorExt for T {}
+
+    /// Extension trait providing the `quote_into_iter` method for
+    /// non-iterable types. These types interpolate the same value in each
+    /// iteration of the repetition.
+    #[doc(hidden)]
+    pub trait RepToTokensExt {
+        /// Pretend to be an iterator for the purposes of `quote_into_iter`.
+        /// This allows repeated calls to `quote_into_iter` to continue
+        /// correctly returning DoesNotHaveIter.
+        fn next(&self) -> Option<&Self> {
+            Some(self)
+        }
+
+        fn quote_into_iter(&self) -> (&Self, DoesNotHaveIter) {
+            (self, DoesNotHaveIter)
+        }
+    }
+
+    impl<T: ToTokens + ?Sized> RepToTokensExt for T {}
+
+    /// Extension trait providing the `quote_into_iter` method for types that
+    /// can be referenced as an iterator.
+    #[doc(hidden)]
+    pub trait RepAsIteratorExt<'q> {
+        type Iter: Iterator;
+
+        fn quote_into_iter(&'q self) -> (Self::Iter, HasIter);
+    }
+
+    impl<'q, T: RepAsIteratorExt<'q> + ?Sized> RepAsIteratorExt<'q> for &T {
+        type Iter = T::Iter;
+
+        fn quote_into_iter(&'q self) -> (Self::Iter, HasIter) {
+            <T as RepAsIteratorExt>::quote_into_iter(*self)
+        }
+    }
+
+    impl<'q, T: RepAsIteratorExt<'q> + ?Sized> RepAsIteratorExt<'q> for &mut T {
+        type Iter = T::Iter;
+
+        fn quote_into_iter(&'q self) -> (Self::Iter, HasIter) {
+            <T as RepAsIteratorExt>::quote_into_iter(*self)
+        }
+    }
+
+    impl<'q, T: 'q> RepAsIteratorExt<'q> for [T] {
+        type Iter = slice::Iter<'q, T>;
+
+        fn quote_into_iter(&'q self) -> (Self::Iter, HasIter) {
+            (self.iter(), HasIter)
+        }
+    }
+
+    impl<'q, T: 'q, const N: usize> RepAsIteratorExt<'q> for [T; N] {
+        type Iter = slice::Iter<'q, T>;
+
+        fn quote_into_iter(&'q self) -> (Self::Iter, HasIter) {
+            (self.iter(), HasIter)
+        }
+    }
+
+    impl<'q, T: 'q> RepAsIteratorExt<'q> for Vec<T> {
+        type Iter = slice::Iter<'q, T>;
+
+        fn quote_into_iter(&'q self) -> (Self::Iter, HasIter) {
+            (self.iter(), HasIter)
+        }
+    }
+
+    impl<'q, T: 'q> RepAsIteratorExt<'q> for BTreeSet<T> {
+        type Iter = btree_set::Iter<'q, T>;
+
+        fn quote_into_iter(&'q self) -> (Self::Iter, HasIter) {
+            (self.iter(), HasIter)
+        }
+    }
+
+    impl<'q, T: RepAsIteratorExt<'q>> RepAsIteratorExt<'q> for RepInterp<T> {
+        type Iter = T::Iter;
+
+        fn quote_into_iter(&'q self) -> (Self::Iter, HasIter) {
+            self.0.quote_into_iter()
+        }
+    }
+}
+
+// Helper type used within interpolations to allow for repeated binding names.
+// Implements the relevant traits, and exports a dummy `next()` method.
+#[derive(Copy, Clone)]
+#[doc(hidden)]
+pub struct RepInterp<T>(pub T);
+
+impl<T> RepInterp<T> {
+    // This method is intended to look like `Iterator::next`, and is called when
+    // a name is bound multiple times, as the previous binding will shadow the
+    // original `Iterator` object. This allows us to avoid advancing the
+    // iterator multiple times per iteration.
+    pub fn next(self) -> Option<T> {
+        Some(self.0)
+    }
+}
+
+impl<T: Iterator> Iterator for RepInterp<T> {
+    type Item = T::Item;
+
+    fn next(&mut self) -> Option<Self::Item> {
+        self.0.next()
+    }
+}
+
+impl<T: ToTokens> ToTokens for RepInterp<T> {
+    fn to_tokens(&self, tokens: &mut TokenStream) {
+        self.0.to_tokens(tokens);
+    }
+}
+
+#[doc(hidden)]
+#[inline]
+pub fn get_span<T>(span: T) -> GetSpan<T> {
+    GetSpan(GetSpanInner(GetSpanBase(span)))
+}
+
+mod get_span {
+    use core::ops::Deref;
+    use proc_macro2::extra::DelimSpan;
+    use proc_macro2::Span;
+
+    pub struct GetSpan<T>(pub(crate) GetSpanInner<T>);
+
+    pub struct GetSpanInner<T>(pub(crate) GetSpanBase<T>);
+
+    pub struct GetSpanBase<T>(pub(crate) T);
+
+    impl GetSpan<Span> {
+        #[inline]
+        pub fn __into_span(self) -> Span {
+            ((self.0).0).0
+        }
+    }
+
+    impl GetSpanInner<DelimSpan> {
+        #[inline]
+        pub fn __into_span(&self) -> Span {
+            (self.0).0.join()
+        }
+    }
+
+    impl<T> GetSpanBase<T> {
+        #[allow(clippy::unused_self)]
+        pub fn __into_span(&self) -> T {
+            unreachable!()
+        }
+    }
+
+    impl<T> Deref for GetSpan<T> {
+        type Target = GetSpanInner<T>;
+
+        #[inline]
+        fn deref(&self) -> &Self::Target {
+            &self.0
+        }
+    }
+
+    impl<T> Deref for GetSpanInner<T> {
+        type Target = GetSpanBase<T>;
+
+        #[inline]
+        fn deref(&self) -> &Self::Target {
+            &self.0
+        }
+    }
+}
+
+#[doc(hidden)]
+pub fn push_group(tokens: &mut TokenStream, delimiter: Delimiter, inner: TokenStream) {
+    tokens.append(Group::new(delimiter, inner));
+}
+
+#[doc(hidden)]
+pub fn push_group_spanned(
+    tokens: &mut TokenStream,
+    span: Span,
+    delimiter: Delimiter,
+    inner: TokenStream,
+) {
+    let mut g = Group::new(delimiter, inner);
+    g.set_span(span);
+    tokens.append(g);
+}
+
+#[doc(hidden)]
+pub fn parse(tokens: &mut TokenStream, s: &str) {
+    let s: TokenStream = s.parse().expect("invalid token stream");
+    tokens.extend(iter::once(s));
+}
+
+#[doc(hidden)]
+pub fn parse_spanned(tokens: &mut TokenStream, span: Span, s: &str) {
+    let s: TokenStream = s.parse().expect("invalid token stream");
+    tokens.extend(s.into_iter().map(|t| respan_token_tree(t, span)));
+}
+
+// Token tree with every span replaced by the given one.
+fn respan_token_tree(mut token: TokenTree, span: Span) -> TokenTree {
+    match &mut token {
+        TokenTree::Group(g) => {
+            let stream = g
+                .stream()
+                .into_iter()
+                .map(|token| respan_token_tree(token, span))
+                .collect();
+            *g = Group::new(g.delimiter(), stream);
+            g.set_span(span);
+        }
+        other => other.set_span(span),
+    }
+    token
+}
+
+#[doc(hidden)]
+pub fn push_ident(tokens: &mut TokenStream, s: &str) {
+    let span = Span::call_site();
+    push_ident_spanned(tokens, span, s);
+}
+
+#[doc(hidden)]
+pub fn push_ident_spanned(tokens: &mut TokenStream, span: Span, s: &str) {
+    tokens.append(ident_maybe_raw(s, span));
+}
+
+#[doc(hidden)]
+pub fn push_lifetime(tokens: &mut TokenStream, lifetime: &str) {
+    tokens.extend([
+        TokenTree::Punct(Punct::new('\'', Spacing::Joint)),
+        TokenTree::Ident(Ident::new(&lifetime[1..], Span::call_site())),
+    ]);
+}
+
+#[doc(hidden)]
+pub fn push_lifetime_spanned(tokens: &mut TokenStream, span: Span, lifetime: &str) {
+    tokens.extend([
+        TokenTree::Punct({
+            let mut apostrophe = Punct::new('\'', Spacing::Joint);
+            apostrophe.set_span(span);
+            apostrophe
+        }),
+        TokenTree::Ident(Ident::new(&lifetime[1..], span)),
+    ]);
+}
+
+macro_rules! push_punct {
+    ($name:ident $spanned:ident $char1:tt) => {
+        #[doc(hidden)]
+        pub fn $name(tokens: &mut TokenStream) {
+            tokens.append(Punct::new($char1, Spacing::Alone));
+        }
+        #[doc(hidden)]
+        pub fn $spanned(tokens: &mut TokenStream, span: Span) {
+            let mut punct = Punct::new($char1, Spacing::Alone);
+            punct.set_span(span);
+            tokens.append(punct);
+        }
+    };
+    ($name:ident $spanned:ident $char1:tt $char2:tt) => {
+        #[doc(hidden)]
+        pub fn $name(tokens: &mut TokenStream) {
+            tokens.append(Punct::new($char1, Spacing::Joint));
+            tokens.append(Punct::new($char2, Spacing::Alone));
+        }
+        #[doc(hidden)]
+        pub fn $spanned(tokens: &mut TokenStream, span: Span) {
+            let mut punct = Punct::new($char1, Spacing::Joint);
+            punct.set_span(span);
+            tokens.append(punct);
+            let mut punct = Punct::new($char2, Spacing::Alone);
+            punct.set_span(span);
+            tokens.append(punct);
+        }
+    };
+    ($name:ident $spanned:ident $char1:tt $char2:tt $char3:tt) => {
+        #[doc(hidden)]
+        pub fn $name(tokens: &mut TokenStream) {
+            tokens.append(Punct::new($char1, Spacing::Joint));
+            tokens.append(Punct::new($char2, Spacing::Joint));
+            tokens.append(Punct::new($char3, Spacing::Alone));
+        }
+        #[doc(hidden)]
+        pub fn $spanned(tokens: &mut TokenStream, span: Span) {
+            let mut punct = Punct::new($char1, Spacing::Joint);
+            punct.set_span(span);
+            tokens.append(punct);
+            let mut punct = Punct::new($char2, Spacing::Joint);
+            punct.set_span(span);
+            tokens.append(punct);
+            let mut punct = Punct::new($char3, Spacing::Alone);
+            punct.set_span(span);
+            tokens.append(punct);
+        }
+    };
+}
+
+push_punct!(push_add push_add_spanned '+');
+push_punct!(push_add_eq push_add_eq_spanned '+' '=');
+push_punct!(push_and push_and_spanned '&');
+push_punct!(push_and_and push_and_and_spanned '&' '&');
+push_punct!(push_and_eq push_and_eq_spanned '&' '=');
+push_punct!(push_at push_at_spanned '@');
+push_punct!(push_bang push_bang_spanned '!');
+push_punct!(push_caret push_caret_spanned '^');
+push_punct!(push_caret_eq push_caret_eq_spanned '^' '=');
+push_punct!(push_colon push_colon_spanned ':');
+push_punct!(push_colon2 push_colon2_spanned ':' ':');
+push_punct!(push_comma push_comma_spanned ',');
+push_punct!(push_div push_div_spanned '/');
+push_punct!(push_div_eq push_div_eq_spanned '/' '=');
+push_punct!(push_dot push_dot_spanned '.');
+push_punct!(push_dot2 push_dot2_spanned '.' '.');
+push_punct!(push_dot3 push_dot3_spanned '.' '.' '.');
+push_punct!(push_dot_dot_eq push_dot_dot_eq_spanned '.' '.' '=');
+push_punct!(push_eq push_eq_spanned '=');
+push_punct!(push_eq_eq push_eq_eq_spanned '=' '=');
+push_punct!(push_ge push_ge_spanned '>' '=');
+push_punct!(push_gt push_gt_spanned '>');
+push_punct!(push_le push_le_spanned '<' '=');
+push_punct!(push_lt push_lt_spanned '<');
+push_punct!(push_mul_eq push_mul_eq_spanned '*' '=');
+push_punct!(push_ne push_ne_spanned '!' '=');
+push_punct!(push_or push_or_spanned '|');
+push_punct!(push_or_eq push_or_eq_spanned '|' '=');
+push_punct!(push_or_or push_or_or_spanned '|' '|');
+push_punct!(push_pound push_pound_spanned '#');
+push_punct!(push_question push_question_spanned '?');
+push_punct!(push_rarrow push_rarrow_spanned '-' '>');
+push_punct!(push_larrow push_larrow_spanned '<' '-');
+push_punct!(push_rem push_rem_spanned '%');
+push_punct!(push_rem_eq push_rem_eq_spanned '%' '=');
+push_punct!(push_fat_arrow push_fat_arrow_spanned '=' '>');
+push_punct!(push_semi push_semi_spanned ';');
+push_punct!(push_shl push_shl_spanned '<' '<');
+push_punct!(push_shl_eq push_shl_eq_spanned '<' '<' '=');
+push_punct!(push_shr push_shr_spanned '>' '>');
+push_punct!(push_shr_eq push_shr_eq_spanned '>' '>' '=');
+push_punct!(push_star push_star_spanned '*');
+push_punct!(push_sub push_sub_spanned '-');
+push_punct!(push_sub_eq push_sub_eq_spanned '-' '=');
+
+#[doc(hidden)]
+pub fn push_underscore(tokens: &mut TokenStream) {
+    push_underscore_spanned(tokens, Span::call_site());
+}
+
+#[doc(hidden)]
+pub fn push_underscore_spanned(tokens: &mut TokenStream, span: Span) {
+    tokens.append(Ident::new("_", span));
+}
+
+// Helper method for constructing identifiers from the `format_ident!` macro,
+// handling `r#` prefixes.
+#[doc(hidden)]
+pub fn mk_ident(id: &str, span: Option<Span>) -> Ident {
+    let span = span.unwrap_or_else(Span::call_site);
+    ident_maybe_raw(id, span)
+}
+
+fn ident_maybe_raw(id: &str, span: Span) -> Ident {
+    if let Some(id) = id.strip_prefix("r#") {
+        Ident::new_raw(id, span)
+    } else {
+        Ident::new(id, span)
+    }
+}
+
+// Adapts from `IdentFragment` to `fmt::Display` for use by the `format_ident!`
+// macro, and exposes span information from these fragments.
+//
+// This struct also has forwarding implementations of the formatting traits
+// `Octal`, `LowerHex`, `UpperHex`, and `Binary` to allow for their use within
+// `format_ident!`.
+#[derive(Copy, Clone)]
+#[doc(hidden)]
+pub struct IdentFragmentAdapter<T: IdentFragment>(pub T);
+
+impl<T: IdentFragment> IdentFragmentAdapter<T> {
+    pub fn span(&self) -> Option<Span> {
+        self.0.span()
+    }
+}
+
+impl<T: IdentFragment> fmt::Display for IdentFragmentAdapter<T> {
+    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
+        IdentFragment::fmt(&self.0, f)
+    }
+}
+
+impl<T: IdentFragment + fmt::Octal> fmt::Octal for IdentFragmentAdapter<T> {
+    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
+        fmt::Octal::fmt(&self.0, f)
+    }
+}
+
+impl<T: IdentFragment + fmt::LowerHex> fmt::LowerHex for IdentFragmentAdapter<T> {
+    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
+        fmt::LowerHex::fmt(&self.0, f)
+    }
+}
+
+impl<T: IdentFragment + fmt::UpperHex> fmt::UpperHex for IdentFragmentAdapter<T> {
+    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
+        fmt::UpperHex::fmt(&self.0, f)
+    }
+}
+
+impl<T: IdentFragment + fmt::Binary> fmt::Binary for IdentFragmentAdapter<T> {
+    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
+        fmt::Binary::fmt(&self.0, f)
+    }
+}
diff --git a/rust/quote/spanned.rs b/rust/quote/spanned.rs
new file mode 100644
index 000000000000..6eba64445d89
--- /dev/null
+++ b/rust/quote/spanned.rs
@@ -0,0 +1,50 @@
+use crate::ToTokens;
+use proc_macro2::extra::DelimSpan;
+use proc_macro2::{Span, TokenStream};
+
+// Not public API other than via the syn crate. Use syn::spanned::Spanned.
+pub trait Spanned: private::Sealed {
+    fn __span(&self) -> Span;
+}
+
+impl Spanned for Span {
+    fn __span(&self) -> Span {
+        *self
+    }
+}
+
+impl Spanned for DelimSpan {
+    fn __span(&self) -> Span {
+        self.join()
+    }
+}
+
+impl<T: ?Sized + ToTokens> Spanned for T {
+    fn __span(&self) -> Span {
+        join_spans(self.into_token_stream())
+    }
+}
+
+fn join_spans(tokens: TokenStream) -> Span {
+    let mut iter = tokens.into_iter().map(|tt| tt.span());
+
+    let first = match iter.next() {
+        Some(span) => span,
+        None => return Span::call_site(),
+    };
+
+    iter.fold(None, |_prev, next| Some(next))
+        .and_then(|last| first.join(last))
+        .unwrap_or(first)
+}
+
+mod private {
+    use crate::ToTokens;
+    use proc_macro2::extra::DelimSpan;
+    use proc_macro2::Span;
+
+    pub trait Sealed {}
+    impl Sealed for Span {}
+    impl Sealed for DelimSpan {}
+    impl<T: ?Sized + ToTokens> Sealed for T {}
+}
diff --git a/rust/quote/to_tokens.rs b/rust/quote/to_tokens.rs
new file mode 100644
index 000000000000..f373092b650f
--- /dev/null
+++ b/rust/quote/to_tokens.rs
@@ -0,0 +1,271 @@
+use super::TokenStreamExt;
+use alloc::borrow::Cow;
+use alloc::rc::Rc;
+use core::iter;
+use proc_macro2::{Group, Ident, Literal, Punct, Span, TokenStream, TokenTree};
+use std::ffi::{CStr, CString};
+
+/// Types that can be interpolated inside a `quote!` invocation.
+pub trait ToTokens {
+    /// Write `self` to the given `TokenStream`.
+    ///
+    /// The token append methods provided by the [`TokenStreamExt`] extension
+    /// trait may be useful for implementing `ToTokens`.
+    ///
+    /// # Example
+    ///
+    /// Example implementation for a struct representing Rust paths like
+    /// `std::cmp::PartialEq`:
+    ///
+    /// ```
+    /// use proc_macro2::{TokenTree, Spacing, Span, Punct, TokenStream};
+    /// use quote::{TokenStreamExt, ToTokens};
+    ///
+    /// pub struct Path {
+    ///     pub global: bool,
+    ///     pub segments: Vec<PathSegment>,
+    /// }
+    ///
+    /// impl ToTokens for Path {
+    ///     fn to_tokens(&self, tokens: &mut TokenStream) {
+    ///         for (i, segment) in self.segments.iter().enumerate() {
+    ///             if i > 0 || self.global {
+    ///                 // Double colon `::`
+    ///                 tokens.append(Punct::new(':', Spacing::Joint));
+    ///                 tokens.append(Punct::new(':', Spacing::Alone));
+    ///             }
+    ///             segment.to_tokens(tokens);
+    ///         }
+    ///     }
+    /// }
+    /// #
+    /// # pub struct PathSegment;
+    /// #
+    /// # impl ToTokens for PathSegment {
+    /// #     fn to_tokens(&self, tokens: &mut TokenStream) {
+    /// #         unimplemented!()
+    /// #     }
+    /// # }
+    /// ```
+    fn to_tokens(&self, tokens: &mut TokenStream);
+
+    /// Convert `self` directly into a `TokenStream` object.
+    ///
+    /// This method is implicitly implemented using `to_tokens`, and acts as a
+    /// convenience method for consumers of the `ToTokens` trait.
+    fn to_token_stream(&self) -> TokenStream {
+        let mut tokens = TokenStream::new();
+        self.to_tokens(&mut tokens);
+        tokens
+    }
+
+    /// Convert `self` directly into a `TokenStream` object.
+    ///
+    /// This method is implicitly implemented using `to_tokens`, and acts as a
+    /// convenience method for consumers of the `ToTokens` trait.
+    fn into_token_stream(self) -> TokenStream
+    where
+        Self: Sized,
+    {
+        self.to_token_stream()
+    }
+}
+
+impl<T: ?Sized + ToTokens> ToTokens for &T {
+    fn to_tokens(&self, tokens: &mut TokenStream) {
+        (**self).to_tokens(tokens);
+    }
+}
+
+impl<T: ?Sized + ToTokens> ToTokens for &mut T {
+    fn to_tokens(&self, tokens: &mut TokenStream) {
+        (**self).to_tokens(tokens);
+    }
+}
+
+impl<'a, T: ?Sized + ToOwned + ToTokens> ToTokens for Cow<'a, T> {
+    fn to_tokens(&self, tokens: &mut TokenStream) {
+        (**self).to_tokens(tokens);
+    }
+}
+
+impl<T: ?Sized + ToTokens> ToTokens for Box<T> {
+    fn to_tokens(&self, tokens: &mut TokenStream) {
+        (**self).to_tokens(tokens);
+    }
+}
+
+impl<T: ?Sized + ToTokens> ToTokens for Rc<T> {
+    fn to_tokens(&self, tokens: &mut TokenStream) {
+        (**self).to_tokens(tokens);
+    }
+}
+
+impl<T: ToTokens> ToTokens for Option<T> {
+    fn to_tokens(&self, tokens: &mut TokenStream) {
+        if let Some(t) = self {
+            t.to_tokens(tokens);
+        }
+    }
+}
+
+impl ToTokens for str {
+    fn to_tokens(&self, tokens: &mut TokenStream) {
+        tokens.append(Literal::string(self));
+    }
+}
+
+impl ToTokens for String {
+    fn to_tokens(&self, tokens: &mut TokenStream) {
+        self.as_str().to_tokens(tokens);
+    }
+}
+
+impl ToTokens for i8 {
+    fn to_tokens(&self, tokens: &mut TokenStream) {
+        tokens.append(Literal::i8_suffixed(*self));
+    }
+}
+
+impl ToTokens for i16 {
+    fn to_tokens(&self, tokens: &mut TokenStream) {
+        tokens.append(Literal::i16_suffixed(*self));
+    }
+}
+
+impl ToTokens for i32 {
+    fn to_tokens(&self, tokens: &mut TokenStream) {
+        tokens.append(Literal::i32_suffixed(*self));
+    }
+}
+
+impl ToTokens for i64 {
+    fn to_tokens(&self, tokens: &mut TokenStream) {
+        tokens.append(Literal::i64_suffixed(*self));
+    }
+}
+
+impl ToTokens for i128 {
+    fn to_tokens(&self, tokens: &mut TokenStream) {
+        tokens.append(Literal::i128_suffixed(*self));
+    }
+}
+
+impl ToTokens for isize {
+    fn to_tokens(&self, tokens: &mut TokenStream) {
+        tokens.append(Literal::isize_suffixed(*self));
+    }
+}
+
+impl ToTokens for u8 {
+    fn to_tokens(&self, tokens: &mut TokenStream) {
+        tokens.append(Literal::u8_suffixed(*self));
+    }
+}
+
+impl ToTokens for u16 {
+    fn to_tokens(&self, tokens: &mut TokenStream) {
+        tokens.append(Literal::u16_suffixed(*self));
+    }
+}
+
+impl ToTokens for u32 {
+    fn to_tokens(&self, tokens: &mut TokenStream) {
+        tokens.append(Literal::u32_suffixed(*self));
+    }
+}
+
+impl ToTokens for u64 {
+    fn to_tokens(&self, tokens: &mut TokenStream) {
+        tokens.append(Literal::u64_suffixed(*self));
+    }
+}
+
+impl ToTokens for u128 {
+    fn to_tokens(&self, tokens: &mut TokenStream) {
+        tokens.append(Literal::u128_suffixed(*self));
+    }
+}
+
+impl ToTokens for usize {
+    fn to_tokens(&self, tokens: &mut TokenStream) {
+        tokens.append(Literal::usize_suffixed(*self));
+    }
+}
+
+impl ToTokens for f32 {
+    fn to_tokens(&self, tokens: &mut TokenStream) {
+        tokens.append(Literal::f32_suffixed(*self));
+    }
+}
+
+impl ToTokens for f64 {
+    fn to_tokens(&self, tokens: &mut TokenStream) {
+        tokens.append(Literal::f64_suffixed(*self));
+    }
+}
+
+impl ToTokens for char {
+    fn to_tokens(&self, tokens: &mut TokenStream) {
+        tokens.append(Literal::character(*self));
+    }
+}
+
+impl ToTokens for bool {
+    fn to_tokens(&self, tokens: &mut TokenStream) {
+        let word = if *self { "true" } else { "false" };
+        tokens.append(Ident::new(word, Span::call_site()));
+    }
+}
+
+impl ToTokens for CStr {
+    fn to_tokens(&self, tokens: &mut TokenStream) {
+        tokens.append(Literal::c_string(self));
+    }
+}
+
+impl ToTokens for CString {
+    fn to_tokens(&self, tokens: &mut TokenStream) {
+        tokens.append(Literal::c_string(self));
+    }
+}
+
+impl ToTokens for Group {
+    fn to_tokens(&self, tokens: &mut TokenStream) {
+        tokens.append(self.clone());
+    }
+}
+
+impl ToTokens for Ident {
+    fn to_tokens(&self, tokens: &mut TokenStream) {
+        tokens.append(self.clone());
+    }
+}
+
+impl ToTokens for Punct {
+    fn to_tokens(&self, tokens: &mut TokenStream) {
+        tokens.append(self.clone());
+    }
+}
+
+impl ToTokens for Literal {
+    fn to_tokens(&self, tokens: &mut TokenStream) {
+        tokens.append(self.clone());
+    }
+}
+
+impl ToTokens for TokenTree {
+    fn to_tokens(&self, tokens: &mut TokenStream) {
+        tokens.append(self.clone());
+    }
+}
+
+impl ToTokens for TokenStream {
+    fn to_tokens(&self, tokens: &mut TokenStream) {
+        tokens.extend(iter::once(self.clone()));
+    }
+
+    fn into_token_stream(self) -> TokenStream {
+        self
+    }
+}
-- 
2.51.2


