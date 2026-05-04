Return-Path: <linux-kbuild+bounces-12988-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Ap1HtSX+GknwwIAu9opvQ
	(envelope-from <linux-kbuild+bounces-12988-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 04 May 2026 14:57:56 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5544BD4D8
	for <lists+linux-kbuild@lfdr.de>; Mon, 04 May 2026 14:57:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E14BB3006823
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 May 2026 12:57:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80D873D6476;
	Mon,  4 May 2026 12:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SZvJylww"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6AEF3D47C3
	for <linux-kbuild@vger.kernel.org>; Mon,  4 May 2026 12:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777899471; cv=none; b=Jr4RKp8+WRiBQqiGuePlGmJp1JX4lFTFKpuR8ZmwOssvjGCj9MZfORD/usTcuQFluTcmarUaI003+dImLyIZYci0ChSp71AA0vXYIVKSAR5vNOLYnvCBXmDR/nCcSpEt4LDGcbftM1hCdyRaIcV8ykBwe9gcIiiZXit/KavbYNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777899471; c=relaxed/simple;
	bh=JpKw4YGYZqTSeDouLbV/J5I+mhkq6/HGzXNcBfTURsA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=EvDk90mOLX1f5SBOBNOEVSCwm1n/Q33UuqGYoC1YHK9JGM26rQIrH0hV9kaJfR4+TZzs26kmbrElqgggentRefwwjJWO1kkO8mJ3JC1jnnqJcT1UDEVK+UuBvT6M7fMlTBB0NHowemguEmj1mD7W2RsCOKsgu2YZNSoa4+swWUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SZvJylww; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-bc34159f48dso39795066b.1
        for <linux-kbuild@vger.kernel.org>; Mon, 04 May 2026 05:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777899468; x=1778504268; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4Zg+P5Ciirgaisv29teHnbm3lGZWHfTdji8uo+YNlso=;
        b=SZvJylwwsv0ocw7/Y1uUu35YfV1EdPt8qxUXlIsbjAwKfygBR49sHs3KJT3CKKHjBX
         F5BmVrDAVXiYGJp4A01dm0t963UutfFC+4CrIq9Uue8gTQzAQrvXvnOtkL8DS2qX506u
         24VTWlh0Sl//9ySf2QFP1OOO4HmGyJpba28OVxUL7JIxcc27fOz3VtpIirZmHsAk/hDg
         gTf3wEl2h0P+QAVbxybNSR8es23JpeG+psZ/CMY4V5VIxAXDnq/HnYOWCTdIzAx18AzJ
         OPl3f/24rglhxJy/vP2B7+BF1cEN2lqpIbFXIdDSNsvqqdlT9TZHmAJ1P59rufVKeI07
         OSfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777899468; x=1778504268;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4Zg+P5Ciirgaisv29teHnbm3lGZWHfTdji8uo+YNlso=;
        b=kf3bQ/HTmG1eI37J1RzCVqYRfbIEDu+P+GiYEhfZwcAyX3gdDNsIpryMWOWGKtqWv3
         juBfa7ch9z8oZsxmOOwtLrYaiRP7vZ2vtIxI9x7g5ZdXgX81kjOE4satjqojb6rmhaCh
         We0IMvT5VWmhVtqdRAPzcwUgP51uS6/WxkpG9BN6qQJmtouqxAFHgFnJeUmQ3MM01arD
         oYbAfHmCk4YCJ7MvD2yROsM7xAMsnfQLL7xCiYS5Emg0tGzIxyE+mvqUzA8I8JxXmIlt
         N8sAsV4JJ8hIZ/L4tLkdykcXOeh3KL1voDqWhVk0Odt1xXt7AzIyZzpk0198JaPEjudn
         9KsA==
X-Forwarded-Encrypted: i=1; AFNElJ9dnwvwOrjTXtqLFZRyxfVTTl2hSqPMkll5wMqnpV8wN42mK/q98Bq/UiFG7dhgzSEIwa0MpwbkkdMGAZ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzX8a7rQv8kWDGcVJR0UcHuJxtOy9Jf+2AaT2wC4+4p63LB/+DB
	RiG7lZV3BgfcrkSg/enQuks0QPR3pB7X6Bph1oCP5tmsl9dqWGMPdNWiaOERU8GRkvUv6cVFf0X
	ZVoKhRwdS9hsH2z4GYA==
X-Received: from eddp19.prod.google.com ([2002:a05:6402:46d3:b0:676:3630:b7f9])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:80e:b0:baa:1db1:ef9b with SMTP id a640c23a62f3a-bbff992c153mr499332666b.18.1777899467950;
 Mon, 04 May 2026 05:57:47 -0700 (PDT)
Date: Mon, 04 May 2026 12:57:37 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMGX+GkC/x2MQQ5AMBAAvyJ7tklVi/iKOFCLvajsIhLxd43jJ
 DPzgJIwKbTZA0IXK8ctQZFnENZhWwh5SgzW2Mp441BOPQLG/UgiBomqWI/eujmU3k0NpHAXmvn +p13/vh8w427wZAAAAA==
X-Change-Id: 20260504-rustc-option-cross-7b524fc354d8
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=4375; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=JpKw4YGYZqTSeDouLbV/J5I+mhkq6/HGzXNcBfTURsA=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBp+JfGB0Q2qinQ0FAwhZoBoMieWhmyYsAhdzQ/Y
 V1a3PG2x6WJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCafiXxgAKCRAEWL7uWMY5
 Rt2yD/9d+F5SkEGar3glfqRRwNrM28H7EkLbjdv55qgJ9gpwGh6aXPx2RS/P+YKITwkYQF1uKRA
 BqvPJcOGgRj6Ut8ujVA2wLAGnMBio3k/PmWv3u0k6/jhclmze25AoBIPlMcQhNm+5ILRbkTXuAj
 9z6FjbUEciC1s6p2urzpeYm0FZO/ggcy4nKCUJ3zPXwM3yVS+E6Nj6SngQsZUDCPozXoHVvHatP
 xl05HV9tSpl0kchRvcL+MsRxlvv0slFlc7hvHd7UDrxDQn1HHuQSH6Slu+fiYaC/z5KmWnKHBDu
 9Qsn1ebtgntv6eFHYfZ012pcfCDttMPLar5P9+Re7wZvul+lc4j8NkMdUEvAYNv5kmFzcOwM9Hn
 BdAP170NqWxlUmsOZvM+0JUBDrDWn+k9ea/N5I+wp5eyG7cTORFzPMB2+sW7g8IWG3L1/rjHOTB
 z3t3x+aeMFXfwsbffBef6ykPeJpFwaHvSNppCkSPlDMJELSmbPPelk6WHJk0MeQpbK1lZHXez4d
 BPJ6ig+nVuLQBIXU7AxcLgzH68IVeuMNvLzhbJU3KiRwgc0nJLGeFJHM6kCMUHss5zzYzmR7Hhy
 FYc1SmbQTOgzZg+GxgUgsWEIHWR6uV5uk36SHuAoW8ObwRCn6gizw46Zpaww+NXRndHxuQuhrSe dPNORfqF8ZEDdvQ==
X-Mailer: b4 0.14.3
Message-ID: <20260504-rustc-option-cross-v1-1-09f2726b680f@google.com>
Subject: [PATCH] rust: kasan/kbuild: fix rustc-option when cross-compiling
From: Alice Ryhl <aliceryhl@google.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	stable@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Queue-Id: 1A5544BD4D8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12988-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,google.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

The Makefile version of rustc-option currently checks whether the option
exists for the host target instead of the target actually being compiled
for. It was done this way in commit 46e24a545cdb ("rust: kasan/kbuild:
fix missing flags on first build") to avoid a circular dependency on
target.json. However, because of this, rustc-option currently does not
function when cross-compiling from x86_64 to aarch64 if
CONFIG_SHADOW_CALL_STACK is enabled. This is because KBUILD_RUSTFLAGS
contains -Zfixed-x18 under this configuration. Since that flag does not
exist on the host target, rustc-option runs into a compilation failure
every time, leading to all flags being rejected as unsupported.

To fix this, update rustc-option to pass a --target parameter so that
the host target is not used. For targets using target.json, use a
built-in target that is as close as possible to the target created with
target.json to avoid the circular dependency on target.json.

One scenario where this causes a boot failure:
* Cross-compiled from x86_64 to aarch64.
* With CONFIG_SHADOW_CALL_STACK=y
* With CONFIG_KASAN_SW_TAGS=y
* With CONFIG_KASAN_INLINE=n
Then the resulting kernel image will fail to boot when it first calls
into Rust code with a crash along the lines of "Unable to handle kernel
paging request at virtual address 0ffffffc08541796". This is because the
call threshold is not specified, so rustc will inline kasan operations,
but the kasan shadow offset is not specified, which leads to the inlined
kasan instructions being incorrect.

The above scenario actually also fails without -Zfixed-x18 since the
SW_TAGS sanitizer itself is aarch64-specific. But it's a problem with
normal KASAN too because of -Zfixed-x18.

Cc: stable@vger.kernel.org
Fixes: 46e24a545cdb ("rust: kasan/kbuild: fix missing flags on first build")
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 arch/x86/Makefile         | 4 ++++
 arch/x86/Makefile.um      | 8 ++++++++
 scripts/Makefile.compiler | 2 +-
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index 46fec0b08487..1d526a5d2a83 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -77,6 +77,10 @@ KBUILD_CFLAGS += -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -mno-sse4a
 KBUILD_RUSTFLAGS += --target=$(objtree)/scripts/target.json
 KBUILD_RUSTFLAGS += -Ctarget-feature=-sse,-sse2,-sse3,-ssse3,-sse4.1,-sse4.2,-avx,-avx2
 
+# The target.json file is not available when invoking rustc-option, so use the
+# built-in target when checking whether flags are supported instead.
+KBUILD_RUSTFLAGS_OPTION_CHKS += --target=x86_64-unknown-none
+
 #
 # CFLAGS for compiling floating point code inside the kernel.
 #
diff --git a/arch/x86/Makefile.um b/arch/x86/Makefile.um
index 19c13afa474e..9adecd65639f 100644
--- a/arch/x86/Makefile.um
+++ b/arch/x86/Makefile.um
@@ -14,6 +14,14 @@ endif
 
 KBUILD_RUSTFLAGS += --target=$(objtree)/scripts/target.json
 
+# The target.json file is not available when invoking rustc-option, so use the
+# built-in target when checking whether flags are supported instead.
+ifeq ($(CONFIG_X86_32),y)
+KBUILD_RUSTFLAGS_OPTION_CHKS += --target=i686-unknown-linux-gnu
+else
+KBUILD_RUSTFLAGS_OPTION_CHKS += --target=x86_64-unknown-linux-gnu
+endif
+
 ifeq ($(CONFIG_X86_32),y)
 START := 0x8048000
 
diff --git a/scripts/Makefile.compiler b/scripts/Makefile.compiler
index ef91910de265..06bbe29c846c 100644
--- a/scripts/Makefile.compiler
+++ b/scripts/Makefile.compiler
@@ -80,7 +80,7 @@ ld-option = $(call try-run, $(LD) $(KBUILD_LDFLAGS) $(1) -v,$(1),$(2),$(3))
 # TODO: remove RUSTC_BOOTSTRAP=1 when we raise the minimum GNU Make version to 4.4
 __rustc-option = $(call try-run,\
 	echo '$(pound)![allow(missing_docs)]$(pound)![feature(no_core)]$(pound)![no_core]' | RUSTC_BOOTSTRAP=1\
-	$(1) --sysroot=/dev/null $(filter-out --sysroot=/dev/null --target=%,$(2)) $(3)\
+	$(1) --sysroot=/dev/null $(KBUILD_RUSTFLAGS_OPTION_CHKS) $(filter-out --sysroot=/dev/null --target=%target.json,$(2)) $(3)\
 	--crate-type=rlib --out-dir=$(TMPOUT) --emit=obj=- - >/dev/null,$(3),$(4))
 
 # rustc-option

---
base-commit: 7fd2df204f342fc17d1a0bfcd474b24232fb0f32
change-id: 20260504-rustc-option-cross-7b524fc354d8

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>


