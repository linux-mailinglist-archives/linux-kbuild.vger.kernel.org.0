Return-Path: <linux-kbuild+bounces-10038-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 31783CB1585
	for <lists+linux-kbuild@lfdr.de>; Tue, 09 Dec 2025 23:50:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 406F23006622
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Dec 2025 22:45:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78D0A23B612;
	Tue,  9 Dec 2025 22:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N9jzQEga"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B052EA480;
	Tue,  9 Dec 2025 22:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765320358; cv=none; b=cCcZ/NNrBdy6MFlIpYmmG/wxkKwJLaSDMFSQZMaZ8AwYh0f6oMPgmCDrXjSArSTDLsAdekRVq1vsYcZ0StFbonXBFiMcM9rUsvxtG+slRjHoH+eqqAth186mDVRUSXf8pohDAH6q6NfRA+i9X2MB8GQoVCZZt2egXpcNd3sPoVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765320358; c=relaxed/simple;
	bh=bRrGBR2aItM/iQPyd68sCNpS/93nSpMKZsGy9Y+v6BY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gC8Jop+3CTTkATq07hv3grFTVQu2s0IxEtaauDEHRgGtBa0KvtEkFO2GwsPa6dqfX0vuokD9YYZPf9d3SRA81r3yW4Y9eVeg+CzFrKMddGpeqvPcffzCAnIFnGmz471XwGBPxPDhdFzxo3atVpIBJBoPi+rGPOc4GMOLVsI13Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com; spf=pass smtp.mailfrom=qti.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N9jzQEga; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qti.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B9GiRCL3736300;
	Tue, 9 Dec 2025 22:45:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=86ugyqi4Lef
	X3BGi5TzoK+1RFecovLT8kszLDUoSuqw=; b=N9jzQEgaU1KUZsh4KUQFRej8n7o
	iAqMzrLNNnk1M0Vq+TbOThZZpRdSVzVwUtjUIjmJaX9fAyKXTbJfjgdW3igqqR4f
	RmHh6LzJOpP02AS7RldXhL1Py6i5FkIZN8aAOh7NEnwo6jpQCQ+9J3SmM96iNluO
	K7wNJnCXO+hOebD0v96CJF2R1Njzm6gus7DVHyjZCPgSFoxREKak9VQo8U0xPY7t
	8edm+7IhkRjxaArYFiUidU8iGUEFTsxqxERV36xyN7SsP4963vyzVNegAOIuxs9K
	9N6zWqs6A45fZQ2I8RxhQkKJ+1IaZxDQC8qkxxb21ANms8y8t5QaWbh55+Q==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axp4vsc4p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Dec 2025 22:45:49 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA04.qualcomm.com [127.0.0.1])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5B9MbFum008000;
	Tue, 9 Dec 2025 22:45:49 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA04.qualcomm.com (PPS) with ESMTP id 4axjphnr7r-1;
	Tue, 09 Dec 2025 22:45:49 +0000
Received: from NALASPPMTA04.qualcomm.com (NALASPPMTA04.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5B9Mc728009041;
	Tue, 9 Dec 2025 22:45:48 GMT
Received: from hu-grahamr-lv.qualcomm.com (hu-grahamr-lv.qualcomm.com [10.81.26.100])
	by NALASPPMTA04.qualcomm.com (PPS) with ESMTP id 5B9Mjmpx020890;
	Tue, 09 Dec 2025 22:45:48 +0000
From: Graham Roff <grahamr@qti.qualcomm.com>
To: nathan@kernel.org
Cc: arnd@arndb.de, corbet@lwn.net, grahamr@qti.qualcomm.com,
        linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, nico@fluxnic.net, nsc@kernel.org
Subject: Re: [PATCH v2] Support conditional deps using "depends on X if Y"
Date: Tue,  9 Dec 2025 14:45:48 -0800
Message-Id: <20251209224548.3885246-1-grahamr@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251205182334.GB3974306@ax162>
References: <20251205182334.GB3974306@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: bRQswlGi790igNsZhwToD3tT7Kw5oiJm
X-Proofpoint-ORIG-GUID: bRQswlGi790igNsZhwToD3tT7Kw5oiJm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDE3OCBTYWx0ZWRfXysLvNVirAbjY
 W/+TdxAVesXSgY5QwFNTb2UFATpEEY0Bk1R8ZHEVw2O2CBudF1AbRDyCQBCO8UWmkoGPjKft+H/
 ujQ0M0Qinhh3R3opbhMCJpe9XrltkreucT0N3nf/NDMErqJyeer7Mp1dKn5eLxhMJoPV+XcRQaH
 vaTETRt4k6MXqtiTEj796O65bRr5p6XsZdKzBd3XsT2C0neUM0irdMUzELkXhKliWbA3WS5wFPf
 xqzxH6bC31FzLsVNVAeYS4uwiPkvy3oGdiePfSGKdkY0GY6N5tfZO8JjhqbxmzF4pbVBsQA0t0U
 bnJHLJ6k1KMhRsv+vjvrzIVpnaYZVdb1bArBGSXkQzg/m+OoZVWA0lN/jGLu0zSN+urYrJmrcY/
 e796pC1/mXpzadf6DmJZ5bksAiB02A==
X-Authority-Analysis: v=2.4 cv=IoYTsb/g c=1 sm=1 tr=0 ts=6938a69e cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=FcAhSGPnqhLolX2j8loA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 suspectscore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512090178

> Other than that, this seems reasonable to me. The actual code changes
> are small and the tests prove this works properly. I won't pick up v3
> until after 6.19-rc1 is out at the least.

Thanks Nathan! I will send out a v3 with the commit text updated, and the test
code changes you suggested.

> > > On the surface, the vast majority these become more readable using the
> > > 'if' syntax.
> >
> > Agreed, the question is whether a small improvement in
> > readability is worth the complexity of having multiple
> > ways of expressing the same thing.
>
> It is a tradeoff. Sometimes it is advantageous to increase the 
> complexity in one place so other areas with more exposure to more people 
> are simplified.

Exactly, a small code update here provides a much simpler syntax for 
expressing a fairly common thing (conditional or optional dependencies).

It also makes the language more consistent since most other kconfig commands
accept a trailing "if <expr>" - I just assumed that "depends on" did as well
when first writing Kconfig files!

> >> +config TEST_COMPLEX
> >> +    bool "Test complex conditional dependency"
> >> +    depends on (FOO && BAR) if (FOO || BAR)
> >> +    default y
> 
> With the existing syntax, this could be expressed as
> 
>       depends on FOO = BAR
> 
> or
> 
>       depends on (FOO && BAR) || (!FOO && !BAR)
> 
> and I don't see how the new syntax is an improvement
> over these.

In this case I agree, the test was chosen to validate a complicated 
conditional, not to show a particularly useful real-world example.
I added much better examples earlier of where the "if" style provides
improved readability.
 
> Overall, I'm not convinced by this patch. I have no strong
> objection to anything in here, but I'm worried that extending
> the syntax adds more problems than this one solves.

Both syntaxes have their places, it comes down to which one is most
understandable to the reader. In a lot of cases it is definitely
easier to understand the intent of the expression using "if" rather
than ors and nots. Combine that with the simplicity of the change
and any problems this might add (not sure what those are though)
would seem on balance to be worth it.

Graham






