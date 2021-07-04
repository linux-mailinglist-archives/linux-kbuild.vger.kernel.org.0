Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3E233BAEFD
	for <lists+linux-kbuild@lfdr.de>; Sun,  4 Jul 2021 22:30:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230378AbhGDUci (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 4 Jul 2021 16:32:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:37698 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230396AbhGDUcU (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 4 Jul 2021 16:32:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 73383613DD;
        Sun,  4 Jul 2021 20:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625430584;
        bh=pPDP+a5TXy0UR1cWe+2R+eaQaK2LjTd/t+sv/xsilhw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KMltLd5YzHT3x1uHVwp+UzxuzaB24SWu0STWeTQ3d3uozmeGBBRfmdFxDEfnyEklH
         hj5blhGhmJKpNfP4D4MVfd4HlWiLtOc2wrMs+oiCCtWVnrv5gksz/RFpLQ3OiZ2FKr
         zBLVcqsdAOX29AjLihsDRs/6yyy0EG00SYVwLwa9VTQpFK1rXU6+uy64JgixNnxBad
         7lytrpBjGJFQCs1UEQ9fkv+fPdC4kj4Ve/gD4tW6AJaMN8fFmS8hsOJ4f1pSsWvz67
         7uPBb5ymyMiQHes0xuXhtD1lobQaGGQdRWUQLXeh69K56Nq9CQCrFfsWCLiZXG/i+W
         lOs83qb++CC6g==
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
        Wedson Almeida Filho <wedsonaf@google.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Sumera Priyadarsini <sylphrenadin@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Sven Van Asbroeck <thesven73@gmail.com>,
        Gary Guo <gary@garyguo.net>,
        Boris-Chengbiao Zhou <bobo1239@web.de>,
        Fox Chen <foxhlchen@gmail.com>,
        Ayaan Zaidi <zaidi.ayaan@gmail.com>,
        Douglas Su <d0u9.su@outlook.com>, Yuki Okushi <jtitor@2k36.org>
Subject: [PATCH 15/17] scripts: add `generate_rust_analyzer.py`
Date:   Sun,  4 Jul 2021 22:27:54 +0200
Message-Id: <20210704202756.29107-16-ojeda@kernel.org>
In-Reply-To: <20210704202756.29107-1-ojeda@kernel.org>
References: <20210704202756.29107-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Miguel Ojeda <ojeda@kernel.org>

The `generate_rust_analyzer.py` script generates the configuration
file (`rust-project.json`) for rust-analyzer.

rust-analyzer is a modular compiler frontend for the Rust language.
It provides an LSP server which can be used in editors such as
VS Code, Emacs or Vim.

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
Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Co-developed-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
Co-developed-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Co-developed-by: Sven Van Asbroeck <thesven73@gmail.com>
Signed-off-by: Sven Van Asbroeck <thesven73@gmail.com>
Co-developed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Gary Guo <gary@garyguo.net>
Co-developed-by: Boris-Chengbiao Zhou <bobo1239@web.de>
Signed-off-by: Boris-Chengbiao Zhou <bobo1239@web.de>
Co-developed-by: Fox Chen <foxhlchen@gmail.com>
Signed-off-by: Fox Chen <foxhlchen@gmail.com>
Co-developed-by: Ayaan Zaidi <zaidi.ayaan@gmail.com>
Signed-off-by: Ayaan Zaidi <zaidi.ayaan@gmail.com>
Co-developed-by: Douglas Su <d0u9.su@outlook.com>
Signed-off-by: Douglas Su <d0u9.su@outlook.com>
Co-developed-by: Yuki Okushi <jtitor@2k36.org>
Signed-off-by: Yuki Okushi <jtitor@2k36.org>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 scripts/generate_rust_analyzer.py | 143 ++++++++++++++++++++++++++++++
 1 file changed, 143 insertions(+)
 create mode 100755 scripts/generate_rust_analyzer.py

diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
new file mode 100755
index 00000000000..72c453e1aea
--- /dev/null
+++ b/scripts/generate_rust_analyzer.py
@@ -0,0 +1,143 @@
+#!/usr/bin/env python3
+"""generate_rust_analyzer - Generates the `rust-project.json` file for `rust-analyzer`.
+"""
+
+import argparse
+import json
+import logging
+import pathlib
+import sys
+
+def generate_crates(srctree, objtree, sysroot_src, bindings_file):
+    # Generate the configuration list.
+    cfg = []
+    with open(objtree / "include" / "generated" / "rustc_cfg") as fd:
+        for line in fd:
+            line = line.replace("--cfg=", "")
+            line = line.replace("\n", "")
+            cfg.append(line)
+
+    # Now fill the crates list -- dependencies need to come first.
+    #
+    # Avoid O(n^2) iterations by keeping a map of indexes.
+    crates = []
+    crates_indexes = {}
+
+    def append_crate(display_name, root_module, is_workspace_member, deps, cfg):
+        crates_indexes[display_name] = len(crates)
+        crates.append({
+            "display_name": display_name,
+            "root_module": str(root_module),
+            "is_workspace_member": is_workspace_member,
+            "deps": [{"crate": crates_indexes[dep], "name": dep} for dep in deps],
+            "cfg": cfg,
+            "edition": "2018",
+            "env": {
+                "RUST_MODFILE": "This is only for rust-analyzer"
+            }
+        })
+
+    # First, the ones in `rust/` since they are a bit special.
+    append_crate(
+        "core",
+        sysroot_src / "core" / "src" / "lib.rs",
+        False,
+        [],
+        [],
+    )
+
+    append_crate(
+        "compiler_builtins",
+        srctree / "rust" / "compiler_builtins.rs",
+        True,
+        [],
+        [],
+    )
+
+    append_crate(
+        "alloc",
+        srctree / "rust" / "alloc" / "lib.rs",
+        True,
+        ["core", "compiler_builtins"],
+        [],
+    )
+
+    append_crate(
+        "macros",
+        srctree / "rust" / "macros" / "lib.rs",
+        True,
+        [],
+        [],
+    )
+    crates[-1]["proc_macro_dylib_path"] = "rust/libmacros.so"
+
+    append_crate(
+        "build_error",
+        srctree / "rust" / "build_error.rs",
+        True,
+        ["core", "compiler_builtins"],
+        [],
+    )
+
+    append_crate(
+        "kernel",
+        srctree / "rust" / "kernel" / "lib.rs",
+        True,
+        ["core", "alloc", "macros", "build_error"],
+        cfg,
+    )
+    crates[-1]["env"]["RUST_BINDINGS_FILE"] = str(bindings_file.resolve(True))
+    crates[-1]["source"] = {
+        "include_dirs": [
+            str(srctree / "rust" / "kernel"),
+            str(objtree / "rust")
+        ],
+        "exclude_dirs": [],
+    }
+
+    # Then, the rest outside of `rust/`.
+    #
+    # We explicitly mention the top-level folders we want to cover.
+    for folder in ("samples", "drivers"):
+        for path in (srctree / folder).rglob("*.rs"):
+            logging.info("Checking %s", path)
+            name = path.name.replace(".rs", "")
+
+            # Skip those that are not crate roots.
+            if f"{name}.o" not in open(path.parent / "Makefile").read():
+                continue
+
+            logging.info("Adding %s", name)
+            append_crate(
+                name,
+                path,
+                True,
+                ["core", "alloc", "kernel"],
+                cfg,
+            )
+
+    return crates
+
+def main():
+    parser = argparse.ArgumentParser()
+    parser.add_argument('--verbose', '-v', action='store_true')
+    parser.add_argument("srctree", type=pathlib.Path)
+    parser.add_argument("objtree", type=pathlib.Path)
+    parser.add_argument("sysroot_src", type=pathlib.Path)
+    parser.add_argument("bindings_file", type=pathlib.Path)
+    args = parser.parse_args()
+
+    logging.basicConfig(
+        format="[%(asctime)s] [%(levelname)s] %(message)s",
+        level=logging.INFO if args.verbose else logging.WARNING
+    )
+
+    rust_project = {
+        "crates": generate_crates(args.srctree, args.objtree, args.sysroot_src, args.bindings_file),
+        "sysroot_src": str(args.sysroot_src),
+    }
+
+    json.dump(rust_project, sys.stdout, sort_keys=True, indent=4)
+
+if __name__ == "__main__":
+    main()
-- 
2.32.0

