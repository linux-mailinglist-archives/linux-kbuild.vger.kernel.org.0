Return-Path: <linux-kbuild+bounces-11121-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BDZIoJOjGmukgAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11121-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Feb 2026 10:40:18 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AA484122D25
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Feb 2026 10:40:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B3AC93004DA9
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Feb 2026 09:40:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65A203570B3;
	Wed, 11 Feb 2026 09:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Pn+MbO35"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263433570AD;
	Wed, 11 Feb 2026 09:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770802810; cv=none; b=TP8ijWuH+8gwSu/xXkfGdDNPErAlx175yftj6yMzeYI1XPhQaPK/u+Fo4z36PbmsgL8N4QwDR7LxQ+4+aFQ1xxJrEu21tArUYGHxL9BPl89J4RrmkDqDSjLB/+dm3DW0o9A7O4VgQr5ZuIxrFuWZpysowFMJ9rG0l9K1OTFyh6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770802810; c=relaxed/simple;
	bh=oHJKj6auKeQ+mUJb7N1gh6wHRPXFLnElYmyO4PnKZ9U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KZl9/G/MY5r9GRuVAHZCC+d+BWkjPMFgHoEM2FC3KfceBMmmSKlm68ScNr0p4UIw49FuRwI7G0hSUUvMyAfCBvyj/BWZjuwW9aWkTSCN9DSgKCTLmejEqXZwjNt7zwYvySLn1MjeIvcdN/PuW6I5H2a9jY65nDd328lul5Ent7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Pn+MbO35; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61ALeGAZ190125;
	Wed, 11 Feb 2026 09:40:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=/LSIAU
	tzk6qvFD+uU+YmSoDQqIUNcGoQJ3QnPYHDtoQ=; b=Pn+MbO35Rue8h+OTpCKGGn
	2sCKYRrNNjf9VqRjQ7dRwKfdRNGYYx931ohHIXU6p+pnzrs4wSUzFUpQm1NPock5
	dlFY8wYpDYkcd6fX9RAuhmVbv8X2rK0LxA/K0Arqf7ekZfUfpiYUIqGsgiyquJk8
	UUhWNyGZ7WVVzFD9WsrT/5sI//0FrVCpvRYuy8dSBd+tllEwpywH7Vyr/OmxDhtO
	XxOAXiZuZqwtph7kiCIcW8eTGgWbk1IzitpHTwNsOXbYHOBu2z7VO0be8lPcNDkD
	hJ6+JJvfIoYvFYgxUbF4jsWMxGq2jppu0x8zHIYwAj+nhlX2NihqufOFySsY2tJA
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4c696ux2bw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Feb 2026 09:40:01 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61B8gsP3008390;
	Wed, 11 Feb 2026 09:40:00 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4c6g3ydbmu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Feb 2026 09:40:00 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61B9dwng52167084
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Feb 2026 09:39:58 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 933232004B;
	Wed, 11 Feb 2026 09:39:58 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6BF5720043;
	Wed, 11 Feb 2026 09:39:58 +0000 (GMT)
Received: from [9.52.200.149] (unknown [9.52.200.149])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 11 Feb 2026 09:39:58 +0000 (GMT)
Message-ID: <3d10f593-bde2-41d9-ac4e-9250614dd880@linux.ibm.com>
Date: Wed, 11 Feb 2026 10:39:57 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kbuild: Add objtool to top-level clean target
To: Josh Poimboeuf <jpoimboe@kernel.org>, x86@kernel.org
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
        linux-kbuild@vger.kernel.org
References: <968faf2ed30fa8b3519f79f01a1ecfe7929553e5.1770759919.git.jpoimboe@kernel.org>
Content-Language: en-US
From: Jens Remus <jremus@linux.ibm.com>
Organization: IBM Deutschland Research & Development GmbH
In-Reply-To: <968faf2ed30fa8b3519f79f01a1ecfe7929553e5.1770759919.git.jpoimboe@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDA3NSBTYWx0ZWRfX4SIVTKGHrx7f
 2BL5E0oXBwKmxOM6/qZlv25oFE7LrkCub1hiiPdnXAW0sHaaS5u9O4x+fREYJmC/vmDTi7oJqC9
 TbVhVQAxAv5nMBxjZmKVm+6Zr94X6VIhNOXgIL8NbkS3JWeExh+VwHcLwb/D+vl/xBMTJ7PDEuk
 ogFXwKGiOBacUaJaBkYKPT1w8U1FEO5AEwYkDr3wIKgI5esDcNNGZXW8oMC7kUHx21XD6e6F4op
 /P21C6LATsOvM2QbhZnfj6NwhOAqV6VA55RvH/cZLRlqLCxTzVW0eVXvTEbuswRfsN1W8sS7r5S
 bk5gZFhww0p7xcJEGZoVIzfWQj4uor490YZ2ytSPYpagf079ajiDHuTI5NiVCIyi2ogWUYJQl0M
 5d7hH7d0+ozDkb2FUkLa/mgHFWfFabYv6T7MmR3F2+4bzPGKgq3vB/5bJ5t2sGOmRU6AshgScVp
 j3ZY20yZQHtEJyg6Qfw==
X-Proofpoint-ORIG-GUID: oHoTkwMJCuv_EFqpd-aho-sncrEFpsTK
X-Proofpoint-GUID: oHoTkwMJCuv_EFqpd-aho-sncrEFpsTK
X-Authority-Analysis: v=2.4 cv=O+Y0fR9W c=1 sm=1 tr=0 ts=698c4e71 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=Zg_fgM-7fzLk7_7bOdYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 adultscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 clxscore=1011 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602110075
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DKIM_TRACE(0.00)[ibm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jremus@linux.ibm.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-11121-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: AA484122D25
X-Rspamd-Action: no action

On 2/10/2026 10:45 PM, Josh Poimboeuf wrote:
> Objtool is an integral part of the build, make sure it gets cleaned by
> "make clean" and "make mrproper".
> 
> Fixes: 442f04c34a1a ("objtool: Add tool to perform compile-time stack metadata validation")
> Reported-by: Jens Remus <jremus@linux.ibm.com>
> Link: https://lore.kernel.org/15f2af3b-be33-46fc-b972-6b8e7e0aa52e@linux.ibm.com
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>

Tested-by: Jens Remus <jremus@linux.ibm.com>

Thank you for fixing!

Regards,
Jens
-- 
Jens Remus
Linux on Z Development (D3303)
jremus@de.ibm.com / jremus@linux.ibm.com

IBM Deutschland Research & Development GmbH; Vorsitzender des Aufsichtsrats: Wolfgang Wendt; Geschäftsführung: David Faller; Sitz der Gesellschaft: Ehningen; Registergericht: Amtsgericht Stuttgart, HRB 243294
IBM Data Privacy Statement: https://www.ibm.com/privacy/


