Return-Path: <linux-kbuild+bounces-13150-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKdHOHZIBWpDUAIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13150-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 May 2026 05:58:46 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6DB53D747
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 May 2026 05:58:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9D97E304D246
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 May 2026 03:57:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FB9A2EC54C;
	Thu, 14 May 2026 03:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="MYuqrcYb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FDB3A6F1C;
	Thu, 14 May 2026 03:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778731062; cv=none; b=DuZToz6Uy56GQY83FNTkfoG4RZDNXkxl6NDgiTZkt42f2n54Cyl6ytrRxakNSzoKcZSv1yT82RZZthfmGDWY8Uq4XPrBHAXHLA6GKeZeGkrTwzgxHCmXRfjbfYphcjTyiqvK19btg7eXVflEaDvsbWBGJsrGY02ifGIKbhgQ3wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778731062; c=relaxed/simple;
	bh=NkZPuusqbBifLgBp7OKn0Hy38J6c7hQsR7qHZZ8b8/M=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=fAfFBLhBseLBtsy+KajfFIommPqc9D/E6/0UufiVM/JWTjZEsEB2YZFN8JGPQMiLVtyPFEV0eiyLgN42WhZK/e3zkNyPpq+I7re7Lu3uOEFlFT/eElnktO9wJapAMpkAcLb8iiQbuktWHOt8BV3t0M2gf02Byb+3tyalOHHrRF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=MYuqrcYb; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DG01xt2611862;
	Thu, 14 May 2026 03:57:33 GMT
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
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4e3nve2qrx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 May 2026 03:57:32 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 64E3sRHu015571;
	Thu, 14 May 2026 03:57:31 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4e3nfgtq49-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 May 2026 03:57:31 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 64E3vTP37144252
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 14 May 2026 03:57:30 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AE7F75805D;
	Thu, 14 May 2026 03:57:29 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E723558055;
	Thu, 14 May 2026 03:57:26 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.247.73])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 14 May 2026 03:57:26 +0000 (GMT)
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
X-Authority-Analysis: v=2.4 cv=Y/XIdBeN c=1 sm=1 tr=0 ts=6a05482c cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=U7nrCbtTmkRpXpFmAIza:22 a=VnNF1IyMAAAA:8
 a=kHXqOBKBtoXf3GAFd-sA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: igSPOgiP3s_d5vwl6tDgMzmF62wGzEjN
X-Proofpoint-ORIG-GUID: TsuJUgoibEFG-KO8v8qigveRW6SIBhAU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDAzMiBTYWx0ZWRfX4EcPI0ixOB51
 QbGriW9vDYNXXvOpBC74/uQrgaYlBFGt4s/MfbjDgjvgNBfX3QzhJ6xMjx/O45CyN9jMzkWG+c6
 3ojwU+X1BqeWAcbjr+wpNN4NYGbMmcpAwOF9QalLCgXtk9FN5UiTLx2vs8AtYFMeUjZ7pRS/rzt
 QYcUZb6W3jLH1/6Vkb/dhdGSWeheMiy0wFh9dgbq7cedL4I7+eoEGccAVALkGGnBNNi6ps1347/
 6qY9CsLOOWPrB3fEVDCDIAXWsFT37wwnCURmVlRFE7rYSp3vLR43TK94GC4MvFhOCHkQHyudh/L
 9btxa0I8DiDeO2Ei5+7T7deraAfGwmzCaMCyBEPOipCgI0kNUylgedb9xRubHzpLzq5hpbSSBg0
 EaPiJnT+x9WOflC3UjjwlFJ5TcyU5kkMFdLQefWFncTFJaIHKMx6MZKGzkYb1zbYfkCLYUSDZy7
 qIZyJ9x5sqdnJW77wag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 phishscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 spamscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140032
X-Rspamd-Queue-Id: 4C6DB53D747
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,lists.ozlabs.org,arndb.de,kernel.org,gmail.com,linux.ibm.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-13150-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arndb.de:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.ibm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[venkat88@linux.ibm.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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


