Return-Path: <linux-kbuild+bounces-12851-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJvNBvam6GmZOQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-12851-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Apr 2026 12:46:14 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B839C444ED0
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Apr 2026 12:46:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 78F0F3013A72
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Apr 2026 10:45:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7CAB3CBE73;
	Wed, 22 Apr 2026 10:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NjRcurpy";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="NxwIUCsa"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4139F3C277B;
	Wed, 22 Apr 2026 10:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776854728; cv=fail; b=DtruiuegWxdlKhjKdVOrj+lPu+s8+kVW/JD2/ALTJg4s45McpdmcCuL2mVelJlxqMZ3NW7MeHJLwCs5emG3i298Xj2goqgy1MezLSAG7zwIzm1+RTq2CTpBlAmKZiyihbFpSfcgO1aB1Jx9/CyHWxz0nj5wpccWHFPK+gwM2tz8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776854728; c=relaxed/simple;
	bh=h08Zl938/jWw4cxFxFw3Qya1RfIloy8GtvoPnAjlnNY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=M6L9fHR1Z8QFLyT0kC+4rWMuEUJ4LH/wtHrlCvNX92GZzNYX1ZDkWFcindpB3m69VrfI0ij8WytK4ONFYhOqS7JlL2hd2sdOajEhWQIg06znQwI4sZCDtfyHXNU1jfp7oTNJThXhoiykwNuwDRKVxM9gf0jh4/GhuSGeIeq+goI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=NjRcurpy; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=NxwIUCsa; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LLaWLr2558619;
	Wed, 22 Apr 2026 10:44:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=nHKM1S7j10SBkBC70GYN9brTKEbHt0wDC6zjsIc/f00=; b=
	NjRcurpyiVZUB336YXUcO7I3alOPJUvCI+eZwU/Lfil2Alf2LydYDG5LQA47kh0B
	IG1qrSXLUz2eoeuoT34+QU65trkydy3+exExxN/Jn0BfHX7jYr51JpCHXgg4RFfQ
	SlJBFbU8y/SNZPPhzaubR4Hmv0oBxiDbktgZgUZO2kB8Pih7cui0Whwnnwts56eQ
	nDMfXkUqZhM0XRwLyoq8jrkPfhizR8pJUVDCbsD4y0b7wKDIEcBJxyN/+TL8XUKO
	qGxAw/xRb73xluA/t2oXIg7RJY8P0F7fLsh0g+PrOTMGEuF6JoPtUYb4aaF2XKw9
	cc9oYh6MSfJ8GdPoe+JMZw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4dpha58ww8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 Apr 2026 10:44:39 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 63MAfIjp012957;
	Wed, 22 Apr 2026 10:44:38 GMT
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011069.outbound.protection.outlook.com [52.101.57.69])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4dpjjeajkr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 Apr 2026 10:44:38 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gm1SHWVYtZpGthaKgI1PPsL07kVu5Gm4x5d64o+uZcAq/WE9/pFskXRpQQLt+Du+Mrmn1RuBfpfLpEIDeimhemNtuCAorAGbnOqznSd2Cq5lx9Ok7IALefVh6CKLv2malVBR/lfd7/+Fj83lXdAt0x9vSJ9mcF0oHSZmTs/dw/eIdhJ1TMmgdv+DsxD5a3GbcrxIFRu0KdveXx3QsauIql3nRG7v/L99G6Aathgab1NwFINp0TZ0sKwRhsb6hcKFyQRf97AhtPcy1zbjrBGRjYb8wQ8Jm4MPEBAfdrnTZPJxLVrLZNeK76PcI/wXm2zmUhWbCn1ovfNDVNxZQr2mww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nHKM1S7j10SBkBC70GYN9brTKEbHt0wDC6zjsIc/f00=;
 b=jcr3tl1podW08+Ddql+WYO+/KW8sMPiXABy/k6wZvwBPjUNlxjlMHugNuDlpLXyOaFpMEKTon1OL5Mxd4tvqHpASWzhfcBBWjtAnWEU4UV0z6TRVLi4I8GHEl5NN3riJ0V73L2vnzRml4JFad1pQDAV7N2Z7/uXwCHtuJ3+xmb87xZioebT17LjP4/IdX2LI7WrJdjn2++AkcHqrd+Qf7pS5w961JZ3vUh2Ui6vxBYboUKNgT5o3TjIHPzweIuwRxeK0F8rJl5ykNc48S5gxTrhjyxuOetfs883iZvL9rnHV/p51VoQXKTUmmGk7R/MUHGRb320VqcOXj01wJF/pEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nHKM1S7j10SBkBC70GYN9brTKEbHt0wDC6zjsIc/f00=;
 b=NxwIUCsaeGKyE/GUsOXYy/JyzxGtXcg/bdqp3R9X+2wvrOpZ0yCrQqTavGgH6swZoXnRvG/4p+Xy1qlMNfASx5+jM2i+u99cq3jyCTMDiL00xvwI/DeBghOg0S8BijHxNvbzwRuvLFHFiehRQJVT+EA+cmlq+I+1/hqdESKhyks=
Received: from DS7PR10MB4909.namprd10.prod.outlook.com (2603:10b6:5:3b0::11)
 by PH7PR10MB7782.namprd10.prod.outlook.com (2603:10b6:510:2fd::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Wed, 22 Apr
 2026 10:44:33 +0000
Received: from DS7PR10MB4909.namprd10.prod.outlook.com
 ([fe80::3f78:c489:86a0:3622]) by DS7PR10MB4909.namprd10.prod.outlook.com
 ([fe80::3f78:c489:86a0:3622%3]) with mapi id 15.20.9846.019; Wed, 22 Apr 2026
 10:44:33 +0000
Message-ID: <c7a8310e-501f-48a8-8ad5-0a40d8b3836b@oracle.com>
Date: Wed, 22 Apr 2026 11:44:24 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] btf: split core BTF parsing out of BPF subsystem into
 kernel/btf/
To: Sasha Levin <sashal@kernel.org>
Cc: James.Bottomley@hansenpartnership.com, adobriyan@gmail.com,
        akpm@linux-foundation.org, alexei.starovoitov@gmail.com,
        ast@kernel.org, bp@alien8.de, bpf@vger.kernel.org, corbet@lwn.net,
        dave.hansen@linux.intel.com, davidgow@google.com, deller@gmx.de,
        geert@linux-m68k.org, gregkh@linuxfoundation.org, hpa@zytor.com,
        jgross@suse.com, jpoimboe@kernel.org, kees@kernel.org,
        laurent.pinchart@ideasonboard.com, linux-doc@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-modules@vger.kernel.org, masahiroy@kernel.org, mcgrof@kernel.org,
        mingo@redhat.com, nathan@kernel.org, nsc@kernel.org,
        peterz@infradead.org, petr.pavlu@suse.com, pmladek@suse.com,
        rdunlap@infradead.org, rostedt@goodmis.org, tglx@kernel.org,
        vbabka@kernel.org, x86@kernel.org
References: <acLbnMAPrHCpoIpr@laps>
 <20260325011853.657295-1-sashal@kernel.org>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <20260325011853.657295-1-sashal@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0235.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::31) To DS7PR10MB4909.namprd10.prod.outlook.com
 (2603:10b6:5:3b0::11)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB4909:EE_|PH7PR10MB7782:EE_
X-MS-Office365-Filtering-Correlation-Id: fa0d5a3e-b1d5-4f38-e965-08dea05c23d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	6c3uz05tbVdG67q5Zh8w2sK7ki0YFAP+Z+X+CPS76Z4816/3qr2SY3sRo5PXV0cBfeIa/oG2C5EVZz9Dx3k+mK5YXCjE6qFySW3sKHaBmI9Icy3S4vwd4ORJLmspXqZ2aIpWE7CEY0tNZxBv168BQOT4/7iScozN7+fXCK6UUI8cUFckdYlHc160uUM9o1unF660670wV0G71jU2nWUbHUGm8dsdQSvh5Efcm8Jw/aubUFgNJkqpVrra0Gf0TZ9GWc+H1udPVOihjUSUxEiDnhrgSxkpxtMBrmt7nUWkiwL1LJ6v7lUl9LYDsta5FLmQhc39m2on6EzGjOuj6LKxbL/ubaEkms4mZGHnqu+4uLOmqBER1dWePzOrYHqoe09rsv54MtZ7ix//ZQI48KURGBlXeSxXRo8kD+KTbcl/Y1EL32Z8UnlmwBwYRzwQgOp8UaPOuxm6eeYyAuCn5fyzvF4C5byoCaIssAAXvfzPTA3J9Kc/b3GK+RL1Jv/TjP7e6Om7XnvSI5tY++sgPaGxpuGPBFth2Y9yUkLjlb2Re9joGwmbDRWjH3n21m3ThZQVqT73UeOK/nvJv8Nm9lRp7y2WAwg6+nkKi1CCigEw5gd/t/1UkalwcVkXJhmmT7efNWCy1hl89x997mDWmIbfQM4Rx4nk7IvkBFBBgI47cUnkBjDYwf1EP8lSVKHol262G/Zf12QuNL/dM3ediNV9av+BK8zzM8ABvFGbqOngad4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB4909.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVZ4RHBPZkhQQXJua2FaWStzNnRpWmR6N3dyYldIL2tDN0hXcG9iYjhPQVd6?=
 =?utf-8?B?Kzh0QkJEWmcvSFZvWm5EVEE0N1N6UFhORDZraWlwcnpXWFVrVnY5d1h6TWVT?=
 =?utf-8?B?SVhsMVVvRVBXb1dMdXd1eStNSmJjd3pPQ2F3L011OWg0alR6eWNFbThoWG85?=
 =?utf-8?B?NVNoNDMwRmwzWVVxdXNBZ25lYy9hWEs4UmdUMXZaZDA4b1orQTNBRDhXVkF1?=
 =?utf-8?B?MU5TaWhBRUI2dnZmT05zTFR6ais3UUhpMHFYY1poYW9kMEFPbER1TElmZlp5?=
 =?utf-8?B?cS9kSVpCZ1djMExtVEt0SThZcTlZVXJyZVFxNlk5SGcvMHphK24rM3NJTk5o?=
 =?utf-8?B?VGhhNElSNWVCQVdUdG9yeG1zQ0JTbXN4c2NoQ2czdFA5RTFoUHMxd2s4c2d0?=
 =?utf-8?B?Nk1RMytoWFhibzhwZ1VNVlBIVDRUakJFWGpuZm94ZzZSV3lJSzNtZ2RqZzlh?=
 =?utf-8?B?cDVidkNkL2hPRmhBTmZvdW5BbENEZEMveUdQamZsQTFMZHFoZEFrWGJwYUhN?=
 =?utf-8?B?WkxsenBCclJWZCtpb1lvY1p6eTFPY3Z6OHBITCtvbk1aM0pPYlhqMDFNb3U1?=
 =?utf-8?B?UnZ4WkxrVUdsbVBKSTFRUHRpNHJUOFVTS0YvVjZSbEI2QlBjbk5NUVRZWVpY?=
 =?utf-8?B?Y2xTZk42SmdhQ0xockJwemoxNVNucUxManBjQW5KYUd4Y291WGpiemxtSmlo?=
 =?utf-8?B?dmFjenBRNTFTcTVXdG5iMHpPWStabVZrcVJsd0pjZGt6TXZ2aGpKeVlTNmVz?=
 =?utf-8?B?UFY5NnZhTlhPbWsrcHBadzVsVUFWbzdFQ2ZlaGVpWEF3bllzOEpDanRmZ1FX?=
 =?utf-8?B?aDV5TkVGbTljZEF6clZEVFBNNUYyNkw5SzBva2Z6ZDRjcUwxYnJRRkJmNXV5?=
 =?utf-8?B?Z1dtTUxFQ2JSK3N6djdCaGh3NE5oV2dtcjh1eGExTm9DSWp6UXM3QS8yL3Zi?=
 =?utf-8?B?NmRleWRGRWpLa0dYT2FYNGkxbnBkekxlRHZhamZ2S3B2RVpLMEE4N0dtRzlP?=
 =?utf-8?B?TmVzUlc5TzFkbHA1aUN0dHpJb1d2K2xwMWNUeGJocXBWYXZNWlpGeG4vdGs4?=
 =?utf-8?B?eWJSZXpUTnY1RENBZzN1OFlzM3hHcStaY2RjazhuVXY5a2UzSjNLeXBlMUxP?=
 =?utf-8?B?Ry9OZk9KY3cvV2xWUU1zMWF1R1M3cWhIRUhoNnM5c3dIYWZZc2ZxZlJMOG1S?=
 =?utf-8?B?MmtwcFF3RDN2cGkwTC9Gb1VEek5xMHhyWDJjZVFjL0RBRGg3cFczK1JLZy9o?=
 =?utf-8?B?Z1BQV3J1Z3gxZ2FabnlVbWJsS1JwNEtjYkZCSjIydlgzTUxNL1h6RXllSGdl?=
 =?utf-8?B?enplbjRlQzgrRENSQjZaWUQ3YVJvY0c5Sk50VHI0alpHdzRtZXRYZlhVVWto?=
 =?utf-8?B?NEF1bm5yUDg1L2ljT2Rzb0N2S2ROOHp5Q2s4WDhwY2xNY2JlVHEvcUZRZkx1?=
 =?utf-8?B?d3dsT0NRSDlSK3BZSU00d3phYk5Panc5NEtxaGZLbk1DbGlGdEZ4MnpBVjdF?=
 =?utf-8?B?SVdIaU1LZ1Vrc0M3U2Q4WWkrVlV0WkVTRVhYR3dWeGxWUE4wMktMUVNqV2Zx?=
 =?utf-8?B?YS9aaG1SNlVQcng5NGpIL0xMeDYvdG1qRUF4R2htR1Jwc09xRmxSY0Vxa1RB?=
 =?utf-8?B?RnQ2dzNndnhvMHlSemJldUE5TDJ0cXNGTGJ4eUZjZUd5MjZ2VjZHaUdDcVNK?=
 =?utf-8?B?eEMwbmh1ai80TGRkRnI0VjJtUHNOOWFMQ0pBelN5YXpVWk8zL3dUN3cvSkM1?=
 =?utf-8?B?K3A3Sm5BTEdBUGI5OEQvbFArcngyaUI1QUlkUmNlN0RjelhnQTlqQVo0bWIx?=
 =?utf-8?B?STlDNmVhWnNHVXM5c1cvMGw4bzF3Qy9KNGh2STB5bkhONFVTWUI0Q3FEL1kv?=
 =?utf-8?B?YmFIenNDQUJIVkJSTm5xRzYvdVlkU0lCaW9SNFlUMlQrL3Vhc0U3UFZObnB5?=
 =?utf-8?B?VkJMbjVuY1dhSHJMeHYyV0N5Q3VqNG93SHgzUjRGZDd1TGU3UzNTTlA3MW9r?=
 =?utf-8?B?M3dOeXBGT2xpeDFuOUpMdlV0YS9sS3RuWHVNWlBETk1YdXJ3bW9mVkhmSGxB?=
 =?utf-8?B?eGE3NDQzOS8vWnJvRXlscWJ0YWVyN0pNQU1zd2xybjlxUkNTMHlycXdlWGl5?=
 =?utf-8?B?ME5qamNNZXFyZG81a0hPYytLOHp0WGtRaHoyRzdaU0haajU1M0NRb2NWNGNx?=
 =?utf-8?B?MUF6dGE3dUcvVWdPOU5wa2hJYi9CTzFiODJaYTduUWFFTlA0M05zTjF2Q2Jz?=
 =?utf-8?B?VU5PL2kzWnJSY1NLTFB5OXlzdzFjNkdzTDJublRyNFd5RnM5M0Q4UW9DOGFk?=
 =?utf-8?B?ejZWakk5RVErWFlxTjNOMCtHM292Zk4vc2hRZWh5WFBWelRISmZIQT09?=
X-Exchange-RoutingPolicyChecked:
	E/81nExtbAUngSb4XkwxEwUV/hXGHNxyCuYlDjltdEJV3NwxBmVq+j4VsEKOK1zxpoOr9XwMOb+NgtA3k48juQVcMStMtUqItYhsrPvWtGLmBY30w56Al7c7ktS5GPENrCoHYcUcrkvGKbJV1aSQbIdcOS09XHSTtcq9QhWMmYoql6c/DRHzqtA08IckK1GWk9bncFSeD5vXFKZd3esuNmbccP4Hugdw3QzpSIopSNZE4ATjfXz2XGlF4rnUG9yk44hGc1BUIsdhjKTWkkkWnj/1jTdXEXe50EkYSE1RundY7CJscugQBTJKJgxDEhZ5i3OYcsHvW92g11qjMHo/iA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	U31jlP6C6ZDJst7JT2DC8oh5FtoO5xiJfnbpS+CN8UR8iHmgceXAUFyfaFOyKo+6mKspUw5iZHKvITP/syF+Lok997ogr6Dw7jQP5YEOpO2UkdTHEbbR+56FPjuroo/lvkKV6o6mrcbf1pFftJhQ2Sl9rVT9ZgcpiP5DAwDKtEwMTfvOosVzDTyZfRscVb4ZAeGvEM324PVwiJ3/013+O9Tm2S5W3xZWps65bHPl67F3eFsmjMyXlf0GdzJ6JT9Ad4ienQn+2AgrKyz59WtOLqusxKWkk6xON1fyWORFqArBRCo9rLSSfCij8ks459io7WXAmi7UjompKmqiRnsR3L8sqAr+UPEzsqQ31eH7j1ORnQ9hJnkYLipcTGwYb8JD6HsrJoSvw6+7Kw3sZKuRRY88nzrgmTajZoQluVBilZDsG59RNk6EQqyjTtO2ukVyewXJiwtnSP1ifNqc+FJNk6DKnz6aUyurU0Lh4CfaD0UV7xUYZYLMubbzhOgXovREvX7YC8RIGXtdA9snvwzY35Rdx+5FB/Y/Kwks5b8x8S6v1a6beorYrBpnOGith3tq48Yb+lcb5k9lbStmfcSU6rtBMgFiAUuTNkAMNImxPdY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa0d5a3e-b1d5-4f38-e965-08dea05c23d1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB4909.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 10:44:33.4181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R1LOFyjM7ZoUFu0YqGQ8KEGxum/kh3nARzrWXqm++x/TKMQb2ImvtLMK9Xm9OwlCbqIrxCxsWl4r9YPFcIZAcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7782
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2604200000 definitions=main-2604220102
X-Proofpoint-GUID: DsVnOm1CYn--1WOROQL9vtmxeJCNSI7T
X-Authority-Analysis: v=2.4 cv=QM5YgALL c=1 sm=1 tr=0 ts=69e8a697 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=BqU2WV_vvsyTyxaotp0D:22 a=kNWSGtDhVt5Rln2Ho_AA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: DsVnOm1CYn--1WOROQL9vtmxeJCNSI7T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEwMiBTYWx0ZWRfX5G34+m7prMMe
 V4O4rEij9Qk6dXo1E62vsfYhP4vuH0xT1Sv1VB2mpS2NeUjTTTrdRhkXizYTbBlC4Sp5QUobYyf
 HzPIMPDBwVH2OYt23oOFEiJAIWlmPK2IXlGNhC2Qy3OD5lQPDxOjHR8Cq9GmMk429IVkSLPLM8P
 D1q5GhYXKHXOpneOoO5+BGzFr7E515oHrLawK8HWo271eJFL93alOrVUoriXwqOJxBh4yhiXNk8
 lwEes8NkPZKr0hihPlEVblRYlM/BQfSAJodWkajZT01i5x4tOxplqFc5aePEU1gCefvNJfWRRwZ
 1CRDdoUHqxadl8JAQhU+B9ZPaiwg0TRJlFOfOcumWtPG5O5atLb2ssISxsPKN6k7bXGLtRqrlE1
 RSCvPki1RqbX4/IXI6wh2exT/HAiIBVSczg7ivivZuM9x/vaQIWtAltiJhp/spypkX7TStcMWNU
 QXKVu61Yznl6er0eZ6A==
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[oracle.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[oracle.com:s=corp-2025-04-25,oracle.onmicrosoft.com:s=selector2-oracle-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[36];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12851-lists,linux-kbuild=lfdr.de];
	FREEMAIL_CC(0.00)[hansenpartnership.com,gmail.com,linux-foundation.org,kernel.org,alien8.de,vger.kernel.org,lwn.net,linux.intel.com,google.com,gmx.de,linux-m68k.org,linuxfoundation.org,zytor.com,suse.com,ideasonboard.com,redhat.com,infradead.org,goodmis.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oracle.com:dkim,oracle.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alan.maguire@oracle.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[oracle.com:+,oracle.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: B839C444ED0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 25/03/2026 01:18, Sasha Levin wrote:
> Move BTF type format parsing and inspection code out of the BPF
> subsystem into its own kernel/bf/ directory, separating core BTF
> functionality from BPF-specific extensions.
> 
> CONFIG_DEBUG_INFO_BTF currently depends on CONFIG_BPF_SYSCALL, which
> prevents embedded, automotive, and safety-critical environments from
> using BTF. These platforms often disable BPF for security and size
> reasons but would benefit from BTF type information for crash
> diagnostics and debugging.
> 

I had a go at a refactor in this area too, and it's pretty tricky. How about
we start with a smaller goal; making /sys/kernel/btf available to userspace
on systems without CONFIG_BPF_SYSCALL? This would just involve a small refactor 
of the BTF module-related stuff in kernel/bpf/btf.c, moving it to btf_module.c 
or similar say. No need to split out BTF parsing APIs from those actively used in 
validating BPF etc, since a non-BPF_SYSCALL system would not need to parse BTF 
in the kernel (just make it available in sysfs.

