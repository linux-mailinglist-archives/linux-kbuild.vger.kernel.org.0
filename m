Return-Path: <linux-kbuild+bounces-12705-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKKhCnvI1Gk0xgcAu9opvQ
	(envelope-from <linux-kbuild+bounces-12705-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 07 Apr 2026 11:03:55 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5913ABB6F
	for <lists+linux-kbuild@lfdr.de>; Tue, 07 Apr 2026 11:03:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8DC70300617B
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Apr 2026 09:02:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FECB30F55F;
	Tue,  7 Apr 2026 09:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="W4elOEDK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9652D312834;
	Tue,  7 Apr 2026 09:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775552571; cv=none; b=JMWoLi5wsKc0R52qAP2sXFU8gcvNcWC00KCmitw1Xln8/BfWzbq9Zoj5IcoayKIyt3wpzDULR5iN38ZQDew5BIGK7SfHY11KAqkO4/k1KF+zKCxhbQSN4TEccC/gk2X6ZLzmVf5JF8V4joiu0jxIqzlaDvQfIMXGBaryIwfFC60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775552571; c=relaxed/simple;
	bh=NOAfC+m5BPIoeX16KFv7NuUFKNJG/h9z+A11zCUfTMc=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Jxn2yA4r8aZ8H7jwKRMgBIz1LhI0SycO5y2HsiqM9EW27hJdm896Y4TKqbRTsmoZaEdQN0KKQC/S9yJbwJS/zLkv6lereo1huzGDE8nRweiArePzgYFFnEdgIhIAvcYBl/t65zEu1QmjoYS83vhJBP+u5ViFeWjM0yji93jBUeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=W4elOEDK; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LmgC92212446;
	Tue, 7 Apr 2026 09:02:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=jsFU1j
	xbFZU+fd2M8Cj7vaFvJ59JgzowXJbwIGML3B0=; b=W4elOEDKHhY59M0j+ZmLH5
	+q9nHz+MePPBuA83dI8BPxM2IA9tqLGykcydxd2KXnmIa9Bg8VRKPvHZTixUxwwY
	dqjJZsm2dNjkwMOzSHFVsxPqOP7up0BXQTIedQMTEWEn/p/UumkmlnjlBx8zDyL0
	9Hn9EjM2I+uA15INOOZvcyJI9HfRmDL81LPz9cQklNXqjka71JGnLB77bXjSemVC
	KL397XOS5amMR9BY9CbER/OOgk6I1gIjxLShQFxjW9SlIusM36T5Gtc8b1BHyDsF
	e9QxVgbTltuChk+MtJXVXZinomVlwtfsNOo8z8EA6/yo3elPl4vH3JUQTaAIIPgw
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4dcn2h9v6r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Apr 2026 09:02:37 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 6373ThGV026707;
	Tue, 7 Apr 2026 09:02:36 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4dcmg7srjf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Apr 2026 09:02:36 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 63792ZHQ4785058
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 7 Apr 2026 09:02:36 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BCDC058052;
	Tue,  7 Apr 2026 09:02:35 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 96B5958065;
	Tue,  7 Apr 2026 09:02:33 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.123.3.173])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTPS;
	Tue,  7 Apr 2026 09:02:33 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCH v4] char/nvram: Remove redundant nvram_mutex
From: Venkat <venkat88@linux.ibm.com>
In-Reply-To: <6c00b695-9e84-4dd8-abbb-306fd67d6f97@linux.ibm.com>
Date: Tue, 7 Apr 2026 14:32:20 +0530
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com,
        ritesh.list@gmail.com, arnd@arndb.de,
        Christophe Leroy <chleroy@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <E92E66BE-165B-4289-99B1-3F4E6B84CAAD@linux.ibm.com>
References: <20260330103530.6873-1-venkat88@linux.ibm.com>
 <68e9ca6a-c53b-4f15-85b3-7ae9639f9528@linux.ibm.com>
 <6c00b695-9e84-4dd8-abbb-306fd67d6f97@linux.ibm.com>
To: arnd@arndb.de, Madhavan Srinivasan <maddy@linux.ibm.com>
X-Mailer: Apple Mail (2.3864.300.41.1.7)
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA4MCBTYWx0ZWRfX9JDAu754Hi15
 Jkyc9bycHOk+8Gm25FOVXfSP06prHArOivC2M84O9TnSjSm0AXEuTJ8RT3OJGytyiU1YsYlKZU6
 1xXu+U+XNCBCDxPCwVdO6sXMJaQ0jXVJwPpzUA0WLXtSBkTYTVc2LpttWQ+KQDjHYSlUQE7Q1nw
 h8YEHblS1W/GRGifcKig1D0anBFCaDRD0hAniQZMbcQy3F3HiHyIJKu+gJYpl01ICl/Q1iVpDK4
 3HolRev8EUDCPOwpq0+eMaA7soLNgUv/X+YLRkrcCKqeDpW/+a+JD78ox++NoLCsY10zxK9OoYl
 83fgLwUZQDDSmaAT7sXAgjvuD5TD+Q5Is6kmetOoI4r9tMQfo6+mYOTDxrE4zmFYoz3PRW8HGMV
 BpXGU9n9X+2OoK6o3s1R0ZXWdJ4fq8zhIirC1rO7q9FnGMg3QZVMEqdLcqjuDniNxYpBdEQM3go
 2qGGI+xPqokNv8wLVKg==
X-Proofpoint-GUID: H7tlVhrNy3pAcqMpooGDy65jTmwiQRXO
X-Authority-Analysis: v=2.4 cv=a/wAM0SF c=1 sm=1 tr=0 ts=69d4c82e cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VnNF1IyMAAAA:8
 a=zM85nl73RZM319hoLRgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: VLQhvai_jLeenBtZNNi8kTSSS5uUnVQ-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070080
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
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.ozlabs.org,linux.ibm.com,gmail.com,arndb.de,kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-12705-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arndb.de:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[venkat88@linux.ibm.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 7B5913ABB6F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



> On 7 Apr 2026, at 12:11=E2=80=AFPM, Tellakula Yeswanth Krishna =
<yeswanth@linux.ibm.com> wrote:
>=20
> Please add this tag
>=20
>=20
> Tested-by: yeswanth <yeswanth@linux.ibm.com>
>=20
> On 02/04/26 9:33 pm, Tellakula Yeswanth Krishna wrote:
>>=20
>> On 30/03/26 4:05 pm, Venkat Rao Bagalkote wrote:
>>> The global nvram_mutex in drivers/char/nvram.c is redundant and =
unused,
>>> and this triggers compiler warnings on some configurations.
>>>=20
>>> All platform-specific nvram operations already provide their own =
internal
>>> synchronization, meaning the wrapper-level mutex does not provide =
any
>>> additional safety.
>>>=20
>>> Remove the nvram_mutex definition along with all remaining =
lock/unlock
>>> users across PPC32, x86, and m68k code paths, and rely entirely on =
the
>>> per-architecture nvram implementations for locking.
>>>=20
>>> Suggested-by: Arnd Bergmann <arnd@arndb.de>
>>> Signed-off-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
>>> ---

Hi Arnd,

Thanks for the earlier review and suggestion on this change.

I=E2=80=99m not entirely sure which tree would be the best home for this =
patch,=20
given that the change touches common NVRAM code used across multiple =
architectures (PPC32, x86, and m68k).=20

If there are no further comments or objections from others, would you be =
able to pick this up through your tree?

Please let me know if this should instead go via some other tree or =
maintainer.

Regards,
Venkat.
>> Without Fix
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> make -j 33 -s && make modules_install && make install
>> In file included from ./include/linux/seqlock.h:20,
>>                 from ./include/linux/mmzone.h:17,
>>                 from ./include/linux/gfp.h:7,
>>                 from ./include/linux/umh.h:4,
>>                 from ./include/linux/kmod.h:9,
>>                 from ./include/linux/module.h:18,
>>                 from drivers/char/nvram.c:34:
>> drivers/char/nvram.c:56:21: warning: 'nvram_mutex' defined but not =
used [-Wunused-variable]
>>   56 | static DEFINE_MUTEX(nvram_mutex);
>>      |                     ^~~~~~~~~~~
>> ./include/linux/mutex.h:87:22: note: in definition of macro =
'DEFINE_MUTEX'
>>   87 |         struct mutex mutexname =3D =
__MUTEX_INITIALIZER(mutexname)
>>      |                      ^~~~~~~~~
>>=20
>>=20
>>=20
>>=20
>> With this patch issue is fixed
>>=20
>>=20
>> Please add below tag
>>=20
>> yeswanth <yeswanth@linux.ibm.com>
>>=20
>>=20
>> Thanks,
>>=20
>> Yeswanth Krishna
>>=20
>>> v4:
>>>   - Remove all remaining nvram_mutex call sites, completing the =
mutex removal
>>>=20
>>> v3:
>>>   - Removed global nvram_mutex definition
>>>=20
>>>  drivers/char/nvram.c | 16 +++-------------
>>>  1 file changed, 3 insertions(+), 13 deletions(-)
>>>=20
>>> diff --git a/drivers/char/nvram.c b/drivers/char/nvram.c
>>> index 9eff426a9286..e89cc1f1c89e 100644
>>> --- a/drivers/char/nvram.c
>>> +++ b/drivers/char/nvram.c
>>> @@ -53,7 +53,6 @@
>>>  #include <asm/nvram.h>
>>>  #endif
>>>  -static DEFINE_MUTEX(nvram_mutex);
>>>  static DEFINE_SPINLOCK(nvram_state_lock);
>>>  static int nvram_open_cnt;    /* #times opened */
>>>  static int nvram_open_mode;    /* special open modes */
>>> @@ -310,11 +309,8 @@ static long nvram_misc_ioctl(struct file *file, =
unsigned int cmd,
>>>          break;
>>>  #ifdef CONFIG_PPC32
>>>      case IOC_NVRAM_SYNC:
>>> -        if (ppc_md.nvram_sync !=3D NULL) {
>>> -            mutex_lock(&nvram_mutex);
>>> +        if (ppc_md.nvram_sync)
>>>              ppc_md.nvram_sync();
>>> -            mutex_unlock(&nvram_mutex);
>>> -        }
>>>          ret =3D 0;
>>>          break;
>>>  #endif
>>> @@ -324,11 +320,8 @@ static long nvram_misc_ioctl(struct file *file, =
unsigned int cmd,
>>>          if (!capable(CAP_SYS_ADMIN))
>>>              return -EACCES;
>>>  -        if (arch_nvram_ops.initialize !=3D NULL) {
>>> -            mutex_lock(&nvram_mutex);
>>> +        if (arch_nvram_ops.initialize)
>>>              ret =3D arch_nvram_ops.initialize();
>>> -            mutex_unlock(&nvram_mutex);
>>> -        }
>>>          break;
>>>      case NVRAM_SETCKS:
>>>          /* just set checksum, contents unchanged (maybe useful =
after
>>> @@ -336,11 +329,8 @@ static long nvram_misc_ioctl(struct file *file, =
unsigned int cmd,
>>>          if (!capable(CAP_SYS_ADMIN))
>>>              return -EACCES;
>>>  -        if (arch_nvram_ops.set_checksum !=3D NULL) {
>>> -            mutex_lock(&nvram_mutex);
>>> +        if (arch_nvram_ops.set_checksum)
>>>              ret =3D arch_nvram_ops.set_checksum();
>>> -            mutex_unlock(&nvram_mutex);
>>> -        }
>>>          break;
>>>  #endif /* CONFIG_X86 || CONFIG_M68K */
>>>      }


