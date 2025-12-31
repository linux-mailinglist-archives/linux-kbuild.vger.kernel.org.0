Return-Path: <linux-kbuild+bounces-10391-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 72529CEB8FC
	for <lists+linux-kbuild@lfdr.de>; Wed, 31 Dec 2025 09:41:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D6F94300D42D
	for <lists+linux-kbuild@lfdr.de>; Wed, 31 Dec 2025 08:41:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49271313E0C;
	Wed, 31 Dec 2025 08:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bSCftVvI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8C91A0728
	for <linux-kbuild@vger.kernel.org>; Wed, 31 Dec 2025 08:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767170498; cv=none; b=j4Xy2MqFpi195O96zvF6ZIE5QKO8epFie6eBT8PhoVotRJBrL7eHDaHGmZ7m5e0J8r14soihOcNBb/zXRPYozds4VGRHTnCPSCESpSMPiKXF9vR7b+u3VmiTVo51IrbsIkHrm7R+mhRC68hNKrEyroyfePQDVfW+Nb75aeOfPjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767170498; c=relaxed/simple;
	bh=D37xojUglmR5RxiG3oEL2rlCJiKy/iqF2PU8QVo9pHo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IPr9WqLhTauFs+1ii6J+07AK5hGpvpx2IMdS4MrIIeut983mFRQsbqr3+FPsltD03KWbrIY8NaBlrRyE6p05JiC5ETNpoDnO9aoNdyU5WlcubTO1UfCddV94FnIoSdm346+QLKwSaWKxvPTkgOdrsFPStkcKMoxxIfsSDgkNoj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bSCftVvI; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-59577c4c7c1so10655258e87.1
        for <linux-kbuild@vger.kernel.org>; Wed, 31 Dec 2025 00:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767170492; x=1767775292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fh6xmyc7Ah435rH7wgWhAfHpOHtdWzPeIR+E5hmnxSw=;
        b=bSCftVvI1e2xcBH1aWywlfAUsdhUrLn22XKfZr11+I9SCFdHMqD9TLuTYVd+hl1SXr
         dpauJNQXvkmfFN3NN0vjCQgxxR9/A6VXeAtTPxzW6wTapnYEZxYc7pZ06IHWYW8KkhEt
         Xocl+/04hmvWxZmJrnAYSbcZOZWjy5lv3+q2C2k7QbgTJ5RDvU5KG1VzW1AAMYOSMxF5
         XOLqiQ9+gVY42lLHbFr4LvwYzsSSGXFAX+Sk2egxgbO93SwQW+YM+Rvi2jaZjzo/9mi4
         gBTOpcNOAbAUpnM/YwH6KrNkbjcthOKL8OWHws+nBxLKu+dyojTG0IZuEVWo6Y0Q9N67
         VSZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767170492; x=1767775292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fh6xmyc7Ah435rH7wgWhAfHpOHtdWzPeIR+E5hmnxSw=;
        b=Hjd4jNlZDLCc1BUpkZ56dumDJQ6LK8YV8ibJoIiOc821H/aTGs2tQjE/zK/laQdbrP
         zqmZP28t4zsB+dFh2LCye+EbZZ2gFm031iCyEGwTWwEMLSzh1heXLNdma9OBb8iRoOr7
         i+8bdrbQcoafqCpxJc23RVpIkUpSB7ZXBQP8fESjntej4xo2lF0/SergXae5Ztzk02zJ
         znEl4mKkfmEiF5IUm2/tHDPVydI6i6ZnjJnGIJ+LVezfttGLZTm5EAfqe8bXlyorAnvY
         v5TUm9ekMJmwkUDKFrT9Qx2mS89BaB3CnuEF/qfFhu7e0qQK8crZtxFlld5JC3GBrjtj
         UbYA==
X-Forwarded-Encrypted: i=1; AJvYcCWDki1s2mvdkaDlt6BSVwVZQgmw2na0qXEoRTsr1XlWVRdFWltKJpLBoHCAFANppWmkIRtZKVEfbrGrH84=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbX0Mrzw5mxVbTQSNqf875s3Xcse0d/twaOAeUZr01Mxbt/VFI
	7RbMb1Pb/rPAo3t7jmfF8BfkXtQ+SBB/JPqwa97FAcAXryP4lR27E7tZwVSSjoPDwUI=
X-Gm-Gg: AY/fxX6+FrFtYtdvBKFRviBhl8CVHPMyuiRoRU82jUc6fWAQf4Iu003mnbmIrjWoxJW
	BM8sXsz570X1X9w87QpSH2kxT+ySuIRrX0ZriH6rCrsf8MkMUpGr92S0ChhZu0UKvKNZXvSdoEu
	7r50hEB4UN0vQZbNBcGPaQYI1xQ5a/WNNljXaOaXEZR8r7amO/0cdGa+Hcxs67Ha03w1q0A/Kj7
	0qsG7q+AtysXiI8iihFbaYR1HwIxjmAZuHwXynwQ2Nz/KBmgjVBK5ccQOfx9EAEYafrVEOb7KCm
	MPeYuF6AKV3Ct6tdYOq2WjpgJTk3lcJi/PJOwCIjK990ZP8MzdpZRtBYGCMAMvb4uK0HohRuRV4
	9S8w8gFXVUxawgHjmrKbIiKIGqIVL1pJEKybe8KOg+wTo2V7heY4u+XowxUmoYvcniFR3Nqx/Iv
	QTHCxK1VSD7hFJhKgqKrNvL9sCWLP43AAoT1rBCOkBuv5y
X-Google-Smtp-Source: AGHT+IEQSvTgAnpUnlCc1mU2K78cacnyMiomjfEx1WAlB21EaY5faLafEowfwC4zhRVNwvYH/2zl/A==
X-Received: by 2002:a05:6512:3d9e:b0:595:7d7c:59a9 with SMTP id 2adb3069b0e04-59a17d6bb20mr13215379e87.22.1767170491651;
        Wed, 31 Dec 2025 00:41:31 -0800 (PST)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a181beb5csm10666566e87.0.2025.12.31.00.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 00:41:31 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v2 3/3] scripts: kconfig: merge_config.sh: warn on duplicate input files
Date: Wed, 31 Dec 2025 10:40:50 +0200
Message-ID: <20251231084050.186874-3-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251231084050.186874-1-mikko.rapeli@linaro.org>
References: <20251230205549.GE4062669@ax162>
 <20251231084050.186874-1-mikko.rapeli@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

External scripts like yocto kernel scc may provide
same input config fragment multiple times. This may
be a bug since processing same fragments multiple times
can be time consuming.

Cc: Anders Roxell <anders.roxell@linaro.org>
Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 scripts/kconfig/merge_config.sh | 11 +++++++++++
 1 file changed, 11 insertions(+)

v2: no changes

v1: https://lore.kernel.org/linux-kbuild/20251229114447.45236-1-mikko.rapeli@linaro.org/T/#t

diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index 462c791cca12..cc541a9686b8 100755
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
 	if ! "${AWK}" -v prefix="$CONFIG_PREFIX" \
 		-v warnoverride="$WARNOVERRIDE" \
@@ -259,6 +269,7 @@ for ORIG_MERGE_FILE in $MERGE_LIST ; do
 		STRICT_MODE_VIOLATED=true
 	fi
 	mv "${TMP_FILE}.new" "$TMP_FILE"
+	PROCESSED_FILES="$PROCESSED_FILES $ORIG_MERGE_FILE"
 done
 if [ "$STRICT_MODE_VIOLATED" = "true" ]; then
 	echo "The fragment redefined a value and strict mode had been passed."
-- 
2.34.1


