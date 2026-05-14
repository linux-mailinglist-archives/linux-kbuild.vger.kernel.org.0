Return-Path: <linux-kbuild+bounces-13149-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKj/D01IBWpDUAIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13149-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 May 2026 05:58:05 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AF653D701
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 May 2026 05:58:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF29B3012E8B
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 May 2026 03:57:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20D913254AF;
	Thu, 14 May 2026 03:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="MYuqrcYb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFB52EC54C;
	Thu, 14 May 2026 03:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778731058; cv=none; b=QDUYZhMqFhWPqpFGLA/ssP4a0e3e+5q6+k/lj7G5h1eJ0fRU+5xGnihKoh3XpfMd6oTFeBa6GMOcUAIFAlga231D+eMlv4BKcb+aSEqiYQRRIIzvSa8m3xdUDNVf0ezhbAbfGpT5g/CRfQangM4vf/0wJX1eozDH9hMgRrBO2Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778731058; c=relaxed/simple;
	bh=NkZPuusqbBifLgBp7OKn0Hy38J6c7hQsR7qHZZ8b8/M=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=meFQh7juW6cqaF5gKhFQtvHkhztPlod7FnYgQ7TTnwqBXz7jTLVAXGaLXaakaZUBmsGBFUnVcbmejJAMI9Bhd1H1cyVlBw9fkioOZoeOP8CKQ5klMj48k29dvsIl181HkoAcOFCeLeg+c7MAPtq+yOqrwmyR5CdMO/3/mGPD2Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=MYuqrcYb; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DF8mjX3179816;
	Thu, 14 May 2026 03:57:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=NkZPuu
	sqbBifLgBp7OKn0Hy38J6c7hQsR7qHZZ8b8/M=; b=MYuqrcYbiHnG3FRuucMaqR
	oVwIKpP1FAbaMVAr51bWxk9ZvEtMS+9hOdCQKsyf9SlYSE/OgfFSGJ/DOlva/ch0
	S53JI5+hfu0Y6iEpc4MD2h2ib5EbmCcIQZNIXyUI181jxmLhmqvEQITVhPqUysvc
	shDhGGT9FJwusciMwCpC2Xxk9Y+wMzdGnsqPc0JjEpKDBuoJVhXMXQFwL7GZ3qLe
	9i2OAswjTq5JUdGr0YBlg68omXiacAj2lBD46WEEAWa5BSMfLhafxB/pILM27l5k
	u7kO9CUOXBSylAaWeyleZIKv/1rBw5W7Gp0GgjIv1kylSBghuSlnOY1+I3xmx6QA
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4e3nv6t87m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 May 2026 03:57:26 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 64E3sZlI020232;
	Thu, 14 May 2026 03:57:26 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4e3nfgjrvy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 May 2026 03:57:26 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 64E3vOPu19595926
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 14 May 2026 03:57:24 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3EE6F5805F;
	Thu, 14 May 2026 03:57:24 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 182B858059;
	Thu, 14 May 2026 03:57:21 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.247.73])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 14 May 2026 03:57:20 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCH v5] char/nvram: Remove redundant nvram_mutex
From: Venkat <venkat88@linux.ibm.com>
In-Reply-To: <20260428061540.73668-1-venkat88@linux.ibm.com>
Date: Thu, 14 May 2026 09:27:07 +0530
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>,
        Christophe Leroy <chleroy@kernel.org>,
        Ritesh Harjani <ritesh.list@gmail.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Tellakula Yeswanth Krishna <yeswanth@linux.ibm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <FC8BDC39-4627-4532-B6FB-C4B88F4DF80E@linux.ibm.com>
References: <20260428061540.73668-1-venkat88@linux.ibm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailer: Apple Mail (2.3864.300.41.1.7)
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=Us1T8ewB c=1 sm=1 tr=0 ts=6a054827 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VnNF1IyMAAAA:8
 a=kHXqOBKBtoXf3GAFd-sA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: -82wwgmnGTBBqlqI576Rb0isCnFyDLa3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDAzMiBTYWx0ZWRfX0QVPaPmgsQ6d
 nqZvBgQdMVAeZi6BOexvBTA4kHAT3k8dyYQtVK8/M8wGx4P3+/wULXDNgXi3gRaHwI5x+J+9UBQ
 IzGHrf7RfcgvljcIUQDGuP+uIa+Fls5GJlAW0MS6JQHHggZj0kN3pSn3XOpSWjUdBva34Ba1Ci6
 eIqY68sZp9W8OHh4VlxWOsgPyfIc77eNlmmfltR58F7avCpUWQaI81i8LMZ8KtwrzAlfELV2tAa
 3Q85Fp6Rpidk87hfd8oHT3KWWmhetQjPKgM6s2embqXyqmPg+K7ky9uemrLI2qD9raMVGHDau8F
 Cj6WgF1s6+d9btaSB4SBtzXilOP5D4KuN7PhVQ4In7kr8hk1IxVpzbNNx2ixzAyF2GMQb35ZZzG
 VMrwxLzjsUv99iX0YsM1/4cgtzT1W7q4dD4yS2yax4N8sG03RzR17T9DOVFR3TKn4DH5pwbvlyY
 zgoefAR9F4SJMvYGIOg==
X-Proofpoint-ORIG-GUID: VaNAjdiS9LV52jR_PqLzJRjnRjUCyJPe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 spamscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140032
X-Rspamd-Queue-Id: 98AF653D701
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,lists.ozlabs.org,arndb.de,kernel.org,gmail.com,linux.ibm.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-13149-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arndb.de:email,linux.ibm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[venkat88@linux.ibm.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Action: no action


Hi,

Gentle ping on this patch.

This removes the unused global nvram_mutex and relies on the
existing per-architecture synchronization, as suggested earlier.

I=E2=80=99ve re-tested the change, and everything continues to work as =
expected.
No issues observed in validation.

Please let me know if any further changes are needed.

Thanks,
Venkat


> On 28 Apr 2026, at 11:45=E2=80=AFAM, Venkat Rao Bagalkote =
<venkat88@linux.ibm.com> wrote:
>=20
> The global nvram_mutex in drivers/char/nvram.c is redundant and =
unused,
> and this triggers compiler warnings on some configurations.
>=20
> All platform-specific nvram operations already provide their own =
internal
> synchronization, meaning the wrapper-level mutex does not provide any
> additional safety.
>=20
> Remove the nvram_mutex definition along with all remaining lock/unlock
> users across PPC32, x86, and m68k code paths, and rely entirely on the
> per-architecture nvram implementations for locking.
>=20
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Tested-by: Tellakula Yeswanth Krishna <yeswanth@linux.ibm.com>
> Signed-off-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> ---
> Changes since v4:
> - No code changes
> - Resent after v7.1-rc1 as suggested by Arnd Bergmann
>=20
> drivers/char/nvram.c | 16 +++-------------
> 1 file changed, 3 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/char/nvram.c b/drivers/char/nvram.c
> index 9eff426a9286..e89cc1f1c89e 100644
> --- a/drivers/char/nvram.c
> +++ b/drivers/char/nvram.c
> @@ -53,7 +53,6 @@
> #include <asm/nvram.h>
> #endif
>=20
> -static DEFINE_MUTEX(nvram_mutex);
> static DEFINE_SPINLOCK(nvram_state_lock);
> static int nvram_open_cnt; /* #times opened */
> static int nvram_open_mode; /* special open modes */
> @@ -310,11 +309,8 @@ static long nvram_misc_ioctl(struct file *file, =
unsigned int cmd,
> break;
> #ifdef CONFIG_PPC32
> case IOC_NVRAM_SYNC:
> - if (ppc_md.nvram_sync !=3D NULL) {
> - mutex_lock(&nvram_mutex);
> + if (ppc_md.nvram_sync)
> ppc_md.nvram_sync();
> - mutex_unlock(&nvram_mutex);
> - }
> ret =3D 0;
> break;
> #endif
> @@ -324,11 +320,8 @@ static long nvram_misc_ioctl(struct file *file, =
unsigned int cmd,
> if (!capable(CAP_SYS_ADMIN))
> return -EACCES;
>=20
> - if (arch_nvram_ops.initialize !=3D NULL) {
> - mutex_lock(&nvram_mutex);
> + if (arch_nvram_ops.initialize)
> ret =3D arch_nvram_ops.initialize();
> - mutex_unlock(&nvram_mutex);
> - }
> break;
> case NVRAM_SETCKS:
> /* just set checksum, contents unchanged (maybe useful after
> @@ -336,11 +329,8 @@ static long nvram_misc_ioctl(struct file *file, =
unsigned int cmd,
> if (!capable(CAP_SYS_ADMIN))
> return -EACCES;
>=20
> - if (arch_nvram_ops.set_checksum !=3D NULL) {
> - mutex_lock(&nvram_mutex);
> + if (arch_nvram_ops.set_checksum)
> ret =3D arch_nvram_ops.set_checksum();
> - mutex_unlock(&nvram_mutex);
> - }
> break;
> #endif /* CONFIG_X86 || CONFIG_M68K */
> }
> --=20
> 2.45.2
>=20


