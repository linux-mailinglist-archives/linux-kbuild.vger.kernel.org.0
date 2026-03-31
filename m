Return-Path: <linux-kbuild+bounces-12380-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAiZMgR/y2mLIQYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12380-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 10:00:04 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE7A365A5B
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 10:00:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D806D306DD6E
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 07:55:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EA4D3B47D7;
	Tue, 31 Mar 2026 07:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MGzR7lBx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="foP/aPAE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFA13D47D3
	for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 07:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774943720; cv=none; b=DdQ0CeFxugAOSvKt0Xc5Bm3B8vXXwUX5fcfk84gR61NtC/THwgeoXDOwKwUQFP5A21IXEx1r5YQTofNLwjU8C5wwbXmo5RClC9+8M8KGebLqJor9UB/7kL/H+RrEndHx5qWjJoSo24YprYKgs4q7z3Aa5U1t5AItf6U/USh1xD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774943720; c=relaxed/simple;
	bh=bfENr2Ga1hRaN0a0ouKuR0lDxkpzobWYOnT0p2/YsIk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KOYwsjoo9+BpcBrgbDKOGMs0FtkPxuIeVwojoT5EVfY6f2XqJN3kt9VI1y3XnGCNG8Dr6+OD/IB1tp2DYXbpxwmTMSgmF8/mF38fQ1NxUmBsQOxnGncpja6OU6xsZK3auJgUvQwA2bIGacX3fqplkQ+LVeMGhlukA6G/WLTC0Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MGzR7lBx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=foP/aPAE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V7jHDL430876
	for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 07:55:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1LskRipLbvIkLFYDOw44HC9Gz57IWPaNBdNoRbXgq44=; b=MGzR7lBx1mzi7Ss9
	yuDUm9ra9bdvpSxHeBBynCFY6poaNaYv8U0I71JGO94QOGCwXODFPQzdsJ12B71d
	nCd2AUXEy0qBH6zz9epBApG1hobev+3XzPDA6FBRz/piz9wlQMHkDlFvFxVh/w4b
	Ahg0JgZeZ293hdKTeRNVBDnF19uPw9L5dtXqSovsBzi111NzRU17ad9Oc/hSf5g6
	OVZxst64/Nyb2QUVbXN48XS1a4j8Aj+rQj28K+7BsGX4Gl3A+jLA9xOno+bvwCBL
	Ix51xCpU3JzPKjpCp/q5DH2EUxty4zKGg5Qlu93eAS7LXo/6/kcEeVPpOc3+jdec
	jEN5yA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d84bfh9j2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 07:55:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b781542c1so130161541cf.1
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 00:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774943716; x=1775548516; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1LskRipLbvIkLFYDOw44HC9Gz57IWPaNBdNoRbXgq44=;
        b=foP/aPAEU08fvqJ38UwRxnsgQwUmrVGwCteXtVPgGglqUDKEko2hiKzrPK5aoxgJsb
         5LhEF6kt/DL9PeBwp+uYsFFx/AzeYGNUW4uq77xo2A2zXh6IlNfKbej+4YbXxd7ys0Ca
         AxOdWZKprFRhsCgTdE08iiMJJphi5OhrQEkcOieHkM3ZZzAQBhR8cbY+0OaFtZoTA4f4
         Rw4ATQoPaEcK5TGNaqUv4f44pvB876cp/feS5eLO//ZMkrD9YPyl1zQ/xFXxK7CeneNj
         bZzulv/aJ9HlOmMTABR+hIFbf/F5hypNHgMFhf2oniS9OusUNspuRwHnroXQR+D3sv1j
         npQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774943716; x=1775548516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1LskRipLbvIkLFYDOw44HC9Gz57IWPaNBdNoRbXgq44=;
        b=O6x7vogiDLvgAHqs3M6/JTQG6141c3MsqSOIPP46D7vKnU1RbsXg8jLvOW8OS3vE2G
         CTlwdLT10f6TENGIbnMxlCSg8U9S6uqPQJWevCZX/cogw3ztPnN0poWhPJZmssZWtY6F
         UZ1gNQQgDgoGHCMV0fvKmaFXYr/Y9+YS8PwZ3ksWZK1sgOAKOJJBbtANdFDdy+6UskYn
         uOErrE3fzB8V04L71DIkY/HDu2G81BDfKpca/rSrGZ4BnjtNuuDg7hD3Ma1ahre0sjBC
         bAmR9KSNrQ2ekvKzfv/B1vC30YjvIG+BT6iXrSKMle0UVgvumbfL0/Tzw4GHWekM2Acl
         itJw==
X-Forwarded-Encrypted: i=1; AJvYcCUBsfgVbL5FzlO+bnACkQY6Wo+qrGwCNzMpD+Y+ytf9GvUeMLZ+IbX4fi5H9a0E6rVJOvR9IK8wn4KNdvM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbkXQ77BrHqXazk+dPDMhX+Ccfq5fGuGn/cFeyFFrXm+tlZqWk
	MnT60pS/lr0FDd864/NSQuSEkTHycyrWcU09dDjP3TN2/2OgNEY5BQfgWXT/jRP1SVniVpIiNjm
	E5Vr5CYhV3fNVU31yjTAiDn8IGx1eXux+4SrfhOtm2tYDLtRiuQ7omVdNW6R6OZw01Tc=
X-Gm-Gg: ATEYQzxSqXnh1JTpHIl/1+vdcn1Vj58UwoST6V25orklwbUQG6kUJtNidLFNPlGnP4e
	ylwSBqRD2Avhee8FyB2szTqpF5yRAFabG5lAOGIgfPW0+c/R0btGljsvgXkSZGxmLJ9nUsbU5/n
	HM6Igwu1EkuqNvWgmx3vSOIJmyiWjReSz/TVTGUa28/5SVzh4GRSRYO5wxaBIX13YPTDc7ahPXq
	AnOHHkdvCPQ5FAsCZzW6UWsqASy5k6xaNLWiIFwL6ro1CAlsgwp6n2xAOpoE17qGRxF69qLFxl6
	wP+vlDgpjw9XjkBjU7Ky0T+pGGhS3FbB6O7tuXZY5FDs93F3n4MDVxY69LJHTK4zEN7P1C5LRwE
	kwbLgJpx3nIQ44Jk15cr4/eBXf8TgvKM822PUgG1WUhs36jT+zA==
X-Received: by 2002:a05:622a:5917:b0:50b:460b:650e with SMTP id d75a77b69052e-50ba38e7652mr188112161cf.49.1774943716570;
        Tue, 31 Mar 2026 00:55:16 -0700 (PDT)
X-Received: by 2002:a05:622a:5917:b0:50b:460b:650e with SMTP id d75a77b69052e-50ba38e7652mr188111811cf.49.1774943716067;
        Tue, 31 Mar 2026 00:55:16 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:29fb:516:a90f:8dda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887c8a546esm12724395e9.5.2026.03.31.00.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 00:55:15 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nicolas.schier@linux.dev>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Mark Pearson <mpearson-lenovo@squebb.ca>,
        "Derek J. Clark" <derekjohn.clark@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-pm@vger.kernel.org, Stephan Gerhold <stephan.gerhold@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-acpi@vger.kernel.org,
        Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v7 0/8] Add support for handling PCIe M.2 Key E connectors in devicetree
Date: Tue, 31 Mar 2026 09:55:12 +0200
Message-ID: <177494370819.4807.18152210084249335606.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260326-pci-m2-e-v7-0-43324a7866e6@oss.qualcomm.com>
References: <20260326-pci-m2-e-v7-0-43324a7866e6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=INwPywvG c=1 sm=1 tr=0 ts=69cb7de5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=nTh72EtQ-9J6yJQhtbMA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA3NCBTYWx0ZWRfX9ZrtJmImL643
 4ARV7wQ98Qt42dRRLvqnlkH5ojwaSjug50WGjqIge8/MKH75cN9uSIFa1lftKCshlryXkY7YEKb
 XAP32hoLXtECc4jnw6zs6vQKJiM+F0FbnfMAQRsPksRcLf5x7iYIwSoM2vAIsAPwc15t4jgGvk7
 wmWi7gGRo3qLs+KOnkim8JtVD4jcvMM9N/ndp5R1ez2Sd7zk9jwt0YmhIqM+p+FnwFyy3Tkk0NA
 NRRhRBufCLIxpO9YZluZJ7BsE8KwSc6d5J4wE0uMjCAAqVFQa9wBSk7LuaaL1Rkk5aMuzCXFPqD
 IM3APWIj06Es9SDA/RdI1pgzI3FYcsfddJjWar9IryCUhGtILobVZCKdvN57PNtPVjOXD5nTpSV
 MhGP78kpoLHsltwJU91WdPEdZJw1mttEgZpBKLmuTWsLsLt183N5gWHQB1F9+WIH/rzoIPSy0R6
 kyz9KALFARvcFEjAxpA==
X-Proofpoint-GUID: TfSZX1o1TUxzxm_9ryhradm4B22KYoQY
X-Proofpoint-ORIG-GUID: TfSZX1o1TUxzxm_9ryhradm4B22KYoQY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1011 malwarescore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310074
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12380-lists,linux-kbuild=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,linux.dev,linux.intel.com,squebb.ca,gmail.com,holtmann.org,bgdev.pl,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-kbuild,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ACE7A365A5B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Thu, 26 Mar 2026 13:36:28 +0530, Manivannan Sadhasivam wrote:
> This series is the continuation of the series [1] that added the initial support
> for the PCIe M.2 connectors. This series extends it by adding support for Key E
> connectors. These connectors are used to connect the Wireless Connectivity
> devices such as WiFi, BT, NFC and GNSS devices to the host machine over
> interfaces such as PCIe/SDIO, USB/UART and NFC. This series adds support for
> connectors that expose PCIe interface for WiFi and UART interface for BT. Other
> interfaces are left for future improvements.
> 
> [...]

Applied, thanks!

[1/8] serdev: Convert to_serdev_*() helpers to macros and use container_of_const()
      https://git.kernel.org/brgl/c/e7fef85039ccdba67d97b2a09f313aceeb6691c8
[2/8] serdev: Add an API to find the serdev controller associated with the devicetree node
      https://git.kernel.org/brgl/c/a2b4814190af5944b276c5fd708d95ea146106b3
[3/8] serdev: Do not return -ENODEV from of_serdev_register_devices() if external connector is used
      https://git.kernel.org/brgl/c/92fa16ecad07dddc5703f7e2ff342441b04c45af
[4/8] dt-bindings: serial: Document the graph port
      https://git.kernel.org/brgl/c/1785c7bc1495e4e22377edffaf0ff8c3c697647d
[5/8] dt-bindings: connector: Add PCIe M.2 Mechanical Key E connector
      https://git.kernel.org/brgl/c/5970c1dafb8adbeab5f6d9a22a4ad5b1c0067888
[7/8] power: sequencing: pcie-m2: Add support for PCIe M.2 Key E connectors
      https://git.kernel.org/brgl/c/0d38285a12a283e12cd589ad5bb46c6f4a8cc647
[8/8] power: sequencing: pcie-m2: Create serdev device for WCN7850 bluetooth
      https://git.kernel.org/brgl/c/3f736aecbdc8e4faf2ed82c981812a6bfc76ea98

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

