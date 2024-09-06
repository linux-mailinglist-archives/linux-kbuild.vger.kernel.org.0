Return-Path: <linux-kbuild+bounces-3423-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A70E396F23A
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Sep 2024 13:02:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B85C61C241F1
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Sep 2024 11:02:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1C1C1CCB28;
	Fri,  6 Sep 2024 11:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="btJcAfy2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A311CBE83;
	Fri,  6 Sep 2024 11:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725620500; cv=none; b=INnRUU5XIr9yXyU4bxz04xFaZ67nhN8XeOvmn7Okw5PaTaI5tmJ0SW9XSKkO53d2IIvDsypdIpbT59O/+8MmSPVYLBWRatKa7fPeJadAjJF1TqlAcFrZxvTzgsXZVlIBNmSd6Wqcfsb+ZbplJA7zwXP0Ffplh9Hx8gwiP3Pv524=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725620500; c=relaxed/simple;
	bh=c3x0bnHapZyCsRyRYyC+LIZeB+J3ImlDAXTdLaX80xs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tj+DNr+dJoezLT0glcqvtW5rqHppOnNLYiDWnOz7pngLnb5ehxP+2zbxvFZ11buqMuOvYHDMrrYB4tb3t702ySFQCO3Gdfkm3d27Z/0tfjT14sNekc2QnIlqXT6Tuo7B1/a0As9OvRbve3lWx9IqKrN2q9vj7UrrQMTM+1k3PoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=btJcAfy2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3DFD2C4CED7;
	Fri,  6 Sep 2024 11:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725620500;
	bh=c3x0bnHapZyCsRyRYyC+LIZeB+J3ImlDAXTdLaX80xs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=btJcAfy2qgqbbzAjf01oYt2H2oCyEH+vlSb9AqgkhlNPrxpmns232Sx4cuPfLwwjM
	 hHbkAWRN13hCR7wXpO++PMYCsV5cAmp2hKrfplof8dSKh7FoKXzAG6WWDLti13Vfcz
	 rmWqzNmPtFb7k3trfzp+b4JT4aoeWBJOSQ3Z5fM1b6PgHfTOLg5kT+IyYSup1Z4UgI
	 uqKbdZwzV7o66NMqvBqHKW0NBqoXm1QoY7dHM4kzkuhX1aPkGPoSjT6F7dHGu+wOUT
	 87PrKn1vC+Hq2JXEgbfPHChyYNK3Z19nJuPDZVUGAo4mBzIo6ScQ+HRTPA3L0AkgNQ
	 N6bYnBjieudmQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35CA2CE7AFB;
	Fri,  6 Sep 2024 11:01:40 +0000 (UTC)
From: Daniel Gomez via B4 Relay <devnull+da.gomez.samsung.com@kernel.org>
Date: Fri, 06 Sep 2024 13:01:30 +0200
Subject: [PATCH v2 3/8] drm/xe: xe_gen_wa_oob: fix
 program_invocation_short_name for macos
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240906-macos-build-support-v2-3-06beff418848@samsung.com>
References: <20240906-macos-build-support-v2-0-06beff418848@samsung.com>
In-Reply-To: <20240906-macos-build-support-v2-0-06beff418848@samsung.com>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, William Hubbs <w.d.hubbs@gmail.com>, 
 Chris Brannon <chris@the-brannons.com>, Kirk Reiser <kirk@reisers.ca>, 
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
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 speakup@linux-speakup.org, selinux@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-serial@vger.kernel.org, llvm@lists.linux.dev, 
 Finn Behrens <me@kloenk.dev>, 
 "Daniel Gomez (Samsung)" <d+samsung@kruces.com>, gost.dev@samsung.com, 
 Daniel Gomez <da.gomez@samsung.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725620498; l=1428;
 i=da.gomez@samsung.com; s=20240621; h=from:subject:message-id;
 bh=x6LVlKYatdZUIjJiYp2s+9CbUoAxRcL8dRJGWqQIBj4=;
 b=BH4HpeG8hB04KMzAeLGkcCFK3N10hMq/U4+Vzh7fajdBsdql7CZEFfKmy7OI6MFwP2a4PKqq6
 h6W1X3yzs24B7Hn3G4bxlap2pj1Vdv/+pm0/KH5H8aSiskiYjxDyb27
X-Developer-Key: i=da.gomez@samsung.com; a=ed25519;
 pk=BqYk31UHkmv0WZShES6pIZcdmPPGay5LbzifAdZ2Ia4=
X-Endpoint-Received: by B4 Relay for da.gomez@samsung.com/20240621 with
 auth_id=175
X-Original-From: Daniel Gomez <da.gomez@samsung.com>
Reply-To: da.gomez@samsung.com

From: Daniel Gomez <da.gomez@samsung.com>

Use getprogname() [1] instead of program_invocation_short_name() [2]
for macOS hosts.

[1]:
https://www.gnu.org/software/gnulib/manual/html_node/
program_005finvocation_005fshort_005fname.html

[2]:
https://developer.apple.com/library/archive/documentation/System/
Conceptual/ManPages_iPhoneOS/man3/getprogname.3.html

Fixes build error for macOS hosts:

drivers/gpu/drm/xe/xe_gen_wa_oob.c:34:3: error: use of
undeclared identifier 'program_invocation_short_name'    34 |
program_invocation_short_name);       |                 ^ 1 error
generated.

Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gen_wa_oob.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gen_wa_oob.c b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
index 904cf47925aa..0d933644d8a0 100644
--- a/drivers/gpu/drm/xe/xe_gen_wa_oob.c
+++ b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
@@ -8,6 +8,7 @@
 #include <errno.h>
 #include <stdbool.h>
 #include <stdio.h>
+#include <stdlib.h>
 #include <string.h>
 
 #define HEADER \
@@ -30,6 +31,9 @@
 
 static void print_usage(FILE *f)
 {
+#ifdef __APPLE__
+	const char *program_invocation_short_name = getprogname();
+#endif
 	fprintf(f, "usage: %s <input-rule-file> <generated-c-source-file> <generated-c-header-file>\n",
 		program_invocation_short_name);
 }

-- 
2.46.0



