Return-Path: <linux-kbuild+bounces-12888-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJLjCRuh72kcDgEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12888-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Apr 2026 19:47:07 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C568477E2C
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Apr 2026 19:47:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 50715306D0F7
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Apr 2026 17:45:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7FFC3E6394;
	Mon, 27 Apr 2026 17:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fGSuJ65B"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02435330B22
	for <linux-kbuild@vger.kernel.org>; Mon, 27 Apr 2026 17:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777311898; cv=none; b=RHQwSwHhVLa0H2HGcLmlqv5nESrR+40BLdAEhbQJKPeUXY9tVo7C9QcRct6cGCFxHuGddi6XM/2Z3/kFQbxg0QRpuw2k83KZkgHxL23NwUbRjVLV1oIXnbT86ZKZQBA8i/RZJGiRi1Sppq/kNhNcp6o5RVdP28+y0+rasKQ9kGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777311898; c=relaxed/simple;
	bh=JeU0auf5zopqzBvoSc/sBlfq+oLC4MEfTX5YFrmAcSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PhYV2mI1gELp//c5Ax524J5tgUAo35KQBFMaeO2so2aGe1XJU+5B5RiA1CX+cI/10VDcSsG21HLfHB+zU0Fo/cU9XACqD/tdbw77JokAmnHExmkZAPJoDG8i799mjfQIZmwWOYT2kKJNQeaotaKohBr6u6xzb46IPQuaIsJQArI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fGSuJ65B; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4891d7164ddso52479285e9.3
        for <linux-kbuild@vger.kernel.org>; Mon, 27 Apr 2026 10:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777311884; x=1777916684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h6cm5SCuyNs1SNiNQEgf/KAaUTvkgCLuKVyr81a4ZOo=;
        b=fGSuJ65BE8fmhtbL8l1I2VxI5bSBjoay++PLmvZwg0hnlAIRk8FbZhH8B/KD8Bgj5j
         jQ21jjcdz4O0KVN592FXWk8LUs1vN48hSxUGmFNYA6ICLOb/Uex9lLgOL5PsOrQL4b28
         ulrWrcp3unopn1Qgd8cumgUXDC9ev2awMY7BX6Bo9pE0EkxtLxKpmEIdMdEfyAWbHSXP
         iAix0vMjq/4Cyr0Sl6t6t+fFUS5CD7VldIq/qIlll9KoZEDjT4JMxtqzrS1PXr3CQEtF
         3ppTx4riB829+I6D+Mbd4kng9wf04pgZXir1WfK3aS5DM9snGqM9TD1twzsQ1UMlVekQ
         rN6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777311884; x=1777916684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h6cm5SCuyNs1SNiNQEgf/KAaUTvkgCLuKVyr81a4ZOo=;
        b=Fo+XFW23dABl/OdJqC3y6GClPFaYU2gk7/V6BN9aHpYab4b72D7N/a7mCS/4q5mNx6
         RMBanTmT1WbnNQEq+DcbJyI1Hvd5OiAJXFz3rKrKW0LZ15Q0CyC7Z/EaEc5jIHAeP8VG
         xs8s2lB6Wx61+FeFIp0v70L2lZEL1ZPuAcwjsbjY1Kf304y+R0jDTIHDGN+d5/T/fGjC
         rbWXuTzpUi1YyPpE1ZSuIJIqZEYxp5tW0PtjWLx+WtpzZuV8yW66LmZJih6syR69Y2mK
         9ZQiHtiojz3dmlvWrijgiMrEmbasLlhHqG1rIk3Z5AHy2Eg14mxUOgARtcy6kz6sa38V
         QjZg==
X-Forwarded-Encrypted: i=1; AFNElJ+DFBkiaiJu828S6oF8DPWT5W0iZusNt37G3fWJSF9NXCiSyjhSZCjmY4ys+dOmeK4i57LBJHJ/fm2NgRQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+hmPof3kURyyrgPtyHF/vNaWCSBR17NvoTxoW7wzt84H0ZUbe
	v+9iOhbOVVXawGqUmJVxtktjkcdmUK9xB7u1h8YUIPxOOItxeDlOHiTS
X-Gm-Gg: AeBDieswfhCy+U+7ue+Z10FEMxIruSjPpt4oVgHrY8CyXc35fBjeYUnO61eGpsg9Mtz
	VDLer0rts3iIu1Yn4HEOTN/iwEEPuba7KAKTytLYh+cpdQ/qdOA9JwrZmiP6GJudu+xQbSTl825
	IGJH71eAnEcg5doqJ7vKe4LVxrCrf6A5MbPwJVeXzted4ER5OPjr3Sl9bgHEGIJJmm+JelwSXIT
	/e+SkNAGrRPLLP1KlFuL138LchD9f31E/TuuaNZtAfx7GI+y3Yh8jY1jCu7e5oFmLbT7a3tO5w9
	3a9eNIFahlK/JyCMNU+xemiBKhXusae1ZiNukVFUbPbIhuWZN3QrYT+jF956klxZNIIiCFnSYVv
	d/F9qNci3zeEkq+5Jj6btBaDAXiGSzSpm3fBaGupACQt9cy0DZALLdyYx8xiWIcVfF+wLyEY8wE
	hhTClAYKbt0tbKWlzrbzLimEl4SbKdKoqYn+7q7kS+oR3eW7oIZZpbTgG1CJSSxgX8hA==
X-Received: by 2002:a05:600c:3548:b0:489:1f6b:6276 with SMTP id 5b1f17b1804b1-48a76f7ecfdmr4147315e9.15.1777311883000;
        Mon, 27 Apr 2026 10:44:43 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a774b6300sm478485e9.16.2026.04.27.10.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:44:42 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: akpm@linux-foundation.org,
	ljs@kernel.org
Cc: arnd@arndb.de,
	gregkh@linuxfoundation.org,
	masahiroy@kernel.org,
	nathan@kernel.org,
	nsc@kernel.org,
	ojeda@kernel.org,
	corbet@lwn.net,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [RFC PATCH 1/2] scripts: add kconfirm
Date: Mon, 27 Apr 2026 18:44:28 +0100
Message-ID: <20260427174429.779474-2-julianbraha@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260427174429.779474-1-julianbraha@gmail.com>
References: <20260427174429.779474-1-julianbraha@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 2C568477E2C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[arndb.de,linuxfoundation.org,kernel.org,lwn.net,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-12888-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julianbraha@gmail.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Add kconfirm into scripts/ and modify the root Makefile and
scripts/Makefile accordingly so that it can be compiled and run with:
`make kconfirm`
from the root of the tree.

The user is expected to have Rust with Cargo installed, and an internet
connection on the first run to download and compile the dependencies.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 Makefile                                      |   12 +-
 scripts/Makefile                              |    2 +-
 scripts/kconfirm/Cargo.lock                   | 1710 +++++++++++++++++
 scripts/kconfirm/Cargo.toml                   |   21 +
 scripts/kconfirm/Makefile                     |   28 +
 scripts/kconfirm/kconfirm-lib/Cargo.toml      |   16 +
 scripts/kconfirm/kconfirm-lib/src/analyze.rs  |  593 ++++++
 scripts/kconfirm/kconfirm-lib/src/checks.rs   |  257 +++
 .../kconfirm/kconfirm-lib/src/dead_links.rs   |   63 +
 scripts/kconfirm/kconfirm-lib/src/lib.rs      |   55 +
 scripts/kconfirm/kconfirm-lib/src/output.rs   |   52 +
 .../kconfirm/kconfirm-lib/src/symbol_table.rs |  209 ++
 scripts/kconfirm/kconfirm-linux/Cargo.toml    |   14 +
 scripts/kconfirm/kconfirm-linux/src/lib.rs    |  129 ++
 scripts/kconfirm/kconfirm-linux/src/main.rs   |   74 +
 15 files changed, 3231 insertions(+), 4 deletions(-)
 create mode 100644 scripts/kconfirm/Cargo.lock
 create mode 100644 scripts/kconfirm/Cargo.toml
 create mode 100644 scripts/kconfirm/Makefile
 create mode 100644 scripts/kconfirm/kconfirm-lib/Cargo.toml
 create mode 100644 scripts/kconfirm/kconfirm-lib/src/analyze.rs
 create mode 100644 scripts/kconfirm/kconfirm-lib/src/checks.rs
 create mode 100644 scripts/kconfirm/kconfirm-lib/src/dead_links.rs
 create mode 100644 scripts/kconfirm/kconfirm-lib/src/lib.rs
 create mode 100644 scripts/kconfirm/kconfirm-lib/src/output.rs
 create mode 100644 scripts/kconfirm/kconfirm-lib/src/symbol_table.rs
 create mode 100644 scripts/kconfirm/kconfirm-linux/Cargo.toml
 create mode 100644 scripts/kconfirm/kconfirm-linux/src/lib.rs
 create mode 100644 scripts/kconfirm/kconfirm-linux/src/main.rs

diff --git a/Makefile b/Makefile
index 54e1ae602000..8fcee448111b 100644
--- a/Makefile
+++ b/Makefile
@@ -1707,13 +1707,16 @@ MRPROPER_FILES += include/config include/generated          \
 #
 clean: private rm-files := $(CLEAN_FILES)
 
-PHONY += archclean vmlinuxclean
+PHONY += archclean vmlinuxclean kconfirm_clean
 
 vmlinuxclean:
 	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/link-vmlinux.sh clean
 	$(Q)$(if $(ARCH_POSTLINK), $(MAKE) -f $(ARCH_POSTLINK) clean)
 
-clean: archclean vmlinuxclean resolve_btfids_clean objtool_clean
+kconfirm_clean:
+	$(Q)$(MAKE) -C scripts/kconfirm clean
+
+clean: archclean vmlinuxclean resolve_btfids_clean objtool_clean kconfirm_clean
 
 # mrproper - Delete all generated files, including .config
 #
@@ -2223,7 +2226,7 @@ endif
 # Scripts to check various things for consistency
 # ---------------------------------------------------------------------------
 
-PHONY += includecheck versioncheck coccicheck
+PHONY += includecheck versioncheck coccicheck kconfirm
 
 includecheck:
 	find $(srctree)/* $(RCS_FIND_IGNORE) \
@@ -2238,6 +2241,9 @@ versioncheck:
 coccicheck:
 	$(Q)$(BASH) $(srctree)/scripts/$@
 
+kconfirm:
+	$(Q)$(MAKE) -C scripts/kconfirm
+
 PHONY += checkstack kernelrelease kernelversion image_name
 
 # UML needs a little special treatment here.  It wants to use the host
diff --git a/scripts/Makefile b/scripts/Makefile
index 55244ce95578..402950d9a008 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -57,7 +57,7 @@ HOSTCFLAGS_sorttable.o += -DMCOUNT_SORT_ENABLED
 endif
 
 # The following programs are only built on demand
-hostprogs += unifdef gen_packed_field_checks
+hostprogs += unifdef gen_packed_field_checks kconfirm
 
 # The module linker script is preprocessed on demand
 targets += module.lds
diff --git a/scripts/kconfirm/Cargo.lock b/scripts/kconfirm/Cargo.lock
new file mode 100644
index 000000000000..c1e55ae2ca00
--- /dev/null
+++ b/scripts/kconfirm/Cargo.lock
@@ -0,0 +1,1710 @@
+# This file is automatically @generated by Cargo.
+# It is not intended for manual editing.
+version = 4
+
+[[package]]
+name = "aho-corasick"
+version = "1.1.4"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "ddd31a130427c27518df266943a5308ed92d4b226cc639f5a8f1002816174301"
+dependencies = [
+ "memchr",
+]
+
+[[package]]
+name = "anstyle"
+version = "1.0.14"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "940b3a0ca603d1eade50a4846a2afffd5ef57a9feac2c0e2ec2e14f9ead76000"
+
+[[package]]
+name = "atomic-waker"
+version = "1.1.2"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "1505bd5d3d116872e7271a6d4e16d81d0c8570876c8de68093a09ac269d8aac0"
+
+[[package]]
+name = "aws-lc-rs"
+version = "1.16.3"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "0ec6fb3fe69024a75fa7e1bfb48aa6cf59706a101658ea01bfd33b2b248a038f"
+dependencies = [
+ "aws-lc-sys",
+ "zeroize",
+]
+
+[[package]]
+name = "aws-lc-sys"
+version = "0.40.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "f50037ee5e1e41e7b8f9d161680a725bd1626cb6f8c7e901f91f942850852fe7"
+dependencies = [
+ "cc",
+ "cmake",
+ "dunce",
+ "fs_extra",
+]
+
+[[package]]
+name = "base64"
+version = "0.22.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6"
+
+[[package]]
+name = "bitflags"
+version = "2.11.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "c4512299f36f043ab09a583e57bceb5a5aab7a73db1805848e8fef3c9e8c78b3"
+
+[[package]]
+name = "bumpalo"
+version = "3.20.2"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "5d20789868f4b01b2f2caec9f5c4e0213b41e3e5702a50157d699ae31ced2fcb"
+
+[[package]]
+name = "bytecount"
+version = "0.6.9"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "175812e0be2bccb6abe50bb8d566126198344f707e304f45c648fd8f2cc0365e"
+
+[[package]]
+name = "bytes"
+version = "1.11.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "1e748733b7cbc798e1434b6ac524f0c1ff2ab456fe201501e6497c8417a4fc33"
+
+[[package]]
+name = "cc"
+version = "1.2.61"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "d16d90359e986641506914ba71350897565610e87ce0ad9e6f28569db3dd5c6d"
+dependencies = [
+ "find-msvc-tools",
+ "jobserver",
+ "libc",
+ "shlex",
+]
+
+[[package]]
+name = "cfg-if"
+version = "1.0.4"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "9330f8b2ff13f34540b44e946ef35111825727b38d33286ef986142615121801"
+
+[[package]]
+name = "cfg_aliases"
+version = "0.2.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "613afe47fcd5fac7ccf1db93babcb082c5994d996f20b8b159f2ad1658eb5724"
+
+[[package]]
+name = "clap"
+version = "4.6.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "1ddb117e43bbf7dacf0a4190fef4d345b9bad68dfc649cb349e7d17d28428e51"
+dependencies = [
+ "clap_builder",
+ "clap_derive",
+]
+
+[[package]]
+name = "clap_builder"
+version = "4.6.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "714a53001bf66416adb0e2ef5ac857140e7dc3a0c48fb28b2f10762fc4b5069f"
+dependencies = [
+ "anstyle",
+ "clap_lex",
+]
+
+[[package]]
+name = "clap_derive"
+version = "4.6.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "f2ce8604710f6733aa641a2b3731eaa1e8b3d9973d5e3565da11800813f997a9"
+dependencies = [
+ "heck",
+ "proc-macro2",
+ "quote",
+ "syn",
+]
+
+[[package]]
+name = "clap_lex"
+version = "1.1.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "c8d4a3bb8b1e0c1050499d1815f5ab16d04f0959b233085fb31653fbfc9d98f9"
+
+[[package]]
+name = "cmake"
+version = "0.1.58"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "c0f78a02292a74a88ac736019ab962ece0bc380e3f977bf72e376c5d78ff0678"
+dependencies = [
+ "cc",
+]
+
+[[package]]
+name = "combine"
+version = "4.6.7"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "ba5a308b75df32fe02788e748662718f03fde005016435c444eea572398219fd"
+dependencies = [
+ "bytes",
+ "memchr",
+]
+
+[[package]]
+name = "core-foundation"
+version = "0.10.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "b2a6cd9ae233e7f62ba4e9353e81a88df7fc8a5987b8d445b4d90c879bd156f6"
+dependencies = [
+ "core-foundation-sys",
+ "libc",
+]
+
+[[package]]
+name = "core-foundation-sys"
+version = "0.8.7"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "773648b94d0e5d620f64f280777445740e61fe701025087ec8b57f45c791888b"
+
+[[package]]
+name = "displaydoc"
+version = "0.2.5"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "97369cbbc041bc366949bc74d34658d6cda5621039731c6310521892a3a20ae0"
+dependencies = [
+ "proc-macro2",
+ "quote",
+ "syn",
+]
+
+[[package]]
+name = "dunce"
+version = "1.0.5"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "92773504d58c093f6de2459af4af33faa518c13451eb8f2b5698ed3d36e7c813"
+
+[[package]]
+name = "env_filter"
+version = "1.0.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "32e90c2accc4b07a8456ea0debdc2e7587bdd890680d71173a15d4ae604f6eef"
+dependencies = [
+ "log",
+]
+
+[[package]]
+name = "env_logger"
+version = "0.11.10"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "0621c04f2196ac3f488dd583365b9c09be011a4ab8b9f37248ffcc8f6198b56a"
+dependencies = [
+ "env_filter",
+ "log",
+]
+
+[[package]]
+name = "find-msvc-tools"
+version = "0.1.9"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "5baebc0774151f905a1a2cc41989300b1e6fbb29aff0ceffa1064fdd3088d582"
+
+[[package]]
+name = "form_urlencoded"
+version = "1.2.2"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "cb4cb245038516f5f85277875cdaa4f7d2c9a0fa0468de06ed190163b1581fcf"
+dependencies = [
+ "percent-encoding",
+]
+
+[[package]]
+name = "fs_extra"
+version = "1.3.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "42703706b716c37f96a77aea830392ad231f44c9e9a67872fa5548707e11b11c"
+
+[[package]]
+name = "futures-channel"
+version = "0.3.32"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "07bbe89c50d7a535e539b8c17bc0b49bdb77747034daa8087407d655f3f7cc1d"
+dependencies = [
+ "futures-core",
+ "futures-sink",
+]
+
+[[package]]
+name = "futures-core"
+version = "0.3.32"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "7e3450815272ef58cec6d564423f6e755e25379b217b0bc688e295ba24df6b1d"
+
+[[package]]
+name = "futures-io"
+version = "0.3.32"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "cecba35d7ad927e23624b22ad55235f2239cfa44fd10428eecbeba6d6a717718"
+
+[[package]]
+name = "futures-sink"
+version = "0.3.32"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "c39754e157331b013978ec91992bde1ac089843443c49cbc7f46150b0fad0893"
+
+[[package]]
+name = "futures-task"
+version = "0.3.32"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "037711b3d59c33004d3856fbdc83b99d4ff37a24768fa1be9ce3538a1cde4393"
+
+[[package]]
+name = "futures-util"
+version = "0.3.32"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "389ca41296e6190b48053de0321d02a77f32f8a5d2461dd38762c0593805c6d6"
+dependencies = [
+ "futures-core",
+ "futures-io",
+ "futures-sink",
+ "futures-task",
+ "memchr",
+ "pin-project-lite",
+ "slab",
+]
+
+[[package]]
+name = "getrandom"
+version = "0.2.17"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "ff2abc00be7fca6ebc474524697ae276ad847ad0a6b3faa4bcb027e9a4614ad0"
+dependencies = [
+ "cfg-if",
+ "js-sys",
+ "libc",
+ "wasi",
+ "wasm-bindgen",
+]
+
+[[package]]
+name = "getrandom"
+version = "0.3.4"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "899def5c37c4fd7b2664648c28120ecec138e4d395b459e5ca34f9cce2dd77fd"
+dependencies = [
+ "cfg-if",
+ "js-sys",
+ "libc",
+ "r-efi",
+ "wasip2",
+ "wasm-bindgen",
+]
+
+[[package]]
+name = "glob"
+version = "0.3.3"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "0cc23270f6e1808e30a928bdc84dea0b9b4136a8bc82338574f23baf47bbd280"
+
+[[package]]
+name = "heck"
+version = "0.5.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
+
+[[package]]
+name = "http"
+version = "1.4.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "e3ba2a386d7f85a81f119ad7498ebe444d2e22c2af0b86b069416ace48b3311a"
+dependencies = [
+ "bytes",
+ "itoa",
+]
+
+[[package]]
+name = "http-body"
+version = "1.0.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "1efedce1fb8e6913f23e0c92de8e62cd5b772a67e7b3946df930a62566c93184"
+dependencies = [
+ "bytes",
+ "http",
+]
+
+[[package]]
+name = "http-body-util"
+version = "0.1.3"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "b021d93e26becf5dc7e1b75b1bed1fd93124b374ceb73f43d4d4eafec896a64a"
+dependencies = [
+ "bytes",
+ "futures-core",
+ "http",
+ "http-body",
+ "pin-project-lite",
+]
+
+[[package]]
+name = "httparse"
+version = "1.10.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "6dbf3de79e51f3d586ab4cb9d5c3e2c14aa28ed23d180cf89b4df0454a69cc87"
+
+[[package]]
+name = "hyper"
+version = "1.9.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "6299f016b246a94207e63da54dbe807655bf9e00044f73ded42c3ac5305fbcca"
+dependencies = [
+ "atomic-waker",
+ "bytes",
+ "futures-channel",
+ "futures-core",
+ "http",
+ "http-body",
+ "httparse",
+ "itoa",
+ "pin-project-lite",
+ "smallvec",
+ "tokio",
+ "want",
+]
+
+[[package]]
+name = "hyper-rustls"
+version = "0.27.9"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "33ca68d021ef39cf6463ab54c1d0f5daf03377b70561305bb89a8f83aab66e0f"
+dependencies = [
+ "http",
+ "hyper",
+ "hyper-util",
+ "rustls",
+ "tokio",
+ "tokio-rustls",
+ "tower-service",
+]
+
+[[package]]
+name = "hyper-util"
+version = "0.1.20"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "96547c2556ec9d12fb1578c4eaf448b04993e7fb79cbaad930a656880a6bdfa0"
+dependencies = [
+ "base64",
+ "bytes",
+ "futures-channel",
+ "futures-util",
+ "http",
+ "http-body",
+ "hyper",
+ "ipnet",
+ "libc",
+ "percent-encoding",
+ "pin-project-lite",
+ "socket2",
+ "tokio",
+ "tower-service",
+ "tracing",
+]
+
+[[package]]
+name = "icu_collections"
+version = "2.1.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "4c6b649701667bbe825c3b7e6388cb521c23d88644678e83c0c4d0a621a34b43"
+dependencies = [
+ "displaydoc",
+ "potential_utf",
+ "yoke",
+ "zerofrom",
+ "zerovec",
+]
+
+[[package]]
+name = "icu_locale_core"
+version = "2.1.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "edba7861004dd3714265b4db54a3c390e880ab658fec5f7db895fae2046b5bb6"
+dependencies = [
+ "displaydoc",
+ "litemap",
+ "tinystr",
+ "writeable",
+ "zerovec",
+]
+
+[[package]]
+name = "icu_normalizer"
+version = "2.1.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "5f6c8828b67bf8908d82127b2054ea1b4427ff0230ee9141c54251934ab1b599"
+dependencies = [
+ "icu_collections",
+ "icu_normalizer_data",
+ "icu_properties",
+ "icu_provider",
+ "smallvec",
+ "zerovec",
+]
+
+[[package]]
+name = "icu_normalizer_data"
+version = "2.1.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "7aedcccd01fc5fe81e6b489c15b247b8b0690feb23304303a9e560f37efc560a"
+
+[[package]]
+name = "icu_properties"
+version = "2.1.2"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "020bfc02fe870ec3a66d93e677ccca0562506e5872c650f893269e08615d74ec"
+dependencies = [
+ "icu_collections",
+ "icu_locale_core",
+ "icu_properties_data",
+ "icu_provider",
+ "zerotrie",
+ "zerovec",
+]
+
+[[package]]
+name = "icu_properties_data"
+version = "2.1.2"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "616c294cf8d725c6afcd8f55abc17c56464ef6211f9ed59cccffe534129c77af"
+
+[[package]]
+name = "icu_provider"
+version = "2.1.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "85962cf0ce02e1e0a629cc34e7ca3e373ce20dda4c4d7294bbd0bf1fdb59e614"
+dependencies = [
+ "displaydoc",
+ "icu_locale_core",
+ "writeable",
+ "yoke",
+ "zerofrom",
+ "zerotrie",
+ "zerovec",
+]
+
+[[package]]
+name = "idna"
+version = "1.1.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "3b0875f23caa03898994f6ddc501886a45c7d3d62d04d2d90788d47be1b1e4de"
+dependencies = [
+ "idna_adapter",
+ "smallvec",
+ "utf8_iter",
+]
+
+[[package]]
+name = "idna_adapter"
+version = "1.2.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "3acae9609540aa318d1bc588455225fb2085b9ed0c4f6bd0d9d5bcd86f1a0344"
+dependencies = [
+ "icu_normalizer",
+ "icu_properties",
+]
+
+[[package]]
+name = "ipnet"
+version = "2.12.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "d98f6fed1fde3f8c21bc40a1abb88dd75e67924f9cffc3ef95607bad8017f8e2"
+
+[[package]]
+name = "iri-string"
+version = "0.7.12"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "25e659a4bb38e810ebc252e53b5814ff908a8c58c2a9ce2fae1bbec24cbf4e20"
+dependencies = [
+ "memchr",
+ "serde",
+]
+
+[[package]]
+name = "itoa"
+version = "1.0.18"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "8f42a60cbdf9a97f5d2305f08a87dc4e09308d1276d28c869c684d7777685682"
+
+[[package]]
+name = "jni"
+version = "0.22.4"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "5efd9a482cf3a427f00d6b35f14332adc7902ce91efb778580e180ff90fa3498"
+dependencies = [
+ "cfg-if",
+ "combine",
+ "jni-macros",
+ "jni-sys",
+ "log",
+ "simd_cesu8",
+ "thiserror",
+ "walkdir",
+ "windows-link",
+]
+
+[[package]]
+name = "jni-macros"
+version = "0.22.4"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "a00109accc170f0bdb141fed3e393c565b6f5e072365c3bd58f5b062591560a3"
+dependencies = [
+ "proc-macro2",
+ "quote",
+ "rustc_version",
+ "simd_cesu8",
+ "syn",
+]
+
+[[package]]
+name = "jni-sys"
+version = "0.4.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "c6377a88cb3910bee9b0fa88d4f42e1d2da8e79915598f65fb0c7ee14c878af2"
+dependencies = [
+ "jni-sys-macros",
+]
+
+[[package]]
+name = "jni-sys-macros"
+version = "0.4.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "38c0b942f458fe50cdac086d2f946512305e5631e720728f2a61aabcd47a6264"
+dependencies = [
+ "quote",
+ "syn",
+]
+
+[[package]]
+name = "jobserver"
+version = "0.1.34"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "9afb3de4395d6b3e67a780b6de64b51c978ecf11cb9a462c66be7d4ca9039d33"
+dependencies = [
+ "getrandom 0.3.4",
+ "libc",
+]
+
+[[package]]
+name = "js-sys"
+version = "0.3.95"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "2964e92d1d9dc3364cae4d718d93f227e3abb088e747d92e0395bfdedf1c12ca"
+dependencies = [
+ "cfg-if",
+ "futures-util",
+ "once_cell",
+ "wasm-bindgen",
+]
+
+[[package]]
+name = "kconfirm-lib"
+version = "0.7.0"
+dependencies = [
+ "env_logger",
+ "log",
+ "nom-kconfig",
+ "regex",
+ "reqwest",
+]
+
+[[package]]
+name = "kconfirm-linux"
+version = "0.7.0"
+dependencies = [
+ "clap",
+ "env_logger",
+ "kconfirm-lib",
+ "log",
+ "nom-kconfig",
+]
+
+[[package]]
+name = "libc"
+version = "0.2.186"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "68ab91017fe16c622486840e4c83c9a37afeff978bd239b5293d61ece587de66"
+
+[[package]]
+name = "litemap"
+version = "0.8.2"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "92daf443525c4cce67b150400bc2316076100ce0b3686209eb8cf3c31612e6f0"
+
+[[package]]
+name = "log"
+version = "0.4.29"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "5e5032e24019045c762d3c0f28f5b6b8bbf38563a65908389bf7978758920897"
+
+[[package]]
+name = "lru-slab"
+version = "0.1.2"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "112b39cec0b298b6c1999fee3e31427f74f676e4cb9879ed1a121b43661a4154"
+
+[[package]]
+name = "memchr"
+version = "2.8.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "f8ca58f447f06ed17d5fc4043ce1b10dd205e060fb3ce5b979b8ed8e59ff3f79"
+
+[[package]]
+name = "mio"
+version = "1.2.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "50b7e5b27aa02a74bac8c3f23f448f8d87ff11f92d3aac1a6ed369ee08cc56c1"
+dependencies = [
+ "libc",
+ "wasi",
+ "windows-sys 0.61.2",
+]
+
+[[package]]
+name = "nom"
+version = "8.0.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "df9761775871bdef83bee530e60050f7e54b1105350d6884eb0fb4f46c2f9405"
+dependencies = [
+ "memchr",
+]
+
+[[package]]
+name = "nom-kconfig"
+version = "0.10.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "c27ba674eb4a89c21e046dcaed8552f26c8332ba4951b167ec845d2abb8c95c4"
+dependencies = [
+ "glob",
+ "nom",
+ "nom_locate",
+ "regex",
+ "serde",
+ "tracing",
+]
+
+[[package]]
+name = "nom_locate"
+version = "5.0.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "0b577e2d69827c4740cba2b52efaad1c4cc7c73042860b199710b3575c68438d"
+dependencies = [
+ "bytecount",
+ "memchr",
+ "nom",
+]
+
+[[package]]
+name = "once_cell"
+version = "1.21.4"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "9f7c3e4beb33f85d45ae3e3a1792185706c8e16d043238c593331cc7cd313b50"
+
+[[package]]
+name = "openssl-probe"
+version = "0.2.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "7c87def4c32ab89d880effc9e097653c8da5d6ef28e6b539d313baaacfbafcbe"
+
+[[package]]
+name = "percent-encoding"
+version = "2.3.2"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "9b4f627cb1b25917193a259e49bdad08f671f8d9708acfd5fe0a8c1455d87220"
+
+[[package]]
+name = "pin-project-lite"
+version = "0.2.17"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "a89322df9ebe1c1578d689c92318e070967d1042b512afbe49518723f4e6d5cd"
+
+[[package]]
+name = "potential_utf"
+version = "0.1.5"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "0103b1cef7ec0cf76490e969665504990193874ea05c85ff9bab8b911d0a0564"
+dependencies = [
+ "zerovec",
+]
+
+[[package]]
+name = "ppv-lite86"
+version = "0.2.21"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "85eae3c4ed2f50dcfe72643da4befc30deadb458a9b590d720cde2f2b1e97da9"
+dependencies = [
+ "zerocopy",
+]
+
+[[package]]
+name = "proc-macro2"
+version = "1.0.106"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "8fd00f0bb2e90d81d1044c2b32617f68fcb9fa3bb7640c23e9c748e53fb30934"
+dependencies = [
+ "unicode-ident",
+]
+
+[[package]]
+name = "quinn"
+version = "0.11.9"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "b9e20a958963c291dc322d98411f541009df2ced7b5a4f2bd52337638cfccf20"
+dependencies = [
+ "bytes",
+ "cfg_aliases",
+ "pin-project-lite",
+ "quinn-proto",
+ "quinn-udp",
+ "rustc-hash",
+ "rustls",
+ "socket2",
+ "thiserror",
+ "tokio",
+ "tracing",
+ "web-time",
+]
+
+[[package]]
+name = "quinn-proto"
+version = "0.11.14"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "434b42fec591c96ef50e21e886936e66d3cc3f737104fdb9b737c40ffb94c098"
+dependencies = [
+ "aws-lc-rs",
+ "bytes",
+ "getrandom 0.3.4",
+ "lru-slab",
+ "rand",
+ "ring",
+ "rustc-hash",
+ "rustls",
+ "rustls-pki-types",
+ "slab",
+ "thiserror",
+ "tinyvec",
+ "tracing",
+ "web-time",
+]
+
+[[package]]
+name = "quinn-udp"
+version = "0.5.14"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "addec6a0dcad8a8d96a771f815f0eaf55f9d1805756410b39f5fa81332574cbd"
+dependencies = [
+ "cfg_aliases",
+ "libc",
+ "once_cell",
+ "socket2",
+ "tracing",
+ "windows-sys 0.52.0",
+]
+
+[[package]]
+name = "quote"
+version = "1.0.45"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "41f2619966050689382d2b44f664f4bc593e129785a36d6ee376ddf37259b924"
+dependencies = [
+ "proc-macro2",
+]
+
+[[package]]
+name = "r-efi"
+version = "5.3.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "69cdb34c158ceb288df11e18b4bd39de994f6657d83847bdffdbd7f346754b0f"
+
+[[package]]
+name = "rand"
+version = "0.9.4"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "44c5af06bb1b7d3216d91932aed5265164bf384dc89cd6ba05cf59a35f5f76ea"
+dependencies = [
+ "rand_chacha",
+ "rand_core",
+]
+
+[[package]]
+name = "rand_chacha"
+version = "0.9.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "d3022b5f1df60f26e1ffddd6c66e8aa15de382ae63b3a0c1bfc0e4d3e3f325cb"
+dependencies = [
+ "ppv-lite86",
+ "rand_core",
+]
+
+[[package]]
+name = "rand_core"
+version = "0.9.5"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "76afc826de14238e6e8c374ddcc1fa19e374fd8dd986b0d2af0d02377261d83c"
+dependencies = [
+ "getrandom 0.3.4",
+]
+
+[[package]]
+name = "regex"
+version = "1.12.3"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "e10754a14b9137dd7b1e3e5b0493cc9171fdd105e0ab477f51b72e7f3ac0e276"
+dependencies = [
+ "aho-corasick",
+ "memchr",
+ "regex-automata",
+ "regex-syntax",
+]
+
+[[package]]
+name = "regex-automata"
+version = "0.4.14"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "6e1dd4122fc1595e8162618945476892eefca7b88c52820e74af6262213cae8f"
+dependencies = [
+ "aho-corasick",
+ "memchr",
+ "regex-syntax",
+]
+
+[[package]]
+name = "regex-syntax"
+version = "0.8.10"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "dc897dd8d9e8bd1ed8cdad82b5966c3e0ecae09fb1907d58efaa013543185d0a"
+
+[[package]]
+name = "reqwest"
+version = "0.13.3"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "62e0021ea2c22aed41653bc7e1419abb2c97e038ff2c33d0e1309e49a97deec0"
+dependencies = [
+ "base64",
+ "bytes",
+ "futures-channel",
+ "futures-core",
+ "futures-util",
+ "http",
+ "http-body",
+ "http-body-util",
+ "hyper",
+ "hyper-rustls",
+ "hyper-util",
+ "js-sys",
+ "log",
+ "percent-encoding",
+ "pin-project-lite",
+ "quinn",
+ "rustls",
+ "rustls-pki-types",
+ "rustls-platform-verifier",
+ "sync_wrapper",
+ "tokio",
+ "tokio-rustls",
+ "tower",
+ "tower-http",
+ "tower-service",
+ "url",
+ "wasm-bindgen",
+ "wasm-bindgen-futures",
+ "web-sys",
+]
+
+[[package]]
+name = "ring"
+version = "0.17.14"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "a4689e6c2294d81e88dc6261c768b63bc4fcdb852be6d1352498b114f61383b7"
+dependencies = [
+ "cc",
+ "cfg-if",
+ "getrandom 0.2.17",
+ "libc",
+ "untrusted",
+ "windows-sys 0.52.0",
+]
+
+[[package]]
+name = "rustc-hash"
+version = "2.1.2"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "94300abf3f1ae2e2b8ffb7b58043de3d399c73fa6f4b73826402a5c457614dbe"
+
+[[package]]
+name = "rustc_version"
+version = "0.4.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "cfcb3a22ef46e85b45de6ee7e79d063319ebb6594faafcf1c225ea92ab6e9b92"
+dependencies = [
+ "semver",
+]
+
+[[package]]
+name = "rustls"
+version = "0.23.39"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "7c2c118cb077cca2822033836dfb1b975355dfb784b5e8da48f7b6c5db74e60e"
+dependencies = [
+ "aws-lc-rs",
+ "once_cell",
+ "rustls-pki-types",
+ "rustls-webpki",
+ "subtle",
+ "zeroize",
+]
+
+[[package]]
+name = "rustls-native-certs"
+version = "0.8.3"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "612460d5f7bea540c490b2b6395d8e34a953e52b491accd6c86c8164c5932a63"
+dependencies = [
+ "openssl-probe",
+ "rustls-pki-types",
+ "schannel",
+ "security-framework",
+]
+
+[[package]]
+name = "rustls-pki-types"
+version = "1.14.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "30a7197ae7eb376e574fe940d068c30fe0462554a3ddbe4eca7838e049c937a9"
+dependencies = [
+ "web-time",
+ "zeroize",
+]
+
+[[package]]
+name = "rustls-platform-verifier"
+version = "0.7.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "26d1e2536ce4f35f4846aa13bff16bd0ff40157cdb14cc056c7b14ba41233ba0"
+dependencies = [
+ "core-foundation",
+ "core-foundation-sys",
+ "jni",
+ "log",
+ "once_cell",
+ "rustls",
+ "rustls-native-certs",
+ "rustls-platform-verifier-android",
+ "rustls-webpki",
+ "security-framework",
+ "security-framework-sys",
+ "webpki-root-certs",
+ "windows-sys 0.61.2",
+]
+
+[[package]]
+name = "rustls-platform-verifier-android"
+version = "0.1.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "f87165f0995f63a9fbeea62b64d10b4d9d8e78ec6d7d51fb2125fda7bb36788f"
+
+[[package]]
+name = "rustls-webpki"
+version = "0.103.13"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "61c429a8649f110dddef65e2a5ad240f747e85f7758a6bccc7e5777bd33f756e"
+dependencies = [
+ "aws-lc-rs",
+ "ring",
+ "rustls-pki-types",
+ "untrusted",
+]
+
+[[package]]
+name = "rustversion"
+version = "1.0.22"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "b39cdef0fa800fc44525c84ccb54a029961a8215f9619753635a9c0d2538d46d"
+
+[[package]]
+name = "same-file"
+version = "1.0.6"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502"
+dependencies = [
+ "winapi-util",
+]
+
+[[package]]
+name = "schannel"
+version = "0.1.29"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "91c1b7e4904c873ef0710c1f407dde2e6287de2bebc1bbbf7d430bb7cbffd939"
+dependencies = [
+ "windows-sys 0.61.2",
+]
+
+[[package]]
+name = "security-framework"
+version = "3.7.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "b7f4bc775c73d9a02cde8bf7b2ec4c9d12743edf609006c7facc23998404cd1d"
+dependencies = [
+ "bitflags",
+ "core-foundation",
+ "core-foundation-sys",
+ "libc",
+ "security-framework-sys",
+]
+
+[[package]]
+name = "security-framework-sys"
+version = "2.17.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "6ce2691df843ecc5d231c0b14ece2acc3efb62c0a398c7e1d875f3983ce020e3"
+dependencies = [
+ "core-foundation-sys",
+ "libc",
+]
+
+[[package]]
+name = "semver"
+version = "1.0.28"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "8a7852d02fc848982e0c167ef163aaff9cd91dc640ba85e263cb1ce46fae51cd"
+
+[[package]]
+name = "serde"
+version = "1.0.228"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "9a8e94ea7f378bd32cbbd37198a4a91436180c5bb472411e48b5ec2e2124ae9e"
+dependencies = [
+ "serde_core",
+ "serde_derive",
+]
+
+[[package]]
+name = "serde_core"
+version = "1.0.228"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "41d385c7d4ca58e59fc732af25c3983b67ac852c1a25000afe1175de458b67ad"
+dependencies = [
+ "serde_derive",
+]
+
+[[package]]
+name = "serde_derive"
+version = "1.0.228"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "d540f220d3187173da220f885ab66608367b6574e925011a9353e4badda91d79"
+dependencies = [
+ "proc-macro2",
+ "quote",
+ "syn",
+]
+
+[[package]]
+name = "shlex"
+version = "1.3.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64"
+
+[[package]]
+name = "simd_cesu8"
+version = "1.1.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "94f90157bb87cddf702797c5dadfa0be7d266cdf49e22da2fcaa32eff75b2c33"
+dependencies = [
+ "rustc_version",
+ "simdutf8",
+]
+
+[[package]]
+name = "simdutf8"
+version = "0.1.5"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "e3a9fe34e3e7a50316060351f37187a3f546bce95496156754b601a5fa71b76e"
+
+[[package]]
+name = "slab"
+version = "0.4.12"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "0c790de23124f9ab44544d7ac05d60440adc586479ce501c1d6d7da3cd8c9cf5"
+
+[[package]]
+name = "smallvec"
+version = "1.15.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "67b1b7a3b5fe4f1376887184045fcf45c69e92af734b7aaddc05fb777b6fbd03"
+
+[[package]]
+name = "socket2"
+version = "0.6.3"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "3a766e1110788c36f4fa1c2b71b387a7815aa65f88ce0229841826633d93723e"
+dependencies = [
+ "libc",
+ "windows-sys 0.61.2",
+]
+
+[[package]]
+name = "stable_deref_trait"
+version = "1.2.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "6ce2be8dc25455e1f91df71bfa12ad37d7af1092ae736f3a6cd0e37bc7810596"
+
+[[package]]
+name = "subtle"
+version = "2.6.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "13c2bddecc57b384dee18652358fb23172facb8a2c51ccc10d74c157bdea3292"
+
+[[package]]
+name = "syn"
+version = "2.0.117"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "e665b8803e7b1d2a727f4023456bbbbe74da67099c585258af0ad9c5013b9b99"
+dependencies = [
+ "proc-macro2",
+ "quote",
+ "unicode-ident",
+]
+
+[[package]]
+name = "sync_wrapper"
+version = "1.0.2"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "0bf256ce5efdfa370213c1dabab5935a12e49f2c58d15e9eac2870d3b4f27263"
+dependencies = [
+ "futures-core",
+]
+
+[[package]]
+name = "synstructure"
+version = "0.13.2"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "728a70f3dbaf5bab7f0c4b1ac8d7ae5ea60a4b5549c8a5914361c99147a709d2"
+dependencies = [
+ "proc-macro2",
+ "quote",
+ "syn",
+]
+
+[[package]]
+name = "thiserror"
+version = "2.0.18"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "4288b5bcbc7920c07a1149a35cf9590a2aa808e0bc1eafaade0b80947865fbc4"
+dependencies = [
+ "thiserror-impl",
+]
+
+[[package]]
+name = "thiserror-impl"
+version = "2.0.18"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "ebc4ee7f67670e9b64d05fa4253e753e016c6c95ff35b89b7941d6b856dec1d5"
+dependencies = [
+ "proc-macro2",
+ "quote",
+ "syn",
+]
+
+[[package]]
+name = "tinystr"
+version = "0.8.3"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "c8323304221c2a851516f22236c5722a72eaa19749016521d6dff0824447d96d"
+dependencies = [
+ "displaydoc",
+ "zerovec",
+]
+
+[[package]]
+name = "tinyvec"
+version = "1.11.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "3e61e67053d25a4e82c844e8424039d9745781b3fc4f32b8d55ed50f5f667ef3"
+dependencies = [
+ "tinyvec_macros",
+]
+
+[[package]]
+name = "tinyvec_macros"
+version = "0.1.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "1f3ccbac311fea05f86f61904b462b55fb3df8837a366dfc601a0161d0532f20"
+
+[[package]]
+name = "tokio"
+version = "1.52.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "b67dee974fe86fd92cc45b7a95fdd2f99a36a6d7b0d431a231178d3d670bbcc6"
+dependencies = [
+ "bytes",
+ "libc",
+ "mio",
+ "pin-project-lite",
+ "socket2",
+ "windows-sys 0.61.2",
+]
+
+[[package]]
+name = "tokio-rustls"
+version = "0.26.4"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "1729aa945f29d91ba541258c8df89027d5792d85a8841fb65e8bf0f4ede4ef61"
+dependencies = [
+ "rustls",
+ "tokio",
+]
+
+[[package]]
+name = "tower"
+version = "0.5.3"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "ebe5ef63511595f1344e2d5cfa636d973292adc0eec1f0ad45fae9f0851ab1d4"
+dependencies = [
+ "futures-core",
+ "futures-util",
+ "pin-project-lite",
+ "sync_wrapper",
+ "tokio",
+ "tower-layer",
+ "tower-service",
+]
+
+[[package]]
+name = "tower-http"
+version = "0.6.8"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "d4e6559d53cc268e5031cd8429d05415bc4cb4aefc4aa5d6cc35fbf5b924a1f8"
+dependencies = [
+ "bitflags",
+ "bytes",
+ "futures-util",
+ "http",
+ "http-body",
+ "iri-string",
+ "pin-project-lite",
+ "tower",
+ "tower-layer",
+ "tower-service",
+]
+
+[[package]]
+name = "tower-layer"
+version = "0.3.3"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "121c2a6cda46980bb0fcd1647ffaf6cd3fc79a013de288782836f6df9c48780e"
+
+[[package]]
+name = "tower-service"
+version = "0.3.3"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "8df9b6e13f2d32c91b9bd719c00d1958837bc7dec474d94952798cc8e69eeec3"
+
+[[package]]
+name = "tracing"
+version = "0.1.44"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "63e71662fa4b2a2c3a26f570f037eb95bb1f85397f3cd8076caed2f026a6d100"
+dependencies = [
+ "log",
+ "pin-project-lite",
+ "tracing-attributes",
+ "tracing-core",
+]
+
+[[package]]
+name = "tracing-attributes"
+version = "0.1.31"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "7490cfa5ec963746568740651ac6781f701c9c5ea257c58e057f3ba8cf69e8da"
+dependencies = [
+ "proc-macro2",
+ "quote",
+ "syn",
+]
+
+[[package]]
+name = "tracing-core"
+version = "0.1.36"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "db97caf9d906fbde555dd62fa95ddba9eecfd14cb388e4f491a66d74cd5fb79a"
+dependencies = [
+ "once_cell",
+]
+
+[[package]]
+name = "try-lock"
+version = "0.2.5"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "e421abadd41a4225275504ea4d6566923418b7f05506fbc9c0fe86ba7396114b"
+
+[[package]]
+name = "unicode-ident"
+version = "1.0.24"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "e6e4313cd5fcd3dad5cafa179702e2b244f760991f45397d14d4ebf38247da75"
+
+[[package]]
+name = "untrusted"
+version = "0.9.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "8ecb6da28b8a351d773b68d5825ac39017e680750f980f3a1a85cd8dd28a47c1"
+
+[[package]]
+name = "url"
+version = "2.5.8"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "ff67a8a4397373c3ef660812acab3268222035010ab8680ec4215f38ba3d0eed"
+dependencies = [
+ "form_urlencoded",
+ "idna",
+ "percent-encoding",
+ "serde",
+]
+
+[[package]]
+name = "utf8_iter"
+version = "1.0.4"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "b6c140620e7ffbb22c2dee59cafe6084a59b5ffc27a8859a5f0d494b5d52b6be"
+
+[[package]]
+name = "walkdir"
+version = "2.5.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "29790946404f91d9c5d06f9874efddea1dc06c5efe94541a7d6863108e3a5e4b"
+dependencies = [
+ "same-file",
+ "winapi-util",
+]
+
+[[package]]
+name = "want"
+version = "0.3.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "bfa7760aed19e106de2c7c0b581b509f2f25d3dacaf737cb82ac61bc6d760b0e"
+dependencies = [
+ "try-lock",
+]
+
+[[package]]
+name = "wasi"
+version = "0.11.1+wasi-snapshot-preview1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "ccf3ec651a847eb01de73ccad15eb7d99f80485de043efb2f370cd654f4ea44b"
+
+[[package]]
+name = "wasip2"
+version = "1.0.1+wasi-0.2.4"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "0562428422c63773dad2c345a1882263bbf4d65cf3f42e90921f787ef5ad58e7"
+dependencies = [
+ "wit-bindgen",
+]
+
+[[package]]
+name = "wasm-bindgen"
+version = "0.2.118"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "0bf938a0bacb0469e83c1e148908bd7d5a6010354cf4fb73279b7447422e3a89"
+dependencies = [
+ "cfg-if",
+ "once_cell",
+ "rustversion",
+ "wasm-bindgen-macro",
+ "wasm-bindgen-shared",
+]
+
+[[package]]
+name = "wasm-bindgen-futures"
+version = "0.4.68"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "f371d383f2fb139252e0bfac3b81b265689bf45b6874af544ffa4c975ac1ebf8"
+dependencies = [
+ "js-sys",
+ "wasm-bindgen",
+]
+
+[[package]]
+name = "wasm-bindgen-macro"
+version = "0.2.118"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "eeff24f84126c0ec2db7a449f0c2ec963c6a49efe0698c4242929da037ca28ed"
+dependencies = [
+ "quote",
+ "wasm-bindgen-macro-support",
+]
+
+[[package]]
+name = "wasm-bindgen-macro-support"
+version = "0.2.118"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "9d08065faf983b2b80a79fd87d8254c409281cf7de75fc4b773019824196c904"
+dependencies = [
+ "bumpalo",
+ "proc-macro2",
+ "quote",
+ "syn",
+ "wasm-bindgen-shared",
+]
+
+[[package]]
+name = "wasm-bindgen-shared"
+version = "0.2.118"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "5fd04d9e306f1907bd13c6361b5c6bfc7b3b3c095ed3f8a9246390f8dbdee129"
+dependencies = [
+ "unicode-ident",
+]
+
+[[package]]
+name = "web-sys"
+version = "0.3.95"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "4f2dfbb17949fa2088e5d39408c48368947b86f7834484e87b73de55bc14d97d"
+dependencies = [
+ "js-sys",
+ "wasm-bindgen",
+]
+
+[[package]]
+name = "web-time"
+version = "1.1.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "5a6580f308b1fad9207618087a65c04e7a10bc77e02c8e84e9b00dd4b12fa0bb"
+dependencies = [
+ "js-sys",
+ "wasm-bindgen",
+]
+
+[[package]]
+name = "webpki-root-certs"
+version = "1.0.7"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "f31141ce3fc3e300ae89b78c0dd67f9708061d1d2eda54b8209346fd6be9a92c"
+dependencies = [
+ "rustls-pki-types",
+]
+
+[[package]]
+name = "winapi-util"
+version = "0.1.11"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "c2a7b1c03c876122aa43f3020e6c3c3ee5c05081c9a00739faf7503aeba10d22"
+dependencies = [
+ "windows-sys 0.61.2",
+]
+
+[[package]]
+name = "windows-link"
+version = "0.2.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "f0805222e57f7521d6a62e36fa9163bc891acd422f971defe97d64e70d0a4fe5"
+
+[[package]]
+name = "windows-sys"
+version = "0.52.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "282be5f36a8ce781fad8c8ae18fa3f9beff57ec1b52cb3de0789201425d9a33d"
+dependencies = [
+ "windows-targets",
+]
+
+[[package]]
+name = "windows-sys"
+version = "0.61.2"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "ae137229bcbd6cdf0f7b80a31df61766145077ddf49416a728b02cb3921ff3fc"
+dependencies = [
+ "windows-link",
+]
+
+[[package]]
+name = "windows-targets"
+version = "0.52.6"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "9b724f72796e036ab90c1021d4780d4d3d648aca59e491e6b98e725b84e99973"
+dependencies = [
+ "windows_aarch64_gnullvm",
+ "windows_aarch64_msvc",
+ "windows_i686_gnu",
+ "windows_i686_gnullvm",
+ "windows_i686_msvc",
+ "windows_x86_64_gnu",
+ "windows_x86_64_gnullvm",
+ "windows_x86_64_msvc",
+]
+
+[[package]]
+name = "windows_aarch64_gnullvm"
+version = "0.52.6"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "32a4622180e7a0ec044bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3"
+
+[[package]]
+name = "windows_aarch64_msvc"
+version = "0.52.6"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "09ec2a7bb152e2252b53fa7803150007879548bc709c039df7627cabbd05d469"
+
+[[package]]
+name = "windows_i686_gnu"
+version = "0.52.6"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "8e9b5ad5ab802e97eb8e295ac6720e509ee4c243f69d781394014ebfe8bbfa0b"
+
+[[package]]
+name = "windows_i686_gnullvm"
+version = "0.52.6"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "0eee52d38c090b3caa76c563b86c3a4bd71ef1a819287c19d586d7334ae8ed66"
+
+[[package]]
+name = "windows_i686_msvc"
+version = "0.52.6"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "240948bc05c5e7c6dabba28bf89d89ffce3e303022809e73deaefe4f6ec56c66"
+
+[[package]]
+name = "windows_x86_64_gnu"
+version = "0.52.6"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "147a5c80aabfbf0c7d901cb5895d1de30ef2907eb21fbbab29ca94c5b08b1a78"
+
+[[package]]
+name = "windows_x86_64_gnullvm"
+version = "0.52.6"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "24d5b23dc417412679681396f2b49f3de8c1473deb516bd34410872eff51ed0d"
+
+[[package]]
+name = "windows_x86_64_msvc"
+version = "0.52.6"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "589f6da84c646204747d1270a2a5661ea66ed1cced2631d546fdfb155959f9ec"
+
+[[package]]
+name = "wit-bindgen"
+version = "0.46.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "f17a85883d4e6d00e8a97c586de764dabcc06133f7f1d55dce5cdc070ad7fe59"
+
+[[package]]
+name = "writeable"
+version = "0.6.3"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "1ffae5123b2d3fc086436f8834ae3ab053a283cfac8fe0a0b8eaae044768a4c4"
+
+[[package]]
+name = "yoke"
+version = "0.8.2"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "abe8c5fda708d9ca3df187cae8bfb9ceda00dd96231bed36e445a1a48e66f9ca"
+dependencies = [
+ "stable_deref_trait",
+ "yoke-derive",
+ "zerofrom",
+]
+
+[[package]]
+name = "yoke-derive"
+version = "0.8.2"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "de844c262c8848816172cef550288e7dc6c7b7814b4ee56b3e1553f275f1858e"
+dependencies = [
+ "proc-macro2",
+ "quote",
+ "syn",
+ "synstructure",
+]
+
+[[package]]
+name = "zerocopy"
+version = "0.8.48"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "eed437bf9d6692032087e337407a86f04cd8d6a16a37199ed57949d415bd68e9"
+dependencies = [
+ "zerocopy-derive",
+]
+
+[[package]]
+name = "zerocopy-derive"
+version = "0.8.48"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "70e3cd084b1788766f53af483dd21f93881ff30d7320490ec3ef7526d203bad4"
+dependencies = [
+ "proc-macro2",
+ "quote",
+ "syn",
+]
+
+[[package]]
+name = "zerofrom"
+version = "0.1.7"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "69faa1f2a1ea75661980b013019ed6687ed0e83d069bc1114e2cc74c6c04c4df"
+dependencies = [
+ "zerofrom-derive",
+]
+
+[[package]]
+name = "zerofrom-derive"
+version = "0.1.7"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "11532158c46691caf0f2593ea8358fed6bbf68a0315e80aae9bd41fbade684a1"
+dependencies = [
+ "proc-macro2",
+ "quote",
+ "syn",
+ "synstructure",
+]
+
+[[package]]
+name = "zeroize"
+version = "1.8.2"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "b97154e67e32c85465826e8bcc1c59429aaaf107c1e4a9e53c8d8ccd5eff88d0"
+
+[[package]]
+name = "zerotrie"
+version = "0.2.4"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "0f9152d31db0792fa83f70fb2f83148effb5c1f5b8c7686c3459e361d9bc20bf"
+dependencies = [
+ "displaydoc",
+ "yoke",
+ "zerofrom",
+]
+
+[[package]]
+name = "zerovec"
+version = "0.11.6"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "90f911cbc359ab6af17377d242225f4d75119aec87ea711a880987b18cd7b239"
+dependencies = [
+ "yoke",
+ "zerofrom",
+ "zerovec-derive",
+]
+
+[[package]]
+name = "zerovec-derive"
+version = "0.11.3"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "625dc425cab0dca6dc3c3319506e6593dcb08a9f387ea3b284dbd52a92c40555"
+dependencies = [
+ "proc-macro2",
+ "quote",
+ "syn",
+]
diff --git a/scripts/kconfirm/Cargo.toml b/scripts/kconfirm/Cargo.toml
new file mode 100644
index 000000000000..afde3813a673
--- /dev/null
+++ b/scripts/kconfirm/Cargo.toml
@@ -0,0 +1,21 @@
+[workspace]
+members = ["kconfirm-lib", "kconfirm-linux"]
+resolver = "3"
+
+[workspace.package]
+license = "GPL-2.0-only"
+description = "A static analysis tool for Kconfig"
+keywords = ["kconfig", "static", "analysis", "detect"]
+categories = ["development-tools", "config", "command-line-utilities"]
+exclude = ["assets/"]
+version = "0.7.0"
+edition = "2024"
+rust-version = "1.85.0"
+
+[workspace.dependencies]
+nom-kconfig = "0.10"
+
+log = { version = "0.4", default-features = false }
+env_logger = { version = "0.11", default-features = false }
+
+clap = { version = "4.6", default-features = false, features = ["std", "derive"] }
diff --git a/scripts/kconfirm/Makefile b/scripts/kconfirm/Makefile
new file mode 100644
index 000000000000..6aa8dbe6f885
--- /dev/null
+++ b/scripts/kconfirm/Makefile
@@ -0,0 +1,28 @@
+# SPDX-License-Identifier: GPL-2.0
+# kconfirm makefile
+
+TARGET := kconfirm
+
+HAS_CARGO := $(shell command -v cargo 2> /dev/null)
+
+# Extra arguments forwarded to kconfirm.
+# Example: make kconfirm KCONFIRM_ARGS="--enable dead_links"
+KCONFIRM_ARGS ?=
+
+PHONY += all
+all: $(TARGET)
+
+$(TARGET):
+ifdef HAS_CARGO
+	@cargo run --release -p kconfirm-linux -- --linux-path ../../ $(KCONFIRM_ARGS)
+else
+	@echo "Error: Cargo not found. Please install Rust and Cargo to build kconfirm."
+	@false
+endif
+
+clean:
+ifdef HAS_CARGO
+	@cargo clean > /dev/null 2>&1
+else
+	@:
+endif
diff --git a/scripts/kconfirm/kconfirm-lib/Cargo.toml b/scripts/kconfirm/kconfirm-lib/Cargo.toml
new file mode 100644
index 000000000000..4a5274e76665
--- /dev/null
+++ b/scripts/kconfirm/kconfirm-lib/Cargo.toml
@@ -0,0 +1,16 @@
+[package]
+name = "kconfirm-lib"
+version = "0.7.0"
+edition = "2024"
+rust-version.workspace = true
+
+[dependencies]
+nom-kconfig = { workspace = true }
+reqwest = { version = "0.13", default-features = false,  features = ["blocking", "rustls"] }
+regex = { version = "1.12", default-features = false }
+log = { workspace = true }
+env_logger = { workspace = true }
+
+[features]
+default = []
+coreboot = ["nom-kconfig/coreboot"]
diff --git a/scripts/kconfirm/kconfirm-lib/src/analyze.rs b/scripts/kconfirm/kconfirm-lib/src/analyze.rs
new file mode 100644
index 000000000000..d647d1d5537b
--- /dev/null
+++ b/scripts/kconfirm/kconfirm-lib/src/analyze.rs
@@ -0,0 +1,593 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+use crate::AnalysisArgs;
+use crate::Check;
+use crate::SymbolTable;
+use crate::dead_links::{self, LinkStatus, check_link};
+use crate::output::{Finding, Severity};
+use crate::symbol_table::ChoiceData;
+
+use log::{debug, warn};
+use nom_kconfig::attribute::DefaultAttribute;
+use nom_kconfig::attribute::Expression;
+use nom_kconfig::attribute::Select;
+use nom_kconfig::attribute::r#type::Type;
+use nom_kconfig::entry::Choice;
+use nom_kconfig::entry::Config;
+use nom_kconfig::entry::If;
+use nom_kconfig::entry::Menu;
+use nom_kconfig::entry::Source;
+use nom_kconfig::{
+    Attribute::*,
+    Entry::{self},
+};
+use std::collections::HashSet;
+use std::option::Option;
+
+#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
+enum FunctionalAttributes {
+    // only tracking the attributes that affect the semantics, e.g. not help texts
+    Dependencies,
+    Selects,
+    Implies,
+    Ranges,
+    Defaults,
+}
+
+struct AttributeGroupingChecker {
+    current_group: Option<FunctionalAttributes>,
+    finished_groups: HashSet<FunctionalAttributes>,
+}
+
+impl AttributeGroupingChecker {
+    fn new() -> Self {
+        Self {
+            current_group: None,
+            finished_groups: HashSet::new(),
+        }
+    }
+
+    // doesn't modify `findings` if the style check is disabled
+    fn check(
+        &mut self,
+        group: FunctionalAttributes,
+        args: &AnalysisArgs,
+        findings: &mut Vec<Finding>,
+        symbol: &str,
+        message: String,
+    ) {
+        if !args.is_enabled(Check::Style) {
+            return;
+        }
+
+        match self.current_group {
+            // still contiguous
+            Some(current) if current == group => {}
+
+            // start of group
+            None => {
+                self.current_group = Some(group);
+            }
+
+            Some(current) => {
+                // the previous group finished
+                self.finished_groups.insert(current);
+
+                // we've already finished this group, it's ungrouped
+                if self.finished_groups.contains(&group) {
+                    findings.push(Finding {
+                        severity: Severity::Style,
+                        check: "ungrouped_attribute",
+                        symbol: Some(symbol.to_string()),
+                        message,
+                    });
+                }
+
+                // switch to the new group
+                self.current_group = Some(group);
+            }
+        }
+    }
+}
+
+struct DeadLinkChecker {
+    visited_links: HashSet<String>,
+}
+
+impl DeadLinkChecker {
+    fn new() -> Self {
+        Self {
+            visited_links: HashSet::new(),
+        }
+    }
+
+    fn check_text(
+        &mut self,
+        text: &str,
+        args: &AnalysisArgs,
+        findings: &mut Vec<Finding>,
+        symbol: Option<&str>,
+        context: &str,
+    ) {
+        if !args.is_enabled(Check::DeadLinks) {
+            return;
+        }
+
+        let links = dead_links::find_links(text);
+
+        if links.is_empty() {
+            return;
+        }
+
+        debug!("{} links are: {:?}", context, links);
+
+        for link in links {
+            // avoid rechecking identical links
+            if !self.visited_links.insert(link.clone()) {
+                continue;
+            }
+
+            let status = check_link(&link);
+            if status != LinkStatus::Ok && status != LinkStatus::ProbablyBlocked {
+                findings.push(Finding {
+                    severity: Severity::Warning,
+                    check: "dead_link",
+                    symbol: symbol.map(|s| s.to_string()),
+                    message: format!(
+                        "{} contains link {} with status {:?}",
+                        context, link, status
+                    ),
+                });
+            }
+        }
+    }
+}
+
+#[derive(Clone)]
+pub struct Context {
+    pub arch: Option<String>,
+    pub definition_condition: Vec<Expression>,
+    pub visibility: Vec<Expression>,
+    pub dependencies: Vec<Expression>,
+    pub in_choice: bool,
+}
+
+impl Context {
+    fn with_arch(arch: Option<String>) -> Context {
+        Context {
+            arch,
+            definition_condition: vec![],
+            visibility: vec![],
+            dependencies: vec![],
+            in_choice: false,
+        }
+    }
+
+    fn child(&self) -> Self {
+        self.clone()
+    }
+
+    fn with_dep(mut self, dep: Expression) -> Self {
+        self.dependencies.push(dep);
+        self
+    }
+
+    fn with_visibility(mut self, cond: Expression) -> Self {
+        self.visibility.push(cond);
+        self
+    }
+
+    fn with_definition(mut self, cond: Expression) -> Self {
+        self.definition_condition.push(cond);
+        self
+    }
+
+    fn in_choice(mut self) -> Self {
+        self.in_choice = true;
+        self
+    }
+}
+
+fn recurse_entries(
+    args: &AnalysisArgs,
+    symtab: &mut SymbolTable,
+    entries: Vec<Entry>,
+    ctx: Context,
+    findings: &mut Vec<Finding>,
+) {
+    for entry in entries {
+        process_entry(args, symtab, entry, ctx.clone(), findings);
+    }
+}
+
+pub fn analyze(
+    args: &AnalysisArgs,
+    symtab: &mut SymbolTable,
+    arch: Option<String>,
+    entries: Vec<Entry>,
+) -> Vec<Finding> {
+    let mut findings = Vec::new();
+
+    let ctx = Context::with_arch(arch);
+
+    recurse_entries(args, symtab, entries, ctx, &mut findings);
+
+    findings
+}
+
+fn handle_config(
+    args: &AnalysisArgs,
+    symtab: &mut SymbolTable,
+    entry: Config,
+    ctx: &Context,
+    findings: &mut Vec<Finding>,
+) {
+    let config_symbol = entry.symbol;
+    debug!(
+        "starting to process config option `config` type: {}",
+        config_symbol
+    );
+
+    let mut child_ctx = ctx.child();
+
+    let mut config_type = None;
+    let mut kconfig_dependencies = Vec::new();
+    let mut kconfig_selects: Vec<Select> = Vec::new();
+    let mut kconfig_ranges = Vec::new();
+    let mut kconfig_defaults = Vec::new();
+
+    debug!("attributes are: {:?}", &entry.attributes);
+    /*
+     * style check: ungrouped attributes
+     * - need to check that dependencies, selects, ranges, and defaults are each kept together.
+     */
+    let mut attribute_grouping_checker = AttributeGroupingChecker::new();
+    let mut dead_link_checker = DeadLinkChecker::new();
+    for attribute in entry.attributes {
+        match attribute {
+            Type(kconfig_type) => match kconfig_type.r#type.clone() {
+                // hybrid type definition and default
+                Type::DefBool(db) => {
+                    let default_attribute: DefaultAttribute = DefaultAttribute {
+                        expression: db.clone(),
+                        r#if: kconfig_type.clone().r#if,
+                    };
+
+                    kconfig_defaults.push(default_attribute);
+                    config_type = Some(kconfig_type);
+
+                    // NOTE: as a style, we prefer to keep the hybrid default-typedef with the standalone defaults
+                    attribute_grouping_checker.check(
+                        FunctionalAttributes::Defaults,
+                        args,
+                        findings,
+                        &config_symbol,
+                        format!("ungrouped default {}", db),
+                    );
+                }
+                Type::Bool(_b) => {
+                    config_type = Some(kconfig_type);
+                }
+
+                // hybrid type definition and default
+                Type::DefTristate(dt) => {
+                    // NOTE: as a style, we prefer to keep the hybrid default-typedef with the standalone defaults
+                    attribute_grouping_checker.check(
+                        FunctionalAttributes::Defaults,
+                        args,
+                        findings,
+                        &config_symbol,
+                        format!("ungrouped default {}", &dt),
+                    );
+
+                    let default_attribute: DefaultAttribute = DefaultAttribute {
+                        expression: dt,
+                        r#if: kconfig_type.clone().r#if,
+                    };
+
+                    kconfig_defaults.push(default_attribute);
+                    config_type = Some(kconfig_type);
+                }
+                Type::Tristate(_ts) => config_type = Some(kconfig_type.clone()),
+                Type::Hex(_h) => config_type = Some(kconfig_type),
+                Type::Int(_i) => config_type = Some(kconfig_type),
+                Type::String(_s) => config_type = Some(kconfig_type),
+            },
+            Default(default) => {
+                attribute_grouping_checker.check(
+                    FunctionalAttributes::Defaults,
+                    args,
+                    findings,
+                    &config_symbol,
+                    format!("ungrouped default {}", &default),
+                );
+
+                kconfig_defaults.push(default);
+            }
+
+            DependsOn(depends_on) => {
+                attribute_grouping_checker.check(
+                    FunctionalAttributes::Dependencies,
+                    args,
+                    findings,
+                    &config_symbol,
+                    format!("ungrouped dependency {}", &depends_on),
+                );
+
+                kconfig_dependencies.push(depends_on);
+            }
+            Select(select) => {
+                attribute_grouping_checker.check(
+                    FunctionalAttributes::Selects,
+                    args,
+                    findings,
+                    &config_symbol,
+                    format!("ungrouped select {}", &select),
+                );
+
+                kconfig_selects.push(select);
+            }
+            Imply(imply) => {
+                // doing nothing for imply in the symtab right now
+
+                attribute_grouping_checker.check(
+                    FunctionalAttributes::Implies,
+                    args,
+                    findings,
+                    &config_symbol,
+                    format!("ungrouped imply {}", imply),
+                );
+
+                // TODO: may be relevant for nonvisible config options when building an SMT model...
+            }
+            // NOTE: range bounds are inclusive
+            Range(r) => {
+                attribute_grouping_checker.check(
+                    FunctionalAttributes::Ranges,
+                    args,
+                    findings,
+                    &config_symbol,
+                    format!("ungrouped range {}", r),
+                );
+
+                kconfig_ranges.push(r);
+            }
+            Help(h) => {
+                // doing nothing for menu help right now
+
+                dead_link_checker.check_text(&h, args, findings, Some(&config_symbol), "help text");
+            }
+
+            Modules => {
+                // the modules attribute designates this config option as the one that determines if the `m` state is available for tristates options.
+
+                // just making a special note of this in the symtab for now...
+                symtab.modules_option = Some(config_symbol.clone());
+            }
+
+            // the prompt's option `if` determines "visibility"
+            Prompt(prompt) => {
+                if let Some(c) = prompt.r#if {
+                    child_ctx = child_ctx.with_visibility(c);
+                }
+            }
+            Transitional => {
+                // doing nothing for transitional right now
+            }
+            _defconfig_list => {
+                todo!(
+                    "Found a defconfig list for config option: {:?}, TODO: handle it!",
+                    &config_symbol
+                );
+            }
+        }
+    }
+
+    // there can be multiple entries that get merged. so we need to do the same for our symtab.
+    let kconfig_type = config_type.clone().map(|c| c.r#type);
+
+    // at the time of writing this, linux's kconfig only uses Bool inside Choice.
+    // however, the kconfig documentation doesn't specify whether or not this is guaranteed to be the case.
+    // we add this check to ensure that we don't cause undefined behavior in future linux versions if something changes...
+    if ctx.in_choice {
+        if let Some(kt) = &kconfig_type {
+            match kt {
+                Type::Bool(_) | Type::DefBool(_) => {
+                    // expected in a choice...
+                }
+
+                _ => {
+                    // TODO: old versions of linux (like 5.4.4) have tristates in the choice
+                    //       - u-boot also currently has hex options in the choice!
+                    warn!("found something unexpected in a choice-statement: {:?}", kt);
+                }
+            }
+        }
+    }
+
+    // at the end, add the file's cur_dependencies to this var's invididual dependencies.
+    kconfig_dependencies.extend(ctx.dependencies.clone());
+    symtab.merge_insert_new_solved(
+        config_symbol.clone(),
+        kconfig_type,
+        kconfig_dependencies,
+        //z3_dependency,
+        kconfig_ranges,
+        kconfig_defaults,
+        ctx.visibility.clone(),
+        ctx.arch.clone(),
+        ctx.definition_condition.clone(),
+        None,
+        kconfig_selects
+            .clone()
+            .into_iter()
+            .map(|sel| (sel.symbol, sel.r#if))
+            .collect(),
+    );
+
+    // need to add the select condition to the definedness condition if it exists
+    for select in kconfig_selects {
+        match select.r#if {
+            None => symtab.merge_insert_new_solved(
+                select.symbol,
+                None,
+                Vec::new(),
+                Vec::new(),
+                Vec::new(),
+                Vec::new(),
+                ctx.arch.clone(),
+                ctx.definition_condition.clone(),
+                Some((config_symbol.clone(), None)),
+                Vec::new(),
+            ),
+            Some(select_condition) => {
+                symtab.merge_insert_new_solved(
+                    select.symbol,
+                    None,
+                    Vec::new(),
+                    Vec::new(),
+                    Vec::new(),
+                    Vec::new(),
+                    ctx.arch.clone(),
+                    ctx.definition_condition.clone(),
+                    Some((config_symbol.clone(), Some(select_condition))),
+                    Vec::new(),
+                );
+            }
+        }
+    }
+}
+
+fn handle_menu(
+    args: &AnalysisArgs,
+    symtab: &mut SymbolTable,
+    entry: Menu,
+    ctx: &Context,
+    findings: &mut Vec<Finding>,
+) {
+    // menus can set the visibility of their menu items
+
+    let mut child_ctx = ctx.child();
+
+    if !entry.depends_on.is_empty() {
+        debug!(
+            "the menu {:?} dependencies are: {:?}",
+            entry, entry.depends_on
+        );
+    }
+
+    for dep in entry.depends_on {
+        child_ctx = child_ctx.with_dep(dep.clone());
+        child_ctx = child_ctx.with_visibility(dep); // not a typo, the config options inside of a menu are only visible if the menu's dependencies are satisfied
+    }
+
+    let nested_entries = entry.entries;
+
+    recurse_entries(args, symtab, nested_entries, child_ctx.clone(), findings);
+}
+
+fn handle_choice(
+    args: &AnalysisArgs,
+    symtab: &mut SymbolTable,
+    entry: Choice,
+    ctx: &Context,
+    findings: &mut Vec<Finding>,
+) {
+    debug!("the attributes of the choice are: {:?}", entry.options);
+    debug!("the entries of the choice are: {:?}", entry.entries);
+
+    let mut child_ctx = ctx.child();
+    child_ctx = child_ctx.in_choice();
+
+    // we are going to add the dependencies of the choice to the dependencies of the entries.
+    //   we start with the dependencies inherited from the file
+    let mut choice_visibility_condition = None;
+    let mut defaults = Vec::new();
+    for attribute in entry.options {
+        match attribute {
+            DependsOn(depends_on) => {
+                child_ctx = child_ctx.with_dep(depends_on);
+            }
+
+            Default(default) => {
+                defaults.push(default);
+            }
+
+            // the prompt's `if` determines visibility
+            Prompt(prompt) => {
+                choice_visibility_condition = prompt.r#if;
+                if let Some(i) = choice_visibility_condition.clone() {
+                    child_ctx = child_ctx.with_visibility(i);
+                }
+            }
+            _ => debug!("skipping attribute {:?} for choice", attribute),
+        }
+    }
+
+    // all of the variables in the choice menu
+    //let mut contained_vars = Vec::with_capacity(c.entries.len());
+    let nested_entries = entry.entries;
+
+    recurse_entries(args, symtab, nested_entries, child_ctx.clone(), findings);
+
+    let choice_data = ChoiceData {
+        //inner_vars: contained_vars,
+        arch: child_ctx.arch.clone(),
+        visibility: choice_visibility_condition,
+        dependencies: child_ctx.dependencies,
+        defaults: defaults,
+    };
+    symtab.choices.push(choice_data);
+}
+
+fn handle_if(
+    args: &AnalysisArgs,
+    symtab: &mut SymbolTable,
+    entry: If,
+    ctx: &Context,
+    findings: &mut Vec<Finding>,
+) {
+    let mut child_ctx = ctx.child();
+    child_ctx = child_ctx.with_definition(entry.condition.clone());
+    child_ctx = child_ctx.with_dep(entry.condition);
+    let nested_entries = entry.entries;
+
+    recurse_entries(args, symtab, nested_entries, child_ctx, findings);
+}
+
+fn handle_source(
+    args: &AnalysisArgs,
+    symtab: &mut SymbolTable,
+    entry: Source,
+    ctx: &Context,
+    findings: &mut Vec<Finding>,
+) {
+    let sourced_kconfig = entry.entries;
+
+    for sourced_kconfig in sourced_kconfig {
+        recurse_entries(args, symtab, sourced_kconfig.entries, ctx.clone(), findings);
+    }
+}
+
+pub fn process_entry(
+    args: &AnalysisArgs,
+    symtab: &mut SymbolTable,
+    entry: Entry,
+    ctx: Context,
+    findings: &mut Vec<Finding>,
+) {
+    // NOTE: in general, each handler should update the context as it encounters that construct.
+    //       e.g. Context.in_choice() should be called at the start of handle_choice(), not right before call to process_entry() when a choice is found and process_entry is called
+    match entry {
+        Entry::Config(c) | Entry::MenuConfig(c) => {
+            handle_config(args, symtab, c, &ctx, findings);
+        }
+        Entry::Menu(m) => handle_menu(args, symtab, m, &ctx, findings),
+        Entry::Choice(c) => handle_choice(args, symtab, c, &ctx, findings),
+        Entry::If(i) => handle_if(args, symtab, i, &ctx, findings),
+        Entry::Source(s) => handle_source(args, symtab, s, &ctx, findings),
+        Entry::Comment(_) => {}
+        Entry::MainMenu(_) => {}
+        _ => {}
+    }
+}
diff --git a/scripts/kconfirm/kconfirm-lib/src/checks.rs b/scripts/kconfirm/kconfirm-lib/src/checks.rs
new file mode 100644
index 000000000000..96b2cf15a6d9
--- /dev/null
+++ b/scripts/kconfirm/kconfirm-lib/src/checks.rs
@@ -0,0 +1,257 @@
+// SPDX-License-Identifier: GPL-2.0-only
+use crate::{
+    output::{Finding, Severity},
+    symbol_table::AttributeDef,
+};
+use std::collections::HashSet;
+
+#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
+pub enum Check {
+    Style,     // check for duplicate default values, and ungrouped attributes
+    DeadLinks, // check for dead links in the help texts
+    DuplicateDependency,
+    DuplicateRange,
+    DuplicateSelect,
+    DeadDefault,
+    DuplicateDefault,
+}
+
+impl Check {
+    pub fn as_str(self) -> &'static str {
+        match self {
+            Check::Style => "style",
+            Check::DeadLinks => "dead_links",
+            Check::DuplicateDependency => "duplicate_dependency",
+            Check::DuplicateRange => "duplicate_range",
+            Check::DuplicateSelect => "duplicate_select",
+            Check::DeadDefault => "dead_default",
+            Check::DuplicateDefault => "duplicate_default",
+        }
+    }
+}
+
+pub fn parse_check(name: &str) -> Option<Check> {
+    match name {
+        "style" => Some(Check::Style),
+        "dead_links" => Some(Check::DeadLinks),
+        "duplicate_dependency" => Some(Check::DuplicateDependency),
+        "duplicate_range" => Some(Check::DuplicateRange),
+        "duplicate_select" => Some(Check::DuplicateSelect),
+        "dead_default" => Some(Check::DeadDefault),
+        "duplicate_default" => Some(Check::DuplicateDefault),
+        _ => None,
+    }
+}
+
+#[derive(Clone)]
+pub struct AnalysisArgs {
+    // check for duplicate default values
+    pub enabled_checks: HashSet<Check>,
+}
+
+impl AnalysisArgs {
+    pub fn is_enabled(&self, check: Check) -> bool {
+        self.enabled_checks.contains(&check)
+    }
+}
+
+pub fn check_variable_info(
+    args: &AnalysisArgs,
+    var_symbol: &str,
+    arch_specific: &Option<String>,
+    info: &AttributeDef,
+) -> Vec<Finding> {
+    let mut findings = Vec::new();
+
+    if args.is_enabled(Check::DuplicateDependency) {
+        findings.extend(check_duplicate_dependencies(
+            var_symbol,
+            info,
+            arch_specific,
+        ));
+    }
+
+    if args.is_enabled(Check::DuplicateRange) {
+        findings.extend(check_duplicate_ranges(var_symbol, info));
+    }
+
+    if args.is_enabled(Check::DuplicateSelect) {
+        findings.extend(check_duplicate_selects(var_symbol, info));
+    }
+
+    if args.is_enabled(Check::DeadDefault)
+        || args.is_enabled(Check::DuplicateDefault)
+        || args.is_enabled(Check::Style)
+    {
+        findings.extend(check_defaults(
+            var_symbol,
+            info,
+            args.is_enabled(Check::Style),
+        ));
+    }
+
+    findings
+}
+
+fn is_duplicate<T: Eq + std::hash::Hash>(set: &mut HashSet<T>, key: T) -> bool {
+    !set.insert(key)
+}
+
+fn check_duplicate_dependencies(
+    var_symbol: &str,
+    info: &AttributeDef,
+    arch_specific: &Option<String>,
+) -> Vec<Finding> {
+    let mut findings = Vec::new();
+    let mut seen = HashSet::new();
+
+    for dep in &info.kconfig_dependencies {
+        if is_duplicate(&mut seen, dep.to_string()) {
+            let message = match arch_specific {
+                Some(arch) => format!(
+                    "duplicate dependency on {:?} for architecture {:?}",
+                    dep.to_string(),
+                    arch
+                ),
+                None => format!("duplicate dependency on {:?}", dep.to_string()),
+            };
+            findings.push(Finding {
+                severity: Severity::Warning,
+                check: Check::DuplicateDependency.as_str(),
+                symbol: Some(var_symbol.to_owned()),
+                message,
+            });
+        }
+    }
+
+    findings
+}
+
+fn check_duplicate_ranges(var_symbol: &str, info: &AttributeDef) -> Vec<Finding> {
+    let mut findings = Vec::new();
+    let mut seen_conditions = HashSet::new();
+    let mut already_unconditional = false;
+
+    for range in &info.kconfig_ranges {
+        if already_unconditional {
+            findings.push(Finding {
+                severity: Severity::Warning,
+                check: Check::DuplicateRange.as_str(),
+                symbol: Some(var_symbol.to_owned()),
+                message: format!("dead range of {:?}", range),
+            });
+            continue;
+        }
+
+        if let Some(cond) = range.r#if.clone() {
+            if is_duplicate(&mut seen_conditions, cond.to_string()) {
+                findings.push(Finding {
+                    severity: Severity::Warning,
+                    check: Check::DuplicateRange.as_str(),
+                    symbol: Some(var_symbol.to_owned()),
+                    message: format!("dead range of {:?}", range),
+                });
+            }
+        } else {
+            already_unconditional = true;
+        }
+    }
+
+    findings
+}
+
+fn check_duplicate_selects(var_symbol: &str, info: &AttributeDef) -> Vec<Finding> {
+    let mut findings = Vec::new();
+    let mut seen: HashSet<(String, String)> = HashSet::new();
+
+    for select in &info.selects {
+        let select_var = select.0.clone();
+
+        match &select.1 {
+            Some(cond) => {
+                // A conditional select is dead if the same var is already selected unconditionally.
+                if seen.contains(&(select_var.clone(), String::new())) {
+                    findings.push(Finding {
+                        severity: Severity::Warning,
+                        check: "dead_select",
+                        symbol: Some(var_symbol.to_owned()),
+                        message: format!("dead select of {:?}", select),
+                    });
+                }
+
+                if is_duplicate(&mut seen, (select_var, cond.to_string())) {
+                    findings.push(Finding {
+                        severity: Severity::Warning,
+                        check: Check::DuplicateSelect.as_str(),
+                        symbol: Some(var_symbol.to_owned()),
+                        message: format!("duplicate select of {:?}", select),
+                    });
+                }
+            }
+            None => {
+                if is_duplicate(&mut seen, (select_var, String::new())) {
+                    findings.push(Finding {
+                        severity: Severity::Warning,
+                        check: Check::DuplicateSelect.as_str(),
+                        symbol: Some(var_symbol.to_owned()),
+                        message: format!("duplicate select of {:?}", select),
+                    });
+                }
+            }
+        }
+    }
+
+    findings
+}
+
+fn check_defaults(var_symbol: &str, info: &AttributeDef, style_enabled: bool) -> Vec<Finding> {
+    let mut findings = Vec::new();
+    let mut seen_conditions = HashSet::new();
+    let mut seen_values = HashSet::new();
+    let mut already_unconditional = false;
+
+    for default in &info.kconfig_defaults {
+        let val_str = default.expression.to_string();
+
+        if already_unconditional {
+            findings.push(Finding {
+                severity: Severity::Warning,
+                check: Check::DeadDefault.as_str(),
+                symbol: Some(var_symbol.to_owned()),
+                message: format!("dead default of {}", default.expression),
+            });
+        }
+
+        if style_enabled {
+            if default.r#if.is_some() && is_duplicate(&mut seen_values, val_str.clone()) {
+                findings.push(Finding {
+                    severity: Severity::Style,
+                    check: "duplicate_default_value",
+                    symbol: Some(var_symbol.to_owned()),
+                    message: format!(
+                        "duplicate default value of {:?}; consider combining the conditions with a logical-or: ||",
+                        val_str
+                    ),
+                });
+            }
+        }
+
+        match &default.r#if {
+            Some(cond) => {
+                if is_duplicate(&mut seen_conditions, cond.to_string()) {
+                    findings.push(Finding {
+                        severity: Severity::Warning,
+                        check: Check::DuplicateDefault.as_str(),
+                        symbol: Some(var_symbol.to_owned()),
+                        message: format!("duplicate default condition of {:?}", cond),
+                    });
+                }
+            }
+            None => {
+                already_unconditional = true;
+            }
+        }
+    }
+
+    findings
+}
diff --git a/scripts/kconfirm/kconfirm-lib/src/dead_links.rs b/scripts/kconfirm/kconfirm-lib/src/dead_links.rs
new file mode 100644
index 000000000000..74224b888695
--- /dev/null
+++ b/scripts/kconfirm/kconfirm-lib/src/dead_links.rs
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: GPL-2.0-only
+use regex::Regex;
+use reqwest::blocking::Client;
+use std::time::Duration;
+
+/*
+ * during testing, "Unreachable" and "ServerError" seem to be a 50/50
+ * as to whether or not they're actually dead links
+ */
+#[derive(PartialEq, Debug)]
+pub enum LinkStatus {
+    Ok,                        // 2xx, definitely alive
+    ProbablyBlocked,           // 403, 429, or cloudflare-style response
+    Redirected(String),        // 301/302, redirection, consider updating the link
+    NotFound,                  // 404, probably dead
+    ServerError,               // 5xx, might be temporary
+    Unreachable(String),       // connection failed, timeout, DNS error etc.
+    UnsupportedScheme(String), // e.g. ftp, git
+}
+
+pub fn check_link(url: &str) -> LinkStatus {
+    if let Some(scheme) = url.split("://").next() {
+        match scheme {
+            "http" | "https" => return check_http(url),
+            "git" | "ftp" | _ => return LinkStatus::UnsupportedScheme(scheme.into()),
+        }
+    }
+
+    LinkStatus::Unreachable("invalid URL".into())
+}
+
+fn check_http(url: &str) -> LinkStatus {
+    let client = Client::builder()
+        .timeout(Duration::from_secs(10))
+        .build()
+        .unwrap();
+
+    match client.head(url).send() {
+        Ok(response) => match response.status().as_u16() {
+            200..=299 => LinkStatus::Ok,
+            301 | 302 => {
+                let location = response
+                    .headers()
+                    .get("location")
+                    .and_then(|v| v.to_str().ok())
+                    .unwrap_or("unknown")
+                    .to_string();
+                LinkStatus::Redirected(location)
+            }
+            403 | 429 => LinkStatus::ProbablyBlocked,
+            404 => LinkStatus::NotFound,
+            500..=599 => LinkStatus::ServerError,
+            _ => LinkStatus::ProbablyBlocked,
+        },
+        Err(e) => LinkStatus::Unreachable(e.to_string()),
+    }
+}
+
+pub fn find_links(text: &str) -> Vec<String> {
+    let re = Regex::new(r#"[a-zA-Z][a-zA-Z0-9+\-.]*://[^\s\)\]\}\"'<>]+"#).unwrap();
+
+    re.find_iter(text).map(|m| m.as_str().to_string()).collect()
+}
diff --git a/scripts/kconfirm/kconfirm-lib/src/lib.rs b/scripts/kconfirm/kconfirm-lib/src/lib.rs
new file mode 100644
index 000000000000..a5c6d6f0b6f2
--- /dev/null
+++ b/scripts/kconfirm/kconfirm-lib/src/lib.rs
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: GPL-2.0-only
+pub mod output;
+use output::*;
+
+pub mod symbol_table;
+use symbol_table::*;
+
+mod dead_links;
+
+mod checks;
+pub use checks::{AnalysisArgs, Check, check_variable_info, parse_check};
+
+mod analyze;
+use analyze::*;
+
+use log::error;
+use nom_kconfig::Entry;
+
+use nom_kconfig::{KconfigInput, parse_kconfig};
+
+pub fn check_kconfig(
+    args: AnalysisArgs,
+    kconfig_files: Vec<(Option<String>, KconfigInput)>,
+) -> Vec<Finding> {
+    let mut findings = Vec::new();
+    let mut symbol_table = SymbolTable::new();
+
+    for (arch_config_option, kconfig_file) in kconfig_files {
+        match parse_kconfig(kconfig_file) {
+            Ok(parsed) => {
+                let entries: Vec<Entry> = parsed.1.entries;
+                findings.extend(analyze(
+                    &args,
+                    &mut symbol_table,
+                    arch_config_option,
+                    entries,
+                ));
+            }
+            Err(e) => {
+                error!("FATAL: failed to parse kconfig, error is {:?}", e);
+                panic!();
+            }
+        }
+    }
+
+    for (var_symbol, type_info) in &symbol_table.raw {
+        for (arch_specific, redefinitions) in &type_info.attribute_defs {
+            for (_definition_condition, info) in redefinitions {
+                findings.extend(check_variable_info(&args, var_symbol, arch_specific, info));
+            }
+        }
+    }
+
+    findings
+}
diff --git a/scripts/kconfirm/kconfirm-lib/src/output.rs b/scripts/kconfirm/kconfirm-lib/src/output.rs
new file mode 100644
index 000000000000..2686bcd13e33
--- /dev/null
+++ b/scripts/kconfirm/kconfirm-lib/src/output.rs
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: GPL-2.0-only
+use std::fmt;
+
+#[derive(Debug, PartialEq, Eq, PartialOrd, Ord)]
+pub enum Severity {
+    Fatal,
+    Error, // will be used for known bugs, e.g. unmet dependencies
+    Warning,
+    Style,
+}
+
+impl fmt::Display for Severity {
+    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
+        match self {
+            Severity::Fatal => write!(f, "FATAL  "),
+            Severity::Error => write!(f, "ERROR  "),
+            Severity::Warning => write!(f, "WARNING"),
+            Severity::Style => write!(f, "STYLE   "),
+        }
+    }
+}
+
+#[derive(Debug)]
+pub struct Finding {
+    pub severity: Severity,
+    pub check: &'static str,
+    pub symbol: Option<String>,
+    pub message: String,
+}
+
+impl fmt::Display for Finding {
+    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
+        match &self.symbol {
+            Some(s) => write!(
+                f,
+                "{} [{}] config {}: {}",
+                self.severity, self.check, s, self.message
+            ),
+            None => write!(f, "{} [{}] {}", self.severity, self.check, self.message),
+        }
+    }
+}
+
+pub fn print_findings(mut findings: Vec<Finding>) {
+    findings.sort_by(|a, b| {
+        (&a.severity, &a.check, &a.symbol).cmp(&(&b.severity, &b.check, &b.symbol))
+    });
+
+    for f in &findings {
+        println!("{}", f);
+    }
+}
diff --git a/scripts/kconfirm/kconfirm-lib/src/symbol_table.rs b/scripts/kconfirm/kconfirm-lib/src/symbol_table.rs
new file mode 100644
index 000000000000..5d368b0f8fac
--- /dev/null
+++ b/scripts/kconfirm/kconfirm-lib/src/symbol_table.rs
@@ -0,0 +1,209 @@
+// SPDX-License-Identifier: GPL-2.0-only
+use log::debug;
+use nom_kconfig::attribute::DefaultAttribute;
+use nom_kconfig::attribute::Expression;
+use nom_kconfig::attribute::OrExpression;
+use nom_kconfig::attribute::Range;
+use nom_kconfig::attribute::r#type::Type;
+use std::collections::HashMap;
+use std::collections::hash_map;
+
+type KconfigSymbol = String;
+type Arch = Option<String>;
+type Cond = Option<Expression>;
+
+// NOTE: we cannot add these elements to the solver until we've processed all variables,
+// because we need to know all of the selectors.
+#[derive(Debug, Clone)]
+pub struct TypeInfo {
+    pub kconfig_type: Option<Type>, // 'None' when we don't know the type (e.g. if it's a dangling reference)
+
+    // maps the selector to an (ARCH, select_cond)
+    // - if the ARCH is None, then it's not arch-specific
+    // if the select_cond is None, then it's unconditional
+    pub selected_by: HashMap<KconfigSymbol, Vec<(Arch, Cond)>>, // .0 only selects it when .1 is true.
+
+    // there is one of these per entry (each entry expected to have a different definedness condition)
+    // maps architecture option name (or none if not arch-specific) to:
+    // [([condition], config definition)]
+    // - NOTE: there can be multiple partial definitions under the same condition, or mutually-exclusive conditions, or a subset condition.
+    pub attribute_defs: HashMap<Arch, Vec<(Vec<Expression>, AttributeDef)>>, // the innermost `Vec<Expression>` represents each nested condition that was reached (we will eventually need to AND them all)
+}
+
+// the dependencies are a vector because we may encounter multiple over time,
+//   so we won't know until the end what the condition is.
+#[derive(Debug, Clone)]
+pub struct AttributeDef {
+    pub kconfig_dependencies: Vec<OrExpression>,
+    pub kconfig_ranges: Vec<Range>,
+    pub kconfig_defaults: Vec<DefaultAttribute>,
+    pub visibility: Vec<OrExpression>,
+    pub selects: Vec<(KconfigSymbol, Cond)>,
+}
+
+impl TypeInfo {
+    fn new_empty() -> Self {
+        Self {
+            kconfig_type: None,
+            selected_by: HashMap::new(),
+            attribute_defs: HashMap::new(),
+        }
+    }
+
+    fn insert(
+        &mut self,
+        kconfig_type: Option<Type>,
+        raw_constraints: Vec<OrExpression>,
+        kconfig_ranges: Vec<Range>,
+        kconfig_defaults: Vec<DefaultAttribute>,
+        visibility: Vec<OrExpression>,
+        arch: Option<String>,
+        definition_condition: Vec<OrExpression>,
+        selected_by: Option<(KconfigSymbol, Cond)>,
+        selects: Vec<(KconfigSymbol, Cond)>,
+    ) {
+        // type merge
+        match (&self.kconfig_type, &kconfig_type) {
+            (None, Some(_)) => self.kconfig_type = kconfig_type,
+            (Some(_), Some(new)) if Some(new) != self.kconfig_type.as_ref() => {
+                // TODO: not doing anything with redefined types yet.
+                //       later, we will want to consider e.g. bool/def_bool the same type (and possibly int/hex?) but not bool/tristate, so we need to build out typechecking.
+                debug!(
+                    "NOTE: different type {:?} (existing {:?})",
+                    kconfig_type, self.kconfig_type
+                );
+            }
+            _ => {}
+        }
+
+        // selected_by merge
+        if let Some(sb) = selected_by {
+            merge_selected_by(&mut self.selected_by, arch.clone(), sb);
+        }
+
+        // variable_info merge
+        insert_variable_info(
+            &mut self.attribute_defs,
+            arch,
+            definition_condition,
+            AttributeDef {
+                kconfig_dependencies: raw_constraints,
+                kconfig_ranges,
+                kconfig_defaults,
+                visibility,
+                selects,
+            },
+        );
+    }
+}
+
+// the visibility and the dependencies will each need to be AND'd (separately)
+// the defaults should each be handled separately.
+pub struct ChoiceData {
+    //pub inner_vars: Vec<String>,
+    pub arch: Arch,
+    pub visibility: Cond,
+    pub dependencies: Vec<OrExpression>, // this is the menu's dependencies (and inherited dependencies from the file)
+    pub defaults: Vec<DefaultAttribute>, // these are each of the conditional defaults for the choice
+}
+
+// NOTE: it might be better if TypeInfo is an enum with a single value,
+//       e.g. Unsolved(kconfig_raw) and Solved(z3_ast)
+pub struct SymbolTable {
+    pub raw: HashMap<KconfigSymbol, TypeInfo>,
+    pub choices: Vec<ChoiceData>,
+    pub modules_option: Option<KconfigSymbol>, // None until we find the modules attribute in exactly 1 config option
+}
+
+impl SymbolTable {
+    pub fn new() -> Self {
+        SymbolTable {
+            raw: HashMap::new(),
+            choices: Vec::new(),
+            modules_option: None,
+        }
+    }
+
+    pub fn from_parts(
+        raw: HashMap<KconfigSymbol, TypeInfo>,
+        choices: Vec<ChoiceData>,
+        modules_option: Option<KconfigSymbol>,
+    ) -> Self {
+        SymbolTable {
+            raw,
+            choices,
+            modules_option,
+        }
+    }
+
+    pub fn merge_insert_new_solved(
+        &mut self,
+        var: KconfigSymbol,
+        kconfig_type: Option<Type>,
+        raw_constraints: Vec<OrExpression>,
+        kconfig_ranges: Vec<Range>,
+        kconfig_defaults: Vec<DefaultAttribute>,
+        visibility: Vec<OrExpression>,
+        arch: Arch,
+        definition_condition: Vec<OrExpression>,
+        selected_by: Option<(KconfigSymbol, Cond)>,
+        selects: Vec<(KconfigSymbol, Cond)>,
+    ) {
+        let entry = self.raw.entry(var.clone());
+
+        match entry {
+            hash_map::Entry::Vacant(v) => {
+                let mut t = TypeInfo::new_empty();
+                t.insert(
+                    kconfig_type,
+                    raw_constraints,
+                    kconfig_ranges,
+                    kconfig_defaults,
+                    visibility,
+                    arch,
+                    definition_condition,
+                    selected_by,
+                    selects,
+                );
+                v.insert(t);
+            }
+
+            hash_map::Entry::Occupied(mut o) => {
+                let t = o.get_mut();
+
+                t.insert(
+                    kconfig_type,
+                    raw_constraints,
+                    kconfig_ranges,
+                    kconfig_defaults,
+                    visibility,
+                    arch,
+                    definition_condition,
+                    selected_by,
+                    selects,
+                );
+            }
+        }
+    }
+}
+
+fn merge_selected_by(
+    map: &mut HashMap<String, Vec<(Arch, Cond)>>,
+    arch: Arch,
+    selected_by: (KconfigSymbol, Cond),
+) {
+    map.entry(selected_by.0)
+        .or_insert_with(Vec::new)
+        .push((arch, selected_by.1));
+}
+
+fn insert_variable_info(
+    map: &mut HashMap<Arch, Vec<(Vec<Expression>, AttributeDef)>>,
+    arch: Arch,
+    definition_condition: Vec<Expression>,
+    info: AttributeDef,
+) {
+    map.entry(arch)
+        .or_insert_with(Vec::new)
+        .push((definition_condition, info));
+}
diff --git a/scripts/kconfirm/kconfirm-linux/Cargo.toml b/scripts/kconfirm/kconfirm-linux/Cargo.toml
new file mode 100644
index 000000000000..3568e198410f
--- /dev/null
+++ b/scripts/kconfirm/kconfirm-linux/Cargo.toml
@@ -0,0 +1,14 @@
+[package]
+name = "kconfirm-linux"
+version = "0.7.0"
+edition = "2024"
+rust-version.workspace = true
+
+
+[dependencies]
+kconfirm-lib = { path = "../kconfirm-lib" }
+nom-kconfig = { workspace = true }
+
+log = { workspace = true }
+env_logger = { workspace = true }
+clap = { workspace = true }
diff --git a/scripts/kconfirm/kconfirm-linux/src/lib.rs b/scripts/kconfirm/kconfirm-linux/src/lib.rs
new file mode 100644
index 000000000000..e90d571ecfb8
--- /dev/null
+++ b/scripts/kconfirm/kconfirm-linux/src/lib.rs
@@ -0,0 +1,129 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+use log::warn;
+use std::io;
+use std::path::PathBuf;
+
+use nom_kconfig::KconfigFile;
+
+// each architecture has its own directory, and config option.
+// most are the same, but powerpc / ppc and um / uml are not.
+// this maps the directory to the config option.
+pub fn arch_dir_to_config(arch_dir: &str) -> String {
+    match arch_dir {
+        "arm" => String::from("ARM"),
+        "arm64" => String::from("ARM64"),
+        "x86" => String::from("X86"),
+        "riscv" => String::from("RISCV"),
+        "mips" => String::from("MIPS"),
+        "xtensa" => String::from("XTENSA"),
+        "sparc" => String::from("SPARC"),
+        "alpha" => String::from("ALPHA"),
+        "arc" => String::from("ARC"),
+        "csky" => String::from("CSKY"),
+        "hexagon" => String::from("HEXAGON"),
+        "loongarch" => String::from("LOONGARCH"),
+        "m68k" => String::from("M68K"),
+        "microblaze" => String::from("MICROBLAZE"),
+        "nios2" => String::from("NIOS2"),
+        "openrisc" => String::from("OPENRISC"),
+        "parisc" => String::from("PARISC"),
+        "powerpc" => String::from("PPC"),
+        "s390" => String::from("S390"),
+        "sh" => String::from("SH"),
+        "um" => String::from("UML"),
+
+        _ => {
+            warn!(
+                "unexpected directory in /arch/ was a new architecture added: {} ?
+                Assuming the config option is the same as the directory name...",
+                arch_dir
+            );
+            String::from(arch_dir).to_uppercase()
+        }
+    }
+}
+
+pub struct LinuxKconfig {
+    pub arch_config_option: Option<String>, // not used for the root kconfig
+    pub kconfig_file: KconfigFile,
+    pub file_contents: String,
+}
+
+// returns a 2-tuple of the arch config option and its root kconfig file
+pub fn get_arch_kconfig_files(
+    linux_root: PathBuf,
+    arch_dir_path: PathBuf,
+) -> std::io::Result<Vec<LinuxKconfig>> {
+    let mut arch_kconfigs = Vec::new();
+
+    // collect all file paths up to 2 levels deep under arch/.
+    // depth 1 is files directly in arch/ (e.g. arch/Kconfig), depth 2 is
+    // files inside each arch subdirectory (e.g. arch/x86/Kconfig.cpu).
+    let mut paths: Vec<PathBuf> = Vec::new();
+    for entry in std::fs::read_dir(&arch_dir_path)? {
+        let entry = entry?;
+        let file_type = entry.file_type()?;
+        if file_type.is_file() {
+            paths.push(entry.path());
+        } else if file_type.is_dir() {
+            for sub_entry in std::fs::read_dir(entry.path())? {
+                let sub_entry = sub_entry?;
+                if sub_entry.file_type()?.is_file() {
+                    paths.push(sub_entry.path());
+                }
+            }
+        }
+    }
+
+    for path in paths {
+        // filter for "Kconfig" prefix
+        if !path
+            .file_name()
+            .and_then(|s| s.to_str())
+            .map_or(false, |n| n.starts_with("Kconfig"))
+        {
+            continue;
+        }
+
+        // get the arch from the path (e.g. x86 in /arch/x86/)
+        let relative_path = path.strip_prefix(&linux_root).unwrap();
+        let arch_dir = match relative_path.components().nth(1) {
+            Some(std::path::Component::Normal(n)) => n.to_string_lossy(),
+            _ => continue,
+        };
+
+        if linux_root.join("arch").join(&*arch_dir).is_dir() {
+            let kconfig_file = KconfigFile::new(linux_root.clone(), relative_path.to_path_buf());
+            arch_kconfigs.push(LinuxKconfig {
+                arch_config_option: Some(arch_dir_to_config(&arch_dir)),
+                file_contents: kconfig_file.read_to_string()?,
+                kconfig_file,
+            });
+        }
+    }
+
+    Ok(arch_kconfigs)
+}
+
+// collects the root kconfig file, and all of the arch-specific kconfig files
+pub fn collect_kconfig_root_files(linux_source: PathBuf) -> io::Result<Vec<LinuxKconfig>> {
+    let mut all_root_kconfig_files = Vec::new();
+
+    // add the root kconfig file
+    let root_kconfig_path = PathBuf::from("Kconfig"); // doesn't include the arch: arch/x86/Kconfig
+    let root_kconfig_file = KconfigFile::new(linux_source.clone(), root_kconfig_path.clone());
+    let root_kconfig = LinuxKconfig {
+        arch_config_option: None,
+        file_contents: root_kconfig_file.read_to_string()?,
+        kconfig_file: root_kconfig_file,
+    };
+    all_root_kconfig_files.push(root_kconfig);
+
+    // add the arch kconfig files
+    let arch_dir_path = linux_source.join("arch");
+    let arch_kconfig_files = get_arch_kconfig_files(linux_source, arch_dir_path)?;
+    all_root_kconfig_files.extend(arch_kconfig_files);
+
+    Ok(all_root_kconfig_files)
+}
diff --git a/scripts/kconfirm/kconfirm-linux/src/main.rs b/scripts/kconfirm/kconfirm-linux/src/main.rs
new file mode 100644
index 000000000000..d8db25d87ee8
--- /dev/null
+++ b/scripts/kconfirm/kconfirm-linux/src/main.rs
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: GPL-2.0-only
+use clap::Parser;
+use std::collections::HashSet;
+use std::io::{self};
+use std::path::PathBuf;
+
+use nom_kconfig::KconfigInput;
+
+use kconfirm_lib::check_kconfig;
+use kconfirm_lib::output::print_findings;
+use kconfirm_lib::parse_check;
+use kconfirm_lib::{AnalysisArgs, Check};
+use kconfirm_linux::collect_kconfig_root_files;
+
+#[derive(Parser, Debug)]
+#[command(author, version, about, long_about = None)]
+struct Args {
+    #[arg(long, required = true)]
+    linux_path: PathBuf,
+
+    // enable specific checks (repeatable or comma-separated)
+    #[arg(long, value_delimiter = ',', num_args = 1..)]
+    enable: Vec<String>,
+
+    // disable specific checks
+    #[arg(long, value_delimiter = ',', num_args = 1..)]
+    disable: Vec<String>,
+}
+
+fn main() -> io::Result<()> {
+    env_logger::init();
+    let cli_args = Args::parse();
+    let mut enabled_checks: HashSet<Check> = [
+        Check::DuplicateDependency,
+        Check::DuplicateRange,
+        Check::DuplicateSelect,
+        Check::DeadDefault,
+        Check::DuplicateDefault,
+    ]
+    .into_iter()
+    .collect();
+
+    // apply --enable
+    for name in &cli_args.enable {
+        if let Some(c) = parse_check(name) {
+            enabled_checks.insert(c);
+        }
+    }
+
+    // apply --disable
+    for name in &cli_args.disable {
+        if let Some(c) = parse_check(name) {
+            enabled_checks.remove(&c);
+        }
+    }
+
+    let analysis_args = AnalysisArgs { enabled_checks };
+
+    let kconfig_files = collect_kconfig_root_files(cli_args.linux_path)?;
+    let kconfig_inputs = kconfig_files
+        .iter()
+        .map(|kconfig| {
+            let kconfig_input =
+                KconfigInput::new_extra(&kconfig.file_contents, kconfig.kconfig_file.clone());
+
+            (kconfig.arch_config_option.clone(), kconfig_input)
+        })
+        .collect();
+    let findings = check_kconfig(analysis_args, kconfig_inputs);
+
+    print_findings(findings);
+
+    Ok(())
+}
-- 
2.53.0


