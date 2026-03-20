Return-Path: <linux-kbuild+bounces-12099-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WI/8NMeTvWnY+wIAu9opvQ
	(envelope-from <linux-kbuild+bounces-12099-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Mar 2026 19:36:55 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 843B82DF858
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Mar 2026 19:36:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 54EFD319F55E
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Mar 2026 18:29:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 362083E3153;
	Fri, 20 Mar 2026 18:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="UT2nVkIk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A3F3E8C68
	for <linux-kbuild@vger.kernel.org>; Fri, 20 Mar 2026 18:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774031375; cv=none; b=aaBia7QLe+V0LVmb1thak+SxPaAuL1WbjLoSEQ5HgxlZobMsWJy8fl8HA4mPSYat/sNNLX4mCrNi4p8+sJwCnOUWusMbKo0j834fzby1SKVLgH+EL0+VZfH1TiXdMWk9FaqQ2hXsujO28WLeWdImEFuLRrri14JaFz5xDU017eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774031375; c=relaxed/simple;
	bh=tXWGkwhgquIn57bRcfY0zSa2j1/v2U/tdifPvDKMAc4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z6erejA3Z7WrmL0HeRDi23q0pFwnUFZJwQdTngIDKHFL63F53Za1S/La656cosu1zXOQzdJXHZN9+4m4eh/zMLb3fE1UHrjKglI1X6gPVwZXaeNTz3FspNdxSsUv9IpniskJCHD+a40bSiKNkoLBHgM7jyvYncwyLnJb5WLyb+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=UT2nVkIk; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-486fe2024a9so5268725e9.0
        for <linux-kbuild@vger.kernel.org>; Fri, 20 Mar 2026 11:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774031372; x=1774636172; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HC90UT3UXKX/61fwzTSQoR9d3mFYuKw4rQp4Oi/BaDw=;
        b=UT2nVkIkgaXmjzOpkqX4brTfJSeXpy3y2TCkrioy26r0bd9CSWgbgR+Z0qtsHtjw3Z
         jLL3lB0I2N5CzixKg8GvnVgv9p9TmNvJyOYGZGoVDYaiR7AypJu7XXtdtXLnKv34Zqz+
         ykqHTf3kIYeDbt+ulIx4JAbGXNFR8zaRD52shdAJqVshULpwp97FpX6gMtAHyt8A6N73
         MJjhdzqxUNoT/fbjKTecQ+TRN7ue0bRx1PeT733vV27tWuxKWrULuWUjE6cGmdZMwLyo
         VjXjRQtooAXXKU+k9pmOv45HF/9F97BuMHahhafADNC/YATVk/G8lHHHjVTrOwrLKYC4
         W3Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774031372; x=1774636172;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HC90UT3UXKX/61fwzTSQoR9d3mFYuKw4rQp4Oi/BaDw=;
        b=ez2KgFAxM/FQM7eOgOpsRlxzSOTv2/DnR5tb4arct5aVSnrKRSSKi7GvDt0C7CZbys
         YJaKptWwKimBC4Sk4uYRndXlVoIPVNfLW475uzhfeFznHHYAFl+9DFVnr52jGr455K0W
         VD3Icz6sE4eO81ymnkavq0GAic+1qGabBg/LPaTGu17SIYDfE4VaiFnMwZBx8A6YGz4Q
         uQMWwgKHaiO5FcbTHbsWOeDsXBYl1tBsmRQoFEgJAWiQXEnVQhtVgG3/EaL+kK3LIehN
         SbrszLhMdgVQ70CwXAghU6VopnF5Z70PH/yZ6GiuCpec4T8ltkHNSh78PAQdDIE4PJfA
         HbJw==
X-Forwarded-Encrypted: i=1; AJvYcCX8WGlQTpvm5TIQJibI/Vce2BON5IA6KQ17NRpbLPhdpmUIb8qLZb+0Mp143TjwH2u8tSkDlmii3Wfq5jM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvvsMl2m6oMAhzsoprCy/ZzWNVxs6UfByHtHz2d2qqlgeeur6b
	r2YtglyHRwZTVlNcmJ7lf6N/oKEVFE9FZeh59YMxwiVzCx5RS3iflwBYBuzHLguOXuY=
X-Gm-Gg: ATEYQzwzVMiLQCI6cp1MsynEtHWX4xVhQXQ2GQMUZ9nD/pWK+1b/A2mshDJpyl8626r
	2WKLpznGn3+TfQupFr6CSlDQX+nktOYesDFq7vsRZSLsowCYDSh6v31dMEaGH/oVNc+R2UhJXr9
	hlMkYK8a3yO/gkENPaPYrtk77IRkKm9DIVOlj0wIfBQSn/LXgyN/hehqgb5Ea8jOt/VDIbMGw+n
	9AgfBZmG5phrHOIbGHHW5py3fKtOGohnO5fF8963odyXsj3gCA9Oor/a74w1G5H3qDBUOUvuIc/
	dij4KcIeWDc5eW4vJJO8zUoMWUU+VBV8JBtylL2lcU1N1Ndb+HTcuh+HocIM/KHyRD6PeRUSthT
	1ZvuebkeTAQIoSyKYRBrK2bic2M0Or4rZSBpuCenHKBNK+KfxRF2AW2lPC4sOdFNV8ERxxZle0v
	g6JWIA8XZWVg==
X-Received: by 2002:a05:600c:8b32:b0:485:4394:b0e with SMTP id 5b1f17b1804b1-486fedbad16mr55939155e9.12.1774031372170;
        Fri, 20 Mar 2026 11:29:32 -0700 (PDT)
Received: from localhost ([189.99.238.44])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a903e0b8csm19938947b3.12.2026.03.20.11.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 11:29:31 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Fri, 20 Mar 2026 15:29:17 -0300
Subject: [PATCH 2/6] selftests/run_kselftest.sh: Add missing quotes
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260320-selftests-fixes-v1-2-79144f76be01@suse.com>
References: <20260320-selftests-fixes-v1-0-79144f76be01@suse.com>
In-Reply-To: <20260320-selftests-fixes-v1-0-79144f76be01@suse.com>
To: Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nsc@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, 
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openssh-sha256; t=1774031363; l=1640;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=tXWGkwhgquIn57bRcfY0zSa2j1/v2U/tdifPvDKMAc4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QMgR/nHHbQqPFV50lY6EDBugs2wrA3LVFot5EV/HSj5tR/v2RlXzJt0URKaYUFq59vfUl8BeZvn
 wmkuL9/6U0ws=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[suse.com:+];
	TAGGED_FROM(0.00)[bounces-12099-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rbm@suse.com,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid]
X-Rspamd-Queue-Id: 843B82DF858
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fix the following shellcheck warning:

Double quote to prevent globbing and word splitting. [SC2086]

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/run_kselftest.sh | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/run_kselftest.sh b/tools/testing/selftests/run_kselftest.sh
index 9abea79018d7..b782b025d002 100755
--- a/tools/testing/selftests/run_kselftest.sh
+++ b/tools/testing/selftests/run_kselftest.sh
@@ -11,7 +11,7 @@ else
         BASE_DIR=$(readlink -f $(dirname $0))
 fi
 
-cd $BASE_DIR
+cd "$BASE_DIR"
 TESTS="$BASE_DIR"/kselftest-list.txt
 if [ ! -r "$TESTS" ] ; then
 	echo "$0: Could not find list of tests to run ($TESTS)" >&2
@@ -38,7 +38,7 @@ Usage: $0 [OPTIONS]
   -h | --help			Show this usage info
   -o | --override-timeout	Number of seconds after which we timeout
 EOF
-	exit $1
+	exit "$1"
 }
 
 COLLECTIONS=""
@@ -51,7 +51,7 @@ while true; do
 	case "$1" in
 		-s | --summary)
 			logfile="$BASE_DIR"/output.log
-			cat /dev/null > $logfile
+			cat /dev/null > "$logfile"
 			shift ;;
 		-p | --per-test-log)
 			per_test_logging=1
@@ -127,7 +127,7 @@ collections=$(echo "$available" | cut -d: -f1 | sort | uniq)
 for collection in $collections ; do
 	[ -w /dev/kmsg ] && echo "kselftest: Running tests in $collection" >> /dev/kmsg
 	tests=$(echo "$available" | grep "^$collection:" | cut -d: -f2)
-	($dryrun cd "$collection" && $dryrun run_many $tests)
+	($dryrun cd "$collection" && $dryrun run_many "$tests")
 done
 
 failures="$(cat "$kselftest_failures_file")"

-- 
2.53.0


