Return-Path: <linux-kbuild+bounces-11772-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAu5KQYDsGnOeQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11772-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 12:39:50 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B15124B3DB
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 12:39:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 38096319CFEE
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 11:37:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 763033876A7;
	Tue, 10 Mar 2026 11:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BPCtfgpx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5257B387587;
	Tue, 10 Mar 2026 11:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773142636; cv=none; b=i4oG0nDGk0giKqgatUinDddNCcc7F1y1Y2/JfrtdmI5iUjFDIHIbMatPhHlmh5n357l2sZRy2qRTGbIPLjLXo3ZwNKHzF9VL/Pn1bpBCCo3xbjIweaoXEcvzmoY0/jgrw/cIYyqVx0NEEt6G/9Yx87DR7sYeN/PdOWkzvIUNk4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773142636; c=relaxed/simple;
	bh=pNPj+CQUFq/2lLo6Iv5trRQxElH3NL/xE39oCnsD2Ic=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MAsYFcbESq4cuLd/Qs5u+9aQylPtIA9lFcNXG7Gw+gKjT9wpitCL8tXJ7hUEcdhX21JGL6bDkRnXlQ76OAo1VTPKcNVSBt2++xfZTXyatss3SQQwfiWSKuSVCH7BS1jpns52ZLubSzT+SkWdldrsFMZEDpBSKhaTTOZdhSxduEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BPCtfgpx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B247C19423;
	Tue, 10 Mar 2026 11:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773142636;
	bh=pNPj+CQUFq/2lLo6Iv5trRQxElH3NL/xE39oCnsD2Ic=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BPCtfgpxAe1wJq35rfB2a7eMMIExUzHia6Kv9IwEEa3GovjvcaMkNPT0VJKr2zcKE
	 xLVOpQ5yg2vMyUS+BBlOclGQoYdAcIzd+A+v/ENjCTz9crVstgghxGuh22nUdvZ7rz
	 hWK1VTSy59VlljcaLeT8qODSqU1XELc+KwrrIIHR3FNCZSET4/QsYjQnlTVDvyyYUz
	 OsAugQeEG5TZoxK7VR2Kun51uhXvieIADF/fTRZHBCGTgaiS6YTP9TOHBgrVRta3ne
	 r25+f35i9oc+X9PS/V3Ar9KDpJDfCbnpIvBaWQh5qsvOeFVOBcs5E0Zadx+kw//CYV
	 pmDp8ku3iMVBg==
From: Daniel Gomez <da.gomez@kernel.org>
Date: Tue, 10 Mar 2026 12:36:25 +0100
Subject: [PATCH 3/3] scripts: kconfig: merge_config.sh: use POSIX test
 operator
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-fixes-merge-config-v1-3-beaeeaded6bd@samsung.com>
References: <20260310-fixes-merge-config-v1-0-beaeeaded6bd@samsung.com>
In-Reply-To: <20260310-fixes-merge-config-v1-0-beaeeaded6bd@samsung.com>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Anders Roxell <anders.roxell@linaro.org>, 
 Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Daniel Gomez <da.gomez@samsung.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1000; i=da.gomez@samsung.com;
 h=from:subject:message-id; bh=UIrcoyCOf6s8kTl47Htq1HmrnxyQ8s21AmPB08roK+U=;
 b=owEBbQKS/ZANAwAIAUCeo8QfGVH7AcsmYgBpsAJiLefCQEg/mjww7V1B+UbOK8XfDrMMNJrP3
 O7x6/YUE32JAjMEAAEIAB0WIQTvdRrhHw9z4bnGPFNAnqPEHxlR+wUCabACYgAKCRBAnqPEHxlR
 +z74EACEIERQtLr3IEZCROlB5BjPsott18Gp5EB5qhRbro04Ydyt+Dv3ERqfRZWIMOCb1GyzYV+
 H0b831gRKx0bfUwUrpzO+X7mz40kp+VgEUFl7mSF1+vmPKJp7tKx1Fc6rNVh6T61dQ/1EH6THOO
 iZ1XkQ2WtL9G1cKuhpC6Yu48tgAC2LmCgD82z2A025NTLc6BwPD8Mnz/zNPUjUydtvRbGfI5j9L
 S4BFq52XLs9wkicQyh/aGm/WbF+p9d6fdrohAfoOeYiA2ztpTXoUtyQbzLWDJ10RYOvF1C43juy
 Z8b1H4gAFr41Giz6mJvfZabJO0gdi5/jGDqmQgeNkehs36I1pUoAQE9+GR3FXTlwtiDe5ua8sUi
 qM1PeEw3kbqSGzyiGaeWmWgR2RWBxk2JL9LfDJedkRG80d9N+0Os1lzQnwV3xLuehHZrLxTmp7U
 g7VsmUSOFv2AWpm2a6BAjUHeup+UBbKzmsDKgKlI2rXlysFVCrkUmCTBMnuVNcEdl0MDYXHiz9O
 RXeySwPQlmkuNiuPqh8oyLI6tJO42SVtovL7rSOViO745K52tW1c8h23mHqZQD+dTrFvdSgbqxW
 Ig/ICrrni9ArEX+kfXW3k1rUf4+NcmqK80+LXibogIVi8VOg+OkuS9FdhDSrsHUjIF3Dovjv+uW
 wsDW9TrdvmzcNbw==
X-Developer-Key: i=da.gomez@samsung.com; a=openpgp;
 fpr=B2A7A9CFDD03B540FF58B27185F56EA4E9E8138F
X-Rspamd-Queue-Id: 2B15124B3DB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11772-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[da.gomez@kernel.org,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,samsung.com:mid,samsung.com:email]
X-Rspamd-Action: no action

From: Daniel Gomez <da.gomez@samsung.com>

The script uses #!/bin/sh but == for string comparison, which is a bash
extension. This causes an error on systems where /bin/sh is not bash:

    ./scripts/kconfig/merge_config.sh: 380: [: false: unexpected operator

Use = instead, as used in the rest of the script.

Fixes: dfc97e1c5da5b ("scripts: kconfig: merge_config.sh: use awk in checks too")

Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
---
 scripts/kconfig/merge_config.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index 95f090b88e8d..f08e0863b712 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -377,7 +377,7 @@ END {
 	STRICT_MODE_VIOLATED=true
 fi
 
-if [ "$STRICT" == "true" ] && [ "$STRICT_MODE_VIOLATED" == "true" ]; then
+if [ "$STRICT" = "true" ] && [ "$STRICT_MODE_VIOLATED" = "true" ]; then
 	echo "Requested and effective config differ"
 	exit 1
 fi

-- 
2.53.0


