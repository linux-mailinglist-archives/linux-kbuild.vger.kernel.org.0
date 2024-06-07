Return-Path: <linux-kbuild+bounces-2030-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 819F3900DA9
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Jun 2024 23:43:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 363FE288252
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Jun 2024 21:43:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30DDC155341;
	Fri,  7 Jun 2024 21:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mn2G88TS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39AA1552F9;
	Fri,  7 Jun 2024 21:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717796578; cv=none; b=VgQ7OK3vQGXb9IZRmNeBpEhMnkc3ZM3Pb4YIEA9GahVfvDh/xfMJZZNYy/+c6fLj9PK82yEe5kpltdfPdIEDstjubBOhwanPi7mDKRQW9paYNksDLMpe4CYee3b4QML720AkN8a+zubIL77JlDcGHMsACCYvsERbWV4sXDp7D1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717796578; c=relaxed/simple;
	bh=RB8GBLa09FNKHnCn8Vj4cDIs5G+EZwnXVBse7JCWfCw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=q/o5hhu2Ia0bSyrOtV2m/EvUjoCSPswD3LojrbhhH1z2kxfjpPe0yOjcOJJAvC7GjrV9vKHHhYyQ1rEKM2nthQ1rWD3yBWT/8PRfUm87543B7/j+/8U47N2Ce/DmGjPyRuw7qEiFAok2I7XlJR8Hgcc7BtExfkBYISnEzQ2Vxns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mn2G88TS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 457HZsgJ021561;
	Fri, 7 Jun 2024 21:42:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+8GU/M5AD7kWb/svYR2W8/
	PjPrUCESnALS1ZvO/wzbI=; b=mn2G88TSh5q8Q7g8blnGN6yjbeJMeWbH1dXjRk
	7XQOcwVYsNOwjuRzMnr7k+NctMxBLYds0I7+wSq2iIzFA67dp/Z2OGBsvmYCiiDk
	VKTD9YZDXVg3KYd13Ya4JQfd2ZTyk2iPsAFrP4AkjnqkMggMvH41xYZoBgAT00++
	bbnYs9rG7VCrqQNXUuPia+XqIz+pcWjXoblcIWMpCgKK2d0hUgT3uLFwRxhMvBnv
	oDdQExfd7CX9hlISfbO4WzV8FqkA7/9uF1DeqGFe50B7wcFKoY1lJ4LFc2J3uqap
	sdUxFvtViDyNbd4KD6TeoWUi6/qYMWaMzY1TOY1qqUC1wTYA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ym0sf1mte-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Jun 2024 21:42:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 457LgjVs020625
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Jun 2024 21:42:45 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 7 Jun 2024
 14:42:43 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Fri, 7 Jun 2024 14:42:43 -0700
Subject: [PATCH] modpost: bypass module description test on vmlinux.o
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240607-md-scripts-mod-v1-1-d3cd5a024f05@quicinc.com>
X-B4-Tracking: v=1; b=H4sIANJ+Y2YC/x3MTQrCQAxA4auUrA2kgzjoVcTF/GRswJmWpEqh9
 O6OLr/FezsYq7DBbdhB+SMmc+sYTwOkKbQno+RucOTOdCGPNaMllWU1rHNGX3wpdB2ZXIQeLcp
 Ftv/w/uiOwRijhpam3+Yl7b1hDbaywnF8Ab5BLJB/AAAA
To: Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor
	<nathan@kernel.org>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Vincenzo Palazzo
	<vincenzopalazzodev@gmail.com>
CC: <linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -5g0ean99e-hNJo417IMauExIjobsCPQ
X-Proofpoint-ORIG-GUID: -5g0ean99e-hNJo417IMauExIjobsCPQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-07_13,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 suspectscore=0 mlxscore=0
 mlxlogscore=816 clxscore=1011 bulkscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406070159

When building modules with W=1, modpost will warn if a module is
missing a MODULE_DESCRIPTION. Unfortunately, it also performs this
test on vmlinux.o:

WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o

Relocate the logic so that the test is not performed on vmlinux.o.

Fixes: 1fffe7a34c89 ("script: modpost: emit a warning when the description is missing")
Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 scripts/mod/modpost.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 937294ff164f..f48d72d22dc2 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1647,10 +1647,11 @@ static void read_symbols(const char *modname)
 			namespace = get_next_modinfo(&info, "import_ns",
 						     namespace);
 		}
+
+		if (extra_warn && !get_modinfo(&info, "description"))
+			warn("missing MODULE_DESCRIPTION() in %s\n", modname);
 	}
 
-	if (extra_warn && !get_modinfo(&info, "description"))
-		warn("missing MODULE_DESCRIPTION() in %s\n", modname);
 	for (sym = info.symtab_start; sym < info.symtab_stop; sym++) {
 		symname = remove_dot(info.strtab + sym->st_name);
 

---
base-commit: 19ca0d8a433ff37018f9429f7e7739e9f3d3d2b4
change-id: 20240607-md-scripts-mod-7f7ff091e02b


