Return-Path: <linux-kbuild+bounces-8946-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3610DB99E2C
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Sep 2025 14:41:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F3AD19C2B44
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Sep 2025 12:41:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 721B5305E00;
	Wed, 24 Sep 2025 12:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ole11jZn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417A8303CAA;
	Wed, 24 Sep 2025 12:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758717636; cv=none; b=MXHNMrukjY0vPpYNj/IQk4PfwL3o9IfT78wsuPuv9MP1ez/PlJ/ZqOAdNcV8HMP4SAcJYfuqHwNTQr2fLpxbWL92b3SsxJ4gYjSKS5QJWp32E6C6Ay7h6+GI3J6VbyjeUBXEHensHZSFRAj9qrAJLlVRcRWa9Itvp8brfFDtF9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758717636; c=relaxed/simple;
	bh=f0aezQP+lTTBaLYyzhKAQG36mNqIE1d7LdhlwAQjbjo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mCQrvVgIUwK7dv6TCiSaL7OXnXjtGYMU29jfLuMmfLde/OJAKqKXlrQLzoNHPrDCodpWiV/4yOKnWDfQXc/TYciJiorC42q4tEsOseFNWpdefeYoub4qyoP5OE2b+Ri6OJ2Yq2jyAhz4e7X4bd+zMRF0rmwrlKriEbEij7mcDzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ole11jZn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74244C4CEE7;
	Wed, 24 Sep 2025 12:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758717635;
	bh=f0aezQP+lTTBaLYyzhKAQG36mNqIE1d7LdhlwAQjbjo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ole11jZnZlaiL1G20R6P5t5vIg4Jt2gCoYgOHMIoAuEuQ2+/t0US0KRmyqsoHS32X
	 D0rqtm7N5ymemF286CZzCKMCmJIdcxgHKonPXMepFXDZT8APL1bNqb7H/mpbe3nNWR
	 c6UVE1x2herlRaxFmZjN34axKJCQi9yngXYA7JG2gikXAk2P9vhetUELcTPJbZQ+/B
	 XeKS2TRE/MgJYulHM95kDREUj4HVt0UZUNCJEH6/1F+mMi9sTHsIALJ2N879WBqCGn
	 q71odUd9zhylTXruZuAFad3uu5l02YBkrNvH+UB9eD6IJ81tzUumnzCXAIzZ5gJdjC
	 Njt4mMpkbUuYw==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Wed, 24 Sep 2025 14:39:28 +0200
Subject: [PATCH v18 5/7] rust: module: update the module macro with module
 parameter support
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-module-params-v3-v18-5-bf512c35d910@kernel.org>
References: <20250924-module-params-v3-v18-0-bf512c35d910@kernel.org>
In-Reply-To: <20250924-module-params-v3-v18-0-bf512c35d910@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Alice Ryhl <aliceryhl@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
 Danilo Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>, 
 Daniel Gomez <da.gomez@kernel.org>, Benno Lossin <lossin@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>
Cc: Trevor Gross <tmgross@umich.edu>, 
 Adam Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
 Daniel Gomez <da.gomez@samsung.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
 Greg KH <gregkh@linuxfoundation.org>, Fiona Behrens <me@kloenk.dev>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 linux-modules@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=13520;
 i=a.hindborg@kernel.org; h=from:subject:message-id;
 bh=f0aezQP+lTTBaLYyzhKAQG36mNqIE1d7LdhlwAQjbjo=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBo0+akj/GBJit09OPJq5euH1Xeio+bC4AC+37D0
 d2TqZZsZ9mJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaNPmpAAKCRDhuBo+eShj
 d0r/D/9E1ASOq4KkX8os3CYf0a0KwkmwYF96boJzKBXuWQU1UMhXD6JvYwu8PpQbL68nNUiTOTo
 m9IA3WOuUBPrSloHjVQwNdzLmiZb/8ROOCcUW/5bm7zNT5XgOIsjVT8uQHp9+oGnsRLGJV/u7Xu
 juxzOOevcA1RX6vMjhtMKg8xs0K92qyaXLYnZVH96cEqiXwG8ZBL64ewyoZIYgmtsa3/HZzgFio
 p4nOFUiaodKeR5Pm+RdHIKidIC82vZVLxqzqKaWgEzE/vonoNkixXHtj1dQwk5y+J4XOuzlyORK
 /4JHGS44VTnkkwh7uwIZ6yzrUmNyVrytZtNtYffMb4xk2iRmv5ehUeM4Mm2Es+KLil4oMnAJAis
 mQ/4Jmdxfu3YUdCBhh60mdKMicJQUidaDEmf8nwGhYRr4pcCGllNjkSpXw2rcTzkuRdnAIh/NbC
 TgZMfySh265+7rkKm/rkq5CP2Wt3RM7D2Zh6NsZ4ydvSUl2VuA/iGHJuA3gVfKP5KtZdF7KVapj
 lYKPgrt8LY8EaEbWAczmUKXlQa2mX+tr0B6exRB9bHnbZApQtUbLx2RK7UJiphC80qyGt0elKpe
 LW3J82WP2I4qSH+t6owaUQ3YQwuLiPzBD44p28JQdgOuP2PX1tURP1KaewYXNtUavi/GKXH4IXT
 qMzL46WWr7fGV3A==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Allow module parameters to be declared in the rust `module!` macro.

Reviewed-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/macros/helpers.rs |  25 +++++++
 rust/macros/lib.rs     |  31 +++++++++
 rust/macros/module.rs  | 178 ++++++++++++++++++++++++++++++++++++++++++++++---
 3 files changed, 224 insertions(+), 10 deletions(-)

diff --git a/rust/macros/helpers.rs b/rust/macros/helpers.rs
index e2602be402c10..365d7eb499c08 100644
--- a/rust/macros/helpers.rs
+++ b/rust/macros/helpers.rs
@@ -10,6 +10,17 @@ pub(crate) fn try_ident(it: &mut token_stream::IntoIter) -> Option<String> {
     }
 }
 
+pub(crate) fn try_sign(it: &mut token_stream::IntoIter) -> Option<char> {
+    let peek = it.clone().next();
+    match peek {
+        Some(TokenTree::Punct(punct)) if punct.as_char() == '-' => {
+            let _ = it.next();
+            Some(punct.as_char())
+        }
+        _ => None,
+    }
+}
+
 pub(crate) fn try_literal(it: &mut token_stream::IntoIter) -> Option<String> {
     if let Some(TokenTree::Literal(literal)) = it.next() {
         Some(literal.to_string())
@@ -103,3 +114,17 @@ pub(crate) fn file() -> String {
         proc_macro::Span::call_site().file()
     }
 }
+
+/// Parse a token stream of the form `expected_name: "value",` and return the
+/// string in the position of "value".
+///
+/// # Panics
+///
+/// - On parse error.
+pub(crate) fn expect_string_field(it: &mut token_stream::IntoIter, expected_name: &str) -> String {
+    assert_eq!(expect_ident(it), expected_name);
+    assert_eq!(expect_punct(it), ':');
+    let string = expect_string(it);
+    assert_eq!(expect_punct(it), ',');
+    string
+}
diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
index fa847cf3a9b5f..2fb520dc930af 100644
--- a/rust/macros/lib.rs
+++ b/rust/macros/lib.rs
@@ -28,6 +28,30 @@
 /// The `type` argument should be a type which implements the [`Module`]
 /// trait. Also accepts various forms of kernel metadata.
 ///
+/// The `params` field describe module parameters. Each entry has the form
+///
+/// ```ignore
+/// parameter_name: type {
+///     default: default_value,
+///     description: "Description",
+/// }
+/// ```
+///
+/// `type` may be one of
+///
+/// - [`i8`]
+/// - [`u8`]
+/// - [`i8`]
+/// - [`u8`]
+/// - [`i16`]
+/// - [`u16`]
+/// - [`i32`]
+/// - [`u32`]
+/// - [`i64`]
+/// - [`u64`]
+/// - [`isize`]
+/// - [`usize`]
+///
 /// C header: [`include/linux/moduleparam.h`](srctree/include/linux/moduleparam.h)
 ///
 /// [`Module`]: ../kernel/trait.Module.html
@@ -44,6 +68,12 @@
 ///     description: "My very own kernel module!",
 ///     license: "GPL",
 ///     alias: ["alternate_module_name"],
+///     params: {
+///         my_parameter: i64 {
+///             default: 1,
+///             description: "This parameter has a default of 1",
+///         },
+///     },
 /// }
 ///
 /// struct MyModule(i32);
@@ -52,6 +82,7 @@
 ///     fn init(_module: &'static ThisModule) -> Result<Self> {
 ///         let foo: i32 = 42;
 ///         pr_info!("I contain:  {}\n", foo);
+///         pr_info!("i32 param is:  {}\n", module_parameters::my_parameter.read());
 ///         Ok(Self(foo))
 ///     }
 /// }
diff --git a/rust/macros/module.rs b/rust/macros/module.rs
index cbf3ac0a8f7ba..d62e9c1e2a898 100644
--- a/rust/macros/module.rs
+++ b/rust/macros/module.rs
@@ -26,6 +26,7 @@ struct ModInfoBuilder<'a> {
     module: &'a str,
     counter: usize,
     buffer: String,
+    param_buffer: String,
 }
 
 impl<'a> ModInfoBuilder<'a> {
@@ -34,10 +35,11 @@ fn new(module: &'a str) -> Self {
             module,
             counter: 0,
             buffer: String::new(),
+            param_buffer: String::new(),
         }
     }
 
-    fn emit_base(&mut self, field: &str, content: &str, builtin: bool) {
+    fn emit_base(&mut self, field: &str, content: &str, builtin: bool, param: bool) {
         let string = if builtin {
             // Built-in modules prefix their modinfo strings by `module.`.
             format!(
@@ -51,8 +53,14 @@ fn emit_base(&mut self, field: &str, content: &str, builtin: bool) {
             format!("{field}={content}\0")
         };
 
+        let buffer = if param {
+            &mut self.param_buffer
+        } else {
+            &mut self.buffer
+        };
+
         write!(
-            &mut self.buffer,
+            buffer,
             "
                 {cfg}
                 #[doc(hidden)]
@@ -75,20 +83,119 @@ fn emit_base(&mut self, field: &str, content: &str, builtin: bool) {
         self.counter += 1;
     }
 
-    fn emit_only_builtin(&mut self, field: &str, content: &str) {
-        self.emit_base(field, content, true)
+    fn emit_only_builtin(&mut self, field: &str, content: &str, param: bool) {
+        self.emit_base(field, content, true, param)
     }
 
-    fn emit_only_loadable(&mut self, field: &str, content: &str) {
-        self.emit_base(field, content, false)
+    fn emit_only_loadable(&mut self, field: &str, content: &str, param: bool) {
+        self.emit_base(field, content, false, param)
     }
 
     fn emit(&mut self, field: &str, content: &str) {
-        self.emit_only_builtin(field, content);
-        self.emit_only_loadable(field, content);
+        self.emit_internal(field, content, false);
+    }
+
+    fn emit_internal(&mut self, field: &str, content: &str, param: bool) {
+        self.emit_only_builtin(field, content, param);
+        self.emit_only_loadable(field, content, param);
+    }
+
+    fn emit_param(&mut self, field: &str, param: &str, content: &str) {
+        let content = format!("{param}:{content}", param = param, content = content);
+        self.emit_internal(field, &content, true);
+    }
+
+    fn emit_params(&mut self, info: &ModuleInfo) {
+        let Some(params) = &info.params else {
+            return;
+        };
+
+        for param in params {
+            let ops = param_ops_path(&param.ptype);
+
+            // Note: The spelling of these fields is dictated by the user space
+            // tool `modinfo`.
+            self.emit_param("parmtype", &param.name, &param.ptype);
+            self.emit_param("parm", &param.name, &param.description);
+
+            write!(
+                self.param_buffer,
+                "
+                pub(crate) static {param_name}:
+                    ::kernel::module_param::ModuleParamAccess<{param_type}> =
+                        ::kernel::module_param::ModuleParamAccess::new({param_default});
+
+                const _: () = {{
+                    #[link_section = \"__param\"]
+                    #[used]
+                    static __{module_name}_{param_name}_struct:
+                        ::kernel::module_param::KernelParam =
+                        ::kernel::module_param::KernelParam::new(
+                            ::kernel::bindings::kernel_param {{
+                                name: if ::core::cfg!(MODULE) {{
+                                    ::kernel::c_str!(\"{param_name}\").as_bytes_with_nul()
+                                }} else {{
+                                    ::kernel::c_str!(\"{module_name}.{param_name}\")
+                                        .as_bytes_with_nul()
+                                }}.as_ptr(),
+                                // SAFETY: `__this_module` is constructed by the kernel at load
+                                // time and will not be freed until the module is unloaded.
+                                #[cfg(MODULE)]
+                                mod_: unsafe {{
+                                    core::ptr::from_ref(&::kernel::bindings::__this_module)
+                                        .cast_mut()
+                                }},
+                                #[cfg(not(MODULE))]
+                                mod_: ::core::ptr::null_mut(),
+                                ops: core::ptr::from_ref(&{ops}),
+                                perm: 0, // Will not appear in sysfs
+                                level: -1,
+                                flags: 0,
+                                __bindgen_anon_1: ::kernel::bindings::kernel_param__bindgen_ty_1 {{
+                                    arg: {param_name}.as_void_ptr()
+                                }},
+                            }}
+                        );
+                }};
+                ",
+                module_name = info.name,
+                param_type = param.ptype,
+                param_default = param.default,
+                param_name = param.name,
+                ops = ops,
+            )
+            .unwrap();
+        }
+    }
+}
+
+fn param_ops_path(param_type: &str) -> &'static str {
+    match param_type {
+        "i8" => "::kernel::module_param::PARAM_OPS_I8",
+        "u8" => "::kernel::module_param::PARAM_OPS_U8",
+        "i16" => "::kernel::module_param::PARAM_OPS_I16",
+        "u16" => "::kernel::module_param::PARAM_OPS_U16",
+        "i32" => "::kernel::module_param::PARAM_OPS_I32",
+        "u32" => "::kernel::module_param::PARAM_OPS_U32",
+        "i64" => "::kernel::module_param::PARAM_OPS_I64",
+        "u64" => "::kernel::module_param::PARAM_OPS_U64",
+        "isize" => "::kernel::module_param::PARAM_OPS_ISIZE",
+        "usize" => "::kernel::module_param::PARAM_OPS_USIZE",
+        t => panic!("Unsupported parameter type {}", t),
     }
 }
 
+fn expect_param_default(param_it: &mut token_stream::IntoIter) -> String {
+    assert_eq!(expect_ident(param_it), "default");
+    assert_eq!(expect_punct(param_it), ':');
+    let sign = try_sign(param_it);
+    let default = try_literal(param_it).expect("Expected default param value");
+    assert_eq!(expect_punct(param_it), ',');
+    let mut value = sign.map(String::from).unwrap_or_default();
+    value.push_str(&default);
+    value
+}
+
 #[derive(Debug, Default)]
 struct ModuleInfo {
     type_: String,
@@ -98,6 +205,50 @@ struct ModuleInfo {
     description: Option<String>,
     alias: Option<Vec<String>>,
     firmware: Option<Vec<String>>,
+    params: Option<Vec<Parameter>>,
+}
+
+#[derive(Debug)]
+struct Parameter {
+    name: String,
+    ptype: String,
+    default: String,
+    description: String,
+}
+
+fn expect_params(it: &mut token_stream::IntoIter) -> Vec<Parameter> {
+    let params = expect_group(it);
+    assert_eq!(params.delimiter(), Delimiter::Brace);
+    let mut it = params.stream().into_iter();
+    let mut parsed = Vec::new();
+
+    loop {
+        let param_name = match it.next() {
+            Some(TokenTree::Ident(ident)) => ident.to_string(),
+            Some(_) => panic!("Expected Ident or end"),
+            None => break,
+        };
+
+        assert_eq!(expect_punct(&mut it), ':');
+        let param_type = expect_ident(&mut it);
+        let group = expect_group(&mut it);
+        assert_eq!(group.delimiter(), Delimiter::Brace);
+        assert_eq!(expect_punct(&mut it), ',');
+
+        let mut param_it = group.stream().into_iter();
+        let param_default = expect_param_default(&mut param_it);
+        let param_description = expect_string_field(&mut param_it, "description");
+        expect_end(&mut param_it);
+
+        parsed.push(Parameter {
+            name: param_name,
+            ptype: param_type,
+            default: param_default,
+            description: param_description,
+        })
+    }
+
+    parsed
 }
 
 impl ModuleInfo {
@@ -112,6 +263,7 @@ fn parse(it: &mut token_stream::IntoIter) -> Self {
             "license",
             "alias",
             "firmware",
+            "params",
         ];
         const REQUIRED_KEYS: &[&str] = &["type", "name", "license"];
         let mut seen_keys = Vec::new();
@@ -137,6 +289,7 @@ fn parse(it: &mut token_stream::IntoIter) -> Self {
                 "license" => info.license = expect_string_ascii(it),
                 "alias" => info.alias = Some(expect_string_array(it)),
                 "firmware" => info.firmware = Some(expect_string_array(it)),
+                "params" => info.params = Some(expect_params(it)),
                 _ => panic!("Unknown key \"{key}\". Valid keys are: {EXPECTED_KEYS:?}."),
             }
 
@@ -199,7 +352,9 @@ pub(crate) fn module(ts: TokenStream) -> TokenStream {
     // Built-in modules also export the `file` modinfo string.
     let file =
         std::env::var("RUST_MODFILE").expect("Unable to fetch RUST_MODFILE environmental variable");
-    modinfo.emit_only_builtin("file", &file);
+    modinfo.emit_only_builtin("file", &file, false);
+
+    modinfo.emit_params(&info);
 
     format!(
         "
@@ -363,15 +518,18 @@ unsafe fn __exit() {{
                             __MOD.assume_init_drop();
                         }}
                     }}
-
                     {modinfo}
                 }}
             }}
+            mod module_parameters {{
+                {params}
+            }}
         ",
         type_ = info.type_,
         name = info.name,
         ident = ident,
         modinfo = modinfo.buffer,
+        params = modinfo.param_buffer,
         initcall_section = ".initcall6.init"
     )
     .parse()

-- 
2.47.2



