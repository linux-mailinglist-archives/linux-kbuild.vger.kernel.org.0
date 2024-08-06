Return-Path: <linux-kbuild+bounces-2870-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5ABB949C11
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Aug 2024 01:11:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FE891F24432
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2024 23:11:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9612F17AE09;
	Tue,  6 Aug 2024 23:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HSoAOz7r"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADAA17A5A0;
	Tue,  6 Aug 2024 23:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722985804; cv=none; b=FuWn7TSf8zjfYHK1Jfh8Dz7YLP/oLXZnwbTXX84g+9KPTTXH5aMsU8v0BAOcbHg9O21LRgGAQp5yRuFmsAN/zQr4I4Xv+/q+2gmWe7BJhzVllWfvj80J8EarjNWqn+lwLfiWbLC5plSMXvT70DsWYAKbgtU0tHqPcIJrsVKRtcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722985804; c=relaxed/simple;
	bh=gwRv4pCIfpi2yjceV4ySL6EBr771qtq3A547owu3a/w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U46x7PArs7g6Hdl0cL7z0VVcDHtHwNl8pr9IciTpgQOYjH8jd0ebrvAgmw765Y6dfOVAN8Uz/n9V//mjENtss4yYu7/YzVecfmskKRAf1iD2G5GW2oh3FKIgTM63YLL/CZsTSUf05XZhuHs7GxpQmtsPFf2x0yIwKBiWqKiodhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HSoAOz7r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 951A6C32786;
	Tue,  6 Aug 2024 23:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722985803;
	bh=gwRv4pCIfpi2yjceV4ySL6EBr771qtq3A547owu3a/w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HSoAOz7rgsv66grJP/k15A/DykRnOnUycdinS56zDhlh/+0MsznkltnyXqLaIQlS/
	 W5IDRxorOQPhKfJ9WYrOqaOxnE5HJiGFn8950C5nnNSnI37BMiY3sOOqu6d6IBFATq
	 pMkRLKfDdyW0maVEf47VNRRvnWZ26qYXfGPB3oga6zj+rceMe2ligh62y/KLT7JLG1
	 2cLkO59/ztuT3pDZowD7nauXyY5I9EunHsYsLE8ctnjgYWpXLnq2DH8BSivBpvcXuZ
	 usDbMatguOvpXX2SjZlP10dK3Wi8Y8RNXSn7hGVqjZ1Fi5wvyKrOGQnIuPXB0JMClV
	 0VwV4/+XTmR5A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87479C52D7B;
	Tue,  6 Aug 2024 23:10:03 +0000 (UTC)
From: Daniel Gomez via B4 Relay <devnull+da.gomez.samsung.com@kernel.org>
Date: Wed, 07 Aug 2024 01:09:23 +0200
Subject: [PATCH 09/12] include: add endian.h support
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240807-macos-build-support-v1-9-4cd1ded85694@samsung.com>
References: <20240807-macos-build-support-v1-0-4cd1ded85694@samsung.com>
In-Reply-To: <20240807-macos-build-support-v1-0-4cd1ded85694@samsung.com>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 William Hubbs <w.d.hubbs@gmail.com>, Chris Brannon <chris@the-brannons.com>, 
 Kirk Reiser <kirk@reisers.ca>, 
 Samuel Thibault <samuel.thibault@ens-lyon.org>, 
 Paul Moore <paul@paul-moore.com>, 
 Stephen Smalley <stephen.smalley.work@gmail.com>, 
 Ondrej Mosnacek <omosnace@redhat.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 James Morse <james.morse@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 speakup@linux-speakup.org, selinux@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-serial@vger.kernel.org, llvm@lists.linux.dev, 
 Finn Behrens <me@kloenk.dev>, 
 "Daniel Gomez (Samsung)" <d+samsung@kruces.com>, gost.dev@samsung.com, 
 Daniel Gomez <da.gomez@samsung.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722985800; l=6952;
 i=da.gomez@samsung.com; s=20240621; h=from:subject:message-id;
 bh=DtZVbn0fWX0kStQGRH/0NcswkT82D02BPxc7A212O48=;
 b=fHToSejWCNC5a5Y0d5FDWxUWxPOD39gQvn8dIfP7DYUHRLm01btwYrXIxK+zbXzSjEERCFH2E
 Toa//DYARs3Ad+ILXuWzrEr8j9YMAEO2jiTPhk1LqJjkcFnDKwl/eqB
X-Developer-Key: i=da.gomez@samsung.com; a=ed25519;
 pk=BqYk31UHkmv0WZShES6pIZcdmPPGay5LbzifAdZ2Ia4=
X-Endpoint-Received: by B4 Relay for da.gomez@samsung.com/20240621 with
 auth_id=175
X-Original-From: Daniel Gomez <da.gomez@samsung.com>
Reply-To: da.gomez@samsung.com

From: Daniel Gomez <da.gomez@samsung.com>

macOS hosts do not include endian.h header required for gen-hyper
object. Add a copy of the include/endian.h from the GNU C Library
(glibc), version glib-2.40 into include/endian and a copy of bits/
uintn-identity.h into include/endian/bits and update the gen-hyper
Makefile to include the library path.

Remove the following from glibc include/endian.h:

diff --git a/include/endian/endian.h b/include/endian/endian.h
index fd20a2b1985d..f70e07f1d3c6 100644
--- a/include/endian/endian.h
+++ b/include/endian/endian.h
@@ -18,11 +18,6 @@
 #ifndef        _ENDIAN_H
 #define        _ENDIAN_H       1

-#include <features.h>
-
-/* Get the definitions of __*_ENDIAN, __BYTE_ORDER, and __FLOAT_WORD_ORDER.  */
-#include <bits/endian.h>
-
 #ifdef __USE_MISC
 # define LITTLE_ENDIAN __LITTLE_ENDIAN
 # define BIG_ENDIAN    __BIG_ENDIAN
@@ -30,9 +25,6 @@
 # define BYTE_ORDER    __BYTE_ORDER
 #endif

-#if defined __USE_MISC && !defined __ASSEMBLER__
-/* Conversion interfaces.  */
-# include <bits/byteswap.h>
 # include <bits/uintn-identity.h>

 # if __BYTE_ORDER == __LITTLE_ENDIAN
@@ -67,6 +59,5 @@
 #  define be64toh(x) __uint64_identity (x)
 #  define le64toh(x) __bswap_64 (x)
 # endif
-#endif

 #endif /* endian.h */

Remove the following from glibc bits/uintn-identity.h:

diff --git a/include/endian/bits/uintn-identity.h b/include/endian/bits/uintn-identity.h
index 8104070583c7..0310c9d955da 100644
--- a/include/endian/bits/uintn-identity.h
+++ b/include/endian/bits/uintn-identity.h
@@ -23,8 +23,6 @@
 #ifndef _BITS_UINTN_IDENTITY_H
 #define _BITS_UINTN_IDENTITY_H 1

-#include <bits/types.h>
-
 /* These inline functions are to ensure the appropriate type
    conversions and associated diagnostics from macros that convert to
    a given endianness.  */

Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
---
 arch/arm64/kvm/hyp/nvhe/Makefile     |  2 +-
 include/endian/bits/uintn-identity.h | 48 +++++++++++++++++++++++++++
 include/endian/endian.h              | 63 ++++++++++++++++++++++++++++++++++++
 3 files changed, 112 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe/Makefile
index 40541c0812bf..1bbe2c2a4aed 100644
--- a/arch/arm64/kvm/hyp/nvhe/Makefile
+++ b/arch/arm64/kvm/hyp/nvhe/Makefile
@@ -15,7 +15,7 @@ ccflags-y += -fno-stack-protector	\
 	     $(DISABLE_STACKLEAK_PLUGIN)
 
 hostprogs := gen-hyprel
-HOST_EXTRACFLAGS += -I$(objtree)/include -I$(srctree)/include/elf
+HOST_EXTRACFLAGS += -I$(objtree)/include -I$(srctree)/include/elf -I$(srctree)/include/endian
 
 lib-objs := clear_page.o copy_page.o memcpy.o memset.o
 lib-objs := $(addprefix ../../../lib/, $(lib-objs))
diff --git a/include/endian/bits/uintn-identity.h b/include/endian/bits/uintn-identity.h
new file mode 100644
index 000000000000..0310c9d955da
--- /dev/null
+++ b/include/endian/bits/uintn-identity.h
@@ -0,0 +1,48 @@
+/* Inline functions to return unsigned integer values unchanged.
+   Copyright (C) 2017-2024 Free Software Foundation, Inc.
+   This file is part of the GNU C Library.
+
+   The GNU C Library is free software; you can redistribute it and/or
+   modify it under the terms of the GNU Lesser General Public
+   License as published by the Free Software Foundation; either
+   version 2.1 of the License, or (at your option) any later version.
+
+   The GNU C Library is distributed in the hope that it will be useful,
+   but WITHOUT ANY WARRANTY; without even the implied warranty of
+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+   Lesser General Public License for more details.
+
+   You should have received a copy of the GNU Lesser General Public
+   License along with the GNU C Library; if not, see
+   <https://www.gnu.org/licenses/>.  */
+
+#if !defined _NETINET_IN_H && !defined _ENDIAN_H
+# error "Never use <bits/uintn-identity.h> directly; include <netinet/in.h> or <endian.h> instead."
+#endif
+
+#ifndef _BITS_UINTN_IDENTITY_H
+#define _BITS_UINTN_IDENTITY_H 1
+
+/* These inline functions are to ensure the appropriate type
+   conversions and associated diagnostics from macros that convert to
+   a given endianness.  */
+
+static __inline __uint16_t
+__uint16_identity (__uint16_t __x)
+{
+  return __x;
+}
+
+static __inline __uint32_t
+__uint32_identity (__uint32_t __x)
+{
+  return __x;
+}
+
+static __inline __uint64_t
+__uint64_identity (__uint64_t __x)
+{
+  return __x;
+}
+
+#endif /* _BITS_UINTN_IDENTITY_H.  */
diff --git a/include/endian/endian.h b/include/endian/endian.h
new file mode 100644
index 000000000000..f70e07f1d3c6
--- /dev/null
+++ b/include/endian/endian.h
@@ -0,0 +1,63 @@
+/* Copyright (C) 1992-2024 Free Software Foundation, Inc.
+   This file is part of the GNU C Library.
+
+   The GNU C Library is free software; you can redistribute it and/or
+   modify it under the terms of the GNU Lesser General Public
+   License as published by the Free Software Foundation; either
+   version 2.1 of the License, or (at your option) any later version.
+
+   The GNU C Library is distributed in the hope that it will be useful,
+   but WITHOUT ANY WARRANTY; without even the implied warranty of
+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+   Lesser General Public License for more details.
+
+   You should have received a copy of the GNU Lesser General Public
+   License along with the GNU C Library; if not, see
+   <https://www.gnu.org/licenses/>.  */
+
+#ifndef	_ENDIAN_H
+#define	_ENDIAN_H	1
+
+#ifdef __USE_MISC
+# define LITTLE_ENDIAN	__LITTLE_ENDIAN
+# define BIG_ENDIAN	__BIG_ENDIAN
+# define PDP_ENDIAN	__PDP_ENDIAN
+# define BYTE_ORDER	__BYTE_ORDER
+#endif
+
+# include <bits/uintn-identity.h>
+
+# if __BYTE_ORDER == __LITTLE_ENDIAN
+#  define htobe16(x) __bswap_16 (x)
+#  define htole16(x) __uint16_identity (x)
+#  define be16toh(x) __bswap_16 (x)
+#  define le16toh(x) __uint16_identity (x)
+
+#  define htobe32(x) __bswap_32 (x)
+#  define htole32(x) __uint32_identity (x)
+#  define be32toh(x) __bswap_32 (x)
+#  define le32toh(x) __uint32_identity (x)
+
+#  define htobe64(x) __bswap_64 (x)
+#  define htole64(x) __uint64_identity (x)
+#  define be64toh(x) __bswap_64 (x)
+#  define le64toh(x) __uint64_identity (x)
+
+# else
+#  define htobe16(x) __uint16_identity (x)
+#  define htole16(x) __bswap_16 (x)
+#  define be16toh(x) __uint16_identity (x)
+#  define le16toh(x) __bswap_16 (x)
+
+#  define htobe32(x) __uint32_identity (x)
+#  define htole32(x) __bswap_32 (x)
+#  define be32toh(x) __uint32_identity (x)
+#  define le32toh(x) __bswap_32 (x)
+
+#  define htobe64(x) __uint64_identity (x)
+#  define htole64(x) __bswap_64 (x)
+#  define be64toh(x) __uint64_identity (x)
+#  define le64toh(x) __bswap_64 (x)
+# endif
+
+#endif	/* endian.h */

-- 
Git-146)



