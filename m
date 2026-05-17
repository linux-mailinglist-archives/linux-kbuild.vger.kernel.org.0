Return-Path: <linux-kbuild+bounces-13212-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLTyCsRJCmqtzAQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13212-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 01:05:40 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D195F5643D7
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 01:05:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 28A50300F97D
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 23:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4AB93D565D;
	Sun, 17 May 2026 23:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="om0tmjJt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C080C3D5656;
	Sun, 17 May 2026 23:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779059132; cv=none; b=CTEzP7XeVH9CogVi9zphm62GCcX1GoO6A74RZvnHxQ8WgVzuEdEXGMPX41Iemj5suALeXFHoc3aOHufSeUVP+8mbNv4ZH2sf6kQq/ds5qDuM0oAETX0Lddsm5tgn1OVdiotZBySjglASUuGZFs3//x49Uu+YIJnox7LxOQeYdVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779059132; c=relaxed/simple;
	bh=rOmTabndOoOX7AmULUZroOZTY/ZAC4Q9umxkdxMQeds=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ly0CNGtPdRK6YoklrujDLgY1TmT34nYqu2D0OnmQz9/X9InJSYYVK2tM4Mc2oCyvve7Z41ZMYANI5LY73opwLKYxbvxSAYhsQGOxUSz75BejB6OJNASecvSa1aHjSl0jekatafJeIBvcPOlh5FRnwBfDXA93tz6RYbR5vM1iDBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=om0tmjJt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4335FC2BCB3;
	Sun, 17 May 2026 23:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779059132;
	bh=rOmTabndOoOX7AmULUZroOZTY/ZAC4Q9umxkdxMQeds=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=om0tmjJtiEXsd7zEymiSPQRCBV+VoM9SSR/41DFzBGphNGT2qBxd9dj5MhCQLNQaI
	 Df4aE0euUAlLQ4l4sZ4qztJpxQVeBdsYPXb1wnPW5EzngIT2pocIGrjckkuj+2hLpU
	 kg2bg5xApZdLeV7JWnvOnGnb/klp61O4cxeq4B2ESA0uBCo4AnRzHkU0/sli+xrJMJ
	 PaVYgpoA5NubciPbwYcREgkKh+pCsx6D4sjbv+D2vZW5A77OgBWoY1LWlj/2DZIEiZ
	 rcfXNIiIp0r+0FNcAVd1lmsfA2TpImCSZmE5AXzMzTHf1Da0+8yYGoGVw4YH0U/Thi
	 qeKF6NpVGqNsA==
From: Nathan Chancellor <nathan@kernel.org>
Date: Sun, 17 May 2026 13:05:04 -1000
Subject: [PATCH v2 01/16] kbuild: Bump minimum version of LLVM for building
 the kernel to 17.0.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260517-bump-minimum-supported-llvm-version-to-17-v2-1-b3b8cda46bdd@kernel.org>
References: <20260517-bump-minimum-supported-llvm-version-to-17-v2-0-b3b8cda46bdd@kernel.org>
In-Reply-To: <20260517-bump-minimum-supported-llvm-version-to-17-v2-0-b3b8cda46bdd@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 linux-kbuild@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=7199; i=nathan@kernel.org;
 h=from:subject:message-id; bh=rOmTabndOoOX7AmULUZroOZTY/ZAC4Q9umxkdxMQeds=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFlcnhsYTwYbsN8U8Pc086itCH4n8VviqZXqr2QtzaWXx
 V+2LU7vKGVhEONikBVTZKl+rHrc0HDOWcYbpybBzGFlAhnCwMUpABNxlWb4H+rhMKdL56DtESXd
 XlsJJgGPqg35mu82m9tcCbirprLoAsNv1tcFr6VvtNZfPFmmV7x08sWtWT8X2pWcae11D7qx71o
 HMwA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Rspamd-Queue-Id: D195F5643D7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13212-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,google.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linuxfoundation.org:email]
X-Rspamd-Action: no action

The current minimum version of LLVM for building the kernel is 15.0.0.
However, there are two deficiencies compared to GCC that were fixed in
LLVM 17 that are starting to become more noticeable.

The first was a bug in LLVM's scope checker [1], where all labels in a
function were validated as potential targets of an asm goto statement,
even if they were not listed in the asm goto statement as targets. This
becomes particularly problematic when the cleanup attribute is used, as

  asm goto(... : label_a);
  ...
label_a:
  ...
  int var __free(foo);
  asm goto(... : label_b);
  ...
label_b:
  ...

will trigger an error since the scope checker will complain that the
cleanup variable would be skipped when jumping from the first asm goto
to label_b (which obviously cannot happen). This issue was the catalyst
for commit e2ffa15b9baa ("kbuild: Disable CC_HAS_ASM_GOTO_OUTPUT on
clang < 17"). Unfortunately, this issue is reproducible with regular asm
goto in addition to asm goto with outputs, so that change was not
entirely sufficient to avoid the issue altogether. As asm goto has
effectively been required since commit a0a12c3ed057 ("asm goto:
eradicate CC_HAS_ASM_GOTO") and the usage of the cleanup attribute
continues to grow across the tree, raising the minimum to a version that
avoids this issue altogether is a better long term solution than
attempting to workaround it at every spot where it happens.

The second issue is an incompatibility with GCC 8.1+ around variables
marked with const being valid constant expressions for _Static_assert
and other macros [2]. With GCC 8.1 being the minimum supported version
since commit 118c40b7b503 ("kbuild: require gcc-8 and binutils-2.30"),
this incompatibility becomes more of a maintenance burden since only
clang-15 and clang-16 are affected by it.

Looking at the clang version of various major distributions through
Docker images, no one should be left behind as a result of this bump, as
the old ones cannot clear the current minimum of 15.0.0.

  archlinux:latest              clang version 22.1.3
  debian:oldoldstable-slim      Debian clang version 11.0.1-2
  debian:oldstable-slim         Debian clang version 14.0.6
  debian:stable-slim            Debian clang version 19.1.7 (3+b1)
  debian:testing-slim           Debian clang version 21.1.8 (3+b1)
  debian:unstable-slim          Debian clang version 21.1.8 (7+b1)
  fedora:42                     clang version 20.1.8 (Fedora 20.1.8-4.fc42)
  fedora:latest                 clang version 21.1.8 (Fedora 21.1.8-4.fc43)
  fedora:44                     clang version 22.1.1 (Fedora 22.1.1-2.fc44)
  fedora:rawhide                clang version 22.1.3 (Fedora 22.1.3-1.fc45)
  opensuse/leap:latest          clang version 17.0.6
  opensuse/tumbleweed:latest    clang version 21.1.8
  ubuntu:jammy                  Ubuntu clang version 14.0.0-1ubuntu1.1
  ubuntu:noble                  Ubuntu clang version 18.1.3 (1ubuntu1)
  ubuntu:questing               Ubuntu clang version 20.1.8 (0ubuntu4)
  ubuntu:resolute               Ubuntu clang version 21.1.8 (6ubuntu1)

17.0.1 is chosen as the minimum instead of 17.0.0 to ensure that the
particular version of LLVM 17 has the two aforementioned bugs fixed, as
the second was fixed during the 17.0.0 release candidate phase and it
was not until LLVM 18 that LLVM adopted the scheme of x.0.0 being a
prerelease version and x.1.0 is a release version [3] to help with
scenarios such as this.

Link: https://github.com/llvm/llvm-project/commit/f023f5cdb2e6c19026f04a15b5a935c041835d14 [1]
Link: https://github.com/llvm/llvm-project/commit/0b2d5b967d98375793897295d651f58f6fbd3034 [2]
Link: https://github.com/llvm/llvm-project/commit/4532617ae420056bf32f6403dde07fb99d276a49 [3]
Acked-by: Nicolas Schier <nsc@kernel.org>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org
---
 Documentation/process/changes.rst                    | 2 +-
 Documentation/translations/it_IT/process/changes.rst | 2 +-
 Documentation/translations/pt_BR/process/changes.rst | 2 +-
 scripts/min-tool-version.sh                          | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index 9a99037270ff..b9afce768446 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -36,7 +36,7 @@ bindgen (optional)     0.71.1           bindgen --version
 binutils               2.30             ld -v
 bison                  2.0              bison --version
 btrfs-progs            0.18             btrfs --version
-Clang/LLVM (optional)  15.0.0           clang --version
+Clang/LLVM (optional)  17.0.1           clang --version
 e2fsprogs              1.41.4           e2fsck -V
 flex                   2.5.35           flex --version
 gdb                    7.2              gdb --version
diff --git a/Documentation/translations/it_IT/process/changes.rst b/Documentation/translations/it_IT/process/changes.rst
index 7e93833b4511..7ee54c972418 100644
--- a/Documentation/translations/it_IT/process/changes.rst
+++ b/Documentation/translations/it_IT/process/changes.rst
@@ -33,7 +33,7 @@ PC Card, per esempio, probabilmente non dovreste preoccuparvi di pcmciautils.
         Programma       Versione minima       Comando per verificare la versione
 ====================== =================  ========================================
 GNU C                  8.1                gcc --version
-Clang/LLVM (optional)  13.0.0             clang --version
+Clang/LLVM (optional)  17.0.1             clang --version
 Rust (opzionale)       1.78.0             rustc --version
 bindgen (opzionale)    0.65.1             bindgen --version
 GNU make               4.0                make --version
diff --git a/Documentation/translations/pt_BR/process/changes.rst b/Documentation/translations/pt_BR/process/changes.rst
index 1964c1c93b34..6bbfe60fd973 100644
--- a/Documentation/translations/pt_BR/process/changes.rst
+++ b/Documentation/translations/pt_BR/process/changes.rst
@@ -31,7 +31,7 @@ PC Card por exemplo, provavelmente não precisará se preocupar com o pcmciautil
         Programa        Versão mínima       Comando para verificar a versão
 ====================== ===============  ========================================
 GNU C                  8.1              gcc --version
-Clang/LLVM (optional)  15.0.0           clang --version
+Clang/LLVM (optional)  17.0.1           clang --version
 Rust (optional)        1.78.0           rustc --version
 bindgen (optional)     0.65.1           bindgen --version
 GNU make               4.0              make --version
diff --git a/scripts/min-tool-version.sh b/scripts/min-tool-version.sh
index b96ec2d379b6..ea2689bc9641 100755
--- a/scripts/min-tool-version.sh
+++ b/scripts/min-tool-version.sh
@@ -27,7 +27,7 @@ llvm)
 	if [ "$SRCARCH" = loongarch ]; then
 		echo 18.0.0
 	else
-		echo 15.0.0
+		echo 17.0.1
 	fi
 	;;
 rustc)

-- 
2.54.0


