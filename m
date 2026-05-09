Return-Path: <linux-kbuild+bounces-13094-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMrSH0mb/2lQ8QAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13094-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 09 May 2026 22:38:33 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4C25015F6
	for <lists+linux-kbuild@lfdr.de>; Sat, 09 May 2026 22:38:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AAC433010497
	for <lists+linux-kbuild@lfdr.de>; Sat,  9 May 2026 20:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EA1B37BE89;
	Sat,  9 May 2026 20:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fOcQa831"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7877A347524
	for <linux-kbuild@vger.kernel.org>; Sat,  9 May 2026 20:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778359104; cv=none; b=PazwwPDnOcqtpo7uyXRD+LNXlsqogVaK4zivrtinxZkMX1elZoIgsSMtA6xvuH8KZMfO8vYGa6VunGKoMYStIGu6y4mDRguluek2ecXyflD7Bg3h+rph7IX1UhJUv/8qzknXoFetKOk79rAakcWrd63D0hjKVvxM6Vrjh0I84zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778359104; c=relaxed/simple;
	bh=Rq91HdZhRkBj5JpG5iRrHQKQshlKeYA/rKt35K39adg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ACp2+roCpmvOVsO/KVvpEXz/axK/GZ1VsMZXjSKFEt653StV5vMcu8MUMPwKtBO5H7z2N9da0GiIymrRSSg16gVONWS+rYLD71ERPu+bj3peMcR6bNVLJxI7V4fGB3Nm/Ow3S51Z7LXCccKqy3lYt/+eo7bQxxXitwpvu74s6m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fOcQa831; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488af9fdaa7so17479845e9.1
        for <linux-kbuild@vger.kernel.org>; Sat, 09 May 2026 13:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778359097; x=1778963897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IFTlsKpcBZ0lrHWxjvbhZkBDof6hXKwEnc2fK9CejnM=;
        b=fOcQa831XksSFAzSSQsm7PcUJ+HZ9NdQlEjZ13WDr1jX5imTu8OrAqWxHQ+i7LkK2q
         0B8/T6NKEsi/vADSEWi1R/g7jTkp/BMVViL8iFbftpqeEFnXb5SHFeU2HBAl16VKkNCA
         8SpXG4io11fSzammhe3JL+xh3GCTiTKKia65AfZ//kAUen2zLhNxwS+upcC7lZQzlmYH
         xd5tkAqpWQezz3t/GSy4R1lOtWoZBx3IzEc6trUjnno929h99cxaPIBom9obf5ddU8KM
         C8NN27vk0m8zAIWYUFouIi9UvO3KJrisHAM6v7+4d9pgXVKfApTlQ56oZsUIzAxtJTgC
         7b2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778359097; x=1778963897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IFTlsKpcBZ0lrHWxjvbhZkBDof6hXKwEnc2fK9CejnM=;
        b=XPla6otewvU3GousBV2Fx2T7BzpL67ha+omjDj/1oM+UGIOXX/+3tVeT4fXppnskIF
         Qp0pCdR5mQHZlTN5GI19JTRT+OetLx9ZVb+eH7Db+z+P20K3MJpquC/YfO1Z8zDyiVKn
         hL3HmgxkcUJ/5ynjyTFIgzQjlovC6EZxNIg1NwuhCugzApxxLWmgW6JNifXShtqhVdoo
         2CcUVpnlg1dYrs1VDpBnfyQ2GSCJUgL42vdBGZo9nxQ50B0q4rFUy/W8vZ9egOMlzSPP
         mEoYGXiI4l528cu5iJLyriMUShgFnOnBsS5E6UeZRZoE9z9HKLYcS90reBb250olt9Df
         cQlg==
X-Forwarded-Encrypted: i=1; AFNElJ8OeKXQLl6y2LPK0k7ZgG8xaYDBZpicplorJYB1iyTgy6zp2JioJwuktuQmCCmVI4zN05DD+q8wW8qFsS8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwS6ubANdfj3BNl+Uk92GY9togtkKgqCuvX1wBUdaOX053n8iqP
	QxfOMcjoxS8mCbM3mkqea33fWAvSAsoaThBfnjBwBRRCrh8sqN1SRpoV
X-Gm-Gg: Acq92OGtVNF0uOt5ZZojkFepTF+LAEKTSpePJyJmNFe2gTte02Pq3+B7fq87TwBfgYy
	2/TEqxI93E6FzFC/ZvK1s7xpP+PmM/qKgNNwu5NUOOCoMkMY9yn+Iy2Nx9k21qFUrqnPiJs2g8H
	gnc/W2Au7u4Cw2vuTHy4i+Dh08i8ZFDRWV4vIE9iNxXjD0yXbFrbZX5FEO+JG4yICA/TI0fLVsD
	HRMhzf1hSMo/6l/bJiBcx5ft9d6tn2wzkKFf5uQO56MVUVFRdKaxyi14xehD0HoNCs5jloPNtEK
	emqrUSxzpXvLeRf7QWP4N7yiq9vrpSVLj+zdCn0w7PQGZQGaQPqR+MAH6sdG+Nfyx/XN6tOU1FW
	0twaizWUYqbOtdh98i8YjqepYJ9vZYXVbSzGdYdrdPJo7cX5KL7VSBNjGW5U+mpfG/biJJe/1IR
	3LKjgBAnugxcpkCRRfrixB85zSONw50HUHCBI2IuvIecT2Y8y4WYfFH2c=
X-Received: by 2002:a05:600c:a305:b0:488:8bdd:cfcc with SMTP id 5b1f17b1804b1-48e51dd6025mr202617035e9.0.1778359096233;
        Sat, 09 May 2026 13:38:16 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6db0b95asm39394605e9.9.2026.05.09.13.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 13:38:15 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: jani.nikula@linux.intel.com,
	akpm@linux-foundation.org,
	gary@garyguo.net,
	ljs@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	masahiroy@kernel.org,
	ojeda@kernel.org,
	corbet@lwn.net,
	qingfang.deng@linux.dev,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [RFC PATCH v2 1/2] scripts: add kconfirm
Date: Sat,  9 May 2026 21:38:07 +0100
Message-ID: <20260509203808.1142311-2-julianbraha@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260509203808.1142311-1-julianbraha@gmail.com>
References: <20260509203808.1142311-1-julianbraha@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: AC4C25015F6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[linux.intel.com,linux-foundation.org,garyguo.net,kernel.org,arndb.de,linuxfoundation.org,lwn.net,linux.dev,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-13094-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julianbraha@gmail.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-0.995];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,module.lds:url]
X-Rspamd-Action: no action

Add kconfirm into scripts/

kconfirm is a static analysis tool with various checks for Kconfig, and
intended to have zero false alarms by default. These default checks
currently include dead code, constant conditions, and invalid (reverse)
ranges.

There are also optional checks for dead links in the help texts, and for
config options that select visible config options.

Checks are performed for all architectures, using a single thread. Alarms
that are specific to one or multiple architectures are tagged using the
architectures' config options, like so: [X86] or [X86, ARM].

Each alarm gets a single line (deduplicated across architectures) and is
formatted like this:
[<SEVERITY>] [<ARCH_1>, <ARCH_2>] config <OPTION_NAME>: <alarm message>

The tool source contains two Rust packages: kconfirm-lib and
kconfirm-linux.

kconfirm-lib is the underlying library that analyzes Kconfig code, and
formats alarms for usability. It analyzes the entire Linux Kconfig spec,
including all architectures. This package exposes the symbol table that it
constructs so that other tools can import this library, and make use of it
for their own Kconfig analyses.

kconfirm-linux imports kconfirm-lib, and provides the CLI, which is
intended for either manual usage, or integration with the Linux build
system so that users can simply run `make kconfirm` from the root.
kconfirm-linux also handles some of the specificities of how Kconfig is
used in the Linux tree, in contrast to other open source software. E.g.
the way that each architecture has its own Kconfig and Kconfig.debug
files, rather than being sourced from the root Kconfig.

The tool's dependencies are vendored in scripts/kconfirm/vendor/ so that
kconfirm can be compiled without an internet connection.

NOTE: the full size of kconfirm with vendored dependencies is too large
for email (49mb), so the full patchset is available in my linux fork, git
branch 'kconfirm_rfc2', and is based on linux v7.1-rc2:
https://github.com/julianbraha/linux/tree/kconfirm_rfc2

This patch actually includes everything _but_ the vendored dependencies.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 Makefile                                      |  11 +-
 scripts/Makefile                              |   2 +-
 scripts/kconfirm/.gitignore                   |   3 +
 scripts/kconfirm/Cargo.toml                   |  12 +
 scripts/kconfirm/LICENSE                      | 339 +++++++++
 scripts/kconfirm/Makefile                     |  29 +
 scripts/kconfirm/kconfirm-lib/Cargo.toml      |  16 +
 scripts/kconfirm/kconfirm-lib/src/analyze.rs  | 658 +++++++++++++++++
 scripts/kconfirm/kconfirm-lib/src/checks.rs   | 694 ++++++++++++++++++
 .../kconfirm/kconfirm-lib/src/dead_links.rs   |  83 +++
 scripts/kconfirm/kconfirm-lib/src/lib.rs      |  62 ++
 scripts/kconfirm/kconfirm-lib/src/output.rs   | 114 +++
 .../kconfirm/kconfirm-lib/src/symbol_table.rs | 228 ++++++
 scripts/kconfirm/kconfirm-linux/Cargo.toml    |  12 +
 scripts/kconfirm/kconfirm-linux/src/lib.rs    | 119 +++
 scripts/kconfirm/kconfirm-linux/src/main.rs   |  82 +++
 scripts/kconfirm/vendor_dependencies.sh       |   1 +
 17 files changed, 2463 insertions(+), 2 deletions(-)
 create mode 100644 scripts/kconfirm/.gitignore
 create mode 100644 scripts/kconfirm/Cargo.toml
 create mode 100644 scripts/kconfirm/LICENSE
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
 create mode 100644 scripts/kconfirm/vendor_dependencies.sh

diff --git a/Makefile b/Makefile
index 9f88dcaae382..f0327dbcb7b0 100644
--- a/Makefile
+++ b/Makefile
@@ -2225,7 +2225,7 @@ endif
 # Scripts to check various things for consistency
 # ---------------------------------------------------------------------------
 
-PHONY += includecheck versioncheck coccicheck
+PHONY += includecheck versioncheck coccicheck kconfirm
 
 includecheck:
 	find $(srctree)/* $(RCS_FIND_IGNORE) \
@@ -2240,6 +2240,15 @@ versioncheck:
 coccicheck:
 	$(Q)$(BASH) $(srctree)/scripts/$@
 
+kconfirm:
+	$(Q)$(MAKE) -C scripts/kconfirm
+
+# kconfirm is compiled and has its own build artifacts
+PHONY += kconfirmclean
+
+kconfirmclean:
+	$(Q)$(MAKE) -C scripts/kconfirm clean
+
 PHONY += checkstack kernelrelease kernelversion image_name
 
 # UML needs a little special treatment here.  It wants to use the host
diff --git a/scripts/Makefile b/scripts/Makefile
index 3434a82a119f..f257e4514489 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -54,7 +54,7 @@ HOSTCFLAGS_sorttable.o += -DMCOUNT_SORT_ENABLED
 endif
 
 # The following programs are only built on demand
-hostprogs += unifdef gen_packed_field_checks
+hostprogs += unifdef gen_packed_field_checks kconfirm
 
 # The module linker script is preprocessed on demand
 targets += module.lds
diff --git a/scripts/kconfirm/.gitignore b/scripts/kconfirm/.gitignore
new file mode 100644
index 000000000000..f64f232d94f2
--- /dev/null
+++ b/scripts/kconfirm/.gitignore
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+/target
+/Cargo.lock
diff --git a/scripts/kconfirm/Cargo.toml b/scripts/kconfirm/Cargo.toml
new file mode 100644
index 000000000000..ebf1bf32920a
--- /dev/null
+++ b/scripts/kconfirm/Cargo.toml
@@ -0,0 +1,12 @@
+[workspace]
+members = ["kconfirm-lib", "kconfirm-linux"]
+resolver = "3"
+
+[workspace.package]
+rust-version = "1.85.0"
+
+[workspace.dependencies]
+nom-kconfig = "0.10"
+log = "0.4"
+env_logger = "0.11"
+clap = { version = "4.6", features = ["derive"] }
diff --git a/scripts/kconfirm/LICENSE b/scripts/kconfirm/LICENSE
new file mode 100644
index 000000000000..d159169d1050
--- /dev/null
+++ b/scripts/kconfirm/LICENSE
@@ -0,0 +1,339 @@
+                    GNU GENERAL PUBLIC LICENSE
+                       Version 2, June 1991
+
+ Copyright (C) 1989, 1991 Free Software Foundation, Inc.,
+ 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+ Everyone is permitted to copy and distribute verbatim copies
+ of this license document, but changing it is not allowed.
+
+                            Preamble
+
+  The licenses for most software are designed to take away your
+freedom to share and change it.  By contrast, the GNU General Public
+License is intended to guarantee your freedom to share and change free
+software--to make sure the software is free for all its users.  This
+General Public License applies to most of the Free Software
+Foundation's software and to any other program whose authors commit to
+using it.  (Some other Free Software Foundation software is covered by
+the GNU Lesser General Public License instead.)  You can apply it to
+your programs, too.
+
+  When we speak of free software, we are referring to freedom, not
+price.  Our General Public Licenses are designed to make sure that you
+have the freedom to distribute copies of free software (and charge for
+this service if you wish), that you receive source code or can get it
+if you want it, that you can change the software or use pieces of it
+in new free programs; and that you know you can do these things.
+
+  To protect your rights, we need to make restrictions that forbid
+anyone to deny you these rights or to ask you to surrender the rights.
+These restrictions translate to certain responsibilities for you if you
+distribute copies of the software, or if you modify it.
+
+  For example, if you distribute copies of such a program, whether
+gratis or for a fee, you must give the recipients all the rights that
+you have.  You must make sure that they, too, receive or can get the
+source code.  And you must show them these terms so they know their
+rights.
+
+  We protect your rights with two steps: (1) copyright the software, and
+(2) offer you this license which gives you legal permission to copy,
+distribute and/or modify the software.
+
+  Also, for each author's protection and ours, we want to make certain
+that everyone understands that there is no warranty for this free
+software.  If the software is modified by someone else and passed on, we
+want its recipients to know that what they have is not the original, so
+that any problems introduced by others will not reflect on the original
+authors' reputations.
+
+  Finally, any free program is threatened constantly by software
+patents.  We wish to avoid the danger that redistributors of a free
+program will individually obtain patent licenses, in effect making the
+program proprietary.  To prevent this, we have made it clear that any
+patent must be licensed for everyone's free use or not licensed at all.
+
+  The precise terms and conditions for copying, distribution and
+modification follow.
+
+                    GNU GENERAL PUBLIC LICENSE
+   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
+
+  0. This License applies to any program or other work which contains
+a notice placed by the copyright holder saying it may be distributed
+under the terms of this General Public License.  The "Program", below,
+refers to any such program or work, and a "work based on the Program"
+means either the Program or any derivative work under copyright law:
+that is to say, a work containing the Program or a portion of it,
+either verbatim or with modifications and/or translated into another
+language.  (Hereinafter, translation is included without limitation in
+the term "modification".)  Each licensee is addressed as "you".
+
+Activities other than copying, distribution and modification are not
+covered by this License; they are outside its scope.  The act of
+running the Program is not restricted, and the output from the Program
+is covered only if its contents constitute a work based on the
+Program (independent of having been made by running the Program).
+Whether that is true depends on what the Program does.
+
+  1. You may copy and distribute verbatim copies of the Program's
+source code as you receive it, in any medium, provided that you
+conspicuously and appropriately publish on each copy an appropriate
+copyright notice and disclaimer of warranty; keep intact all the
+notices that refer to this License and to the absence of any warranty;
+and give any other recipients of the Program a copy of this License
+along with the Program.
+
+You may charge a fee for the physical act of transferring a copy, and
+you may at your option offer warranty protection in exchange for a fee.
+
+  2. You may modify your copy or copies of the Program or any portion
+of it, thus forming a work based on the Program, and copy and
+distribute such modifications or work under the terms of Section 1
+above, provided that you also meet all of these conditions:
+
+    a) You must cause the modified files to carry prominent notices
+    stating that you changed the files and the date of any change.
+
+    b) You must cause any work that you distribute or publish, that in
+    whole or in part contains or is derived from the Program or any
+    part thereof, to be licensed as a whole at no charge to all third
+    parties under the terms of this License.
+
+    c) If the modified program normally reads commands interactively
+    when run, you must cause it, when started running for such
+    interactive use in the most ordinary way, to print or display an
+    announcement including an appropriate copyright notice and a
+    notice that there is no warranty (or else, saying that you provide
+    a warranty) and that users may redistribute the program under
+    these conditions, and telling the user how to view a copy of this
+    License.  (Exception: if the Program itself is interactive but
+    does not normally print such an announcement, your work based on
+    the Program is not required to print an announcement.)
+
+These requirements apply to the modified work as a whole.  If
+identifiable sections of that work are not derived from the Program,
+and can be reasonably considered independent and separate works in
+themselves, then this License, and its terms, do not apply to those
+sections when you distribute them as separate works.  But when you
+distribute the same sections as part of a whole which is a work based
+on the Program, the distribution of the whole must be on the terms of
+this License, whose permissions for other licensees extend to the
+entire whole, and thus to each and every part regardless of who wrote it.
+
+Thus, it is not the intent of this section to claim rights or contest
+your rights to work written entirely by you; rather, the intent is to
+exercise the right to control the distribution of derivative or
+collective works based on the Program.
+
+In addition, mere aggregation of another work not based on the Program
+with the Program (or with a work based on the Program) on a volume of
+a storage or distribution medium does not bring the other work under
+the scope of this License.
+
+  3. You may copy and distribute the Program (or a work based on it,
+under Section 2) in object code or executable form under the terms of
+Sections 1 and 2 above provided that you also do one of the following:
+
+    a) Accompany it with the complete corresponding machine-readable
+    source code, which must be distributed under the terms of Sections
+    1 and 2 above on a medium customarily used for software interchange; or,
+
+    b) Accompany it with a written offer, valid for at least three
+    years, to give any third party, for a charge no more than your
+    cost of physically performing source distribution, a complete
+    machine-readable copy of the corresponding source code, to be
+    distributed under the terms of Sections 1 and 2 above on a medium
+    customarily used for software interchange; or,
+
+    c) Accompany it with the information you received as to the offer
+    to distribute corresponding source code.  (This alternative is
+    allowed only for noncommercial distribution and only if you
+    received the program in object code or executable form with such
+    an offer, in accord with Subsection b above.)
+
+The source code for a work means the preferred form of the work for
+making modifications to it.  For an executable work, complete source
+code means all the source code for all modules it contains, plus any
+associated interface definition files, plus the scripts used to
+control compilation and installation of the executable.  However, as a
+special exception, the source code distributed need not include
+anything that is normally distributed (in either source or binary
+form) with the major components (compiler, kernel, and so on) of the
+operating system on which the executable runs, unless that component
+itself accompanies the executable.
+
+If distribution of executable or object code is made by offering
+access to copy from a designated place, then offering equivalent
+access to copy the source code from the same place counts as
+distribution of the source code, even though third parties are not
+compelled to copy the source along with the object code.
+
+  4. You may not copy, modify, sublicense, or distribute the Program
+except as expressly provided under this License.  Any attempt
+otherwise to copy, modify, sublicense or distribute the Program is
+void, and will automatically terminate your rights under this License.
+However, parties who have received copies, or rights, from you under
+this License will not have their licenses terminated so long as such
+parties remain in full compliance.
+
+  5. You are not required to accept this License, since you have not
+signed it.  However, nothing else grants you permission to modify or
+distribute the Program or its derivative works.  These actions are
+prohibited by law if you do not accept this License.  Therefore, by
+modifying or distributing the Program (or any work based on the
+Program), you indicate your acceptance of this License to do so, and
+all its terms and conditions for copying, distributing or modifying
+the Program or works based on it.
+
+  6. Each time you redistribute the Program (or any work based on the
+Program), the recipient automatically receives a license from the
+original licensor to copy, distribute or modify the Program subject to
+these terms and conditions.  You may not impose any further
+restrictions on the recipients' exercise of the rights granted herein.
+You are not responsible for enforcing compliance by third parties to
+this License.
+
+  7. If, as a consequence of a court judgment or allegation of patent
+infringement or for any other reason (not limited to patent issues),
+conditions are imposed on you (whether by court order, agreement or
+otherwise) that contradict the conditions of this License, they do not
+excuse you from the conditions of this License.  If you cannot
+distribute so as to satisfy simultaneously your obligations under this
+License and any other pertinent obligations, then as a consequence you
+may not distribute the Program at all.  For example, if a patent
+license would not permit royalty-free redistribution of the Program by
+all those who receive copies directly or indirectly through you, then
+the only way you could satisfy both it and this License would be to
+refrain entirely from distribution of the Program.
+
+If any portion of this section is held invalid or unenforceable under
+any particular circumstance, the balance of the section is intended to
+apply and the section as a whole is intended to apply in other
+circumstances.
+
+It is not the purpose of this section to induce you to infringe any
+patents or other property right claims or to contest validity of any
+such claims; this section has the sole purpose of protecting the
+integrity of the free software distribution system, which is
+implemented by public license practices.  Many people have made
+generous contributions to the wide range of software distributed
+through that system in reliance on consistent application of that
+system; it is up to the author/donor to decide if he or she is willing
+to distribute software through any other system and a licensee cannot
+impose that choice.
+
+This section is intended to make thoroughly clear what is believed to
+be a consequence of the rest of this License.
+
+  8. If the distribution and/or use of the Program is restricted in
+certain countries either by patents or by copyrighted interfaces, the
+original copyright holder who places the Program under this License
+may add an explicit geographical distribution limitation excluding
+those countries, so that distribution is permitted only in or among
+countries not thus excluded.  In such case, this License incorporates
+the limitation as if written in the body of this License.
+
+  9. The Free Software Foundation may publish revised and/or new versions
+of the General Public License from time to time.  Such new versions will
+be similar in spirit to the present version, but may differ in detail to
+address new problems or concerns.
+
+Each version is given a distinguishing version number.  If the Program
+specifies a version number of this License which applies to it and "any
+later version", you have the option of following the terms and conditions
+either of that version or of any later version published by the Free
+Software Foundation.  If the Program does not specify a version number of
+this License, you may choose any version ever published by the Free Software
+Foundation.
+
+  10. If you wish to incorporate parts of the Program into other free
+programs whose distribution conditions are different, write to the author
+to ask for permission.  For software which is copyrighted by the Free
+Software Foundation, write to the Free Software Foundation; we sometimes
+make exceptions for this.  Our decision will be guided by the two goals
+of preserving the free status of all derivatives of our free software and
+of promoting the sharing and reuse of software generally.
+
+                            NO WARRANTY
+
+  11. BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
+FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW.  EXCEPT WHEN
+OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
+PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED
+OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
+MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.  THE ENTIRE RISK AS
+TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU.  SHOULD THE
+PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING,
+REPAIR OR CORRECTION.
+
+  12. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
+WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
+REDISTRIBUTE THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES,
+INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING
+OUT OF THE USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED
+TO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY
+YOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER
+PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE
+POSSIBILITY OF SUCH DAMAGES.
+
+                     END OF TERMS AND CONDITIONS
+
+            How to Apply These Terms to Your New Programs
+
+  If you develop a new program, and you want it to be of the greatest
+possible use to the public, the best way to achieve this is to make it
+free software which everyone can redistribute and change under these terms.
+
+  To do so, attach the following notices to the program.  It is safest
+to attach them to the start of each source file to most effectively
+convey the exclusion of warranty; and each file should have at least
+the "copyright" line and a pointer to where the full notice is found.
+
+    <one line to give the program's name and a brief idea of what it does.>
+    Copyright (C) <year>  <name of author>
+
+    This program is free software; you can redistribute it and/or modify
+    it under the terms of the GNU General Public License as published by
+    the Free Software Foundation; either version 2 of the License, or
+    (at your option) any later version.
+
+    This program is distributed in the hope that it will be useful,
+    but WITHOUT ANY WARRANTY; without even the implied warranty of
+    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+    GNU General Public License for more details.
+
+    You should have received a copy of the GNU General Public License along
+    with this program; if not, write to the Free Software Foundation, Inc.,
+    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+
+Also add information on how to contact you by electronic and paper mail.
+
+If the program is interactive, make it output a short notice like this
+when it starts in an interactive mode:
+
+    Gnomovision version 69, Copyright (C) year name of author
+    Gnomovision comes with ABSOLUTELY NO WARRANTY; for details type `show w'.
+    This is free software, and you are welcome to redistribute it
+    under certain conditions; type `show c' for details.
+
+The hypothetical commands `show w' and `show c' should show the appropriate
+parts of the General Public License.  Of course, the commands you use may
+be called something other than `show w' and `show c'; they could even be
+mouse-clicks or menu items--whatever suits your program.
+
+You should also get your employer (if you work as a programmer) or your
+school, if any, to sign a "copyright disclaimer" for the program, if
+necessary.  Here is a sample; alter the names:
+
+  Yoyodyne, Inc., hereby disclaims all copyright interest in the program
+  `Gnomovision' (which makes passes at compilers) written by James Hacker.
+
+  <signature of Ty Coon>, 1 April 1989
+  Ty Coon, President of Vice
+
+This General Public License does not permit incorporating your program into
+proprietary programs.  If your program is a subroutine library, you may
+consider it more useful to permit linking proprietary applications with the
+library.  If this is what you want to do, use the GNU Lesser General
+Public License instead of this License.
diff --git a/scripts/kconfirm/Makefile b/scripts/kconfirm/Makefile
new file mode 100644
index 000000000000..8b01ac967f67
--- /dev/null
+++ b/scripts/kconfirm/Makefile
@@ -0,0 +1,29 @@
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
+	@cargo run --release --offline -p kconfirm-linux -- --linux-path ../../ $(KCONFIRM_ARGS)
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
+	@rm -f Cargo.lock
diff --git a/scripts/kconfirm/kconfirm-lib/Cargo.toml b/scripts/kconfirm/kconfirm-lib/Cargo.toml
new file mode 100644
index 000000000000..90c04d3394f5
--- /dev/null
+++ b/scripts/kconfirm/kconfirm-lib/Cargo.toml
@@ -0,0 +1,16 @@
+[package]
+name = "kconfirm-lib"
+version = "0.9.0"
+edition = "2024"
+rust-version.workspace = true
+
+[dependencies]
+nom-kconfig = { workspace = true }
+log = { workspace = true }
+env_logger = { workspace = true }
+ureq = { version = "3.3", default-features = false, features = ["native-tls"] }
+regex = { version = "1.12", default-features = false }
+
+[features]
+default = []
+coreboot = ["nom-kconfig/coreboot"]
diff --git a/scripts/kconfirm/kconfirm-lib/src/analyze.rs b/scripts/kconfirm/kconfirm-lib/src/analyze.rs
new file mode 100644
index 000000000000..366213283f8c
--- /dev/null
+++ b/scripts/kconfirm/kconfirm-lib/src/analyze.rs
@@ -0,0 +1,658 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+use crate::AnalysisArgs;
+use crate::Check;
+use crate::SymbolTable;
+use crate::dead_links::{self, LinkStatus, check_link};
+use crate::output::{Finding, Severity};
+use crate::symbol_table::ChoiceData;
+
+use log::error;
+use log::{debug, warn};
+use nom_kconfig::attribute::DefaultAttribute;
+use nom_kconfig::attribute::Expression;
+use nom_kconfig::attribute::Imply;
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
+        arch: &Option<String>,
+        message: String,
+    ) {
+        if !args.is_enabled(Check::UngroupedAttribute) {
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
+                        check: Check::UngroupedAttribute,
+                        symbol: Some(symbol.to_string()),
+                        message,
+                        arch: arch.to_owned(),
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
+        arch: &Option<String>,
+        context: &str,
+    ) {
+        if !args.is_enabled(Check::DeadLink) {
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
+                    check: Check::DeadLink,
+                    symbol: symbol.map(|s| s.to_string()),
+                    message: format!(
+                        "{} contains link {} with status {:?}",
+                        context, link, status
+                    ),
+                    arch: arch.to_owned(),
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
+    pub visibility: Vec<Option<Expression>>,
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
+    fn with_visibility(mut self, cond: Option<Expression>) -> Self {
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
+    let mut kconfig_implies: Vec<Imply> = Vec::new();
+    let mut kconfig_ranges = Vec::new();
+    let mut kconfig_defaults = Vec::new();
+    let mut found_prompt = false;
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
+                        &ctx.arch,
+                        format!("ungrouped default {}", db),
+                    );
+                }
+                Type::Bool(unconditional_prompt) => {
+                    if unconditional_prompt.is_some() {
+                        found_prompt = true;
+                    }
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
+                        &ctx.arch,
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
+                Type::Tristate(unconditional_prompt) => {
+                    if unconditional_prompt.is_some() {
+                        found_prompt = true;
+                    }
+
+                    config_type = Some(kconfig_type.clone())
+                }
+                Type::Hex(unconditional_prompt) => {
+                    if unconditional_prompt.is_some() {
+                        found_prompt = true;
+                    }
+
+                    config_type = Some(kconfig_type);
+                }
+                Type::Int(unconditional_prompt) => {
+                    if unconditional_prompt.is_some() {
+                        found_prompt = true;
+                    }
+                    config_type = Some(kconfig_type);
+                }
+                Type::String(unconditional_prompt) => {
+                    if unconditional_prompt.is_some() {
+                        found_prompt = true;
+                    }
+                    config_type = Some(kconfig_type);
+                }
+            },
+            Default(default) => {
+                attribute_grouping_checker.check(
+                    FunctionalAttributes::Defaults,
+                    args,
+                    findings,
+                    &config_symbol,
+                    &ctx.arch,
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
+                    &ctx.arch,
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
+                    &ctx.arch,
+                    format!("ungrouped select {}", &select),
+                );
+
+                kconfig_selects.push(select);
+            }
+            Imply(imply) => {
+                attribute_grouping_checker.check(
+                    FunctionalAttributes::Implies,
+                    args,
+                    findings,
+                    &config_symbol,
+                    &ctx.arch,
+                    format!("ungrouped imply {}", imply),
+                );
+
+                kconfig_implies.push(imply);
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
+                    &ctx.arch,
+                    format!("ungrouped range {}", r),
+                );
+
+                kconfig_ranges.push(r);
+            }
+            Help(h) => {
+                // doing nothing for menu help right now
+
+                dead_link_checker.check_text(
+                    &h,
+                    args,
+                    findings,
+                    Some(&config_symbol),
+                    &ctx.arch,
+                    "help text",
+                );
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
+                // TODO: once we have SMT solving, we can also check if the prompt condition is always true or never true (and therefore, effectively unconditional)
+
+                found_prompt = true;
+                if let Some(c) = prompt.r#if {
+                    child_ctx = child_ctx.with_visibility(Some(c));
+                }
+            }
+            Transitional => {
+                // doing nothing for transitional right now
+            }
+            Optional | Visible(_) | Requires(_) | Option(_) => {
+                error!("Unexpected attribute encountered: {:?}", attribute);
+
+                if !cfg!(debug_assertions) {
+                    panic!();
+                }
+            }
+        }
+    }
+
+    if !found_prompt {
+        child_ctx = child_ctx.with_visibility(None);
+    }
+
+    // there can be multiple entries that get merged. so we need to do the same for our symtab.
+    let kconfig_type = config_type.clone().map(|c| c.r#type);
+
+    // at the time of writing this, linux's kconfig only uses Bool inside Choice.
+    // however, the kconfig documentation doesn't specify whether or not this is guaranteed to be the case.
+    // we add this check to ensure that we don't cause undefined behavior in future linux versions if something changes...
+    if child_ctx.in_choice {
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
+    kconfig_dependencies.extend(child_ctx.dependencies.clone());
+    symtab.merge_insert_new_solved(
+        config_symbol.clone(),
+        kconfig_type,
+        kconfig_dependencies,
+        //z3_dependency,
+        kconfig_ranges,
+        kconfig_defaults,
+        child_ctx.visibility.clone(),
+        child_ctx.arch.clone(),
+        child_ctx.definition_condition.clone(),
+        None,
+        kconfig_selects
+            .clone()
+            .into_iter()
+            .map(|sel| (sel.symbol, sel.r#if))
+            .collect(),
+        kconfig_implies
+            .into_iter()
+            .map(|imply| (imply.symbol.to_string(), imply.r#if))
+            .collect(),
+    );
+    // TODO: file a github issue, imply can never imply a constant (this is technically parsing incorrectly)
+
+    // TODO: when SMT solving, we may need to keep track of the implies the same way we keep track of selects,
+    //       in cases when the implied config option is non-visible
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
+                child_ctx.arch.clone(),
+                child_ctx.definition_condition.clone(),
+                Some((config_symbol.clone(), None)),
+                Vec::new(),
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
+                    child_ctx.arch.clone(),
+                    child_ctx.definition_condition.clone(),
+                    Some((config_symbol.clone(), Some(select_condition))),
+                    Vec::new(),
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
+        child_ctx = child_ctx.with_visibility(Some(dep)); // not a typo, the config options inside of a menu are only visible if the menu's dependencies are satisfied
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
+                    child_ctx = child_ctx.with_visibility(Some(i));
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
+        defaults,
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
index 000000000000..bdd45b679dcb
--- /dev/null
+++ b/scripts/kconfirm/kconfirm-lib/src/checks.rs
@@ -0,0 +1,694 @@
+use log::error;
+use nom_kconfig::attribute::{Expression, range::RangeBound};
+
+// SPDX-License-Identifier: GPL-2.0-only
+use crate::{
+    output::{Finding, Severity},
+    symbol_table::{AttributeDef, TypeInfo},
+};
+use std::{collections::HashSet, num::ParseIntError};
+
+#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
+pub enum Check {
+    FailedParse,
+    UngroupedAttribute, // check for duplicate default values, and ungrouped attributes
+    DeadLink,           // check for dead links in the help texts
+    SelectVisible,
+    // need SMT solving before we can detect select-undefineds
+    //SelectUndefined,
+    DuplicateDependency,
+    DuplicateRange,
+    DeadRange,
+    DuplicateSelect,
+    DeadSelect,
+    DeadDefault,
+    ConstantCondition,
+    DuplicateDefault,
+    DuplicateDefaultValue,
+    DuplicateImply,
+    DeadImply,
+    ReverseRange,
+}
+
+impl Check {
+    pub fn as_str(self) -> &'static str {
+        match self {
+            Check::FailedParse => "failed_parse",
+            Check::UngroupedAttribute => "ungrouped_attribute",
+            Check::DeadLink => "dead_link",
+            Check::SelectVisible => "select_visible",
+            Check::DuplicateDependency => "duplicate_dependency",
+            Check::DuplicateRange => "duplicate_range",
+            Check::DeadRange => "dead_range",
+            Check::DuplicateSelect => "duplicate_select",
+            Check::DeadSelect => "dead_select",
+            Check::DeadDefault => "dead_default",
+            Check::ConstantCondition => "constant_condition",
+            Check::DuplicateDefault => "duplicate_default",
+            Check::DuplicateDefaultValue => "duplicate_default_value",
+            Check::DuplicateImply => "duplicate_imply",
+            Check::DeadImply => "dead_imply",
+            Check::ReverseRange => "reverse_range",
+        }
+    }
+}
+
+pub fn parse_check(name: &str) -> Option<Check> {
+    match name {
+        "failed_parse" => Some(Check::FailedParse),
+        "ungrouped_attribute" => Some(Check::UngroupedAttribute),
+        "dead_link" => Some(Check::DeadLink),
+        "select_visible" => Some(Check::SelectVisible),
+        "duplicate_dependency" => Some(Check::DuplicateDependency),
+        "duplicate_range" => Some(Check::DuplicateRange),
+        "duplicate_select" => Some(Check::DuplicateSelect),
+        "dead_select" => Some(Check::DeadSelect),
+        "dead_default" => Some(Check::DeadDefault),
+        "constant_condition" => Some(Check::ConstantCondition),
+        "duplicate_default" => Some(Check::DuplicateDefault),
+        "duplicate_default_value" => Some(Check::DuplicateDefaultValue),
+        "duplicate_imply" => Some(Check::DuplicateImply),
+        "dead_imply" => Some(Check::DeadImply),
+        "reverse_range" => Some(Check::ReverseRange),
+        _ => None,
+    }
+}
+
+#[derive(Clone, Debug)]
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
+// returns an Error if a hex range bound cannot be parsed as an i64
+pub fn check_reverse_ranges(
+    arch: &Option<String>,
+    var_symbol: &str,
+    info: &AttributeDef,
+) -> Vec<Finding> {
+    let mut findings = Vec::new();
+
+    for range in &info.kconfig_ranges {
+        // returns an Error if a hex range bound cannot be parsed as an i64
+        fn range_bound_to_int(range_bound: &RangeBound) -> Result<i64, ParseIntError> {
+            match range_bound {
+                RangeBound::Number(b) => {
+                    return Ok(b.to_owned());
+                }
+                RangeBound::Hex(b_str) => {
+                    let trimmed = b_str.trim_start_matches("0x").trim_start_matches("0X");
+
+                    return i64::from_str_radix(trimmed, 16);
+                }
+                RangeBound::Symbol(_) => {
+                    // TODO: need SMT solving for this case
+                    //       for now, the caller is expected not to pass these cases.
+                    unreachable!("not handling variable ranges until SMT solving");
+                }
+            }
+        }
+
+        if matches!(range.lower_bound, RangeBound::Symbol(_))
+            || matches!(range.upper_bound, RangeBound::Symbol(_))
+        {
+            // not handling these cases until SMT solving.
+            // don't return though, because we stil want to check the other ranges.
+            continue;
+        }
+
+        let maybe_lower_bound = range_bound_to_int(&range.lower_bound);
+        let maybe_upper_bound = range_bound_to_int(&range.upper_bound);
+
+        match (maybe_lower_bound, maybe_upper_bound) {
+            (Ok(lower_bound), Ok(upper_bound)) => {
+                if lower_bound > upper_bound {
+                    let message = format!(
+                        "reverse range {} for config option: {}, no value is valid",
+                        range.to_string(),
+                        var_symbol,
+                    );
+                    findings.push(Finding {
+                        severity: Severity::Warning,
+                        check: Check::ReverseRange,
+                        symbol: Some(var_symbol.to_owned()),
+                        arch: arch.to_owned(),
+                        message,
+                    });
+                }
+            }
+            (Result::Err(_), _) | (_, Result::Err(_)) => {
+                error!(
+                    "couldn't parse hex range bound as i64 for config option: {}",
+                    var_symbol
+                );
+                // still want to check the other range bounds
+                continue;
+            }
+        }
+    }
+
+    findings
+}
+
+pub fn check_constant_conditions(
+    arch: &Option<String>,
+    var_symbol: &str,
+    info: &AttributeDef,
+) -> Vec<Finding> {
+    let mut findings = Vec::new();
+    let default_conditions: Vec<&Expression> = info
+        .kconfig_defaults
+        .iter()
+        .filter_map(|conditional_default| conditional_default.r#if.as_ref())
+        .collect();
+
+    check_conditions(
+        arch,
+        &mut findings,
+        &var_symbol,
+        &info.kconfig_dependencies,
+        default_conditions,
+        "default",
+    );
+
+    let select_conditions: Vec<&Expression> = info
+        .selects
+        .iter()
+        .filter_map(|conditional_select| conditional_select.1.as_ref())
+        .collect();
+
+    check_conditions(
+        arch,
+        &mut findings,
+        var_symbol,
+        &info.kconfig_dependencies,
+        select_conditions,
+        "select",
+    );
+
+    let imply_conditions: Vec<&Expression> = info
+        .implies
+        .iter()
+        .filter_map(|imp| imp.1.as_ref())
+        .collect();
+
+    check_conditions(
+        arch,
+        &mut findings,
+        var_symbol,
+        &info.kconfig_dependencies,
+        imply_conditions,
+        "imply",
+    );
+
+    let range_conditions: Vec<&Expression> = info
+        .kconfig_ranges
+        .iter()
+        .filter_map(|conditional_range| conditional_range.r#if.as_ref())
+        .collect();
+
+    check_conditions(
+        arch,
+        &mut findings,
+        var_symbol,
+        &info.kconfig_dependencies,
+        range_conditions,
+        "range",
+    );
+
+    fn check_conditions(
+        arch: &Option<String>,
+        findings: &mut Vec<Finding>,
+        symbol: &str,
+        kconfig_dependencies: &[Expression],
+        attribute_conditions: Vec<&Expression>,
+        context: &str,
+    ) {
+        for attribute_condition in attribute_conditions.into_iter() {
+            if kconfig_dependencies.contains(attribute_condition) {
+                let message = format!(
+                    "constant {} condition 'if {}' for config option: {}, this condition is a dependency and will always be true",
+                    context,
+                    attribute_condition.to_string(),
+                    symbol,
+                );
+                findings.push(Finding {
+                    severity: Severity::Warning,
+                    check: Check::ConstantCondition,
+                    symbol: Some(symbol.to_owned()),
+                    arch: arch.to_owned(),
+                    message,
+                });
+            }
+        }
+    }
+    findings
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
+            arch_specific,
+            var_symbol,
+            info,
+        ));
+    }
+
+    if args.is_enabled(Check::DuplicateImply) {
+        findings.extend(check_duplicate_implies(arch_specific, var_symbol, info));
+    }
+
+    if args.is_enabled(Check::DuplicateRange) {
+        findings.extend(check_duplicate_ranges(arch_specific, var_symbol, info));
+    }
+
+    if args.is_enabled(Check::DuplicateSelect) {
+        findings.extend(check_duplicate_selects(arch_specific, var_symbol, info));
+    }
+
+    if args.is_enabled(Check::ConstantCondition) {
+        findings.extend(check_constant_conditions(arch_specific, var_symbol, info));
+    }
+
+    if args.is_enabled(Check::DeadDefault)
+        || args.is_enabled(Check::DuplicateDefault)
+        || args.is_enabled(Check::DuplicateDefaultValue)
+    {
+        findings.extend(check_defaults(arch_specific, var_symbol, info, args));
+    }
+
+    if args.is_enabled(Check::ReverseRange) {
+        findings.extend(check_reverse_ranges(arch_specific, var_symbol, info));
+    }
+
+    findings
+}
+
+// TODO: also check if a config option in one arch unconditionally references a config option that only exists in another arch (need SMT for this first)
+pub fn check_select_visible(var_symbol: &str, info: &TypeInfo) -> Vec<Finding> {
+    let mut findings = Vec::new();
+
+    // only interested in the options that are selected
+    if info.selected_by.is_empty() {
+        return Vec::new();
+    }
+
+    for (selector, select_info) in &info.selected_by {
+        for (arch, _cond) in select_info {
+            // NOTE: we don't care if the select is conditional or unconditional, just the selectee's visibility
+
+            // at this point, we know that `selector` unconditionally selects `var_symbol`
+            // now, we need to check if `var_symbol` is unconditionally visible
+
+            let message = format!(
+                "selects the visible {}; consider using 'depends on' or 'imply' instead",
+                var_symbol
+            );
+
+            // match the architecture that the select happens under with the architecture of the unconditional visibility
+            match info.attribute_defs.get(arch) {
+                None => {
+                    // there's no config option definition specifically under the architecture that this config option gets selected,
+                    // so let's check if it's defined for all archs (arch-independent)
+                    if let Some(no_arch_attribute_def) = info.attribute_defs.get(&None) {
+                        for (if_conditions, attributes) in no_arch_attribute_def {
+                            if if_conditions.is_empty() && attributes.visibility.is_empty() {
+                                // empty visiblity means that it is unconditionally visible, within the current arch (assuming arch is not `None`)
+
+                                findings.push(Finding {
+                                    severity: Severity::Warning,
+                                    check: Check::SelectVisible,
+                                    symbol: Some(selector.to_owned()),
+                                    message: message.clone(),
+                                    arch: arch.to_owned(),
+                                });
+                            }
+                        }
+                    }
+                }
+                Some(cur_arch_attribute_def) => {
+                    for (if_conditions, attributes) in cur_arch_attribute_def {
+                        if if_conditions.is_empty() && attributes.visibility.is_empty() {
+                            // empty visiblity means that it is unconditionally visible, within the current arch (assuming arch is not `None`)
+
+                            findings.push(Finding {
+                                severity: Severity::Warning,
+                                check: Check::SelectVisible,
+                                symbol: Some(selector.to_owned()),
+                                message: message.clone(),
+                                arch: arch.to_owned(),
+                            });
+                        }
+                    }
+                }
+            }
+        }
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
+    arch_specific: &Option<String>,
+    var_symbol: &str,
+    info: &AttributeDef,
+) -> Vec<Finding> {
+    let mut findings = Vec::new();
+    let mut seen = HashSet::new();
+
+    for dep in &info.kconfig_dependencies {
+        if is_duplicate(&mut seen, dep.to_string()) {
+            let message = format!("duplicate dependency on {}", dep.to_string());
+            findings.push(Finding {
+                severity: Severity::Warning,
+                check: Check::DuplicateDependency,
+                symbol: Some(var_symbol.to_owned()),
+                message,
+                arch: arch_specific.to_owned(),
+            });
+        }
+    }
+
+    findings
+}
+
+fn check_duplicate_implies(
+    arch: &Option<String>,
+    var_symbol: &str,
+    info: &AttributeDef,
+) -> Vec<Finding> {
+    let mut findings = Vec::new();
+
+    // symbols implied unconditionally
+    let mut unconditional: HashSet<String> = HashSet::new();
+
+    // (symbol, condition)
+    let mut conditional: HashSet<(String, String)> = HashSet::new();
+
+    for imp in &info.implies {
+        let imply_var = imp.0.clone();
+
+        match &imp.1 {
+            Some(cond) => {
+                let cond_str = cond.to_string();
+
+                // duplicate conditional imply
+                if !conditional.insert((imply_var.clone(), cond_str.clone())) {
+                    findings.push(Finding {
+                        severity: Severity::Warning,
+                        check: Check::DuplicateImply,
+                        symbol: Some(var_symbol.to_owned()),
+                        message: format!(
+                            "duplicate imply of {:?} with condition {}",
+                            imp.0, cond_str
+                        ),
+                        arch: arch.to_owned(),
+                    });
+                }
+
+                // conditional imply is dead if unconditional exists
+                if unconditional.contains(&imply_var) {
+                    findings.push(Finding {
+                        severity: Severity::Warning,
+                        check: Check::DeadImply,
+                        symbol: Some(var_symbol.to_owned()),
+                        message: format!("dead imply of {:?}", imp),
+                        arch: arch.to_owned(),
+                    });
+                }
+            }
+
+            None => {
+                // duplicate unconditional imply
+                if !unconditional.insert(imply_var.clone()) {
+                    findings.push(Finding {
+                        severity: Severity::Warning,
+                        check: Check::DuplicateImply,
+                        symbol: Some(var_symbol.to_owned()),
+                        message: format!("duplicate imply of {:?}", imp),
+                        arch: arch.to_owned(),
+                    });
+                }
+
+                // previous conditionals with same symbol are dead
+                for (sym, _) in &conditional {
+                    if sym == &imply_var {
+                        findings.push(Finding {
+                            severity: Severity::Warning,
+                            check: Check::DeadImply,
+                            symbol: Some(var_symbol.to_owned()),
+                            message: format!("dead imply of {:?}", imp),
+                            arch: arch.to_owned(),
+                        });
+                    }
+                }
+            }
+        }
+    }
+
+    findings
+}
+
+fn check_duplicate_ranges(
+    arch: &Option<String>,
+    var_symbol: &str,
+    info: &AttributeDef,
+) -> Vec<Finding> {
+    let mut findings = Vec::new();
+
+    // unconditional ranges by bounds
+    let mut unconditional: HashSet<String> = HashSet::new();
+
+    // (bounds, condition)
+    let mut conditional: HashSet<(String, String)> = HashSet::new();
+
+    for range in &info.kconfig_ranges {
+        // uniquely identify the range bounds
+        let range_key = format!("{} {}", range.lower_bound, range.upper_bound);
+
+        match &range.r#if {
+            Some(cond) => {
+                let cond_str = cond.to_string();
+
+                // duplicate conditional range
+                if !conditional.insert((range_key.clone(), cond_str.clone())) {
+                    findings.push(Finding {
+                        severity: Severity::Warning,
+                        check: Check::DeadRange,
+                        symbol: Some(var_symbol.to_owned()),
+                        message: format!("duplicate range {:?} with condition {}", range, cond_str),
+                        arch: arch.to_owned(),
+                    });
+                }
+
+                // conditional range is dead if unconditional exists
+                if unconditional.contains(&range_key) {
+                    findings.push(Finding {
+                        severity: Severity::Warning,
+                        check: Check::DeadRange,
+                        symbol: Some(var_symbol.to_owned()),
+                        message: format!("dead range of {:?}", range),
+                        arch: arch.to_owned(),
+                    });
+                }
+            }
+
+            None => {
+                // duplicate unconditional range
+                if !unconditional.insert(range_key.clone()) {
+                    findings.push(Finding {
+                        severity: Severity::Warning,
+                        check: Check::DeadRange,
+                        symbol: Some(var_symbol.to_owned()),
+                        message: format!("duplicate range {:?}", range),
+                        arch: arch.to_owned(),
+                    });
+                }
+
+                // previous conditionals with same bounds are dead
+                for (bounds, _) in &conditional {
+                    if bounds == &range_key {
+                        findings.push(Finding {
+                            severity: Severity::Warning,
+                            check: Check::DeadRange,
+                            symbol: Some(var_symbol.to_owned()),
+                            message: format!("dead range of {:?}", range),
+                            arch: arch.to_owned(),
+                        });
+                    }
+                }
+            }
+        }
+    }
+
+    findings
+}
+
+fn check_duplicate_selects(
+    arch: &Option<String>,
+    var_symbol: &str,
+    info: &AttributeDef,
+) -> Vec<Finding> {
+    let mut findings = Vec::new();
+
+    // symbols selected unconditionally
+    let mut unconditional: HashSet<String> = HashSet::new();
+
+    // (symbol, condition)
+    let mut conditional: HashSet<(String, String)> = HashSet::new();
+
+    for select in &info.selects {
+        let select_var = select.0.clone();
+
+        match &select.1 {
+            Some(cond) => {
+                let cond_str = cond.to_string();
+
+                // duplicate conditional select
+                if !conditional.insert((select_var.clone(), cond_str.clone())) {
+                    findings.push(Finding {
+                        severity: Severity::Warning,
+                        check: Check::DuplicateSelect,
+                        symbol: Some(var_symbol.to_owned()),
+                        message: format!(
+                            "duplicate select of {:?} with condition {}",
+                            select.0, cond_str
+                        ),
+                        arch: arch.to_owned(),
+                    });
+                }
+
+                // conditional is dead if unconditional exists
+                if unconditional.contains(&select_var) {
+                    findings.push(Finding {
+                        severity: Severity::Warning,
+                        check: Check::DeadSelect,
+                        symbol: Some(var_symbol.to_owned()),
+                        message: format!("dead select of {:?}", select.0),
+                        arch: arch.to_owned(),
+                    });
+                }
+            }
+
+            None => {
+                // duplicate unconditional select
+                if !unconditional.insert(select_var.clone()) {
+                    findings.push(Finding {
+                        severity: Severity::Warning,
+                        check: Check::DuplicateSelect,
+                        symbol: Some(var_symbol.to_owned()),
+                        message: format!("duplicate select of {:?}", select.0),
+                        arch: arch.to_owned(),
+                    });
+                }
+
+                // any previous conditional selects are now dead too
+                for (sym, _) in &conditional {
+                    if sym == &select_var {
+                        findings.push(Finding {
+                            severity: Severity::Warning,
+                            check: Check::DeadSelect,
+                            symbol: Some(var_symbol.to_owned()),
+                            message: format!("dead select of {:?}", select.0),
+                            arch: arch.to_owned(),
+                        });
+                    }
+                }
+            }
+        }
+    }
+
+    findings
+}
+
+#[allow(clippy::collapsible_if)]
+fn check_defaults(
+    arch: &Option<String>,
+    var_symbol: &str,
+    info: &AttributeDef,
+    args: &AnalysisArgs,
+) -> Vec<Finding> {
+    let mut findings = Vec::new();
+    let mut seen_conditions = HashSet::new();
+    let mut seen_values = HashSet::new();
+    let mut already_unconditional = false;
+
+    for default in &info.kconfig_defaults {
+        let val_str = default.expression.to_string();
+
+        if already_unconditional && args.is_enabled(Check::DeadDefault) {
+            findings.push(Finding {
+                severity: Severity::Warning,
+                check: Check::DeadDefault,
+                symbol: Some(var_symbol.to_owned()),
+                message: format!("dead default of {}", val_str),
+                arch: arch.to_owned(),
+            });
+        }
+
+        if args.is_enabled(Check::DuplicateDefaultValue) {
+            if default.r#if.is_some() && is_duplicate(&mut seen_values, val_str.clone()) {
+                findings.push(Finding {
+                    severity: Severity::Style,
+                    check: Check::DuplicateDefaultValue,
+                    symbol: Some(var_symbol.to_owned()),
+                    message: format!(
+                        "duplicate default value of {}; consider combining the conditions with a logical-or: ||",
+                        val_str
+                    ),
+                    arch: arch.to_owned(),
+                });
+            }
+        }
+
+        match &default.r#if {
+            Some(cond) => {
+                if is_duplicate(&mut seen_conditions, cond.to_string()) {
+                    if is_duplicate(&mut seen_values, val_str.clone()) {
+                        if args.is_enabled(Check::DuplicateDefault) {
+                            findings.push(Finding {
+                                severity: Severity::Warning,
+                                check: Check::DuplicateDefault,
+                                symbol: Some(var_symbol.to_owned()),
+                                message: format!("duplicate default condition of {:?}", cond),
+                                arch: arch.to_owned(),
+                            });
+                        }
+                    } else {
+                        if args.is_enabled(Check::DeadDefault) {
+                            findings.push(Finding {
+                                severity: Severity::Warning,
+                                check: Check::DeadDefault,
+                                symbol: Some(var_symbol.to_owned()),
+                                message: format!("dead default of {}", val_str),
+                                arch: arch.to_owned(),
+                            });
+                        }
+                    }
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
index 000000000000..4ca85ee3b994
--- /dev/null
+++ b/scripts/kconfirm/kconfirm-lib/src/dead_links.rs
@@ -0,0 +1,83 @@
+// SPDX-License-Identifier: GPL-2.0-only
+use regex::Regex;
+use std::sync::OnceLock;
+use std::time::Duration;
+use ureq::{
+    Agent,
+    tls::{RootCerts, TlsConfig, TlsProvider},
+};
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
+static AGENT: OnceLock<Agent> = OnceLock::new();
+
+fn agent() -> &'static Agent {
+    const TEN_SECONDS: Duration = Duration::from_secs(10);
+
+    AGENT.get_or_init(|| {
+        Agent::config_builder()
+            .timeout_global(Some(TEN_SECONDS))
+            .max_redirects(0) // we want to output any redirects as a finding
+            .http_status_as_error(false)
+            .tls_config(
+                TlsConfig::builder()
+                    .provider(TlsProvider::NativeTls)
+                    .root_certs(RootCerts::PlatformVerifier)
+                    .build(),
+            )
+            .build()
+            .into()
+    })
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
+    match agent().head(url).call() {
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
index 000000000000..4163437a2e7e
--- /dev/null
+++ b/scripts/kconfirm/kconfirm-lib/src/lib.rs
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: GPL-2.0-only
+use nom_kconfig::Entry;
+use nom_kconfig::{KconfigInput, parse_kconfig};
+
+pub mod output;
+use output::*;
+
+pub mod symbol_table;
+use symbol_table::*;
+
+mod dead_links;
+
+mod checks;
+pub use checks::{AnalysisArgs, Check, check_select_visible, check_variable_info, parse_check};
+
+mod analyze;
+use analyze::*;
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
+                findings.push(Finding {
+                    severity: Severity::Fatal,
+                    check: Check::FailedParse,
+                    symbol: None,
+                    message: format!("Failed to parse kconfig, error is: {}", e),
+                    arch: None,
+                });
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
+
+        if args.is_enabled(Check::SelectVisible) {
+            findings.extend(check_select_visible(var_symbol, type_info));
+        }
+    }
+
+    findings
+}
diff --git a/scripts/kconfirm/kconfirm-lib/src/output.rs b/scripts/kconfirm/kconfirm-lib/src/output.rs
new file mode 100644
index 000000000000..755fcd30dcaf
--- /dev/null
+++ b/scripts/kconfirm/kconfirm-lib/src/output.rs
@@ -0,0 +1,114 @@
+// SPDX-License-Identifier: GPL-2.0-only
+use std::fmt;
+
+use crate::Check;
+
+#[derive(Debug, PartialEq, Eq, PartialOrd, Ord)]
+pub enum Severity {
+    Fatal,
+    Error, // will be used for known bugs, e.g. unmet dependencies
+    Warning,
+    Style,
+}
+
+#[derive(Debug)]
+pub struct Finding {
+    pub severity: Severity,
+    pub check: Check,
+    pub symbol: Option<String>,
+    pub message: String,
+    pub arch: Option<String>,
+}
+
+impl Finding {
+    fn fmt_with_arches(&self, f: &mut fmt::Formatter, arches: &[&str]) -> fmt::Result {
+        let arch_part = if arches.is_empty() {
+            String::new()
+        } else {
+            format!(" [{}]", arches.join(", "))
+        };
+
+        match &self.symbol {
+            Some(s) => write!(
+                f,
+                "{} [{}]{} config {}: {}",
+                self.severity,
+                self.check.as_str(),
+                arch_part,
+                s,
+                self.message
+            ),
+            None => write!(
+                f,
+                "{} [{}]{} {}",
+                self.severity,
+                self.check.as_str(),
+                arch_part,
+                self.message
+            ),
+        }
+    }
+}
+
+impl fmt::Display for Finding {
+    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
+        self.fmt_with_arches(f, &[])
+    }
+}
+
+pub fn print_findings(mut findings: Vec<Finding>) {
+    findings.sort_by(|a, b| {
+        (
+            &a.severity,
+            a.check.as_str(),
+            &a.symbol,
+            &a.message,
+            &a.arch,
+        )
+            .cmp(&(
+                &b.severity,
+                b.check.as_str(),
+                &b.symbol,
+                &b.message,
+                &b.arch,
+            ))
+    });
+
+    for group in findings.chunk_by(|a, b| {
+        a.severity == b.severity
+            && a.check.as_str() == b.check.as_str()
+            && a.symbol == b.symbol
+            && a.message == b.message
+    }) {
+        let head = &group[0];
+
+        let mut arches: Vec<&str> = Vec::new();
+        for f in group {
+            if let Some(a) = f.arch.as_deref() {
+                if arches.last() != Some(&a) {
+                    arches.push(a);
+                }
+            }
+        }
+
+        // Use a small wrapper so we can call our custom formatter via println!
+        struct Wrap<'a>(&'a Finding, &'a [&'a str]);
+        impl fmt::Display for Wrap<'_> {
+            fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
+                self.0.fmt_with_arches(f, self.1)
+            }
+        }
+        println!("{}", Wrap(head, &arches));
+    }
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
diff --git a/scripts/kconfirm/kconfirm-lib/src/symbol_table.rs b/scripts/kconfirm/kconfirm-lib/src/symbol_table.rs
new file mode 100644
index 000000000000..27746d7f7194
--- /dev/null
+++ b/scripts/kconfirm/kconfirm-lib/src/symbol_table.rs
@@ -0,0 +1,228 @@
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
+// everything is a vector because we may encounter multiple over time,
+//   so we won't know until the end what the condition is.
+#[derive(Debug, Clone)]
+pub struct AttributeDef {
+    pub kconfig_dependencies: Vec<OrExpression>,
+    pub kconfig_ranges: Vec<Range>,
+    pub kconfig_defaults: Vec<DefaultAttribute>,
+    pub visibility: Vec<Option<OrExpression>>,
+    pub selects: Vec<(KconfigSymbol, Cond)>,
+    pub implies: Vec<(KconfigSymbol, Cond)>,
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
+    // TODO: we should consider having separate functions for:
+    // 1. merge-inserting a redef of attributes (NOTE: the type definition is actually part of the redef, but we aren't handling type-redefinitions for now)
+    // 2. selectors
+    fn insert(
+        &mut self,
+        kconfig_type: Option<Type>,
+        raw_constraints: Vec<OrExpression>,
+        kconfig_ranges: Vec<Range>,
+        kconfig_defaults: Vec<DefaultAttribute>,
+        visibility: Vec<Option<OrExpression>>,
+        arch: Option<String>,
+        definition_condition: Vec<OrExpression>,
+        selected_by: Option<(KconfigSymbol, Cond)>,
+        selects: Vec<(KconfigSymbol, Cond)>,
+        implies: Vec<(KconfigSymbol, Cond)>,
+    ) {
+        // type merge
+        match (&self.kconfig_type, &kconfig_type) {
+            (None, Some(_)) => self.kconfig_type = kconfig_type.clone(),
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
+        // variable_info merge:
+        //   we only want to add an attribute redefinition if the things in the attribute def aren't empty
+        //   (the visibility is just additional info to capture)
+        if (&kconfig_type).is_some() // we need to ensure that we have an empty definition here if the config option had a type definition
+            || !raw_constraints.is_empty()
+            || !kconfig_ranges.is_empty()
+            || !kconfig_defaults.is_empty()
+            || !selects.is_empty()
+            || !implies.is_empty()
+        {
+            insert_variable_info(
+                &mut self.attribute_defs,
+                arch,
+                definition_condition,
+                AttributeDef {
+                    kconfig_dependencies: raw_constraints,
+                    kconfig_ranges,
+                    kconfig_defaults,
+                    visibility,
+                    selects,
+                    implies,
+                },
+            );
+        }
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
+        visibility: Vec<Option<OrExpression>>,
+        arch: Arch,
+        definition_condition: Vec<OrExpression>,
+        selected_by: Option<(KconfigSymbol, Cond)>,
+        selects: Vec<(KconfigSymbol, Cond)>,
+        implies: Vec<(KconfigSymbol, Cond)>,
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
+                    implies,
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
+                    implies,
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
+        .or_default() // empty vec
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
+        .or_default() // empty vec
+        .push((definition_condition, info));
+}
diff --git a/scripts/kconfirm/kconfirm-linux/Cargo.toml b/scripts/kconfirm/kconfirm-linux/Cargo.toml
new file mode 100644
index 000000000000..aae77494f624
--- /dev/null
+++ b/scripts/kconfirm/kconfirm-linux/Cargo.toml
@@ -0,0 +1,12 @@
+[package]
+name = "kconfirm-linux"
+version = "0.9.0"
+edition = "2024"
+rust-version.workspace = true
+
+[dependencies]
+kconfirm-lib = { path = "../kconfirm-lib" }
+nom-kconfig = { workspace = true }
+log = { workspace = true }
+env_logger = { workspace = true }
+clap = { workspace = true }
diff --git a/scripts/kconfirm/kconfirm-linux/src/lib.rs b/scripts/kconfirm/kconfirm-linux/src/lib.rs
new file mode 100644
index 000000000000..e6142fec6e55
--- /dev/null
+++ b/scripts/kconfirm/kconfirm-linux/src/lib.rs
@@ -0,0 +1,119 @@
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
+// this maps the directory to the config option
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
+    // iterate only architecture subdirectories under arch/
+    for entry in std::fs::read_dir(&arch_dir_path)? {
+        let entry = entry?;
+
+        if !entry.file_type()?.is_dir() {
+            continue;
+        }
+
+        let arch_dir = entry.file_name().to_string_lossy().to_string();
+        let arch_path = entry.path();
+
+        // only parse:
+        //   arch/<arch>/Kconfig
+        //   arch/<arch>/Kconfig.debug
+        let candidate_files = [arch_path.join("Kconfig"), arch_path.join("Kconfig.debug")];
+
+        for path in candidate_files {
+            if !path.is_file() {
+                continue;
+            }
+
+            let relative_path = match path.strip_prefix(&linux_root) {
+                Ok(p) => p.to_path_buf(),
+                Err(_) => continue,
+            };
+
+            let kconfig_file = KconfigFile::new(linux_root.clone(), relative_path);
+
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
index 000000000000..cd12985a900d
--- /dev/null
+++ b/scripts/kconfirm/kconfirm-linux/src/main.rs
@@ -0,0 +1,82 @@
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
+        // need SMT solving before we can detect select-undefineds
+        //Check::SelectUndefined,
+        Check::DuplicateDependency,
+        Check::DuplicateRange,
+        Check::DeadRange,
+        Check::DuplicateSelect,
+        Check::DeadSelect,
+        Check::DeadDefault,
+        Check::DuplicateDefault,
+        Check::ConstantCondition,
+        Check::DuplicateImply,
+        Check::DeadImply,
+        Check::ReverseRange,
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
diff --git a/scripts/kconfirm/vendor_dependencies.sh b/scripts/kconfirm/vendor_dependencies.sh
new file mode 100644
index 000000000000..110321f54276
--- /dev/null
+++ b/scripts/kconfirm/vendor_dependencies.sh
@@ -0,0 +1 @@
+cargo vendor-filterer   --platform "*-unknown-linux-gnu"   --tier 2      --exclude-crate-path curl-sys#curl   --exclude-crate-path libz-sys#src/zlib   --exclude-crate-path libz-sys#src/*.c   --exclude-crate-path libz-sys#src/zlib-ng   --exclude-crate-path ring#pregenerated/*.o   --exclude-crate-path "*#tests"   --exclude-crate-path "*#*.md"
-- 
2.53.0


