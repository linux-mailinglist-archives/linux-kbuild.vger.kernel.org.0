Return-Path: <linux-kbuild+bounces-12145-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +ICjGlPtwGm3OgQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12145-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 08:35:47 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D96842EDA72
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 08:35:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D3608300766F
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 07:35:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0788D33C53F;
	Mon, 23 Mar 2026 07:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="HNwOQPVm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B0B2BEC5E;
	Mon, 23 Mar 2026 07:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774251344; cv=none; b=kSG65v77S6OjlrTU/EqIdsdS4wU99laBQfdX2gCN8Sm/AsGrjLO5jnoIELNWz0DpvoY0hOhHfjU3GAp43C6123Wf0YLAXDpLcoVIYsTeZdnwCtO5AF55noQGTOabOrCno0RidnrUptzqj6bhE/eTCFCJ4KY1SeLGCvds0JqQfIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774251344; c=relaxed/simple;
	bh=SJhhKqujQzlu0ONFyfAqpPnBCwiyyQjCXhtIgPy/XpU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PEiE6O2hH8lyFxmFm0MsTroNgZ5U8vU/695oepVXDG3sDoPyi4JRw0HJjrvWaci//XMaYKiFrTfBQ6cgrWEkv3Chvr2qz26P6q8jpCcV2TCO/isrbN2LrN23LGHMxTOq8a9Iyx/KgD49mmKYqMMu3Eu2a68kOhb43aCKCQZ7j74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=HNwOQPVm; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62MAvo2A3340564;
	Mon, 23 Mar 2026 07:35:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Q4j1X3
	yQmWfKOL/vVm6xaFQOiBbR28tAWXlPGIFCkA0=; b=HNwOQPVmEVNfXyuWiJ+DAQ
	bV/2KevSuixwVCYg9/xv6QR4m1KFZQ/nS8ODzJ2ZCi5KmBPXhod5SPiX9tJfEH+Y
	6dalDZMG+pxJ8p1Uvu68paQ1jSprjSw/o2ZHuNx3FCWxeNt8/+cS05vW9esWhhhG
	idLJa9hXL/sPV8ha+GkZEEu+yM+yyaksTDStu+rP/wQG1P23CbFETAN6buxNbw6o
	Wn1d+FY4BMcQRuJVi4tIACdZC3rieeUpexd9EI9pdCzEQn5ko6pbFGZhpy4irD3v
	b9gff4Gkb6lj+AI/sCFX76rQ5fEke4aIQ5hGoBU6/VJuG2oSQF7sV6bA7x6lM7UA
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4d1kxywhck-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Mar 2026 07:35:22 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 62N38TQD004407;
	Mon, 23 Mar 2026 07:35:21 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4d28c1v68t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Mar 2026 07:35:21 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 62N7ZKIj55706086
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Mar 2026 07:35:20 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9186E58052;
	Mon, 23 Mar 2026 07:35:20 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D169058054;
	Mon, 23 Mar 2026 07:35:13 +0000 (GMT)
Received: from [9.61.247.60] (unknown [9.61.247.60])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 23 Mar 2026 07:35:13 +0000 (GMT)
Message-ID: <c518c792-63fe-4ee3-bb18-fb1b59520a89@linux.ibm.com>
Date: Mon, 23 Mar 2026 13:05:12 +0530
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] char: nvram: Remove unused nvram_mutex to fix
 -Wunused-variable warning
Content-Language: en-GB
To: arnd@arndb.de, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, nathan@kernel.org, nsc@kernel.org,
        ojeda@kernel.org, masahiroy@kernel.org, linux@weissschuh.net,
        tamird@kernel.org, rostedt@goodmis.org, ihor.solodrai@linux.dev,
        ritesh.list@gmail.com, maddy@linux.ibm.com, peterz@infradead.org
References: <20260323072422.25730-1-venkat88@linux.ibm.com>
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <20260323072422.25730-1-venkat88@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA1NCBTYWx0ZWRfX3qWh0ceN/7/N
 8nB5mK/Nh1lx9CwMxR662D93MjGWIKcB+N3+m6IONlzEsRZp+z/H1xqiU7lkNqzHGSOSdWtrfYK
 Ul4uQcKpq8ZW4p0DuVaRnZ3UVmWMA5zlMW9WJGxEcR6dOHaFtfO57Hq10xYa2UCPI+rz0SquMiS
 lSNP4OHyKQEoE8K5dO//qmZ6LOxTGx8CJs3x0NeYG8Q0/8LxAYuxHL8NNBKsuIyNyoMlsj329m/
 Vw4U+ybFX0YktQnfwjLk9Ez2J2NrPnlVAj7Fz7hzk2lRUtgQMWfVm2u8J6H5kUGkZAujNNKDs1e
 qjs+UhsKSCoPVNoTGImoBHSxiUZ0msDD8QgLV5pLc6BRYJPkdC5lpdfhH6O9CXktMgMRkcs+5zR
 yThYV5TcKhVTCoO6+Jb0hblpY7aWOOtSWBU8nk0N/eV7R7zRLXPK7eiNke+4kNys4vZMX5SRlvM
 4azib8rAh8Ib6R121BA==
X-Authority-Analysis: v=2.4 cv=JK42csKb c=1 sm=1 tr=0 ts=69c0ed3a cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=VIzm9ZymDEyWMT5NIq8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 8MtyErc3tNZydkP8MOMsOvnnY-XMRY2s
X-Proofpoint-GUID: GhAJn_2wzw8uyzmoMhK7P09YQtJ3VUkW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230054
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.ozlabs.org,kernel.org,weissschuh.net,goodmis.org,linux.dev,gmail.com,linux.ibm.com,infradead.org];
	TAGGED_FROM(0.00)[bounces-12145-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCPT_COUNT_TWELVE(0.00)[16];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[venkat88@linux.ibm.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: D96842EDA72
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Please ignore this. Sent v2 [1]

[1]: 
https://lore.kernel.org/all/20260323073220.25798-1-venkat88@linux.ibm.com/


Regards,

Venkat.

On 23/03/26 12:54 pm, Venkat Rao Bagalkote wrote:
> drivers/char/nvram.c defines a static mutex 'nvram_mutex' which is never
> used. This results in a compiler warning on linux-next builds:
>
>    warning: 'nvram_mutex' defined but not used [-Wunused-variable]
>
> Remove the unused definition to avoid the warning.
>
> Signed-off-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> ---
>   drivers/char/nvram.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/char/nvram.c b/drivers/char/nvram.c
> index 9eff426a9286..2ce3307663ed 100644
> --- a/drivers/char/nvram.c
> +++ b/drivers/char/nvram.c
> @@ -53,7 +53,7 @@
>   #include <asm/nvram.h>
>   #endif
>   
> -static DEFINE_MUTEX(nvram_mutex);
> +static __maybe_unused DEFINE_MUTEX(nvram_mutex);
>   static DEFINE_SPINLOCK(nvram_state_lock);
>   static int nvram_open_cnt;	/* #times opened */
>   static int nvram_open_mode;	/* special open modes */

