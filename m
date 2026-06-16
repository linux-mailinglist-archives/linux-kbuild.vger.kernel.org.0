Return-Path: <linux-kbuild+bounces-13766-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5z1cOY6RMWrSmwUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13766-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 20:10:22 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B59693DBC
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 20:10:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=eSQ6G6EI;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CZYF3K1K;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13766-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13766-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 971F131ABE88
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 18:09:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 395153D45CB;
	Tue, 16 Jun 2026 18:09:26 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAED43D565C
	for <linux-kbuild@vger.kernel.org>; Tue, 16 Jun 2026 18:09:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781633366; cv=none; b=IQyLy6s0UCRhi+rhO0lbjpixnrI3C3Nvll3jEQvTsSr+cwC2mGJk+n2xGoXGzwKnSUDPs3st5/nzZXpKLZG+hUWU/ot8AVnuMNRCi3gYEO9+H0/nesEhhPOrPfI7lA/fJ8/hvErYzw+//KA1S8bsTChZD0pFOsHSMgmJhTiTE88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781633366; c=relaxed/simple;
	bh=gSQMryyLHdvcV09dgoClPUfxYxJLHgh4cYOBza3eWEQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FOyunTsgV2j8CcvFsxbsu0bEcQhDs8MxGH53+JHNJ6NRAo0jW754rZNHmQ83dxpwL8qw/owAb2T1DLvGcZu/483auLX5fa1OlajwqLNKVCzLNtryU1nm55Ltcw9cX1x030qpgtMBdsj6DtWRaDNTqYQWqHai6Q+e7kqmUcAgE3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eSQ6G6EI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CZYF3K1K; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GH8toT3746552
	for <linux-kbuild@vger.kernel.org>; Tue, 16 Jun 2026 18:09:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fAKiKuo+7Xo4tAEEl10qvc
	4jZotTrJ4XmaotDb6MuMw=; b=eSQ6G6EI4RGw4WM19eGumGrwdRiSdRQKs0RRQ6
	BjHW/PyvK1eOHeqj5LrfBfP5+MVLwJjTKKWRJb6YHF0yxrMjzb8hkS5p7E8cUIMw
	J1yZtyrPHbwrDLm0WD8lySaH5mKP3Kl42mrcBxt7xplwJzgncVCWGRKSkAy+MRso
	xLrwhPzZCDqgXB4ugiANvDlWfsjAGEIv/aEWHxL6sh3rtW+Ei/fDNuGvwC4qYxD5
	YN1Jsvzlj/fJFYRBMvvQm9Y1OgFlEs8bgcITsCPQ1ybIG8nkoKmlDHaSjj7HiakQ
	/qDT3RFCE0p12DkzHtEcmBtitpsob+s77AOaOisT48ckAunQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu0a7uep8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kbuild@vger.kernel.org>; Tue, 16 Jun 2026 18:09:22 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-13967c19ac6so10733816c88.0
        for <linux-kbuild@vger.kernel.org>; Tue, 16 Jun 2026 11:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781633362; x=1782238162; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fAKiKuo+7Xo4tAEEl10qvc4jZotTrJ4XmaotDb6MuMw=;
        b=CZYF3K1KtqOoCYIvPmv4jLG/jKY6Lj7iRiKBlYogwRnFuF+V1ZnK8TKeGMwBTMd3ff
         qPCnCTWzzQw3FJdWVxx+LRBK3y6ndj3xq9CVwt2wtl+GNhNegcoVDo6CJrtqgz5BvP1n
         qk7k0kad8gTnOBYCCEpWjrjpALQpvwST/qOyNmMDZj9xK2C4tkSxW8C9nsFtW+vNe5lq
         azDvKAIpLCumepFXu50HskJMhCoi5QUmjoGrwIeXjOAPD0U0O2y0EN5eK0xK1H/CU6oP
         CNhsSjh5Eu3AxZ2LtBAVXqFCdHJgE2oCbg/5z6604WNPLcF2TtwaE6E7grslXpLiOJwq
         73VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781633362; x=1782238162;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fAKiKuo+7Xo4tAEEl10qvc4jZotTrJ4XmaotDb6MuMw=;
        b=YFntxLYOmvBEzRtwlEq9udbdH7p88WGlCwKWugKkdO3LhR/JWJUY8pXUfDXCWu3DG8
         BrvFZrAcDX0x3+GQ56PKDtJ925NBmxOYXymEe2sDiBKfciruWEP/oZILYysbwAioKwKh
         qMFTyXfbhR+TwnJPCDQ3HfiGzoeKqq1nqnyxHMYs/jebOElLAKziAq/hJ/jTMBHd+ksK
         AqywjgyQU+azzbvSPnfyEE/ZtMLVrHhzeGv4E7HaIHAQB8WQFmcXybXcG6L+AK4FILZd
         KJPNCI9vOWLtH21g6+8wbOj1bDL+ZJWv3QlOof99nyb+Bh2jzr5HJDcgGS2z1qEtrfnb
         7CVA==
X-Forwarded-Encrypted: i=1; AFNElJ9Z4JIVy7ZEjbqax2vUhuLs2+BoOgFjc1c1gjDcNHffMgMrgU1lgyfuKc+Uo9W+3g73E2TKf/emTlprwoQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQn9F6aZWnY1FjMajc6qSj5LFQxQvySgKBEb8nJJsat/bbexRD
	+kQat6SftyLwIRNDs3I04php80Kaz8IhJmfE72afFxMXiKNc6t2HLcRNvJhRxyD0raP2vHT680v
	i65LrLRFsoeUqG7kW44ps0Pcf5wE/qnoECVQUuDvO2vOhyPUm3Yia5pDlKmWCfdLYofE=
X-Gm-Gg: Acq92OEIeSyL/WvZsurp34Py4FNjfbqtm/8nd4WYBFs770yfysXep4NZtYDxZzeXh4q
	V2pY/dxcBJ+0oD/c+GYe0nQAUevTirS5uMdy/eIEE0LNZBNFu7MdRZjoppJ09DDCoODlcoYRx0v
	NlbLX6KziCMc6apRB2rInuwG2V5HIqYuyYN4bxwHDlmsEBNJ7sKEGBcv8qo6UG3H7X5Ghlz4q4v
	L0jiP/9jHcUPk7ThrOe/nxiEgQVCXV28LkgmAHVB6hIiJtlgSrnOD+7LlS5MvOLUfaJZr6B88ev
	oIQlb/02U1Q2EsnXzizifJp2IMPM8kuenzoa/9kKfImFg2Tqn+zAc6lu3Q7BbpIhgi4k2SMNM3t
	sQ1H1+YF6/AFLr7qUY/gEz8o9tn0VVfx2vCx3Z0FWkShmSADAjoMmqhliOmbH5Ps=
X-Received: by 2002:a05:7022:2228:b0:139:7bac:db41 with SMTP id a92af1059eb24-1398f69ed04mr25456c88.28.1781633362205;
        Tue, 16 Jun 2026 11:09:22 -0700 (PDT)
X-Received: by 2002:a05:7022:2228:b0:139:7bac:db41 with SMTP id a92af1059eb24-1398f69ed04mr25432c88.28.1781633361714;
        Tue, 16 Jun 2026 11:09:21 -0700 (PDT)
Received: from [169.254.0.13] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384b916b2bsm13747124c88.6.2026.06.16.11.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 11:09:21 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: [PATCH 0/2] firmware: arm_scmi: Ensure automatic module loading
Date: Tue, 16 Jun 2026 18:09:14 +0000
Message-Id: <20260616-scmi-modalias-v1-0-662b8dd52ab2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEqRMWoC/yXMQQ6DIBBA0auYWUsCo7LoVYwLhKGOETWMbUyMd
 y9tl2/x/wVCmUngUV2Q6c3C21pg6gr85NYnKQ7FgBqttsYq8YlV2oJb2InSscEWzRjaDqE0e6b
 I5+/XD3/La5zJH98J3PcHRd5bKnEAAAA=
X-Change-ID: 20260616-scmi-modalias-0f32421bd452
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781633360; l=1190;
 i=bjorn.andersson@oss.qualcomm.com; s=20230915; h=from:subject:message-id;
 bh=gSQMryyLHdvcV09dgoClPUfxYxJLHgh4cYOBza3eWEQ=;
 b=hF93igeEPPEEj+VjMuQ/oRz7Gv5WUFbaGYz6EcAFAMGMdz2f+wcZBl7zZGwazwjqTJy2yhDFx
 MXSW0mgkrRxDx2fXqHBhray2y2xzXr9Z6MwzY44vUQpYGYsQZEcrnSQ
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=VkhObtljigy9k0ZUIE1Mvr0Y+E1dgBEH9WoLQnUtbIM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDE4NiBTYWx0ZWRfX7dctipcAuAvb
 hK+vD32g0WJcr45YFjpII0GufBwmNy1YWp8pID4ITqiFf/9HTSriwWXrpo/Ta4IPDk2yWD+ccWL
 SVGpdW1KAq/J6EXl6UfbSJAW2AEKJ6MiaC6Lfy+Ke5iuTRqnNz2gxaRJh5185ojMCEMbAZyVb//
 TUEcaWHo+RFlnvLeM+orW80HSaDzWdaiJr6Zj2aqYqAc45rcl6xzypaa/o+nrwvLmb3GaQvIsbN
 Ofp89zeo4SI0IG2d0YpCOUTLiz/yPpD3BXAHWoKq3ISurdAm1ArRMqGV1WUzkP66t7SIAZGsBLG
 IvptqoPAV3NOsej5kPU94aQ59czmqAv5PJJNn7QDEScwCeTKTX1jbQ/AuXx0vOKCyOSxo8t7GA+
 3dA+aQxp/B5RIF80Gi8lT7w+/+zxam1KkN9XhoqIsr09pNu5Pyg4ntPOKJKxs1TKN1MwpOas5S5
 wj38opdxyrMvotqib9g==
X-Authority-Analysis: v=2.4 cv=JKALdcKb c=1 sm=1 tr=0 ts=6a319152 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=8yBAbjwBbfdicugfQZEA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: YQUOsQJm_rgMkYOolwQzOLIgIxKKM3uP
X-Proofpoint-GUID: YQUOsQJm_rgMkYOolwQzOLIgIxKKM3uP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDE4NiBTYWx0ZWRfX4rA5o1wczOVp
 P2qAn+ZTEF/UZ8WJi5RDogsgVUCraCph6O1B36V83d95LV6SQCiEMwi7AdupuUW6mw2iMLf/pEx
 aA9XMBbfguuScoazEiv3EVoggw+tANg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 adultscore=0 clxscore=1011 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160186
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-13766-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bjorn.andersson@oss.qualcomm.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:sudeep.holla@kernel.org,m:cristian.marussi@arm.com,m:nathan@kernel.org,m:nsc@kernel.org,m:arm-scmi@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:johannes.goede@oss.qualcomm.com,m:bjorn.andersson@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bjorn.andersson@oss.qualcomm.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 76B59693DBC

SCMI drivers such as the Arm SCMI CPUfreq driver are allowed to built as
modules, but they are then not automatically loaded. Rework the SCMI
device table alias support to make modpost consume the information from
MODULE_DEVICE_TABLE(scmi, ...) and allow drivers to be loaded based on
this information, if known. Also add a protocol-based alias to also
trigger driver loading when only the SCMI protocol id is known.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
Bjorn Andersson (2):
      module: add SCMI device table alias support
      firmware: arm_scmi: request modules for discovered protocols

 drivers/firmware/arm_scmi/bus.c    | 19 +++++++++----------
 drivers/firmware/arm_scmi/driver.c |  2 ++
 include/linux/mod_devicetable.h    | 12 ++++++++++++
 include/linux/scmi_protocol.h      |  6 +-----
 scripts/mod/devicetable-offsets.c  |  4 ++++
 scripts/mod/file2alias.c           | 13 +++++++++++++
 6 files changed, 41 insertions(+), 15 deletions(-)
---
base-commit: 8d6dbbbe3ba62de0a63e962ee004afb848c8e3ac
change-id: 20260616-scmi-modalias-0f32421bd452

Best regards,
--  
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>


