Return-Path: <linux-kbuild+bounces-13818-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6VXyNq8WNGq+OAYAu9opvQ
	(envelope-from <linux-kbuild+bounces-13818-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Jun 2026 18:02:55 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 629056A16DE
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Jun 2026 18:02:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="j+4Ad/TB";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bWtzS7iJ;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13818-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13818-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E1AA3039899
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Jun 2026 15:56:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A75232E5B1B;
	Thu, 18 Jun 2026 15:56:44 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CAC82F6184
	for <linux-kbuild@vger.kernel.org>; Thu, 18 Jun 2026 15:56:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781798204; cv=none; b=GSSJCfNGmvOXINPsd7aZbGBtwuXGzgFiG0EJr/8pnpCKSQjhnjbsBiLMs0INStqzXEsIZ7AQhAGaqWqpUedDbm+pUaSBPM4RJvqidVCMGq4gjzOUYN7CwBVNbky7tCtkfZkWw4yXlm60N7/gOqpumhLkoBSdL7ZFlV/p2PVuaes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781798204; c=relaxed/simple;
	bh=mjHNFjrSpakQHraKQgU4+H6bL9gQu4hB14FwBpqmgUw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=G9LppaoxdtU3/rlF9e1FUQtEkjLau4uiM8m449lAXKqtZJjcpi7xWFAzCoSV4ROSyKGPYAjs/yOCJf+smdGLTcjm/zz9isRYGw7oQ86qQcLAtcacoDzT1z+Ad3ulxiC6IDEkGdNmRkju3iZa3i/s4YhjhbPOtpixmmGMSNR36Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j+4Ad/TB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bWtzS7iJ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65IFGU7i2094563
	for <linux-kbuild@vger.kernel.org>; Thu, 18 Jun 2026 15:56:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VcLPpasNEX3QJRIY2M0aIP
	dRTeqR6PucNCShGuq0DT4=; b=j+4Ad/TBxE32rfAqTZbpyHo5FViecn7R35vhpr
	74BEHSF2/qdDmvm+fklFofRMit2uIn8MmjvJl8YgZ6xNgVsThjmZ3BotCkH1eI9/
	louLIg+7SUtah9lg6M0uCp8iZqtFJmlAfKBc7eKX9IpNO1aniohq8rz/FLdjaToH
	q7kBJcoz7BpzIU/SlKHazaORgfwxy/S8vwaDPEh9tr8ApsE73xuAhFNOP+A79pYs
	aeeaKmUMq662gL1I5bm5ogAQ5V2KGJy43PV6w8gdvypO6/lBeIuaHAp4E7ywCsxo
	YnoF/lH5og/tG4XxnDctQi2cLkFhXY389TcmW3IlWx1nC4uw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev19a45g6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kbuild@vger.kernel.org>; Thu, 18 Jun 2026 15:56:41 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-139553dd8acso4460508c88.0
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Jun 2026 08:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781798201; x=1782403001; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VcLPpasNEX3QJRIY2M0aIPdRTeqR6PucNCShGuq0DT4=;
        b=bWtzS7iJBPg6n5tq0TOSnESMpc3T0W2ufYl5B9KuujEnNfbYaQli4ptSgZ0rYBLajr
         BUSiUDWqiF1EII64iNl3cFZKMKeCyvRVfXVZksddCGE+zUA1hy0P9NDWyM7zGie+YIKc
         /bsk1b98YUwbD4uqYOSPb/ldAYnu7eMU2uEuaxXRL4o+NbDaNOqUJ9pTSy1vPG9TbxDo
         6/d6muaqZa4gmCJ8mEGP4RX/ZJp88hdUb0FMFhhWozKmkA74Cs4lrn13tlNKgZOVnk73
         oGgOLJrmMr4S6VMRvb4cuNHhdnm13FlXFDly+i53Slyc7AkAQS65Nre8rRY1TqxbKkpW
         ahzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781798201; x=1782403001;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VcLPpasNEX3QJRIY2M0aIPdRTeqR6PucNCShGuq0DT4=;
        b=p4HdK4DiciIOIWhpxK2GNf3LTXg+yvwW97Tytuu3z5gthTqbWZd9nz/OknRgv9SOLG
         CPVRlodhL6ZuM8wc45aAzn6rI97LV4qsG9q7xKVNMrn92hg1YDOxZYM2mt3595Q8J4tb
         vv7yXOTyXmU6K6JMktK00keacOkmEYM/gtjAgKIRfq9KFKSDCRZM6YCLFg5w2s5kDI3j
         Q7tepBZvyN+e72+gmhC8pKWm2FewRH97M5fRiqELAseilRr0ugxNs7YYaRCbxRET1SPG
         PAjGFD1XfB1WIOdIQ30o51n/tC8ZcAYJ5tPrMThBopmzIXOT8Wp03bMGK4tafUUj+8DS
         QQQg==
X-Forwarded-Encrypted: i=1; AFNElJ85bHWbOOzUoiLrCtk/4orZyzeF3eeF3HjYHF7/raNLPLI8lRkn6oFMmTNRP/CBOCkEuxyAQfwlSQdVFfk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXv4WCdkfCT/FEqdNe5D7wFY19p6/wIAPV3rIDf0vrUKnuQRwH
	L3eSg66777NJXkCYxvfxfxaaFYR17dDNtTRX7WDyNgZGgcf58E+T5wQ9eD/MUAO9DEDgJYEsyGr
	vQLLizTt9vGRVvynik/wUgI5hB8vTvfhaKjNTqBIACm6cTTBwEitfOnZJFlp5DAj4jjM=
X-Gm-Gg: AfdE7cluhl2io7cB1giE7zkcSw/AqRcxLxFICR5O3kGDtKEb+AdfQcZeEDKHSIpUoOn
	Pk+aH7f05ZT4m9daKiAJXeA83NeS4EfN4Y78ov1i3THaqjZQp3cDRwc2nhvW4UmYVv485LDgwtx
	XnFrXiSVVEDj14VgKbR1Nuvyy/IHpvl2poKekzdxoeLyKWNKHPFYEu3E/5Z/LpjgRMpjdSODR1K
	eM5gOq3M7//KWOVjnAjy8kO2xzhy+LUHAW7p9JIhg6FWziq2ApAzFa0VxpkKroUFvf/oeuM9Nt2
	71iBUp80+t/iDt5T0Vg7WluB7/mpGsy+fNHeCODzOxX2B4xHJk2uN83CfXQlrqyNDi2CPHw0a0I
	zkL70CYku2N+ARLeC5mp/kHiRsBOGkxMEAZXaKumGDBqxGA5LgJk0
X-Received: by 2002:a05:7022:624:b0:137:eb21:eafb with SMTP id a92af1059eb24-139a210d950mr184925c88.13.1781798200907;
        Thu, 18 Jun 2026 08:56:40 -0700 (PDT)
X-Received: by 2002:a05:7022:624:b0:137:eb21:eafb with SMTP id a92af1059eb24-139a210d950mr184876c88.13.1781798200388;
        Thu, 18 Jun 2026 08:56:40 -0700 (PDT)
Received: from [169.254.0.13] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384b9110d3sm19671267c88.5.2026.06.18.08.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 08:56:39 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: [PATCH v2 0/2] firmware: arm_scmi: Ensure automatic module loading
Date: Thu, 18 Jun 2026 15:56:33 +0000
Message-Id: <20260618-scmi-modalias-v2-0-8c7547c1be21@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADEVNGoC/3WNyw6CMBREf4V0bUl7hca48j8Mi76QayjFXiAaw
 r9bcO1mkpPMnFkZ+YSe2LVYWfILEsYhA5wKZjs9PDxHl5mBACWUVJxsQB6i0z1q4qI9QwXSuKo
 Gljdj8i2+D9+9+THN5unttEv2Roc0xfQ5Dhe59/65F8kFVwrMxbkatIFbJCpfs+5tDKHMwZpt2
 741G+bgwwAAAA==
X-Change-ID: 20260616-scmi-modalias-0f32421bd452
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Guenter Roeck <linux@roeck-us.net>,
        Jyoti Bhayana <jbhayana@google.com>,
        Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781798198; l=3732;
 i=bjorn.andersson@oss.qualcomm.com; s=20230915; h=from:subject:message-id;
 bh=mjHNFjrSpakQHraKQgU4+H6bL9gQu4hB14FwBpqmgUw=;
 b=hBg6Nk9j8qta0n05zkLply061xcL+eKoogc7g6U/ddVe3HybQC8J6n/rGWlCHlG6Rs3u3pXA1
 tTC1mEfs4N3BHALIzXBsVdWzGKEoLUmiZW+sPGVEdal1Zj/Blud0IQn
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=VkhObtljigy9k0ZUIE1Mvr0Y+E1dgBEH9WoLQnUtbIM=
X-Authority-Analysis: v=2.4 cv=YbmNIQRf c=1 sm=1 tr=0 ts=6a34153a cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8
 a=IpJZQVW2AAAA:8 a=20KFwNOVAAAA:8 a=KKAkSRfTAAAA:8 a=8AirrxEcAAAA:8
 a=pGLkceISAAAA:8 a=_jlGtV7tAAAA:8 a=1XWaLZrsAAAA:8 a=gAnH3GRIAAAA:8
 a=P-IC7800AAAA:8 a=JfrnYn6hAAAA:8 a=Bhy_3RDnOwLV862tVBkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=IawgGOuG5U0WyFbmm1f5:22 a=cvBusfyB2V15izCimMoJ:22
 a=ST-jHhOKWsTCqRlWije3:22 a=nlm17XC03S6CtCLSeiRr:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDE0NyBTYWx0ZWRfXwKkOHFudmCvf
 tehmflWAD33+kdbGDNxOwQ52DSzTMYJaUHGo+cAshAY+/NbXteRqw58SKfJt2DerN4hWNqPnapR
 WulXljiBUsSQNEGLapdOgaH9bMPjYkw=
X-Proofpoint-GUID: WmdhiZEqU35WHC3qnt1ijdyUVovSrvmd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDE0NyBTYWx0ZWRfXw4DMDYIv5b78
 rQJ4UEQv1ATq6P4h00SOSI4pazuwtQ+n4kGC5kGRcCRZ7J7yJCOfdJEexdiPeXg+HehSU7M+33l
 m14E3/ByNpv94DAU4m8trhVRmtin2LTdpY79jrqOfhnv2byZZZ+6jTNU9xgwlAz1hLzlFGuzOjk
 UwDATbJGuSLxXW2wmXekGg5OxapYD4p8PuQ8cVFMQ7LklxdSusg9RTIAdCRNgGbIAGbh5rtYT1c
 Db+wCeUwN8sm+7jGQF6Vi8GH5E/L1chZ4/c0g3aPXQYj3D/Rk2B8P2wUkTmt1LB2vi5beRfP9T3
 dQAQmUmMIGMKcsWBEgqyo8lgF2h2scxR+yXYjJrxkedxV9rBB+aBt0SJ/C0o7mj1EMkca4qUkul
 npL2bRPOLIZjTWkum64296vNAvFB50MFXqO3uwvmhnvaFx96ycY7wlixIaiWG5wtv45VDM/TsgJ
 mojfsEVqxMEn5MrRZsw==
X-Proofpoint-ORIG-GUID: WmdhiZEqU35WHC3qnt1ijdyUVovSrvmd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180147
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[38];
	TAGGED_FROM(0.00)[bounces-13818-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sudeep.holla@kernel.org,m:cristian.marussi@arm.com,m:nathan@kernel.org,m:nsc@kernel.org,m:mturquette@baylibre.com,m:arm-scmi@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:johannes.goede@oss.qualcomm.com,m:bjorn.andersson@oss.qualcomm.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:rafael@kernel.org,m:viresh.kumar@linaro.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux@roeck-us.net,m:jbhayana@google.com,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:dmitry.torokhov@gmail.com,m:ulfh@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:p.zabel@pengutronix.de,m:alexandre.belloni@bootlin.com,m:linux-clk@vger.kernel.org,m:linux-pm@vger.kernel.org,m:imx@lists.linux.dev,m:linux-hwmon@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-rtc@vger.kernel.org,m:dmitrytorokhov@gmai
 l.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bjorn.andersson@oss.qualcomm.com,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,oss.qualcomm.com,kernel.org,redhat.com,linaro.org,nxp.com,pengutronix.de,gmail.com,roeck-us.net,google.com,baylibre.com,analog.com,bootlin.com,lists.linux.dev];
	RCVD_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bjorn.andersson@oss.qualcomm.com,linux-kbuild@vger.kernel.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,bootlin.com:email,nxp.com:email,qualcomm.com:dkim,qualcomm.com:email,pengutronix.de:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linux.dev:email,arm.com:email,roeck-us.net:email,linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 629056A16DE

SCMI drivers such as the Arm SCMI CPUfreq driver are allowed to built as
modules, but they are then not automatically loaded. Rework the SCMI
device table alias support to make modpost consume the information from
MODULE_DEVICE_TABLE(scmi, ...) and allow drivers to be loaded based on
this information, if known. Also add a protocol-based alias to also
trigger driver loading when only the SCMI protocol id is known.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
Changes in v2:
- Use request_module_nowait()
- Drop #include <linux/mod_devicetable.h> from scmi_protocol.h
- Link to v1: https://patch.msgid.link/20260616-scmi-modalias-v1-0-662b8dd52ab2@oss.qualcomm.com

To: Sudeep Holla <sudeep.holla@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>
To: Michael Turquette <mturquette@baylibre.com>
To: Nicolas Schier <nsc@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Jyoti Bhayana <jbhayana@google.com>
Cc: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>
Cc: Nuno Sá <nuno.sa@analog.com>
Cc: Andy Shevchenko <andy@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: arm-scmi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-pm@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
Cc: linux-iio@vger.kernel.org
Cc: linux-input@vger.kernel.org
Cc: linux-rtc@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org

---
Bjorn Andersson (2):
      module: add SCMI device table alias support
      firmware: arm_scmi: request modules for discovered protocols

 drivers/clk/clk-scmi.c                         |  1 +
 drivers/cpufreq/scmi-cpufreq.c                 |  1 +
 drivers/firmware/arm_scmi/bus.c                | 20 ++++++++++----------
 drivers/firmware/arm_scmi/driver.c             |  3 +++
 drivers/firmware/arm_scmi/scmi_power_control.c |  1 +
 drivers/firmware/imx/sm-cpu.c                  |  1 +
 drivers/firmware/imx/sm-lmm.c                  |  1 +
 drivers/firmware/imx/sm-misc.c                 |  1 +
 drivers/hwmon/scmi-hwmon.c                     |  1 +
 drivers/iio/common/scmi_sensors/scmi_iio.c     |  1 +
 drivers/input/keyboard/imx-sm-bbm-key.c        |  1 +
 drivers/pmdomain/arm/scmi_perf_domain.c        |  1 +
 drivers/pmdomain/arm/scmi_pm_domain.c          |  1 +
 drivers/powercap/arm_scmi_powercap.c           |  1 +
 drivers/regulator/scmi-regulator.c             |  1 +
 drivers/reset/reset-scmi.c                     |  1 +
 drivers/rtc/rtc-imx-sm-bbm.c                   |  1 +
 include/linux/mod_devicetable.h                | 12 ++++++++++++
 include/linux/scmi_protocol.h                  |  5 +----
 scripts/mod/devicetable-offsets.c              |  4 ++++
 scripts/mod/file2alias.c                       | 13 +++++++++++++
 21 files changed, 58 insertions(+), 14 deletions(-)
---
base-commit: 8d6dbbbe3ba62de0a63e962ee004afb848c8e3ac
change-id: 20260616-scmi-modalias-0f32421bd452

Best regards,
--  
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>


