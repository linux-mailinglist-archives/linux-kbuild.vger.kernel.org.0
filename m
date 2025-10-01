Return-Path: <linux-kbuild+bounces-8990-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A189DBAF15D
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Oct 2025 06:21:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 54F5D3C427F
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Oct 2025 04:21:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D079E2D73A3;
	Wed,  1 Oct 2025 04:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="abGKf5o8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E46E1519AC;
	Wed,  1 Oct 2025 04:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759292488; cv=none; b=lktDXfoI+lR8c51aht1e173pf73y/fR0qccLckHo01Asn/6B7q3polhuVctyLkWu9SxfiitHyxsH8TrcqomSCEV0PosLpudBJgEhe5obHj3c0qTLgstvC3LGEqh3RymDAQeeyl+Hedke4J11e7PXlHoG+7lUFdG2xHQBlNuDob0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759292488; c=relaxed/simple;
	bh=UhNrCBjhO1wGI43r9SVqIkPvGGTiZHVqwGumcw21eXw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UXlRiBbKbyZlmLzhed5i3oQbfu7yQ9ghhjysLwG7z/3Nwkvn3+8M6w5W643F2LaVadbcyTBuv/VilFR12ox7GPdQrp3Wis6wjfpqVVAvV/Xu0VKo9bij2N7O/GgSt0kLIip+U5RcQPNe9u2rFNkubFHC3mmw0a1LZeo4DgiGiKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=abGKf5o8; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591277Z8015128;
	Wed, 1 Oct 2025 04:21:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=lacTCk
	Wq8XW78aQ4Et3awNI5b5AeEExdQupXjsBMZf4=; b=abGKf5o8/gcCnCUljaCw5U
	6H3TaDPHrcStC98VD6kQZPJcoM4iHuu2aXA2/+tKxrVhnlnz7d/0UIRlJaRSzhJD
	jwz9WwuozSgvOFOYqcvqo2WsxDB4BiX3Ce0vGufvAVwNXRMFUsd2LpIzksXRVOiu
	IiexyBPKgbXJZp4rw+ca4zy09g+GgV7Vljc33jNgjIMCK9lZ9b8JMs4mlpFdtGVp
	uZ7Cqd2yFZfUDMagNLRpby0MQ7IoNc0I30QSarbKYfdzdhm4fY3e1ZHtSwvgVneE
	oB/Wg2K96mIdASZLkoKQT/eDUGZVCHK7O94CaP+08ND/W1T9uHENPKMvp9kgEjFg
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49e7n7w3m0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Oct 2025 04:21:14 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5913PLXG020054;
	Wed, 1 Oct 2025 04:21:13 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 49et8s766d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Oct 2025 04:21:13 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5914LCk618809540
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Oct 2025 04:21:13 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B700C58045;
	Wed,  1 Oct 2025 04:21:12 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7689458052;
	Wed,  1 Oct 2025 04:21:09 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (unknown [9.90.171.232])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  1 Oct 2025 04:21:09 +0000 (GMT)
Message-ID: <01f772073dba88daf7f5acd824d10fc37412c99e.camel@linux.ibm.com>
Subject: Re: [PATCH v2] kconfig: Avoid prompting for transitional symbols
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Kees Cook <kees@kernel.org>, Vegard Nossum <vegard.nossum@oracle.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
        Masahiro Yamada	
 <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>, Petr Vorel	
 <pvorel@suse.cz>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-hardening@vger.kernel.org
Date: Wed, 01 Oct 2025 14:21:07 +1000
In-Reply-To: <20250930154514.it.623-kees@kernel.org>
References: <20250930154514.it.623-kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: GQzrCrk5lKL0VF4NSxYTpu8UzerGUZJe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyNSBTYWx0ZWRfX0jQ+66uttz92
 mFS02TbuBwaZ6NbNP3YqnqENWXev3e+TdUI2KFFkwKYfdScr1MTSBv1J6UT833gXhUBgSO2zVRx
 DbNj8IxWesDtpTTTylpyCf6jCzA5KtosQArcba64lVLHfrRmvQ9AYcHtPz0aONR2dQ0BTv7+yZJ
 NHrRdO8Vf7iQjtJlhYDDJBz9ex42QMeXooDV1sMT1A0/te2DvR66jHNOYsauzufbhuamtoPiJOL
 NSjflAn2ZuIwc6rwrfxD/dc/gIz7T1vn1nU14xdIgvHvW2g3lA1zi9BbVY8pUTY727WZPsbnmBT
 V98U7QcAAVlFEjqaea50/NQuRhi9ryTyqCHM60uk8IYbD/t6BLjwLoLM0BUN5vrUc5B/1NPsn6H
 52I+sLHhb4EJlmytdBioG5G4D6xeeA==
X-Proofpoint-GUID: GQzrCrk5lKL0VF4NSxYTpu8UzerGUZJe
X-Authority-Analysis: v=2.4 cv=T7qBjvKQ c=1 sm=1 tr=0 ts=68dcac3a cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=Z4Rwk6OoAAAA:8 a=VnNF1IyMAAAA:8 a=IbW2e5xBvT1FO4-4gcUA:9 a=QEXdDO2ut3YA:10
 a=HkZW87K1Qel5hWWM3VKY:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_06,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 clxscore=1011 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270025

On Tue, 2025-09-30 at 08:45 -0700, Kees Cook wrote:
> The "transitional" symbol keyword, while working with the "olddefconfig"
> target, was prompting during "oldconfig". This occurred because these
> symbols were not being marked as user-defined when they received values
> from transitional symbols that had user values. The "olddefconfig" target
> explicitly doesn't prompt for anything, so this deficiency wasn't noticed=
.
>=20
> The issue manifested when a symbol's value came from a transitional
> symbol's user value but the receiving symbol wasn't marked with
> SYMBOL_DEF_USER. Thus the "oldconfig" logic would then prompt for these
> symbols unnecessarily.
>=20
> Check after value calculation whether a symbol without a user value
> gets its value from a single transitional symbol that does have a user
> value. In such cases, mark the receiving symbol as user-defined to
> prevent prompting.
>=20
> Update regression tests to verify that symbols with transitional defaults
> are not prompted in "oldconfig", except when conditional defaults evaluat=
e
> to 'no' and should legitimately be prompted.
>=20
> Build tested with "make testconfig".
>=20
> Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
> Closes:
> https://lore.kernel.org/lkml/CAHk-=3DwgZjUk4Cy2XgNkTrQoO8XCmNUHrTe5D519Fi=
j1POK+3qw@mail.gmail.com/
> Fixes: 05020835c86e ("kconfig: Add transitional symbol attribute for migr=
ation
> support")

I think this should be f9afce4f32e9.

Andrew


--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

