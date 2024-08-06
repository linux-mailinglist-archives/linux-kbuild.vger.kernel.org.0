Return-Path: <linux-kbuild+bounces-2869-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AA784949C13
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Aug 2024 01:11:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC9A71C224D6
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2024 23:11:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 884C9175D33;
	Tue,  6 Aug 2024 23:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bAwtcOMC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E3F17A593;
	Tue,  6 Aug 2024 23:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722985804; cv=none; b=HqYJABw/k0c4XMAYd+vmZeyiC2WwuKlUEIcBlDd0ZpJ8RSuPhrQdzNeNYTDIdP7rcAPXTYf4iZeHda4mMNtPJoWAl/5DRRlHd0ccofL/oKnjBP4sIEAFuxoA0dLmdbJ/pRj64+cvqVqoBxhUyinJAkwBAfGcNSKHwvawWXTJ/Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722985804; c=relaxed/simple;
	bh=F/61/VQXtzneQgOaAhBFTxqHT0QyvEg2fHmrDz3d6fc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qzickOp4fzs/fmTam76ax5BLR5FnUzOGVRVUCo7FHWWk210gTL5DUJtmgsqsJ+6pVIEBd6GQ+X0HFSqUELLcwN/9Qoh6jCAfu85UCcYzxqcIYspEUWbDDKEoakaTZEV1ab1aGqH2aT+W1ZzgJ62EygQPq85NHu4ho+OJRzvKIOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bAwtcOMC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DB346C4AF16;
	Tue,  6 Aug 2024 23:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722985804;
	bh=F/61/VQXtzneQgOaAhBFTxqHT0QyvEg2fHmrDz3d6fc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=bAwtcOMC8uO9tQnqyMg3XmA8qwx6z04MqrogLLb2sa0ckkM37lEQCb10pqiKe5Sh1
	 fmisLW9J+woUaDJ1WuRkdMlf2ppQaPwmanZ1ABs7nrUmoeOywkpZbOvijM0iJgZSr+
	 GRrc+9SDnopW0bT7lbT4XbO+bPLex8HyZUrSExZxqT2uc+CucKsSSiDYhc2dyTs/se
	 q3HQRFQnsfAs13xFXF0v164/6XO2YrL130OLGwcMh3XlYX99l7xORXhsy54KZAf4qk
	 ka5IeQgoPsUv1Pncs0bCSiRpdk+AYCOSJ61umxoJoNVYkY9UujpLl7drVDp3WCEszh
	 zeN2ZldHpKbhQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCECFC52D6F;
	Tue,  6 Aug 2024 23:10:03 +0000 (UTC)
From: Daniel Gomez via B4 Relay <devnull+da.gomez.samsung.com@kernel.org>
Date: Wed, 07 Aug 2024 01:09:26 +0200
Subject: [PATCH 12/12] scripts/kallsyms: add compatibility support for
 macos
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240807-macos-build-support-v1-12-4cd1ded85694@samsung.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722985800; l=1149;
 i=da.gomez@samsung.com; s=20240621; h=from:subject:message-id;
 bh=m407j60dxP91/ofe/fC4k8KKLnSnwDft1+cuKD+Nr3Q=;
 b=9wVc3kFNW+eWlInTH68OVYW9lOTG64z9J8uGc06BNi0UKGSdgCWwd1pkJsrDb88EilcZAB+Hc
 BJiETDqZxOnA90nq/6n8hSEX1pXA+98beHklgtsWgzrpZRnNCLjTyIj
X-Developer-Key: i=da.gomez@samsung.com; a=ed25519;
 pk=BqYk31UHkmv0WZShES6pIZcdmPPGay5LbzifAdZ2Ia4=
X-Endpoint-Received: by B4 Relay for da.gomez@samsung.com/20240621 with
 auth_id=175
X-Original-From: Daniel Gomez <da.gomez@samsung.com>
Reply-To: da.gomez@samsung.com

From: Daniel Gomez <da.gomez@samsung.com>

Commit 67bf347ba924 ("kbuild: remove PROVIDE() for kallsyms symbols")
introduces the use of scripts/kallsyms with /dev/null as input to
generate the kernel symbols file. This results in getline() returning
ENOTTY as the errno value on macOS hosts. To handle this different
behavior, add a specific #ifdef condition for macOS.

Fixes:
+ scripts/kallsyms --base-relative /dev/null
read_symbol: Inappropriate ioctl for device
make[1]: *** [scripts/Makefile.vmlinux:34: vmlinux] Error 1
make: *** [Makefile:1172: vmlinux] Error 2

Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
---
 scripts/kallsyms.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 0ed873491bf5..cb200120a072 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -130,7 +130,11 @@ static struct sym_entry *read_symbol(FILE *in, char **buf, size_t *buf_len)
 	errno = 0;
 	readlen = getline(buf, buf_len, in);
 	if (readlen < 0) {
+#ifndef __APPLE__
 		if (errno) {
+#else
+		if (errno && errno != ENOTTY) {
+#endif
 			perror("read_symbol");
 			exit(EXIT_FAILURE);
 		}

-- 
Git-146)



