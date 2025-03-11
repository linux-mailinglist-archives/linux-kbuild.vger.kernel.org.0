Return-Path: <linux-kbuild+bounces-6072-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B46A5CFE3
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 20:50:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE7BC17C7EF
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 19:50:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FFBB264A71;
	Tue, 11 Mar 2025 19:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YDs1bkDc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84A2264A76
	for <linux-kbuild@vger.kernel.org>; Tue, 11 Mar 2025 19:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741722560; cv=none; b=V0ejiW9Ne38TyOSDh4AP4Ha3PjjJnYLtD46onfY1RmKByxMvqQpzmtAZ/ExGpu3Af6ULu1X2GE3mfHcJLN8Jm3rwP+BvQFNgYVkVlgeHXqJjANEk+zptxMSsW4CeoULapfc71HvtaR0defkgaw8gfq6Psh6V5yYdnXO2zNqTnJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741722560; c=relaxed/simple;
	bh=lb+3eIB5E4cbkCyTv4AbOsx/VhSeG3B+x7KApIAeUl4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ADmalbjkrFeIxXRtjcwhdEA/bIwH4ii8kvjKZ242sz5+Zt4IQAGjUKvfetnf9OHfDWNuAjcfrmhErxQQ/LmCWCnfFmE0ADL0akW9jhjZm+9FCawLtMnj8GbwfAaJK3RaYGy91huZ6xKMvsU70T0Zl0FLsoyPcUxJ1hhA0IE5+Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YDs1bkDc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52BJ8DBM007368
	for <linux-kbuild@vger.kernel.org>; Tue, 11 Mar 2025 19:49:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uJ+KtnproCEK/DE4ictchb
	606AaIv+PdZqDhsy1doWU=; b=YDs1bkDceUpWw1o/wPIsSd27hFkXRoBVwTL8iu
	a7QtVBXDHpH8nTjc7q9+MDOw+a8PStp9n0BB/JN7r+GMfkvAWiHvq2f5UC+lEfov
	rS3pVzhd+OB5XPJIfWJEo8/egTaEobWkTEJSUXi0HryziNtY7CRbPdaPgjJFycU4
	vWCdQjy/UZmq3BoAUJkRBFLsXqb2SU9MsihZDWatTCtw60ZtyndVFm4XAiiIgoRX
	OmGeGEBj0aI5fB4AtX+Zmk00AWT/FUCP3aNLX10ate3cfonOcWSsYYnn834Kqtcz
	JZUJfUgEDorXGLNq1GJDKXZ2doWBZAamdnB52l2rfmkv1ieA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2mr2xc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kbuild@vger.kernel.org>; Tue, 11 Mar 2025 19:49:16 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2241ae15dcbso120051805ad.0
        for <linux-kbuild@vger.kernel.org>; Tue, 11 Mar 2025 12:49:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741722556; x=1742327356;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uJ+KtnproCEK/DE4ictchb606AaIv+PdZqDhsy1doWU=;
        b=CjRJ9zXawieeFjyIgXdgCSAf20LFYwfSRpbR7KHNSvcwUiqYjbvp4uawklMro7ZHKS
         ZIAZmeZ1L9nTTUFM6Y65j2ho7wmu7RbOUwWZqJrg8FtDLgnfI98q1X6m2V7rMb4o/zlf
         gLpXGOXqqcR9C1KAazECCF3GDvbPaebC1LfT2wxqz8j7NqsQ0/rAoes+7oXEaMRq/n7y
         cA9sljF0RnufkUo3Y0fIpG2V0zPQRznHKKEQhryqVE1zZM6Hp7qNixCFESHcIK0nbMt2
         q/GGkZwE2z3QW2vNoUEvvUSMdm35vBWXaeSHNqjVRQcVpGbgm7eQ8W55N62PlkURxBSz
         JN8w==
X-Gm-Message-State: AOJu0YycJa3L8QX6nItqJ4TkGzHiiOpbIP7BxzySTlbEyrwTg51J57v/
	2rY9rPT/YfOiMJgbaBnY6Chukr+iZApJZZxTB4jGpF70Nd/hnWbXsCdfrg3sNK7z0UFl4KHSctu
	UxeXgiU6LWo0WllPhQyayssvdCtqtoNId86cVy346GagUpwzgBr6QzLwj3aEnKQJhu4puEWo=
X-Gm-Gg: ASbGnctS95q8LiK4mm/jZr0BND26bs/YhlvqJgAWqV+M1NssAySGfNKQ5wX878iFo6U
	eFay6LJbiygI0EdTFdk3vCE7Jib1MG43cfeVjmPuXhdU7pa6FoOnXb0oiy1R58NYMXLqDXWnBh9
	QRt+6G2rR8/awKI6DcVlOey39k6yjj7qDXrTvfa7k8rojjGAZkBEMK7iqPoXSqEU8H7XnHFHVTB
	2V2Xc3GiMDsrq8/rSAruYpGO+SjE/X6Eu0x2TZLWv/Hk7pabOMkl4eWn0s3EU3/48aRQuHUORdq
	Wg8XEYLK15JEiz4xp5Sh15IYDRieixzPUXxg0zeJKrTvKmBfe+Md
X-Received: by 2002:a17:903:40cb:b0:21f:85ee:f2df with SMTP id d9443c01a7336-2242888adfemr284510215ad.15.1741722555812;
        Tue, 11 Mar 2025 12:49:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSpgLwDBd8Si8UBxJzfvvV1/zAfw6r/lhK5mV2ZdDy2fTTd6cfAoHj1s3SajalhCNSRF3jhw==
X-Received: by 2002:a17:903:40cb:b0:21f:85ee:f2df with SMTP id d9443c01a7336-2242888adfemr284509975ad.15.1741722555375;
        Tue, 11 Mar 2025 12:49:15 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22410a92699sm101813575ad.204.2025.03.11.12.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 12:49:15 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Tue, 11 Mar 2025 12:49:02 -0700
Subject: [PATCH] script: modpost: require a MODULE_DESCRIPTION()
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250311-moddesc-error-v1-1-79adedf48d0e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAK2T0GcC/x3MwQrCMAyA4VcZORtY6xTmq4iHNI0u4FpJVAZj7
 77q8Tv8/woupuJw6VYw+aprLQ3h0AFPVB6Cmpsh9vHUH0PAueYszihm1TBSHocxM58TQWteJnd
 d/r/rrTmRCyajwtPv8tTyWXAmf4vBtu1QTVklfgAAAA==
To: Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nicolas@fjasle.eu>, Arnd Bergmann <arnd@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Authority-Analysis: v=2.4 cv=BN+zrEQG c=1 sm=1 tr=0 ts=67d093bc cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=YU1Jr47rrnIWNfndT5YA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: GNRhZI7mYnKNrP7DmW-j9GO-cU_NwI7f
X-Proofpoint-ORIG-GUID: GNRhZI7mYnKNrP7DmW-j9GO-cU_NwI7f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_05,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 mlxlogscore=958 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503110127

Since commit 1fffe7a34c89 ("script: modpost: emit a warning when the
description is missing"), a module without a MODULE_DESCRIPTION() has
resulted in a warning with make W=1. Since that time, all known
instances of this issue have been fixed. Therefore, now make it an
error if a MODULE_DESCRIPTION() is not present.

Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
did my treewide cleanup for v6.11, Arnd had a few more stragglers that
he was going to fix. I hope that by posting, some of the 0-day bots
will pick it up and hopefully provide some feedback.

Note: I'm not really sure if *all* of these have been fixed. After I
---
 scripts/mod/modpost.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index c35d22607978..c0b7a869ed24 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1596,8 +1596,8 @@ static void read_symbols(const char *modname)
 						     namespace);
 		}
 
-		if (extra_warn && !get_modinfo(&info, "description"))
-			warn("missing MODULE_DESCRIPTION() in %s\n", modname);
+		if (!get_modinfo(&info, "description"))
+			error("missing MODULE_DESCRIPTION() in %s\n", modname);
 	}
 
 	for (sym = info.symtab_start; sym < info.symtab_stop; sym++) {

---
base-commit: 4d872d51bc9d7b899c1f61534e3dbde72613f627
change-id: 20250311-moddesc-error-2ad949dcc6ba


