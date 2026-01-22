Return-Path: <linux-kbuild+bounces-10802-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLTJIYEJcmmOagAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10802-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 12:26:57 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8901D65F95
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 12:26:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3FE468A3E2B
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 11:06:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5796440B6FE;
	Thu, 22 Jan 2026 10:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fkqX5WSu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5655E47DD78
	for <linux-kbuild@vger.kernel.org>; Thu, 22 Jan 2026 10:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769079504; cv=none; b=CXQ8ocWPRzmDiq/41U7miC8G0ledYJ0QVkY2Ci2pDQHp8rV7mUUogHoIgmI6PpyhHmNFD51bMbtTs9Hf0W9xVC8hog5lsuVOTz173BkcyPaHSq76ah/ofAox9jT3kLONuCab2nzt4/U3qKtTOnYjdib0ctSa9c6RROOXzFqCMi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769079504; c=relaxed/simple;
	bh=IMkJgM4aRmhqZgphBUQfQMkJfQvCESQd/ZaYH5f5ydg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HJD+nf+bhNp5I1DNoQ5o+6bCxzNRbff3CBbAeGxQDrdzCAVVddIqlm8V6mlXtrtpGAci1OgxnAIZe+fj6YVFhCelrCjQCCO3PmzoN4khptcKkT3w10aGyp1hsrlEvNP2Ecuojuj/otAdd+tC5QYY67rpK+SlV8yY9Hq7u0EvGv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fkqX5WSu; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-59b685d2b79so804481e87.3
        for <linux-kbuild@vger.kernel.org>; Thu, 22 Jan 2026 02:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769079500; x=1769684300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jDvZa1RQe6YqqWZizFboxtjozJnHM2wFaUUPlzeKgK0=;
        b=fkqX5WSuSxODH0W+JaIO1SedJDlVZcMjyFR7I1vreCipfg8UelpEVEjphXFMQOp6dp
         oL+07hhHgFcuY1t1CyH7dR58QqA2uXOcxFNUH7/xA7jAvslbLVzyTi7kOqkgwwuN8r/i
         3LAtvgy0Ek4SW4ahactf4QZGXymoQCaDMpbu+mvOedvHFmviaYHaPJ3e5OUCJ+D8A/zZ
         BHSXjOegnnMSIYnoQbVOkCpBkcyRD1kOGOicGdIEj6OZrMe3Zk9U5YSfiGceTOKf0h40
         KnHnjYkjKLD/Bg7RuRo/zKiYl68DdE1VhRQ6vvvmBE6xW1JQAFlOa8LnWcEIzdFjpGRO
         6M7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769079500; x=1769684300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jDvZa1RQe6YqqWZizFboxtjozJnHM2wFaUUPlzeKgK0=;
        b=XTMqUMB6FJvb0Bo6bo8t3dg0FqS0txbe6Dqo+3ugW2Mh5qVe4mMBAIDKTedpt59MMT
         IFFRx8Y9UHcWKHkYKmJhMYNzDZD4ocNmqUjphBs5tDrW6lOEUqLbB0wJX173IFFIPvap
         lw+x90x7xETOdb6Jj9lmSCAeaU6sqT1pTx3buBP9fZxE4nOVPVDmfeGmC5c3tck3eohH
         3Jbu0VsZptoQ+vY6628nmZC2HIgiM1n4wWLeTpa3xtYMr7tdKVtwBFKfyGJkMsQPw97U
         mSFIS2jGPwvAeW61JmhZZLdjbcIduVrFvNnEGZSgfGV0OR4PJdtZBN8/TahylrizuUAf
         DyCg==
X-Forwarded-Encrypted: i=1; AJvYcCV51FW7/Le1y5Py6piRhmvYQtR5Uchhalow2HVRRQY5Rb7629QNRwea9eAnhBdDc73LNibymLJC6DvTJjI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZFeqS2YtdYqF7/aV7OMVTbNnLBp1AhfQOWFB8ijzmlR1/mOE3
	SmIvksz5SgA5+rgulNr66KS10A9TDyY4+SveENCSMvhlFWsrC4HUCtEtWmOpnu5VB/I=
X-Gm-Gg: AZuq6aJpoqoZHQjfK6G5ado3t1z8gzUJ+FrL2Dp3Vdq4EOt8ZEI0LUDeKd2ITcgMUyn
	JTZ3rdqOH/AqPXpScOlrFCTFQ9YY9TJI7wBwRq12/Ktfh0t5uox6ei94RpJADAACWwOqKWUF26A
	/aJv0GfMfgmb0GVHCfZMIWwhf8r084+fkAqpAr8h9hyLZVBODBy8Kfid7e2DQBDUeYvwothNspQ
	EMMJKLg7SyQp1rPXLEhmZNWp6XnshfwFa75wuymlXp9icSIztb0mf5UEOYvmy02w+Aii+e15Qtf
	/8uIrxQiVjkaz+13CyX4F59YHwPyDia3hKe51Bm9ApechnOStnUFQk9v+WAhpLVvKKc6l/j3gtt
	Io+8eUOIt6gSzoCostgAClindGPTWkISfj5J1RnJ/d8tgWBG8G87P35oqzqnaD1wt+8XMYOXAeA
	523GLMcASTGKicVDDLppV1QvT46HVUKHIA45YpfafwuFn3
X-Received: by 2002:a05:6512:3c90:b0:59a:11b7:80c4 with SMTP id 2adb3069b0e04-59baeee382fmr6872830e87.35.1769079500157;
        Thu, 22 Jan 2026 02:58:20 -0800 (PST)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385d5091433sm350841fa.14.2026.01.22.02.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 02:58:19 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v3 3/3] scripts: kconfig: merge_config.sh: warn on duplicate input files
Date: Thu, 22 Jan 2026 12:57:51 +0200
Message-ID: <20260122105751.2186609-3-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260122105751.2186609-1-mikko.rapeli@linaro.org>
References: <20260122105751.2186609-1-mikko.rapeli@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[linaro.org,none];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10802-lists,linux-kbuild=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mikko.rapeli@linaro.org,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,linaro.org:email,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Queue-Id: 8901D65F95
X-Rspamd-Action: no action

External scripts like yocto kernel scc may provide
same input config fragment multiple times. This may
be a bug since processing same fragments multiple times
can be time consuming.

Cc: Anders Roxell <anders.roxell@linaro.org>
Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 scripts/kconfig/merge_config.sh | 11 +++++++++++
 1 file changed, 11 insertions(+)

v3: no changes

v2: no changes
    https://lore.kernel.org/linux-kbuild/20251229114447.45236-1-mikko.rapeli@linaro.org/T/#me2023dbfef124059bd906d44c60ffaa7cd83732c

v1: https://lore.kernel.org/linux-kbuild/20251229114447.45236-1-mikko.rapeli@linaro.org/T/#t

diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index 9eda9dbd4542..735e1de450c6 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -130,6 +130,8 @@ trap clean_up EXIT
 
 cat $INITFILE > $TMP_FILE
 
+PROCESSED_FILES=""
+
 # Merge files, printing warnings on overridden values
 for ORIG_MERGE_FILE in $MERGE_LIST ; do
 	echo "Merging $ORIG_MERGE_FILE"
@@ -137,6 +139,14 @@ for ORIG_MERGE_FILE in $MERGE_LIST ; do
 		echo "The merge file '$ORIG_MERGE_FILE' does not exist.  Exit." >&2
 		exit 1
 	fi
+
+	# Check for duplicate input files
+	case " $PROCESSED_FILES " in
+		*" $ORIG_MERGE_FILE "*)
+			${WARNOVERRIDE} "WARNING: Input file provided multiple times: $ORIG_MERGE_FILE"
+			;;
+	esac
+
 	# Use awk for single-pass processing instead of per-symbol grep/sed
 	if ! "$AWK" -v prefix="$CONFIG_PREFIX" \
 		-v warnoverride="$WARNOVERRIDE" \
@@ -259,6 +269,7 @@ for ORIG_MERGE_FILE in $MERGE_LIST ; do
 		STRICT_MODE_VIOLATED=true
 	fi
 	mv "$TMP_FILE.new" "$TMP_FILE"
+	PROCESSED_FILES="$PROCESSED_FILES $ORIG_MERGE_FILE"
 done
 if [ "$STRICT_MODE_VIOLATED" = "true" ]; then
 	echo "The fragment redefined a value and strict mode had been passed."
-- 
2.34.1


