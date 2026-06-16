Return-Path: <linux-kbuild+bounces-13767-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6nkoAVmRMWq2mwUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13767-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 20:09:29 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D81B3693D84
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 20:09:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=esYTsWvE;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=SEzQHRZF;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13767-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13767-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 161C53036BF3
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 18:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F5A53D88F0;
	Tue, 16 Jun 2026 18:09:26 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FAD23D7D9F
	for <linux-kbuild@vger.kernel.org>; Tue, 16 Jun 2026 18:09:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781633366; cv=none; b=jicCGBthkn9gD1V283XKGezRRVM6rhqhKARVLeSotiSHK5gRNJy3iaH23CBGsF9dMM1xz89mJKkvJ6aw+GD/7lDq5sbaxrhJJCxuM1YLCYdSJguk0awTKKe4JRF29sqk6RaorsRCCiqTf3xukTFpdLBi5DGvcUKSqycifj6y260=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781633366; c=relaxed/simple;
	bh=QotbZv7vjLrREeiiHMvKmU0dv3R+anoFnJbihk/prqo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MBgPe++8fsLGbjF42kbt9w/HCgkExOMdiKOHlZRl2jMXt2AMvKIq9v1iyzbg++rY/f616SYbh7tVQlhB8VuT9EtmGRPrrJ3mtQpGBrRtJfgqWn79DBYIPNkhTTGcCiVBuDFskIkgFZI4sYc+H5hTjndhhUabKk0Q/5ZH/Dnoo3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=esYTsWvE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SEzQHRZF; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GH94uf3747401
	for <linux-kbuild@vger.kernel.org>; Tue, 16 Jun 2026 18:09:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0jagAJ5kWTSod7R143j9Inn4eTzLl+m9fNAglUfCFpo=; b=esYTsWvEh4aOuFSh
	7viw280LQ4FQ+iMiZ3Y15ia3pIAC4sBuchx3OffabSvixwod+V8pzoS6vytuIl2w
	qncsz8k5xextFHajpYa+ZeoHtcso8KJGhMWOeheYa56XsMRDGZCHVog+5TigKwNZ
	PbpcNaklhblOajAKAcRKxffNAKMJn8H1vUd6NVkDQgjv7qvBfSn1vpdtAmJ3/biS
	NUf/eUz4L0/IvgURbN0AjagvbEgNYTU842Q/Tk2IKqrOf/MT9YiC1zwqEZd+UpIa
	PMsrJNrBSkKkWisiu/UJrhu5lQVaVFQzb/TxJXCfbMUKRDeYWHS4rysm8+Znb8fl
	1nU1Ow==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu0a7uepd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kbuild@vger.kernel.org>; Tue, 16 Jun 2026 18:09:24 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-138acbc0e69so4840595c88.0
        for <linux-kbuild@vger.kernel.org>; Tue, 16 Jun 2026 11:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781633364; x=1782238164; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0jagAJ5kWTSod7R143j9Inn4eTzLl+m9fNAglUfCFpo=;
        b=SEzQHRZFV4BJSqX35BHEzmUKN8V8wqTvXFbuAeORQuybVfoORg1RwVJv262ODETifc
         ZUCWlkmHA8GATM/ydvYugQYxZFj/h0SXD9brfQ6v8/5vYm4DxnWbcgyb4RvhBtWW4J8a
         EZK7wDKM5SdY4ShnB1vBUZT2wzyMIqWaQypc7RjdWVN8Z5jZCl6AwjPzdcz7/A30QB2i
         kjXX7c2uILkMTaI+9QioHUCa5JF7olKvCQ2e4GuF+pWtGAQlLcHALRTqhdfL+LeeYZ74
         +xbBkgozLYZinFB/bI4s3LjUXOgV5Cww3TA+/soNiqu4hjX0zh0GuDyjSj5OhR7bl78w
         1USQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781633364; x=1782238164;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0jagAJ5kWTSod7R143j9Inn4eTzLl+m9fNAglUfCFpo=;
        b=dfdYCDYbo5vNUx9H+xXiwiyUsXNTaVJT0x+m9CNd9yHn0dJhuAtUwk3vkcFBMbGhAF
         KEQzmlHOWlWJvPKll9TGYVrCqnFuk987mIL+PIbiTIQwwvsZ+rmAzbaRzzXSzk1L9in5
         VzmCmeaUaVG9sp6be93FSfThvgZ2a1UWkI0ubkT9m+jJ7jNAAx/gxCNLHrNbhMS8ukjH
         wvp880pChjnR8QhpxszeLUqZ3rWgUsvPrJwIDXduFkmO/05rlfMObG/8kZJ1RkkbAj1u
         bJR5VwtEIzDKCjd+WdWEinbfxoTAYKVf2nq2Y/Vl1uP8TGtacH3w3opjOdvBYoBc+QBY
         dhSA==
X-Forwarded-Encrypted: i=1; AFNElJ+BQdGY0WA58BFJ1zvbK1351vxRQC17zB4oOCFGjmTRPLT96GoESnDOp/6TsPZ4+WFt9+iGIBP4v2UWZ90=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQIarpYRYAi+JyvOazf0obaNCpb9kKamzc3fKx/N644GsZ7rf5
	MdlVHNy4gCKthOGRO1YFdAuLIJggf3Gq9weYMA0UErBsIWX7+VKa7V8iT0cn1Dw8tB2G17ztkl3
	born26ygMTOJb7RY5yfd3A3rS3S6S6a/5gZjmC2qN906A7zn3plrjovCUOoiuV8wQ764=
X-Gm-Gg: Acq92OEBSJFRRobDWMUuOLEmCPmbQFRa18kn52b6TVoyOPbwCidYU9VrnDe5WImTvMl
	85UZk8fZktfclybCERz0FC1co5Iz85/pnfUsX/T2KzsBLtt/M4KiVugYWrClGJP/kwTjkEFFMb3
	66nISN/87CxJSfa0R1MoGmUigyQ0aeQHHLhBi/tdteNhTsZKZ2Ud+dgeDNfllmC87Re/YPUerCK
	gdq1BJTexpMF5Hun3mE+u709YUd59Q93/E56S8vmaLtahnxdjnj9ArgjY26llacpPA/PntN6Pdz
	XfnTkjVjKeyxrMYwOEn6ClYKATdNBHzgLQXL5QsmUoPevlupb4RX+JU/GGgTgyvIbHsRHcTo79C
	3Ndfk6McL4whc1Vfevz4KBO7ZJlXvXO2La9GaOo3jHhl/CH+bUJCCEN3bJMujfDo=
X-Received: by 2002:a05:7022:112:b0:138:4f8f:e2f3 with SMTP id a92af1059eb24-1398f6df39bmr14530c88.32.1781633364095;
        Tue, 16 Jun 2026 11:09:24 -0700 (PDT)
X-Received: by 2002:a05:7022:112:b0:138:4f8f:e2f3 with SMTP id a92af1059eb24-1398f6df39bmr14514c88.32.1781633363605;
        Tue, 16 Jun 2026 11:09:23 -0700 (PDT)
Received: from [169.254.0.13] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384b916b2bsm13747124c88.6.2026.06.16.11.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 11:09:23 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 18:09:16 +0000
Subject: [PATCH 2/2] firmware: arm_scmi: request modules for discovered
 protocols
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-scmi-modalias-v1-2-662b8dd52ab2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781633360; l=3049;
 i=bjorn.andersson@oss.qualcomm.com; s=20230915; h=from:subject:message-id;
 bh=QotbZv7vjLrREeiiHMvKmU0dv3R+anoFnJbihk/prqo=;
 b=mB3teymLVnjogVQ6ExoR0B8j71yObnhG9+mpy3G/YKYbRRmaxd/rbtwdNPct9ZL7MkcP9BRiV
 D/b62Do9yGlCbNRbysR8nEk0uZCXaj60e9kojVb6CI+ua3aIcERljQj
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=VkhObtljigy9k0ZUIE1Mvr0Y+E1dgBEH9WoLQnUtbIM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDE4NiBTYWx0ZWRfX9xiJzGQNDYpd
 5D56wsGJi7HSKS30DOIdIKRuBDHxyXowFFXUrPH19hlqVf55PxtOMoUshZ3q0IWwruAyalOfWmL
 QqoOPx2nKL1XRB/ip/l260G9zVZKS1MczNnvNF0wDwdBUivMzKxvWgA2g8jcsHntF7wLzkydpxT
 o6gyN2oeDQ4quo4mBDxM6dcv6UQSyTUJMLBq0Ze1bdVR/YJcQedg1pR2IO3vwGl/mWOSERzAviH
 O7pPNNKJiIqe41Mq5d4f2GmrEYRwwYZlOqh+1SDy901paCNamBArS7TO8lc2/P2HgBj83xdIDaO
 7lgF+HQoMNWuB8EXHErF8Kl0OSrfaTt/H1gd1iJ8OL9poZDv24PQNM1aRg3h5n1TUNRey2aHx/d
 WQUYTazNX55M8CY4l4ymRhzVZ5kMBHMs0DXZFVIbrWpqcciv2g1bLQJtaeMDs5v4KPE3/7DIaT6
 zbMYfm/5P3VsfC9TpQA==
X-Authority-Analysis: v=2.4 cv=JKALdcKb c=1 sm=1 tr=0 ts=6a319154 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=pziBBDB2UT3EZnJ0EPMA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: o8KdxDAb7yEwRnU5-iXEqw-bS74YJrZZ
X-Proofpoint-GUID: o8KdxDAb7yEwRnU5-iXEqw-bS74YJrZZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDE4NiBTYWx0ZWRfX0bEIwnM8aVKP
 vkzLPkm9/cdSOnrzY0xOtKCKyvK2Jza1asqoEUQb36R5rxYy+eujNIjf8ooJG3Z/8cUEkICETt7
 oaRtJfq15aVbXMS5MXeICZWvgP0sCHE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160186
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-13767-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bjorn.andersson@oss.qualcomm.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:sudeep.holla@kernel.org,m:cristian.marussi@arm.com,m:nathan@kernel.org,m:nsc@kernel.org,m:arm-scmi@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:johannes.goede@oss.qualcomm.com,m:bjorn.andersson@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bjorn.andersson@oss.qualcomm.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D81B3693D84

SCMI client devices are created from SCMI driver id tables. If such a
driver is modular, the core does not know the driver's client name until
the module has already loaded, so normal device uevent based autoloading
cannot break the dependency cycle.

Emit a protocol-level alias for each SCMI device id table entry and
request that alias when the SCMI core discovers an implemented protocol.
This loads modules that have registered interest in the protocol; their
normal SCMI driver registration then requests the concrete client device
and the SCMI bus matches it by protocol and name.

This allows e.g. ARM_SCMI_CPUFREQ=m to autoload on systems that expose
only the SCMI Performance protocol node, where the cpufreq client name
is Linux-internal and not available from firmware before loading the
module.

Assisted-by: Codex:GPT-5.5
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/firmware/arm_scmi/driver.c | 2 ++
 include/linux/mod_devicetable.h    | 1 +
 scripts/mod/file2alias.c           | 4 +++-
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 3e0d975ec94c..8538eedc7c3a 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -47,6 +47,7 @@
 #include <trace/events/scmi.h>
 
 #define SCMI_VENDOR_MODULE_ALIAS_FMT	"scmi-protocol-0x%02x-%s"
+#define SCMI_MODULE_ALIAS_FMT		SCMI_PROTOCOL_MODULE_PREFIX "0x%02x"
 
 static DEFINE_IDA(scmi_id);
 
@@ -3362,6 +3363,7 @@ static int scmi_probe(struct platform_device *pdev)
 		}
 
 		of_node_get(child);
+		request_module(SCMI_MODULE_ALIAS_FMT, prot_id);
 		scmi_create_protocol_devices(child, info, prot_id, NULL);
 	}
 
diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index 769382f2eadd..2cc7e78e35a3 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -477,6 +477,7 @@ struct rpmsg_device_id {
 
 #define SCMI_NAME_SIZE		32
 #define SCMI_MODULE_PREFIX	"scmi:"
+#define SCMI_PROTOCOL_MODULE_PREFIX	"scmi-protocol-"
 
 struct scmi_device_id {
 	__u8 protocol_id;
diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index a5283f4c8e6f..40a37b6bf1ad 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -852,7 +852,7 @@ static void do_rpmsg_entry(struct module *mod, void *symval)
 	module_alias_printf(mod, false, RPMSG_DEVICE_MODALIAS_FMT, *name);
 }
 
-/* Looks like: scmi:NN:S */
+/* Looks like: scmi:NN:S and scmi-protocol-0xNN */
 static void do_scmi_entry(struct module *mod, void *symval)
 {
 	DEF_FIELD(symval, scmi_device_id, protocol_id);
@@ -860,6 +860,8 @@ static void do_scmi_entry(struct module *mod, void *symval)
 
 	module_alias_printf(mod, false, SCMI_MODULE_PREFIX "%02x:%s",
 			    protocol_id, *name);
+	module_alias_printf(mod, false, SCMI_PROTOCOL_MODULE_PREFIX "0x%02x",
+			    protocol_id);
 }
 
 /* Looks like: i2c:S */

-- 
2.53.0


