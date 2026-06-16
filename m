Return-Path: <linux-kbuild+bounces-13765-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MZz/BYyRMWrQmwUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13765-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 20:10:20 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE9E693DB4
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 20:10:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=k7TJxMK2;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=OIQe0bmi;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13765-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13765-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7944331A9B58
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 18:09:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 254CB3D88E3;
	Tue, 16 Jun 2026 18:09:26 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9FE3D47CE
	for <linux-kbuild@vger.kernel.org>; Tue, 16 Jun 2026 18:09:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781633366; cv=none; b=PSi0XIH6824toI4qv32En3OoMOxiShNv22NzkawaADXdGSsGp7HXqA9vBNXyhIpzZ/sS/92tZb8v+1JJ1buFDvTnuVQ/BhKEv5nSKqq7m2Lgs2qOUrvKPL5JVmUTyT6+Zak/J6uCwIrazOwT5WhtRXhgYytRvbuE0bCSpPupkAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781633366; c=relaxed/simple;
	bh=zuntpegxMNUfLfKRKVJpD+fHhSqwi5sTESBy5Gc11ms=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tc0rIzuKPB7NJZngrsXpemulq03t8UKHJhsj+IRAcgpHw8GOc88j8pmNIDsrDlAEqIFhrB8HFPF9OVl1jHodcIJaSrZ44slA7NQnrGjRf3gaW7gWSe0Q7Lu9irUSDf4fytKYMtXv/oJUtcxCS3h5qdipb4OwuYkJn883kctqO80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k7TJxMK2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OIQe0bmi; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GH8vwO2376165
	for <linux-kbuild@vger.kernel.org>; Tue, 16 Jun 2026 18:09:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PDZtaXjETEhxMoI0zV7AcPBY5Wbkc86wyJ65881hyNY=; b=k7TJxMK2tEDVKdCZ
	fcPYpg+1uVbV2651EKTIOIhdItA5a2Bwr78sfjVqpUSW17xA1Wv2loh9kLX1fr+X
	3MDz2sMbMa0rVouu6JiGpbnUmKhGUXcVCwy1+KojoYTRS/L1O9D7JjkbdHs6vxf5
	PD6vpwOT2WePZYOAXuaVv0iie0JZFd0Adr1CdP8xANnRcsERYRjQyfod3yFxBh23
	eJz73dDbm8afvgtwxq3YHyCTf/cvRpxul4RSheH7JmrjPqnbYIhRftfY0OLeoSI3
	Ger5BUeQPHdO7jIVwrMcDuQiktds+4wDwRl0UywtR594IrfPC+s/P4S5t63jQ1j9
	Vd6V7w==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu3ct2j24-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kbuild@vger.kernel.org>; Tue, 16 Jun 2026 18:09:23 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-13980b6561dso4072935c88.1
        for <linux-kbuild@vger.kernel.org>; Tue, 16 Jun 2026 11:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781633363; x=1782238163; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PDZtaXjETEhxMoI0zV7AcPBY5Wbkc86wyJ65881hyNY=;
        b=OIQe0bmiPqy7fkQUKklATzOaLjPgh2zaWBMhSSxG/51Vhzp29XBtpKe9LU33ZK0T3P
         tQ9InoSiR7RAkxiJiL1lqtEGuWVa7FBNnn3aBGJuN3aXaBl4CREJmn/0osQlT6hMFk1+
         TYDjLvfa8YMLkTbBXMF+PZkBK/PcahJA6DmVRelRVpq6YyMWrCHFq2iezmzh3ITFLdFT
         KNdsuxtEwO6ysi3jWxK9LthEHBJFSmavyeyDoATRJgQ28+FZDNpwsSpeog0aJQHAHOIS
         HBav7thruvYzsOcVBpTDlosrMwmeIsA2e4aiU8v491eJyyPAJ19l4ewiPtRjS963p5m6
         +Tqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781633363; x=1782238163;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PDZtaXjETEhxMoI0zV7AcPBY5Wbkc86wyJ65881hyNY=;
        b=oi9OrUg1o+swq9TD8oK4IS+jtCr71MmOE4YfhJwbj3R1qZqINtsPmoHCouEzTUKxoc
         b/Dxt6XyGtGDxd14IUsgoNsFP4jcQq3K4v1I52wI5TeGM6nowrT6eDqYm19LQ1TjQuAh
         aDGqkExyBtMr7xcz44N8lzsVD4vBaw2tyjXkJ0I/+nBWp9IatqVbDAgm6YPvMubspA8t
         8kTJ5GO7g/s7xXxbLPlgt0JUtwCqza7I/NmgsIcnjE1U0g4lekMfudqDlp9cUbxBcKrN
         YleXdw3xrMSlSTuONzg4A1ypnN+hi8C4RdDK8IxN73X/J2eO8uKoeHy5f6j1VQquev5s
         bCPw==
X-Forwarded-Encrypted: i=1; AFNElJ8cuXlSX0YiYt4WyXk55QXqpMNtiD1871tdMdBuyRlkUvkTeCUHncv0tiGaMCMAsv0YHqSk5YyceXnh0I8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdywod65LpA4Lb/o/BdGUprv3lMesgRM+IFsSCuFKV5d1CMYtO
	3db4iZrtJydpsOSAZrXJR+vkrWXJbwSjzvfb4GWcNe/wWn7RVlnG3++PCMIbCUWFQLCju32JwpL
	aKO0d8sIWRKSwOq+i3ixwemyRfcHTsY3ZD4TGbe1deq+vrlhpIuI1kjKtx9n+fbYNkQU=
X-Gm-Gg: Acq92OHHoT8OcX5wutUgz2k/MzoQt3q5+2RlEavKPKSimRe2FHvIJYc4Mb6OZXYmwGR
	bwcFxlwthKxvSBk47F3DACnTzSLMQZE/wvOGekEdvVlScw/zIlzEqg+35+FaZdWG5UZNNtxrZdc
	ci8vGL1QSFrmzYgtWSToyQtSw6Nx/EODTFxZFhsyOECVfRM2ZEOyfcN9/tqgnvCFJ1MN6XfMx4J
	augZX/e9w6etv5oRioE4FE+NCTHGtc970zngeAe2N0Nb0oYRBOFSqcuy37CjVP5QrPtaf5erQVi
	YfpgGPTYCBo78Cky+xGA3vU9XTUvRxMFBpj6QlWNKJLyB0Pv6Ind2odHPhFnuyEnHT0CjFqSB8R
	GuFS0izGCW/j1lZ8U1bR7vaqKjvbjiehZmg+3Howlwcy+C0zMohQalk4PTEkd6sE=
X-Received: by 2002:a05:7022:68d:b0:137:6bdb:5842 with SMTP id a92af1059eb24-1398f5c45ecmr43997c88.0.1781633363290;
        Tue, 16 Jun 2026 11:09:23 -0700 (PDT)
X-Received: by 2002:a05:7022:68d:b0:137:6bdb:5842 with SMTP id a92af1059eb24-1398f5c45ecmr43970c88.0.1781633362667;
        Tue, 16 Jun 2026 11:09:22 -0700 (PDT)
Received: from [169.254.0.13] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384b916b2bsm13747124c88.6.2026.06.16.11.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 11:09:22 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 18:09:15 +0000
Subject: [PATCH 1/2] module: add SCMI device table alias support
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-scmi-modalias-v1-1-662b8dd52ab2@oss.qualcomm.com>
References: <20260616-scmi-modalias-v1-0-662b8dd52ab2@oss.qualcomm.com>
In-Reply-To: <20260616-scmi-modalias-v1-0-662b8dd52ab2@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781633360; l=6788;
 i=bjorn.andersson@oss.qualcomm.com; s=20230915; h=from:subject:message-id;
 bh=zuntpegxMNUfLfKRKVJpD+fHhSqwi5sTESBy5Gc11ms=;
 b=kEt4IJDgAcszo9qEnabKZ1PfxlY0dKprUvlsugiQm0JnJgv6B2HuknECadqYw9wTY5ru0hGcj
 llEct1gZ35UAhFv/6bNJUnMr8bmgM7PyCuD4VLWerqLC475PpaR0wqw
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=VkhObtljigy9k0ZUIE1Mvr0Y+E1dgBEH9WoLQnUtbIM=
X-Authority-Analysis: v=2.4 cv=SoCgLvO0 c=1 sm=1 tr=0 ts=6a319154 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Fcj57D9thYDiAllwEF0A:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: J-ZLOrVnwtIWTnHaOSwzmoj9FENFOERm
X-Proofpoint-ORIG-GUID: J-ZLOrVnwtIWTnHaOSwzmoj9FENFOERm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDE4NiBTYWx0ZWRfX7AxhJFw2h8PP
 0lh5S70y1p/elB0gER7nloocCQ4oXkQflSXgUqJeMxJVYlR1FLHAdS5KJL437RhAV/xH9xPYYtG
 uncmixhFOnGjWRwn9gu+0bJhyiuacEIfYV7PFME7lIfvKuGeQWyOuWf6rg/L0EpLxLF0W8IS/xI
 fA3PQAdTLi3WmJjIqO2HjFEoB77Nag/RTbgKG55Hojpx0QXomRfQCkW4bee+AjRDX87k1tyfdqW
 az63dp3TIKXvX9bTEIDLLG/Om8jPqV4I0PStSJSUBj8Noy16ht99TTyIdGgsHvk6ckYO9ZZgAk1
 iSuhR6TNCHvRsoErrPBcyc0CAuCsCk+m0ENy15lJV7oZfIHnXx8e7TQ1jE4SGtSAv4VCs7Fr31l
 Cil0nv3ocUg7JDdZ3Nr7z+3cplS1qrYQfK/R4YZiLIoNpdjiW9XV4PbgY+PoiB9o0gQPyWxuGBy
 tZUo5JbvHxGxt9H5N0A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDE4NiBTYWx0ZWRfX/o1FnidtTPwv
 B3LMz7BaU1E2153iztGyvEMvTupu+X7pR1MslsuawTsrZKbr+tjJl/L4MUu5mqtgDjJgCb4CIlo
 xYn4FQoOmZuZES/K97ZPKf1f5t5QbM4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1011 spamscore=0 phishscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606160186
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-13765-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bjorn.andersson@oss.qualcomm.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:sudeep.holla@kernel.org,m:cristian.marussi@arm.com,m:nathan@kernel.org,m:nsc@kernel.org,m:arm-scmi@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:johannes.goede@oss.qualcomm.com,m:bjorn.andersson@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bjorn.andersson@oss.qualcomm.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4FE9E693DB4

SCMI client drivers already describe their bus match data with
MODULE_DEVICE_TABLE(scmi, ...), but modpost does not know how to consume
SCMI device tables. As a result, SCMI modules do not get generated module
aliases from their id tables.

Move struct scmi_device_id to mod_devicetable.h so it has a fixed layout
visible to modpost, add the corresponding generated offsets and teach
file2alias to emit scmi:<protocol>:<name> aliases.

Use the same stable alias format for SCMI device uevents and sysfs
modaliases. The previous string included the instance-specific device
name, which is not useful for matching modules.

Assisted-by: Codex:GPT-5.5
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/firmware/arm_scmi/bus.c   | 19 +++++++++----------
 include/linux/mod_devicetable.h   | 11 +++++++++++
 include/linux/scmi_protocol.h     |  6 +-----
 scripts/mod/devicetable-offsets.c |  4 ++++
 scripts/mod/file2alias.c          | 11 +++++++++++
 5 files changed, 36 insertions(+), 15 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 793be9eabaed..7e344f2ee18d 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -13,11 +13,12 @@
 #include <linux/of.h>
 #include <linux/kernel.h>
 #include <linux/slab.h>
+#include <linux/string.h>
 #include <linux/device.h>
 
 #include "common.h"
 
-#define SCMI_UEVENT_MODALIAS_FMT	"%s:%02x:%s"
+#define SCMI_UEVENT_MODALIAS_FMT	SCMI_MODULE_PREFIX "%02x:%s"
 
 BLOCKING_NOTIFIER_HEAD(scmi_requested_devices_nh);
 EXPORT_SYMBOL_GPL(scmi_requested_devices_nh);
@@ -141,7 +142,7 @@ static int scmi_protocol_table_register(const struct scmi_device_id *id_table)
 	int ret = 0;
 	const struct scmi_device_id *entry;
 
-	for (entry = id_table; entry->name && ret == 0; entry++)
+	for (entry = id_table; entry->name[0] && ret == 0; entry++)
 		ret = scmi_protocol_device_request(entry);
 
 	return ret;
@@ -197,18 +198,18 @@ scmi_protocol_table_unregister(const struct scmi_device_id *id_table)
 {
 	const struct scmi_device_id *entry;
 
-	for (entry = id_table; entry->name; entry++)
+	for (entry = id_table; entry->name[0]; entry++)
 		scmi_protocol_device_unrequest(entry);
 }
 
 static int scmi_dev_match_by_id_table(struct scmi_device *scmi_dev,
 				      const struct scmi_device_id *id_table)
 {
-	if (!id_table || !id_table->name)
+	if (!id_table || !id_table->name[0])
 		return 0;
 
 	/* Always skip transport devices from matching */
-	for (; id_table->protocol_id && id_table->name; id_table++)
+	for (; id_table->protocol_id && id_table->name[0]; id_table++)
 		if (id_table->protocol_id == scmi_dev->protocol_id &&
 		    strncmp(scmi_dev->name, "__scmi_transport_device", 23) &&
 		    !strcmp(id_table->name, scmi_dev->name))
@@ -245,7 +246,7 @@ static struct scmi_device *scmi_child_dev_find(struct device *parent,
 	struct device *dev;
 
 	id_table[0].protocol_id = prot_id;
-	id_table[0].name = name;
+	strscpy(id_table[0].name, name, sizeof(id_table[0].name));
 
 	dev = device_find_child(parent, &id_table, scmi_match_by_id_table);
 	if (!dev)
@@ -282,8 +283,7 @@ static int scmi_device_uevent(const struct device *dev, struct kobj_uevent_env *
 	const struct scmi_device *scmi_dev = to_scmi_dev(dev);
 
 	return add_uevent_var(env, "MODALIAS=" SCMI_UEVENT_MODALIAS_FMT,
-			      dev_name(&scmi_dev->dev), scmi_dev->protocol_id,
-			      scmi_dev->name);
+			      scmi_dev->protocol_id, scmi_dev->name);
 }
 
 static ssize_t modalias_show(struct device *dev,
@@ -292,8 +292,7 @@ static ssize_t modalias_show(struct device *dev,
 	struct scmi_device *scmi_dev = to_scmi_dev(dev);
 
 	return sysfs_emit(buf, SCMI_UEVENT_MODALIAS_FMT,
-			  dev_name(&scmi_dev->dev), scmi_dev->protocol_id,
-			  scmi_dev->name);
+			  scmi_dev->protocol_id, scmi_dev->name);
 }
 static DEVICE_ATTR_RO(modalias);
 
diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index 3b0c9a251a2e..769382f2eadd 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -473,6 +473,17 @@ struct rpmsg_device_id {
 	kernel_ulong_t driver_data;
 };
 
+/* scmi */
+
+#define SCMI_NAME_SIZE		32
+#define SCMI_MODULE_PREFIX	"scmi:"
+
+struct scmi_device_id {
+	__u8 protocol_id;
+	char name[SCMI_NAME_SIZE];
+	kernel_ulong_t driver_data;
+};
+
 /* i2c */
 
 #define I2C_NAME_SIZE	20
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 5ab73b1ab9aa..48b346a26068 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -10,6 +10,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/device.h>
+#include <linux/mod_devicetable.h>
 #include <linux/notifier.h>
 #include <linux/types.h>
 
@@ -951,11 +952,6 @@ struct scmi_device {
 
 #define to_scmi_dev(d) container_of_const(d, struct scmi_device, dev)
 
-struct scmi_device_id {
-	u8 protocol_id;
-	const char *name;
-};
-
 struct scmi_driver {
 	const char *name;
 	int (*probe)(struct scmi_device *sdev);
diff --git a/scripts/mod/devicetable-offsets.c b/scripts/mod/devicetable-offsets.c
index b4178c42d08f..da5bd712c8da 100644
--- a/scripts/mod/devicetable-offsets.c
+++ b/scripts/mod/devicetable-offsets.c
@@ -144,6 +144,10 @@ int main(void)
 	DEVID(rpmsg_device_id);
 	DEVID_FIELD(rpmsg_device_id, name);
 
+	DEVID(scmi_device_id);
+	DEVID_FIELD(scmi_device_id, protocol_id);
+	DEVID_FIELD(scmi_device_id, name);
+
 	DEVID(i2c_device_id);
 	DEVID_FIELD(i2c_device_id, name);
 
diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 8d36c74dec2d..a5283f4c8e6f 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -852,6 +852,16 @@ static void do_rpmsg_entry(struct module *mod, void *symval)
 	module_alias_printf(mod, false, RPMSG_DEVICE_MODALIAS_FMT, *name);
 }
 
+/* Looks like: scmi:NN:S */
+static void do_scmi_entry(struct module *mod, void *symval)
+{
+	DEF_FIELD(symval, scmi_device_id, protocol_id);
+	DEF_FIELD_ADDR(symval, scmi_device_id, name);
+
+	module_alias_printf(mod, false, SCMI_MODULE_PREFIX "%02x:%s",
+			    protocol_id, *name);
+}
+
 /* Looks like: i2c:S */
 static void do_i2c_entry(struct module *mod, void *symval)
 {
@@ -1491,6 +1501,7 @@ static const struct devtable devtable[] = {
 	{"virtio", SIZE_virtio_device_id, do_virtio_entry},
 	{"vmbus", SIZE_hv_vmbus_device_id, do_vmbus_entry},
 	{"rpmsg", SIZE_rpmsg_device_id, do_rpmsg_entry},
+	{"scmi", SIZE_scmi_device_id, do_scmi_entry},
 	{"i2c", SIZE_i2c_device_id, do_i2c_entry},
 	{"i3c", SIZE_i3c_device_id, do_i3c_entry},
 	{"slim", SIZE_slim_device_id, do_slim_entry},

-- 
2.53.0


