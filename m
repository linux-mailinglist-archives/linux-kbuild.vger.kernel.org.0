Return-Path: <linux-kbuild+bounces-7472-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BD8AD724F
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Jun 2025 15:41:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB2AD165EF3
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Jun 2025 13:41:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C720522DA1B;
	Thu, 12 Jun 2025 13:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ufAG53sx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C042F4309;
	Thu, 12 Jun 2025 13:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749735687; cv=none; b=OOl9an3quiamvHp0MljdpOminTB3gD3wwjujMi40Z4eezm+9H57L3yKKdfa0QYGU4RCyBF8cb9wKq7ZzeM0J4iTt4d3o4v/yOn5YSLRAPOlDBLl5RTUGhJCK2ayL0Ydil1lO2Dt7Y9qkgblhscLuZWBW8ngIcqIVg0nIOG0f8rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749735687; c=relaxed/simple;
	bh=PV6kxD2yYHPZ26FVfzuEnik3sz20FWj0rE9Vtm2uxy8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P7hZSXNhGRCvobKqLTWfNjeDzfLKFf7gsJ89Qxj+V/KhpOqpYGaKVRRYMFZkkVoLF1HskrK5bHjmpkPfAx9GBqtR/mAHfYPPjYSAEM+emJxr+rC6+DJrVVeU9XmHuU0AN9hgvSH7KpJRQ1+F+YkN6JyeXC1iBI5OyOjzvKM/vMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ufAG53sx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21B6FC4CEEE;
	Thu, 12 Jun 2025 13:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749735687;
	bh=PV6kxD2yYHPZ26FVfzuEnik3sz20FWj0rE9Vtm2uxy8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ufAG53sxEaPTAMYSxGoTXGvG3L0fUs890KKoFtK/AQniC6EZjPl8RfcH2tbkf6Fec
	 loLE6Zlz2KEyozS/M4SOin2h6zOhjRpzb3KUJ0gzeuNooc6a/6oHyKeW/ItCHC95Zz
	 dnhJscmm9JljcReP3XJZgn+mMecMkBU5Jhtton4B6qZ5715UqDgmZLjSAieJiDSale
	 mGYS7yHj+OsGKHT5DcB0gj4FLp//gU3R4QTOFsnjXDfTx3jCov8iunY4BDvpcHp8Cs
	 WW8wv/dzz+1OWE/9G4ffUFWwWOtPAcffqrUnHvjplvMxUevHZRGLQxWfvGGHq/PTIe
	 qJtu0Uzo6u8jQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Thu, 12 Jun 2025 15:40:05 +0200
Subject: [PATCH v13 4/6] rust: module: update the module macro with module
 parameter support
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-module-params-v3-v13-4-bc219cd1a3f8@kernel.org>
References: <20250612-module-params-v3-v13-0-bc219cd1a3f8@kernel.org>
In-Reply-To: <20250612-module-params-v3-v13-0-bc219cd1a3f8@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Alice Ryhl <aliceryhl@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
 Danilo Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>, 
 Benno Lossin <lossin@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>
Cc: Trevor Gross <tmgross@umich.edu>, 
 Adam Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
 Daniel Gomez <da.gomez@samsung.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
 Greg KH <gregkh@linuxfoundation.org>, Fiona Behrens <me@kloenk.dev>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 linux-modules@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=13358;
 i=a.hindborg@kernel.org; h=from:subject:message-id;
 bh=PV6kxD2yYHPZ26FVfzuEnik3sz20FWj0rE9Vtm2uxy8=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBoSti5FGohBiBMOv8QlhTrYQU6PuPYFV3PB2Y5m
 C30Xck8EHmJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaErYuQAKCRDhuBo+eShj
 d3+ED/9ng7KCJ+MRs31DFuu6KCd236y+hiwMoMngxk9DLnC4RNKx3wqBS4u0lJszSYCHkGEQxeK
 zdgOC30ycl43MmbRKBgRmJVUqPcbTDdmc+g6ZZTu2RryuDnLednVT0zop7/VkrJ0aYACxGBl1kv
 /qcawxJq9Vn9MNEYbxw/78g0T13ktl5YmdY48j5eB1OTCSWZG7U9gGInBU1fKOOj7mL+8z2t+T9
 Zmmjnavo8Mgrx6rqG8GQ/sHNu976pSvMGzrCulO9XvNjkTqlAc46j3OaqkCmiweo2ubT9JrOj5Y
 HdF55YwOO707YgtgJOAnenWLMv4d8luD5BS1GKQmtu7bNn7CkYdaHhhZSnSG1jgdiEpSUoKpRL3
 WmLnMkRlxEiXNRNe9sm1RgbmOK8S+u9ecqCi6suPlsBZLR13KgBFiyMLjXuLskKCK0tdAqSl/+Y
 LV1TDgmS+kPLwQXwSWWldZaA4Vp9qPcaOosOi2uuHKTJVxy/G7ZubAlSca6kRw89KHHm8cAt/1e
 Ojo60/4kr9JVgM1f0XS9JO2y2HgzncDNOuTooe8ltnXf2HLFIK9CSspHyBk/2iUFyx6IabnxMb3
 DaZ8ppS33S8MvnVio3OpCljLE4kVKC0lMhJ21Ti7O1hP/EKTKo1TIdmJMKCI0rVYjYG3rfOgbA4
 77ZQbhG8ZyhiYuw==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Allow module parameters to be declared in the rust `module!` macro.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/macros/helpers.rs |  25 +++++++
 rust/macros/lib.rs     |  31 +++++++++
 rust/macros/module.rs  | 175 ++++++++++++++++++++++++++++++++++++++++++++++---
 3 files changed, 221 insertions(+), 10 deletions(-)

diff --git a/rust/macros/helpers.rs b/rust/macros/helpers.rs
index e2602be402c1..365d7eb499c0 100644
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
index fa847cf3a9b5..2fb520dc930a 100644
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
index 1a867a1e787e..b2605482822a 100644
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
@@ -75,20 +83,116 @@ fn emit_base(&mut self, field: &str, content: &str, builtin: bool) {
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
+                    pub(crate) static {param_name}:
+                        ::kernel::module_param::ModuleParamAccess<{param_type}> =
+                            ::kernel::module_param::ModuleParamAccess::new({param_default});
+
+                    #[link_section = \"__param\"]
+                    #[used]
+                    static __{module_name}_{param_name}_struct:
+                        ::kernel::module_param::RacyKernelParam =
+                        ::kernel::module_param::RacyKernelParam(::kernel::bindings::kernel_param {{
+                            name: if cfg!(MODULE) {{
+                                ::kernel::c_str!(\"{param_name}\").as_bytes_with_nul()
+                            }} else {{
+                                ::kernel::c_str!(\"{module_name}.{param_name}\").as_bytes_with_nul()
+                            }}.as_ptr(),
+                            // SAFETY: `__this_module` is constructed by the kernel at load time
+                            // and will not be freed until the module is unloaded.
+                            #[cfg(MODULE)]
+                            mod_: unsafe {{
+                                (&::kernel::bindings::__this_module
+                                    as *const ::kernel::bindings::module)
+                                    .cast_mut()
+                            }},
+                            #[cfg(not(MODULE))]
+                            mod_: ::core::ptr::null_mut(),
+                            ops: &{ops} as *const ::kernel::bindings::kernel_param_ops,
+                            perm: 0, // Will not appear in sysfs
+                            level: -1,
+                            flags: 0,
+                            __bindgen_anon_1:
+                                ::kernel::bindings::kernel_param__bindgen_ty_1 {{
+                                    arg: {param_name}.as_mut_ptr().cast()
+                                }},
+                        }});
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
@@ -99,6 +203,50 @@ struct ModuleInfo {
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
@@ -114,6 +262,7 @@ fn parse(it: &mut token_stream::IntoIter) -> Self {
             "license",
             "alias",
             "firmware",
+            "params",
         ];
         const REQUIRED_KEYS: &[&str] = &["type", "name", "license"];
         let mut seen_keys = Vec::new();
@@ -140,6 +289,7 @@ fn parse(it: &mut token_stream::IntoIter) -> Self {
                 "license" => info.license = expect_string_ascii(it),
                 "alias" => info.alias = Some(expect_string_array(it)),
                 "firmware" => info.firmware = Some(expect_string_array(it)),
+                "params" => info.params = Some(expect_params(it)),
                 _ => panic!("Unknown key \"{key}\". Valid keys are: {EXPECTED_KEYS:?}."),
             }
 
@@ -205,7 +355,9 @@ pub(crate) fn module(ts: TokenStream) -> TokenStream {
     // Built-in modules also export the `file` modinfo string.
     let file =
         std::env::var("RUST_MODFILE").expect("Unable to fetch RUST_MODFILE environmental variable");
-    modinfo.emit_only_builtin("file", &file);
+    modinfo.emit_only_builtin("file", &file, false);
+
+    modinfo.emit_params(&info);
 
     format!(
         "
@@ -369,15 +521,18 @@ unsafe fn __exit() {{
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



