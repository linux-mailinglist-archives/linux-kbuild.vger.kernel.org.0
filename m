Return-Path: <linux-kbuild+bounces-2091-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A9E9049A6
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Jun 2024 05:29:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 554281C202CA
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Jun 2024 03:29:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75FA2179B7;
	Wed, 12 Jun 2024 03:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TfZ3uEfp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498041DFF0;
	Wed, 12 Jun 2024 03:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718162942; cv=none; b=XvT/MI32Vsji8y/oNowHxltHzljyG5dvQh7ldnFRInlKw6QTPNLNFa+COsr9A/inlLjfYDqv6eByqwI3kzgs1JmXDrYgwmDtkipKYbDOgvsRB0bnihqqT00rvodgkeQF0i+l2OzwET2ACAx0DqsA5w7maemtb9nQHWmL/SHAois=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718162942; c=relaxed/simple;
	bh=dzytYAPA2vntPxLFoQACxn5mDGtGCdAdzSX3DYn4Sy0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QPC8fTD6kj5Hz9We0N1huk7sWeuyNhc9DaAxLHeewxgXJNl8cP8FbqsmK4ofn8jIzUk3ODZIGKHDHIYIrY74cCn6L5OmZoQngX6xBqnWmhwqBCyfsH0v6cDn/FhAOa0llwoevCntiOjUFahv9GVWrqqWOgCLJ/NYITyfYmxRa88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TfZ3uEfp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D1EEDC32786;
	Wed, 12 Jun 2024 03:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718162941;
	bh=dzytYAPA2vntPxLFoQACxn5mDGtGCdAdzSX3DYn4Sy0=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=TfZ3uEfp1sH8DRTaiFN3apxLEzXcEDhJjfHsGkQ5VlIoPBxuj6Ms+6iQZtJaPoY0s
	 gQXyoPncqufuYUTX1IFiR2iQkpGIfre2JTpQL60NhLzwIiyFPLjMik0A9FcpIr7VFC
	 18qIsLPh2I3TAPFZgcMt1IWHqEyhP54YvGsoks8zRvMYfIlRE4YzS/Ly7/W4i4FFXV
	 6L6+VfT6odL7ELpbA5J4Je2/q0gjrvBSfa77grZyVdeiCgw1/gd8vFDhz3y7kgWH60
	 lKLiYEddd8VfYyg10u9eZ7/uPGxQXT5MNWY6/6MYL1cwyy+Kpfbs3JncZBM9masQ5R
	 atq8xh9UXLY7w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C45E6C27C53;
	Wed, 12 Jun 2024 03:29:01 +0000 (UTC)
From: Dmitry Safonov via B4 Relay <devnull+0x7f454c46.gmail.com@kernel.org>
Date: Wed, 12 Jun 2024 04:27:17 +0100
Subject: [PATCH RFC v2] kbuild/x86: Use $(KBUILD_AFLAGS) in Kbuild's
 version of $(as-instr)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-as-instr-opt-wrussq-v2-1-bd950f7eead7@gmail.com>
X-B4-Tracking: v=1; b=H4sIAJUVaWYC/22OzQrCMBCEX0X27EqTBjWeBMEH8Co9bOO2Ddgfs
 7Uqpe9uWjx6nGG+mRlBOHgWOKxGCDx48W0ThV6vwFXUlIz+FjXoRJvEqARJ0DfSB2y7Hl/hKfJ
 As2eX7jjd6sRAJLvAhX8vrVe4nE+QRTMnYcwDNa6aC2uSnsOcrrz0bfgsFwa1ML819XdtUKjQ2
 lyRImsLmx7Lmvx949oasmmavuAli9LUAAAA
To: Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
 "H. Peter Anvin" <hpa@zytor.com>, Masahiro Yamada <masahiroy@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 Dmitry Safonov <0x7f454c46@gmail.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718162850; l=6387;
 i=0x7f454c46@gmail.com; s=20240410; h=from:subject:message-id;
 bh=mE/MtJBn2tZ2pMC+jU16KAPPWHc/zIAQ99jOTODDD5E=;
 b=+ml6hQMsHqv7+mqb7hjrBh5lDWB7+8/2dGtaJhoUzvYoMQcYXrueH858HPd3C/nuBRFU8VOueaEV
 n5HA69KaAboO5X0CfNO40u34XTuavXrpBuLRgEQvfP5TjJX+IPce
X-Developer-Key: i=0x7f454c46@gmail.com; a=ed25519;
 pk=cFSWovqtkx0HrT5O9jFCEC/Cef4DY8a2FPeqP4THeZQ=
X-Endpoint-Received: by B4 Relay for 0x7f454c46@gmail.com/20240410 with
 auth_id=152
X-Original-From: Dmitry Safonov <0x7f454c46@gmail.com>
Reply-To: 0x7f454c46@gmail.com

From: Dmitry Safonov <0x7f454c46@gmail.com>

At Arista some products use compatible 32-bit userspace running on x86.
As a part of disto build for ia32 it also compiles the 64-bit kernel.
While the toolchain for the kernel build is yet the same, with 64-bit gcc:
> / @Bru-na-Boinne% file /usr/bin/gcc-11
> /usr/bin/gcc-11: ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=6571ad50d8f12eece053f1bac7a95a2c767f32c9, for GNU/Linux 3.2.0, stripped

It seems that gcc is being smart and detects that it's running in
a 32-bit container (personality flag? 32-bit mmap base? something else
inherited post-exec?  haven't yet figured it out) and by default tries
to build 32-bit binaries.

That results in a failing toolchain check:
> / @Bru-na-Boinne% printf "%b\n" "wrussq %rax, (%rbx)" | /usr/bin/gcc-11 -Wa,--fatal-warnings -c -x assembler-with-cpp -o /dev/null -
> <stdin>: Assembler messages:
> <stdin>:1: Error: `wrussq' is only supported in 64-bit mode

Which passes when -m64 is directly specify for the build check:
> / @Bru-na-Boinne% printf "%b\n" "wrussq %rax, (%rbx)" | /usr/bin/gcc-11 -m64 -Wa,--fatal-warnings -c -x assembler-with-cpp -o /dev/null -
> / @Bru-na-Boinne% echo $?
> 0

As a result, kbuild produces different value for CONFIG_AS_WRUSS
for native 64-bit containers and ia32 containers with 64-bit gcc,
which produces different kernels with enabled/disabled
CONFIG_X86_USER_SHADOW_STACK.

arch/x86/Makefile already properly defines KBUILD_AFLAGS += -m64,
which is luckly already available at the point of toolchain check
in arch/x86/Kconfig.assembler

By hacking around Kbuild variable the following way:
> --- a/scripts/Kconfig.include
> +++ b/scripts/Kconfig.include
> @@ -13,7 +13,8 @@ left_paren  := (
>
>  # $(if-success,<command>,<then>,<else>)
>  # Return <then> if <command> exits with 0, <else> otherwise.
> -if-success = $(shell,{ $(1); } >/dev/null 2>&1 && echo "$(2)" || echo "$(3)")
> +if-success = $(shell,echo '$(1)' 1>&2;{ $(1); } >/dev/null 2>&1 && echo "$(2)" || echo "$(3)")

I got the following output for the toolchain check, before:
> linux @Bru-na-Boinne% make ARCH=x86_64 oldconfig V=1 2>&1 | grep wrus
> printf "%b\n" "wrussq %rax,(%rbx)" | gcc  -c -x assembler-with-cpp -o /dev/null -

and after:
> linux @Bru-na-Boinne% make ARCH=x86_64 oldconfig V=1 2>&1 | grep wrus
> printf "%b\n" "wrussq %rax,(%rbx)" | gcc -D__ASSEMBLY__ -fno-PIE -m64 -c -x assembler-with-cpp -o /dev/null -

Which seems appropriate to me.
This also reflects the existing definition in scripts/Makefile.compiler
for $(as-instr) that already has $(KBUILD_AFLAGS).

In order to eliminate a possible circular dependency of
Kconfig => arch/.../Makefile => Kconfig => ...
which exist i.e. in arm64/Makefile for KASAN_SHADOW_SCALE_SHIFT that
depends on CONFIG_KASAH_SW_TAGS and CONFIG_KASAN_GENERIC kconfigs,
ignore KBUILD_AFLAGS difference in auto.conf.cmd as it is expected that
the variable will differ between fist and later Makefile passes.
Use that in Kconfig toolchain checks.

Signed-off-by: Dmitry Safonov <0x7f454c46@gmail.com>
---
Changes in v2:
- I made a mistake in version 1 by not testing it on a clean tree.
  Which passed on an existing "dirty" tree, but went into build
  busy-loop over a fresh clean kernel tree. With a little debug,
  I found out that the reason was subdir-asflags-y in scripts/.
  They are "empty", but they update KBUILD_AFLAGS with an extra
  trailing space. Ugh.
  That resulted in include/config/auto.conf.cmd being unhappy and
  triggering rebuild after rebuild.
- Then I've added a patch to scripts/kconfig/preprocess.c that removes
  any extra head or tail spaces from the environment variables.
- That was a working patch set on x86_64, but that broke arm64 by
  creating a circular dependency on KASAN_SHADOW_SCALE_SHIFT.
- In the end, I decided to just ignore KBUILD_AFLAGS in auto.conf.cmd
  for RFC v2. Probably, I could just add $(as-instr-config,...)
  function to Kconfig that would take -m64 just for AS_WRUSS,
  but that seems like fixing one specific place, rather than more
  generic fix. Unsure, sending this as RFC, please advise/vote on
  the best approach.
- Link to v1: https://lore.kernel.org/r/20240411-as-instr-opt-wrussq-v1-1-99b1a1a99f93@gmail.com
---
 scripts/Kconfig.include      |  2 +-
 scripts/kconfig/preprocess.c | 14 +++++++++++++-
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
index 3ee8ecfb8c04..d8574c1faf2d 100644
--- a/scripts/Kconfig.include
+++ b/scripts/Kconfig.include
@@ -33,7 +33,7 @@ ld-option = $(success,$(LD) -v $(1))
 
 # $(as-instr,<instr>)
 # Return y if the assembler supports <instr>, n otherwise
-as-instr = $(success,printf "%b\n" "$(1)" | $(CC) $(CLANG_FLAGS) -Wa$(comma)--fatal-warnings -c -x assembler-with-cpp -o /dev/null -)
+as-instr = $(success,printf "%b\n" "$(1)" | $(CC) $(CLANG_FLAGS) $(KBUILD_AFLAGS) -Wa$(comma)--fatal-warnings -c -x assembler-with-cpp -o /dev/null -)
 
 # check if $(CC) and $(LD) exist
 $(error-if,$(failure,command -v $(CC)),C compiler '$(CC)' not found)
diff --git a/scripts/kconfig/preprocess.c b/scripts/kconfig/preprocess.c
index f0a4a218c4a5..cf7389f13f00 100644
--- a/scripts/kconfig/preprocess.c
+++ b/scripts/kconfig/preprocess.c
@@ -61,6 +61,17 @@ static void env_del(struct env *e)
 	free(e);
 }
 
+static bool env_ignore(const char *name)
+{
+	/*
+	 * Break the circular dependency Kconfig => arch/.../Makefile => Kconfig
+	 * On the first Makefile pass only AFLAGS that do not depend on
+	 * CONFIG_* set will be defined. Those are used by Kconfig for
+	 * toolchain checks.
+	 */
+	return !strcmp(name, "KBUILD_AFLAGS");
+}
+
 /* The returned pointer must be freed when done */
 static char *env_expand(const char *name)
 {
@@ -83,7 +94,8 @@ static char *env_expand(const char *name)
 	 * We need to remember all referenced environment variables.
 	 * They will be written out to include/config/auto.conf.cmd
 	 */
-	env_add(name, value);
+	if (!env_ignore(name))
+		env_add(name, value);
 
 	return xstrdup(value);
 }

---
base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
change-id: 20240410-as-instr-opt-wrussq-48ec37e36204

Best regards,
-- 
Dmitry Safonov <0x7f454c46@gmail.com>



