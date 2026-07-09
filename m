Return-Path: <linux-kbuild+bounces-13972-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id D0l2Cii5T2pOnQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13972-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 09 Jul 2026 17:07:20 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A353E732A26
	for <lists+linux-kbuild@lfdr.de>; Thu, 09 Jul 2026 17:07:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FJmsKPRY;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=L34fareB;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13972-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13972-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5115F3191C18
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 Jul 2026 14:49:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A20E3890F0;
	Thu,  9 Jul 2026 14:49:25 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253EE386567
	for <linux-kbuild@vger.kernel.org>; Thu,  9 Jul 2026 14:49:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783608565; cv=none; b=rwegVnJ6g5mzxwh1vXhsnQzI7979zbfrPf/lyM14c9kDsaVrI1drp8XZdbqkIYW6MAV0Txth4Eg0pcjhCInc94vVq0tFbS5VjeAEbPkCacYN11uWmVyZENJofxT9eBZgRczdwF6MGKV6pTrgrgR81hwVsogy9u85D9HNpsDHATc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783608565; c=relaxed/simple;
	bh=Fx8I98chejCgVIaPDpoTZOG6PQad1id268swqWnYKRA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=pI3/bhlV17T/FnQ2aZf51RDplVgtoGnDDTyudTj4enUL2amlNvSD3Ps0isoWMQ0YZ01AQWf6QoSp6r82DPgpSVx9utgQkJPPZPjlsFpb3bilwzYbP2hlhi52TmScbpgLJ8Y3KMMr8MVCT7ngDF9r7DjFDwtCSF8qw3j3MXeLW00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FJmsKPRY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L34fareB; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669Dx5dr1835833
	for <linux-kbuild@vger.kernel.org>; Thu, 9 Jul 2026 14:49:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sBlF+8E2H45VgCzLKYkd9chRzubdxCW2XKqpDUb80gg=; b=FJmsKPRYWJSKZ2cg
	r0nRuF2nXN0A8sapXCce2Yd8vnfwzxlt5yWFjrcu4Xk1i2pio7GMuhAY3pkUs5zI
	gc1pKui090o/rmxwA3jONAlV8tO9W59GuFg32i/BAZvFafi4SiJOROikNZf17Cs+
	Epw9vvX0cXKEPW1ITAPgJwzP8ASOvpS5LprdQVUHtV7KU34wpKCPd44wDerBO/jA
	qzaIsy9NHhoMPPUGJUX6YUaDbB4qw5iZ6sXPauupxMdbudzj87k1Ne6hc4KVyi7w
	tr6RaxU8TJ5ndw1XsNt8xzVf1boakbvTsZlUf1SQn6vdYK3w+xyWFYk3RZePGNfF
	dSU82Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9wwfut4j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kbuild@vger.kernel.org>; Thu, 09 Jul 2026 14:49:21 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ec235c7c66so30313006d6.0
        for <linux-kbuild@vger.kernel.org>; Thu, 09 Jul 2026 07:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783608561; x=1784213361; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sBlF+8E2H45VgCzLKYkd9chRzubdxCW2XKqpDUb80gg=;
        b=L34fareBNAih7U8j/7tQUhijVzDPKLl0nKFGec+bMPTHwkY/mvpD24D241SWzMiDPf
         01qkQdh+icY3N2iliVBZq5K7EiizZ6JQ3bU29FJRWq66kzZngsgJTkGdPMVd52mGGyRD
         jQkqeMH/JD3g0FA5BQomJ+TvobOqM/ELa0HLpbtk6K/AvYlbqroLgUVo/rRaCsl3tsD5
         ANEE4MlENblwzPo4PtGPngPJLqHrKlEZ3+2W0mOCYIRtEyRSaWxWvDooHuOQ5xHXXOjh
         GBHHDxYDdW5NOAT+gV3s4G74CohsbwMZgNAnxTDrIEJRK/H61O2pa93auvNaR6YpTdah
         RljQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783608561; x=1784213361;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sBlF+8E2H45VgCzLKYkd9chRzubdxCW2XKqpDUb80gg=;
        b=Judydx6kSyyV8jSRB9Qdrr2359CcrU9FhQ83h77c5mVfWIhzMnBaOjen5IKW7azqsU
         vVpBWGzGq5sIB72IFu2ygqs9oOD02BIeWa+IvDgK9BBUMRSMgXhw4hrXA4n2gU4dqb2C
         WJpXhlxgGmRLY8BdUFA22ph9vmikuWsk2LcJpiJJjawsc5WS3dIMCAiC6kdYgapQ+jrU
         TpCOj+pU63IrPdMP8G2We40IzgGRXpKYPP4jlMxgqRidt29MFvr8/4CgstUEr3JCFzwP
         h2F9wP5F1fy5pneRNdBaJv1wnye1eDp/pvFQy2ZsLQmDPJexRc0BBAeDJyn8B+U25vNO
         NZeg==
X-Forwarded-Encrypted: i=1; AHgh+Ro72cDZU/4xECuLYXfRpB3lAo+BN2GmGAKNE/E0BRWcToKG63XoyLkhXjB3QOxpR4Y8OIpe2QikmC/4neQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIP1wckvL4tfSpYoRDV/7aEtetaqmjsjqhCJPhgpW3UBAWLeGr
	81vYSC6tFFMS+QA05gErdzo3wG0qzhBEHbKLTOuzC3AJ6x7Bz3kehT590OCq6Qhxac/nzMb9W5I
	Xrw2PJQpY2iLXTLbUhZP9cx0oY3+aHfIfDcesiqfJmv/y+78UjNZyfNQrNM+3aLUfhmFlNdKL7i
	R0JA==
X-Gm-Gg: AfdE7cmVfClkKKUXJ38JK/bzr+WfoHN70S924C3fqi5tdlGmp5GvuYV3ENJ/yi4kx3M
	g7e8+Vj5vSB0hMI6NuY6qZT6o3qOEnFur7XRpdj3P8qBLFtOPGgLFhlP+0N0SvRMdVgguLz25AQ
	WCZg35LiVNHTGThHHkskWu9fMtPz6wcxK4yzFNNQExY/oD0RP6PlVMokMZUoJHcT/+qfULwTaRD
	Fycgevj6OxOpuObC3zKz5zzzXFZy4wAB1IRewA8nm0Xr+uc0pmfC1WFSmmWtgz5nFZ4RVRUyaIC
	VDTcxlzGd/FqWN5ALtCRoDDYqUN/5XBLac16AEOZyaChCs35AgawemTKvAMTpx3J19b5fCcGC1V
	uFnNhao9CkEUDywP52RCsHey4oQLDfMrlreSCIU8bU8PRpj5R7rC7smCyfZJ40oyzeMPrJnHQ5n
	EWc+0EH9ruguS6ZwLS+qbUisio9/jyzNwe/tsGde1SadyVF0yg0TLPXpGqGRKdPr8VMiYN88Egm
	4TDwA==
X-Received: by 2002:ac8:5a46:0:b0:51c:44c:6ad with SMTP id d75a77b69052e-51c8b301983mr79491751cf.21.1783608561355;
        Thu, 09 Jul 2026 07:49:21 -0700 (PDT)
X-Received: by 2002:ac8:5a46:0:b0:51c:44c:6ad with SMTP id d75a77b69052e-51c8b301983mr79491351cf.21.1783608560738;
        Thu, 09 Jul 2026 07:49:20 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19cd88aesm9342636a12.3.2026.07.09.07.49.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 07:49:19 -0700 (PDT)
Message-ID: <158aa658-3109-4b7e-8213-1cc2cbd5aeb5@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 16:49:18 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/2] firmware: arm_scmi: Ensure automatic module
 loading
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Guenter Roeck <linux@roeck-us.net>,
        Jyoti Bhayana <jbhayana@google.com>,
        Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Ulf Hansson <ulfh@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        imx@lists.linux.dev, linux-hwmon@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
        linux-rtc@vger.kernel.org
References: <20260618-scmi-modalias-v2-0-8c7547c1be21@oss.qualcomm.com>
 <8c2a4ae3-95cc-489a-a7a4-90a3ee2597e9@oss.qualcomm.com>
 <20260709-spicy-fiery-squid-6eec1d@sudeepholla>
 <dae4deba-7e5f-434e-80ae-89033bdeb793@oss.qualcomm.com>
 <ak-h8oPcL69fCUg2@redhat.com>
 <f05860be-dd75-49f8-b27a-bff7b554e71b@oss.qualcomm.com>
 <20260709-exuberant-galago-of-spirit-1c908f@sudeepholla>
 <5fb236b7-7b99-40fb-b80b-fa7e1dfccd70@oss.qualcomm.com>
 <20260709-exuberant-narwhal-of-correction-7f4650@sudeepholla>
Content-Language: en-US, nl
In-Reply-To: <20260709-exuberant-narwhal-of-correction-7f4650@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE0NiBTYWx0ZWRfXwqoCdgYOaf1m
 0pZN0Xmmxl52kGS7h8ur7bXGwXhsWsxGJFnKUvCoU1pSFMo42CI1Wmu57sshEOiwKx2ZL0oC+/+
 w5Uw03TneRiIK5s65FpRkzhBwbQ9g/f3dKOhIVbEY1S2eD3CyBRQKEql8lxENC2DkEV9ocpKL0v
 dzC1/j5kMxAyaDIqKVoVpkoaD4dyGLOCpepgMQ/+l0hNiu/tt60kXEQtznCfSs43qzXdubjcmtk
 c55Nj3GeVXAF8gbde0Pp2rfakxsvIVdTRrH5AMHyKSax6DAmWdSBQWXPQiOurMdyPxag3LOPbxc
 GIc72JECQ0kaYVCttH1uG0GLAH7/8Iqj0hSGZkPkadKLWsZSvEnnw1vLXX9wJwKl28HBga+8DcB
 OSkeD0sB1I4hvKSLJujkRw1BY2h89WJZWMWIsfAXBEWgjQfUy6KaLuaFzzm+wh4Yo82hrzgEytB
 cq9UvP7jX9XQHj1zsvw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE0NiBTYWx0ZWRfX6CR2WpHcZDgg
 Yy+7wTYOmI29doeVzG28+pX497Hfyl77Ll6rYGtCLBo2I5Yw1f6gCuGturoFCZzUndV8sHY8SgL
 nb00CfAzI8buJhxAptQ3ihM+0Ww0F64=
X-Proofpoint-ORIG-GUID: YZp0UaQ30UiyzeaOeTuIyxWTNbyKdC8h
X-Proofpoint-GUID: YZp0UaQ30UiyzeaOeTuIyxWTNbyKdC8h
X-Authority-Analysis: v=2.4 cv=Krh9H2WN c=1 sm=1 tr=0 ts=6a4fb4f1 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=LBz1ya_SPPO7fqYsHhAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_03,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090146
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[37];
	TAGGED_FROM(0.00)[bounces-13972-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sudeep.holla@kernel.org,m:bmasney@redhat.com,m:bjorn.andersson@oss.qualcomm.com,m:cristian.marussi@arm.com,m:nathan@kernel.org,m:nsc@kernel.org,m:mturquette@baylibre.com,m:arm-scmi@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:sboyd@kernel.org,m:rafael@kernel.org,m:viresh.kumar@linaro.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux@roeck-us.net,m:jbhayana@google.com,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:dmitry.torokhov@gmail.com,m:ulfh@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:p.zabel@pengutronix.de,m:alexandre.belloni@bootlin.com,m:linux-clk@vger.kernel.org,m:linux-pm@vger.kernel.org,m:imx@lists.linux.dev,m:linux-hwmon@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-rtc@vger.kernel.org,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[johannes.goede@oss.qualcomm.com,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[redhat.com,oss.qualcomm.com,arm.com,kernel.org,baylibre.com,vger.kernel.org,lists.infradead.org,linaro.org,nxp.com,pengutronix.de,gmail.com,roeck-us.net,google.com,analog.com,bootlin.com,lists.linux.dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A353E732A26

Hi,

On 9-Jul-26 16:37, Sudeep Holla wrote:
> On Thu, Jul 09, 2026 at 04:31:00PM +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 9-Jul-26 16:21, Sudeep Holla wrote:
> [...]
>>>
>>> I need to recall why we moved from static list of devices to dynamic.
>>> One reason I can think right now is the vendor protocols and their drivers
>>> But in general it was an attempt to help multiple drivers bind to different
>>> scmi_devices that have same protocol ID. E.g. the performance protocol
>>> can be used by cpufreq and devfreq/performance genpd drivers.
>>
>> Note it is ok to have multiple drivers bind to the same modalias,
>> depending on the reason why there are multiple drivers either one
>> should detect that it is not compatible and exit probe() with -ENODEV
>> or there should be some other mechanism to make sure only one driver
>> loads.
>>
>> E.g. duplicate USB device-ids happen (they shouldn't but they do) and
>> then the drivers typically figure out if they are talking to the device
>> which they were written for, or the other device with the same USB-ids
>> and then one of the 2 drivers exits with -ENODEV.
>>
> 
> Understood. Sorry I tried to explain with examples assuming you may not
> be aware of the details, but now reading your response, you have better
> examples.
> 
>>>> I wonder if we can just move a small part of the drivers
>>>> (some mapping table) into the bus code and then just have this work as it
>>>> does on regular busses. I hope to be able to make some time to look into
>>>> this soonish.
>>>>
>>>
>>> I started with that few years ago and we then moved to this dynamic
>>> device creation. But I agree if it is deviation from the norms(which I
>>> wasn't aware of at the time), we can remove it.
>>
>> Looking at the issue this is causing for automatic module loading if we
>> can get back to the bus enumeration code always creating a device without
>> waiting for the driver kmod to load then that would be good IMHO.
>>
> 
> Sure if it fixes the issue for you. Cristian can point out anything I
> might have missed to consider as he is the one who reworked it and made
> it dynamic device creation which at the time sounded nice option to
> solve the issue. We weren't aware that it could cause such issues 🙁.

Note that before patch 1/2 of this series we did not have working
module-autoloading for SCMI modules at all. With that said yes it would
be nice to get this working.

Can you provide a patch for this to try ?

Regards,

Hans



