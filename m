Return-Path: <linux-kbuild+bounces-10786-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHaOHl+bcWmdKAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10786-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 04:37:03 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC4761605
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 04:37:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8194B408A04
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 03:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 958703EDAD7;
	Thu, 22 Jan 2026 03:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DzZfdJAJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eeIimcnU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07633DA7EB
	for <linux-kbuild@vger.kernel.org>; Thu, 22 Jan 2026 03:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769052721; cv=pass; b=EgYQPJh3pw6LyJHukRT6XsJj57k0zirN5u6Wn8dnkj4hBfsDaaYgGviuSY6lZJZI9dVPxCFieaatYfJ9y6AnJaYQKhICzP8sfDbX9rT9ksyWj/OdAKvK6oei2zRL+0mrCrhIhitn5lWqis6uAr8O5o52LO1mOXdOuo/07pOb0Ko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769052721; c=relaxed/simple;
	bh=YqGJEQXocCu2IXgx1JMKkre0smD+S44fNBjqxDtbnXA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a/AAAi9oiYwW38TuHjjnIXzo5jeo5yU8fpmlNCBvbTbMhbLzmOY7SD4cpatP2ERfVtPHevdgO3t6EbtUmbXqgSnpLiLPuSe87GNRzGpe2NsMBdPyAQUUjNkfCKQnGtP72GZLNgBrugpG2TTgROhKYy5W7A+P80cx9PJ+M+QZ6WI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DzZfdJAJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eeIimcnU; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LN0i4x2727048
	for <linux-kbuild@vger.kernel.org>; Thu, 22 Jan 2026 03:31:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=f38V1daSMqmqUi5nFuou/Qz/Xb9FRonTJr9QHeZssNY=; b=Dz
	ZfdJAJRImGgOrmVy09qIhBY5HgqSq/WtxkaipjMF5sdbJonyjh1+Ln4YBDzevxZV
	QggbQJr2HRRAxJm9anWNK/O+fNCSjykqVXC71i9l1M0OwONVXCUdGtEAU8MZJOtZ
	p3rtf7I3l/tLpM+Qq2w16/LlzxM1T9Ty8hCEjxmrv/67lod4aPnBsB2S+a+qTySL
	GAELu9ZwMj0oNkHGl61RwUz5yOZSAV+LFmG4R3b++VDqdZ5LgACcu9tykjpD9NHE
	cJCoOaSpTJxKpTU0naF5Wh4gw2jcFfiSIVRa7US6UmBxJSJ7gS7jKXQj3vIg/qvR
	f9tzUzIFd+HT7r00PFIg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btysftebe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kbuild@vger.kernel.org>; Thu, 22 Jan 2026 03:31:58 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2b0588c6719so1121296eec.0
        for <linux-kbuild@vger.kernel.org>; Wed, 21 Jan 2026 19:31:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769052718; cv=none;
        d=google.com; s=arc-20240605;
        b=ECDHdQBIo4XcjP3Tcpi3PjpiQ1VXRqK+24aEH87r5H1YGB2Syl2wOv6BLIJyes1oc2
         fKquL2PCbdx12c/9xSwBfbkfesiPu6pPqDM8TgeRTln4XV4lmPjxlnESC4yoFbluiS01
         ZFRNSy1rEgGjEdmBJgnjNE0+oHXq2unBcqCQgqJuV+hmIdfGXxB+8TUeePSaTL0ZKd57
         UcCJjo5fTVExm7LU7KYMuCX0nv9Dym5GzUXtRoXhp4pMBFkNFulCJ4yA/JwXogau5wYE
         alvEiNMGLKD+RYPQ6f4/UHNMmpF0DgAhcrhJsb3zCIrfFsiNBapkBA0YLJzSuEAaAJvq
         WZ9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=f38V1daSMqmqUi5nFuou/Qz/Xb9FRonTJr9QHeZssNY=;
        fh=JVlwuu9pybe1jONZjenRt5qzAvGpwAB6EPF4Hz9kbl8=;
        b=hiTpd07xAmHFN0pbUd1SHkFcZoQRzgHjtuvm0nuVc022IbuFkZkcEBUYbni0ycnXHa
         /oIUCGysFTRShpihZwq9VQq1QvEvC6DIyQ/QY0KKf3ICG2YGnAcKXKg3k+dfhXg8d2Gw
         1TS0Tg6v6+KjrvzUeB/O7/1S7iVy2ID1+8h4vbdtyIo0afmrjrDZSeGKDuvK/f2o9Mm1
         HQtbpJbvTFDSFTInBVGqI4JwMRLpZWvA+KrBKh4W9TLRvpgtTwpFFTlKWJvaucJ5yoNy
         XJzgXi6boYJhaSB+WP8Kficgc9iJ/1IHOKnopk5zLFFAzlc5WH2JnUtkDW2cNvP7EOB7
         tbXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769052718; x=1769657518; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=f38V1daSMqmqUi5nFuou/Qz/Xb9FRonTJr9QHeZssNY=;
        b=eeIimcnUbdAXyC5zJVMbvhhunYHBnGIJEWL4aYwzkaBx/ab4R24Xd0eR9N9mfzHf6n
         ivIHVV6+75hOcoQjA1LwH6bYXhnvfUHIynri3ApPI7Py4c88RzJVb4qaRcLpx1hxvpfO
         bdYFTjuY8tP377unRSU0TipzxoaJ9MtjG3anv9rcSXKgNHB2bAWmDhH1+bjDXE5JBBLU
         kraNhe2XaSVkDVNqmfmI8Y4/FubhEyrN/EZRNdMcCG0ymg/JLZ99HCo2unj5Ibk8W426
         8RXyU0oTRyc9kK4pN+5lCWjKVsWpo5tr4cxA7Xfjuky85i2UgTKSEQA411jQ1I009oDg
         NpOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769052718; x=1769657518;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f38V1daSMqmqUi5nFuou/Qz/Xb9FRonTJr9QHeZssNY=;
        b=TdWcWhzJ/+AnQU2iUjGiDygSQ2Nd/bpCTyJKWEJfOFmOwpkST7tNT5V1YMXtAS8QhU
         zZKWNbY0t4XHhCmyxYZdm7U5ur49qEwQ+tc56+cpD4V9cLD9qxG4NEyTEXFk4O98Mpyu
         yOq08Szn7FoVi6yySpcAZRwVe3mOY3SD0GQA24dR2QBB/1dqjk5OyOTVl+csL8G4kPq7
         OyQn39r5FDLrLa24e+N+kBc3GE47UlN5aJiw2IR7W35FqAnEKeU8ZZAQjgi5Oz+NX3LB
         mbKpTKf4MhDnSisH2i6Wt1xpsF0GRESxw6odL0/H2b46EdXWSx2nKbZa3580rgcE3Ovs
         xlDw==
X-Forwarded-Encrypted: i=1; AJvYcCVP/28Hm73xVQPq1guVXqqZB2ra4AEkzyEhDIepNv+3Nfodjc4O349Bc8E8M2IJOyAn6e5V56LRg3D0bts=@vger.kernel.org
X-Gm-Message-State: AOJu0YwteAMVqNV2Gz6Y1aTayyESXvdsP/zGQA4L2RZA/YhJHhNajeh1
	s1WzBarevi6y5JGDBRZ1XPiYPYWPLrTNMu8BOovJWws6eZYGw7dZn6c6Aevn86oeXPgyrck22t2
	wXJPaXHz/bNHxmPk7NsFfxbwKcy3RvLT/jyp8MtDHBs02r05UD3CfLlz3lAPrmoBQ7wxQzejjoB
	fgefnwqI1p8Ql/J3NqDDY7ii59H8OS8eYDlUQEoXVWsQ==
X-Gm-Gg: AZuq6aKemZCzpJm8yEfw06JAUJUnYc/u/3g3PT0De+b6jRnN09RIE5FVZXnrIA9Oj4l
	MqEjJh6ePqIUce4B2gvNaZvzt/KaWJAc5QxuCGRxbLsWzKLY4IESVQzCy7T7+y8FWrk8Q1Saz0I
	ojfuYIY8h8+WPuggpzrujHKwXiUKFLLtlDqzwn3zhGmbCYF3Ql6Zp0aj7FXCa7t1y2nMrtH4avw
	FWodZiTlSNpXcz18GC5eZTU6g==
X-Received: by 2002:a05:7022:619a:b0:11b:c86b:3870 with SMTP id a92af1059eb24-12476a72fdfmr1188402c88.4.1769052716309;
        Wed, 21 Jan 2026 19:31:56 -0800 (PST)
X-Received: by 2002:a05:7022:619a:b0:11b:c86b:3870 with SMTP id
 a92af1059eb24-12476a72fdfmr1188385c88.4.1769052715500; Wed, 21 Jan 2026
 19:31:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121105801.1827-1-msuchanek@suse.de> <20260121231651.GA601114@ax162>
In-Reply-To: <20260121231651.GA601114@ax162>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 19:31:44 -0800
X-Gm-Features: AZwV_QjjZBDlevCSTRGBPUhBJZbwYWNu3veoPDZepGhNutEwE7FkCuZamuMzoE4
Message-ID: <CACSVV00oEEOXczPXZD9TX9nra7UOqzqBgobH+Q5GFGqQeqvLPQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: dummy-tools: Add python3
To: Nathan Chancellor <nathan@kernel.org>
Cc: Michal Suchanek <msuchanek@suse.de>, linux-kbuild@vger.kernel.org,
        Nicolas Schier <nsc@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=N8Ik1m9B c=1 sm=1 tr=0 ts=69719a2e cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=HBHXGj094uW-_k1tqT4A:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: -H7MvZTYKCddz2cwYDyQiJ4oY7re4Wv7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDAyNSBTYWx0ZWRfX2uyEmuRmMSR4
 d3wH+keL3kfc32mWkov2ilDTpnaGsZr9k5c2hbK+1D+diWx8nTpfH+tLrGPJ/8G/VxFdQYaSzIR
 XsNDgBRoA6rHIIDLPZ4s8tOMd6Jg1agh1ST1W1zqUX/zgkHj48Ev7J7yHGf4fs/9aslaFnfNPSV
 glETztw9sv5uvmOhTU7WGT+NarOM9a5IsN3YL+v+68u3TDvzu1fUp4dPvcbojPdQnt1Vnjt8mEz
 XxJxlob7TaAwxZ4XYDlKCI/VE/CstV77FjWEmgBhzqhFyfCtbQtpA2j1iBuCeBjyraaMXsYPZlR
 E3MDX8csIq5iRsyeQLWx67jjB58BY0zePWo9z2LwAhvCiNpbBev8bc0WVrr6M+WkJyI+IzGIMd5
 LSf8dUTXc1K9AOc1BiHuqaabHXnVvW6zWN22B6OXBl1kk1+ccMwDsFCz4EfEnkNfZ2jEjlLoj36
 fkRtKfEbKJVKDoSg7yQ==
X-Proofpoint-ORIG-GUID: -H7MvZTYKCddz2cwYDyQiJ4oY7re4Wv7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601220025
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10786-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,linux-kbuild@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[7];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com]
X-Rspamd-Queue-Id: 5FC4761605
X-Rspamd-Action: no action

On Wed, Jan 21, 2026 at 3:16=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> On Wed, Jan 21, 2026 at 11:57:57AM +0100, Michal Suchanek wrote:
> > DRM_MSM_VALIDATE_XML depends on a python feature. Add a dummy python
> > interpreter to make it possible to configure this option with dummy
> > tools.
> >
> > Fixes: b587f413ca47 ("drm/msm/gen_header: allow skipping the validation=
")
> > Signed-off-by: Michal Suchanek <msuchanek@suse.de>
>
> Sure, this seems reasonable, as Python may become more used for various
> parts of the kernel over time.
>
> I was thinking this could qualify as a fix for Nicolas to take now but
> the help text of CONFIG_DRM_MSM_VALIDATE_XML mentions this option is
> mostly targeted at drm/msm developers, so we can probably just take this
> via kbuild-next.

yes, this is a developers option

Acked-by: Rob Clark <robin.clark@oss.qualcomm.com>

>
> > ---
> >  scripts/dummy-tools/python3 | 5 +++++
> >  1 file changed, 5 insertions(+)
> >  create mode 100755 scripts/dummy-tools/python3
> >
> > diff --git a/scripts/dummy-tools/python3 b/scripts/dummy-tools/python3
> > new file mode 100755
> > index 000000000000..1f3ac6541dd3
> > --- /dev/null
> > +++ b/scripts/dummy-tools/python3
> > @@ -0,0 +1,5 @@
> > +#!/bin/sh
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +#
> > +
> > +true
> > --
> > 2.51.0
> >

