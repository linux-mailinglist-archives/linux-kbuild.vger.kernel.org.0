Return-Path: <linux-kbuild+bounces-13303-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PBZGgiID2qnNAYAu9opvQ
	(envelope-from <linux-kbuild+bounces-13303-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 May 2026 00:32:40 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C12D95AC5FA
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 May 2026 00:32:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB6373002128
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 May 2026 22:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4866B2F39B8;
	Thu, 21 May 2026 22:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K08MKVsw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zqf4FDAg"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A342D877A
	for <linux-kbuild@vger.kernel.org>; Thu, 21 May 2026 22:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779402679; cv=none; b=NU4XZeYbeoE8eo1/KDwwUWEAqx2XESTfMto4DIWVLZhfbmZboVBO9Tnq0sxck5aHAVlWBVDbRO9SDdUhAkjGpMBG+JT802Wj/WM7dfcJhSExzBBzqzzo8QT6hxt0EtnS8dq/zn4DBlz8fNpXLIb1drnnZLAZrupeuBHNHU++Ybc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779402679; c=relaxed/simple;
	bh=h1L6rq1ESlxjwhrY9baHHF3wqmH0yoC4qa2PjOzY5oc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hFnBSEeID0jUU8Fcb2azM4mj5A8pkTSoJv6w071KxLAwtMJZ2dl8nBCvlVJyAdhaUqFcvWwJ65Vkvc7hwQ69X0j0NapU8lii/wn+W5j5l2O8VweTwg/hpnaDSmGSwf7xgi6wDqT+bv7xFYnYqegSofVlTq6pnrryFgAraQTL0MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K08MKVsw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zqf4FDAg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64LJSN6d312910
	for <linux-kbuild@vger.kernel.org>; Thu, 21 May 2026 22:31:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JJEW00WU2CavgKGhklJTDj5d
	T51ANTog8YdOk70jXbc=; b=K08MKVswpVRGXUB/iIbZFUh51RbGFM+gwyA/xu6y
	H0L71RfP80f1VQy38s+HnbiOTJVgxYy/8492wa1fGQNI1AfFrKSp9YlLdHreq7Wd
	YgdlJpQ61HOpUTs4X/+C4nETnjErfK8dEudXTu4j8PlP4HDx+RNwUTZxL6mXegKE
	YC7ojC8AhRQPAQthtZHm/ftycVoDgCR6gSKZXRC45tuEHhWMsUz0mf4FGlOiFYnC
	O4SjYZDFeGW6jOBdXxLmuoDQ4Rduig7OPYMWPuZrA3dqLnEHDTsN34BGQnwaBgiZ
	8IWK/7UC0hTyTrJPEMxb97GQ7cFbD/hbQYwTEt4qIxVEoQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea8830uaj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kbuild@vger.kernel.org>; Thu, 21 May 2026 22:31:16 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ef37c3f773so6971471eec.1
        for <linux-kbuild@vger.kernel.org>; Thu, 21 May 2026 15:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779402676; x=1780007476; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JJEW00WU2CavgKGhklJTDj5dT51ANTog8YdOk70jXbc=;
        b=Zqf4FDAgbp449hNRB8nHxd4MGe4Is80dPITic9Ra1oVFTzUAVrw0cQyWwal1IeJ0pq
         o/Cw6MoHQ3E5PIJTw7khXp//mZXfT5Q4zbCI4bKkqBcO+KiB3jbdgX07Z3CXN5a27ADh
         VRCEw4nKeSGDKopRObwNtEHCiqiKrM6nw0MsybjeEXBu+mvzCTdrxWdmuYSQtJ92RdE3
         JRTGiEkMrieAQgP68lE8uMsaQNokxvobF7cgJ7e0yJ2xkc47UNvj1iMPM4oLK8lDkqlk
         Dg999uNrPu1Ae5qrbpE6a3RGXeGLdYTF6uoIEqyfzzI/nfm3ULWbUjxAiEg/tGJYjKX9
         Jl9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779402676; x=1780007476;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JJEW00WU2CavgKGhklJTDj5dT51ANTog8YdOk70jXbc=;
        b=LnJQb12x0exo5UCay/IkvTy43wsqs+lx/7mC9nNz8ClHxrqkS3hxlMAc/NxQCNblaX
         Yev4ym9KZKWcQk1JyggQZKEZCBn+2lGLNE5w9GGPgRjyGCrtIfv6bGIKVZzyTCloE4Xj
         0M16++xNwjWWdJ6zlpg4rza+lvSdb0uU46PB2l9gSXQMG4VhzgdZJhdZZB0OmDhk3TSY
         6yOnAL0f+YkS1UVsknWBGc7j5GT+E2McPLWbP3vQ0Ix5jUy0eRlQqXYzpVkilk9l5J0W
         1znMfhFOpCv1EAVwBPimH1ISq9DZC3RWDLH6ktj+Q4TBUwl6H743pR7R+6Za/2+xaY5R
         7YRg==
X-Forwarded-Encrypted: i=1; AFNElJ+QjVbBAbqaKTWMyhNwUTgnjjwMjLjwObDxmP1s9/kvBkvdOSV0hL/3Vh5o8yNWjOiB/nOWADNgZv0Qon4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDsTlkvo8RqZwK8lXzoZdsKofoXSuyrO1ynBKYyjlDvWLT+qNP
	tU4MMcT6cwdN4TNl8xDScE2Pv2/01OoyeiqEF2iHDMXuUf1V9tyFla7iQUbN6n/r1P38rH54rlA
	G5Av5zCT8Io5uZAqEqK6milDRE5ZHsUQ4lRKgwv3sFPdUq0ehb/G0zg6aUimXeD7QOqw=
X-Gm-Gg: Acq92OGfV9PJFpVLhgOWF/Z3AwhqNX9yT19QUG9UWZ1ALrSnbiOgCeG80mNMVBfje5V
	4MW31ctwte0ubox8i34sRCOBIcb2glywW+BhFmdKtZomTzTfTzfufHmap+UCAXq+Sx4OwD2GBI3
	+qE7/rDgbD7Qge+STV88QPh8CgowRPiKbuElNgqba0Mr2oLY3WWiOgsd+jn/lFmomX7KM9/dWcG
	CNDaxVgBpBH9eVZLaAWM3zQ6NK9GfF+ZIb69GHYG/sR05P6rH29Alo7MmwvG3dMXp6XmDGtEsrj
	lzMdpsvc1UrnY7FGY45E12pioKxxLw25BQffCIVBRo5hAPIU7Lfg0K5NMRg7QxMFFqmIxhIVzZX
	VNeWcvrHvOOWzlq6RUcGwoUbe59RR7Lw=
X-Received: by 2002:a05:7301:3809:b0:304:ab8:f89a with SMTP id 5a478bee46e88-30448fd5c6amr555053eec.1.1779402675719;
        Thu, 21 May 2026 15:31:15 -0700 (PDT)
X-Received: by 2002:a05:7301:3809:b0:304:ab8:f89a with SMTP id 5a478bee46e88-30448fd5c6amr555033eec.1.1779402675173;
        Thu, 21 May 2026 15:31:15 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3044b9989d1sm306573eec.29.2026.05.21.15.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 15:31:14 -0700 (PDT)
Date: Thu, 21 May 2026 17:31:13 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Julian Braha <julianbraha@gmail.com>
Cc: Andrew Jones <andrew.jones@linux.dev>, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, nathan@kernel.org, nsc@kernel.org,
        andriy.shevchenko@linux.intel.com, rdunlap@infradead.org
Subject: Re: [PATCH v3] kconfig: add kconfig-sym-check static checker
Message-ID: <numrmmjpnheiawifcjhc5zustrlk6bfv5wtr6ibdzbf7mq5o53@x6wf4zv7jhsg>
References: <20260521204435.534773-1-andrew.jones@linux.dev>
 <f3eb96da-cbe2-4d07-a586-9eade3bf39cc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f3eb96da-cbe2-4d07-a586-9eade3bf39cc@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDIyNiBTYWx0ZWRfX8vWkPgE0pSut
 u8kBtF+pNMZXfYoBxoL3nLF/VvhQtRHZC1AUvzSddWNN6tCLsGa9zfMmAskCBarWuBtCPPzB5TZ
 wySVZrOPzzQW2KKWpE5fjP8HvOt1kqjVUKNs2kKIhtLiWVDtermsa7y6QkICn9sE4/M25dtW0+r
 HcIFvkk5dzj5Jibw6oS7lXBwxFWOQlXv+JfwNTXMwU6US3oB85JnQ7BUjutIhFcSFHuiaz964DK
 EbuM5MQl6HWX2Ef6DoC4SGUQmMXPAOOTQGxI5fxlt8SXkp/Xe6xnBDNe0EK3nsuBO+eOuexIf8q
 k/SvgdqlREn/xJSiCvbKCHP8NyaBjKlsImj+n+OfTNLikXM1/ZImZvftgu14vu9u3HrHSVI0E03
 MVbW6cTOriBldw3iHAEtpocbO6juh89/Q7IZuIgTnLEmQQmJI4JLD70clAN4wsgJUIxOmiz2ZMb
 92u3EI7q42HiSxwZ0NA==
X-Proofpoint-GUID: d5la-Z20ZSDz7CNxJhXCb1YEgMsQW89k
X-Proofpoint-ORIG-GUID: d5la-Z20ZSDz7CNxJhXCb1YEgMsQW89k
X-Authority-Analysis: v=2.4 cv=LsSiDHdc c=1 sm=1 tr=0 ts=6a0f87b4 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=8Z_nkCGK3RhH4F7P-uwA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1011 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210226
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13303-lists,linux-kbuild=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.jones@oss.qualcomm.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C12D95AC5FA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 21, 2026 at 10:01:37PM +0100, Julian Braha wrote:
> On 5/21/26 21:44, Andrew Jones wrote:
> > The checker also warns about uppercase N/Y/M used as tristate literal
> > values following the same logic as checkpatch.
> 
> Thanks, this is better! But...
> 
> While it does catch the Y case now, it still doesn't catch 'Y' with
> quotes. Again, I had to manually inject this into Kconfig; I don't
> actually know if this is used anywhere.
>

Ah, I see kconfig interprets "default 'y'" equivalently to "default y".
That's likely due to an implementation quirk of sym_lookup() and it's a
bit frustrating and maybe even deserves a fix. At least 'Y' is still
invalid, so we can look for "N", 'N', "M", 'M', "Y", 'Y' and complain
when we see them, but that seems more like a job for the corresponding
checkpatch patch[1]. This script is looking for symbols, and symbols
should never be quoted. We only add the extra warning text in this
script for dangling N, M, Y since there's a good chance those should
have been n, m, y instead.

[1] https://lore.kernel.org/all/20260521204605.534862-1-andrew.jones@linux.dev/

Thanks,
drew

