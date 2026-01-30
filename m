Return-Path: <linux-kbuild+bounces-10939-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id j57WAZYCfGklKAIAu9opvQ
	(envelope-from <linux-kbuild+bounces-10939-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Jan 2026 02:00:06 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D255B60ED
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Jan 2026 02:00:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D67F0300C582
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Jan 2026 01:00:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 237C13164DF;
	Fri, 30 Jan 2026 01:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="DnDPpIJ9";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="JJgqDGCr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9D22E6CBF;
	Fri, 30 Jan 2026 01:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769734803; cv=fail; b=HDX4SHOlDzYu04OfdpUmF4I1Ig84JZlG8HyjxYo0VUc8e4TioV9vKrw0k9kA37c1YggK+XMFHAzxhK41tySmTXnYajP1ChZZe3fASO4BaE+mIlKm1ef/lWjkJj7C1qAbIAuz7gpbh/wA7HOoT+C2X2glReNx8pnAbZ5uwaAwe60=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769734803; c=relaxed/simple;
	bh=0+bVn/WlHjSFZMZ/vHaBlr698+v+UMfJvvNNROLDb5A=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Pp4SLDsUgwqFtwNNSCoA/5KZSAqvdcqVmLSfKwIoZjbQ5qJWdXz5vdmiDngT5SDn5zfaSStR2Rz8xTsVRHjchtZa3JwWjqLrPzKY5UniYceAsQSyRJxtR9qA7pBp90hfEme9E1eizWlgGhryOsVToTLMt8CZ+1LpIvGKpl/NEbQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=DnDPpIJ9; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=JJgqDGCr; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TM4S8R367543;
	Fri, 30 Jan 2026 00:59:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=xRZw0thCnfFXpcXXALwAKv4JtnVLu/EHXSpKLkFLlQQ=; b=
	DnDPpIJ9W3yRpwRJmkrGR/4l0Ku5Z3dVv06vHSli+rDBW+LrX8CwLfVTGYwdHs1F
	VIJjUhp/wAlV4+UGCLFyq4ziaUTSSoksvbdNg+ARBio3SWbDmZxZuH3mmNwP84w3
	FEGtANJWW/OC3z9kyznNbLKsQD/nmRJ6CU0lS1pgJGKBVDga/j8bw/bchvXj3GrO
	+QPUELJ7J3k674bmleZu7cEA30eRPC/jVUS5OMMlc1jgBWtJ+Qya9lXl+o1EWJ+w
	vppZczbbZzqF4U/oMxcH4rJPyOdRo6jcHX0pU0LWCOjFEBE3djK9mjxuWbOrG2q3
	Xt2LtXqkOSI+9LgU7EmB6w==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4by378mdu4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 Jan 2026 00:59:15 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60U0s2Ne019762;
	Fri, 30 Jan 2026 00:59:14 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013062.outbound.protection.outlook.com [40.93.196.62])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4bvmhjcj54-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 Jan 2026 00:59:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dddVJ+BkjpoNgrbi4XGkS7gofYz7po0ZWB2zCEmEVLjgjstAxWvV1A9s+xgaKSJ6ABoBTyK+JbGRQbRKx85mydSx03/ALuVowxmfGUm15OJbOkZD1rgzW8RdxEKabtMOgUHUoel/WBqfkUp3TbY4DxqPLIYMfo+mMEOHY6Yaly36fVTN5S/aoKfmWiNP0isbMsZa+Wpb18a6ErNeDtG+gPnXg1o0QtiyuWyc/H9ypKFYZrdYbSO8uPCzSXB6q33OMwJM7ZeMvuiMOOzm5n6tIe9SEfoEy0/4W93WVGwlHwDvXsrO5id5wI3yE3Pq1d1eJa8raPxPm6ab6bvcci68tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xRZw0thCnfFXpcXXALwAKv4JtnVLu/EHXSpKLkFLlQQ=;
 b=vo9+WmXTnlc0bKa+UWZNJ4229okedhTeul+XHhvflbXK0SBP9jIUxLCkMwJfndgfQnYcCFAiWvVYbNkAFhCx3KQEJt43Lr97p9uUGOEm+5ti05ZvfyhGOXCZBWUwCJwYofqRU0dM1IdAvEHheIy2hzQidZJDVH+Nnc/DB3MyR+Dqef+3tY8M8dth6gYJ3/3UmzlbVGlRfprWFFOJfQtQJxXPbT/fb/ZKGzd8YTbZcQb9hvjQOYq3tJ61y/cmqCiviyT1a0qHFpDW9Tgb2XX7uIGRC+6pMa14yKcZmaSDLGzRG7hOF6EJPX7H3xaykQ8AcBTY9ApAsCEkn0njDFNBcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xRZw0thCnfFXpcXXALwAKv4JtnVLu/EHXSpKLkFLlQQ=;
 b=JJgqDGCr8VJamr36pvgBa3XA09Qsllv0kzOLYXYC+2Kxw9k2YVJWtLzUZEphRsbiaPT7UFkAhsTIra2Z25bnlhRxNq4tiNsZZ9XmcvaHveOf1Qg2ngst7unD7pGA6EjlwZHGxQTEjwJfGNkXb6NpT1kleD8i99jcMyUqwrSsTHs=
Received: from SA1PR10MB6365.namprd10.prod.outlook.com (2603:10b6:806:255::12)
 by CH3PR10MB6714.namprd10.prod.outlook.com (2603:10b6:610:142::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 00:59:11 +0000
Received: from SA1PR10MB6365.namprd10.prod.outlook.com
 ([fe80::e842:361f:d030:1ec1]) by SA1PR10MB6365.namprd10.prod.outlook.com
 ([fe80::e842:361f:d030:1ec1%4]) with mapi id 15.20.9542.010; Fri, 30 Jan 2026
 00:59:11 +0000
Message-ID: <59805735-5e41-44b7-a250-5bedcb80a75e@oracle.com>
Date: Thu, 29 Jan 2026 16:58:49 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] Don't create sframes during build
To: Nathan Chancellor <nathan@kernel.org>, Jens Remus <jremus@linux.ibm.com>
Cc: Matthias Klose <doko@debian.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Nicolas Schier <nicolas.schier@linux.dev>,
        Binutils
 <binutils@sourceware.org>,
        Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
        Frederik Schwan <freswa@archlinux.org>
References: <20250904131835.sfcG19NV@linutronix.de>
 <b3db475e-e84d-4056-9420-bc0acc8b9fe5@debian.org>
 <7b45d196-063e-4e76-b08b-ec2bcc111328@linux.ibm.com>
 <20260129222357.GA493990@ax162>
Content-Language: en-US
From: Indu Bhagat <indu.bhagat@oracle.com>
In-Reply-To: <20260129222357.GA493990@ax162>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0188.namprd04.prod.outlook.com
 (2603:10b6:303:86::13) To SA1PR10MB6365.namprd10.prod.outlook.com
 (2603:10b6:806:255::12)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR10MB6365:EE_|CH3PR10MB6714:EE_
X-MS-Office365-Filtering-Correlation-Id: 86911d90-ccc1-462f-cee7-08de5f9ac780
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OFQwbDNqMk8zSDZmVmlWVUhwTFQ5L2xDVExoZzZkRmpqTmJ4Z0hnR2dNSSt1?=
 =?utf-8?B?djhQdnVDV0hLKzhrVVdaa1U3WVlkY2dLbExCeDg1di9sSERhQ0d4YnBwWHVS?=
 =?utf-8?B?azlTcnFzLzRFMlF5Y0Iza0ZmdDBXZTFMTE9rUzJUM09SVDUzZkZnUVdjYytG?=
 =?utf-8?B?QjV1WEtOaE02WjA4c3BRRDMwcGI3UUIweGhzMDU2RmxzTG1PWEtXWnFHMDFG?=
 =?utf-8?B?NVYxK2I2OGppQXE2WkNxcFA3YkZmaUJaMGpIbEhYV3dERUhIeDdVazJXSEhh?=
 =?utf-8?B?M240NXFHbUNib0IvbnpDVW5mMlVyemhBa2tzK1lsTklRclBzSytxSzJWN0Yr?=
 =?utf-8?B?TU0wUjBjWDhSMVVBSEZrQW9BNUNqU3ZEVHJQM3Q4YnRvM0w5T2o1aHBXdHRU?=
 =?utf-8?B?OVlKK1NEQlNoTE4vYVBDVW9LcTBsWFVaRExQV3hnL0pvK1ZQWWZteDdwcmlT?=
 =?utf-8?B?c09SNHJQNHhKQ215bmV4akp6K04ydE5kZ1ZsWS92bXM3b1BMTWVKbUVVUkQw?=
 =?utf-8?B?d1pHR2NNR3ArRXRUVTJBaUZRdHUzZmw4KzJ2YkEwUys2aUlRT3ozVzl0dDZS?=
 =?utf-8?B?ejhIRWR6QmRNRzROVGVUT1IvVFVhN0h2SEhyRG11VTBPT3RlSTFQS1R6Z1VX?=
 =?utf-8?B?YkwzR2pmTlBhSnZ0dzRBUlRJZHNjSG9DL2pOTFBHV2R1ZjJubS8yK24zdXBK?=
 =?utf-8?B?VXROVXBjbWFzRHBmSXpJQTVlNU9nUlRoQ1dGNmlDd1pEMDdNaXU0UjUvNmg4?=
 =?utf-8?B?UkhiZXgxd25oS0NxaWxlYXkydnhHUHRCSXAxYURtLzc3TUc1dndUVEJJZU9o?=
 =?utf-8?B?NVBGTUdFQ0hBVHE5dGcyeE8vYW13RWxjczRrMi9VTkZyckM5aUlYZzhxVDJG?=
 =?utf-8?B?SVM5QUROTk00eVlrMG9KeTRad2NNaGYwZXgzaFZFcDNIWGJ5QUpPNDRtd2Ft?=
 =?utf-8?B?ZWd0cjhMeitBdmhxbU43clRXb0lEazQ1OHN5c3RoZ0pnYjVyZXV5YWdiV0xr?=
 =?utf-8?B?M1JzUm9ZK1BUb0pMZkFLUlppMlJXeERmMFVXa1FLOUtmUkd6akFHVjBnOFdr?=
 =?utf-8?B?WUNodmltUWNPTXgrbTMwYUJHOGphQnpqNUpMZ25EcHR6d2hRZ2RMMmdaMlEw?=
 =?utf-8?B?WmhYWCtZVHduVE9sUitlVHg5NW82aUVkZG5Oa1lCWGhsWU1vNUFabWlkV3Ry?=
 =?utf-8?B?aFcySTViOEtSWXBCeUpWVzdLOHJNSlI3eE9TVUZQeFVmZmVzOElNQ0hKcmFW?=
 =?utf-8?B?ckpLOU9MT3EwMHdCK1NkaWd0NHNGcSt3bHEzcGVLTEhvOXNsa0VIa0QxdWw0?=
 =?utf-8?B?a3NyMGNEUTc2eGtzcmVWemhFZXdpNGtwRmpjN2ZpNTlyeUVOOE9ER1Vic05E?=
 =?utf-8?B?aVZ1T2VaNU5xU1Q5OFZWUC8reDZjamJSUlFldUVpSjJISlVac2V4QWs3bWd6?=
 =?utf-8?B?b2FPb25CUm1Yb0lpRVV6R3BzN1BzMVJxMk9UQUpMWWFEN0ZCbXFqUkRXenVZ?=
 =?utf-8?B?UUlzVnVsbXhHeGZEaXhpUE9rb0JxK0Q4TE85MU5EMk5rc3oxSnRVMzdqTWll?=
 =?utf-8?B?RnhOQzRrODEveTFXRWRYV3ZuVHFBdVY1MTQ3eVNsWU9pd00va2xjOE9WNFhk?=
 =?utf-8?B?T1oxSXdpK093Z1AwTGR6eitRMHlXYVRjMFBhREpXSG5sbS9WNlJjS2pqWGZV?=
 =?utf-8?B?cVc4MVJ6NXhzZC9wMjUwY2dyWHcxNUg4Y285d240SmFoeTNXUFpSRVRpaFF1?=
 =?utf-8?B?dlhVZ1NsT0sxeklobE5wMDBKcG1iK1JDU2l4Z3BFVHF0NWhZcUZXYUh4Tngx?=
 =?utf-8?B?emhFRysweU5qa2JTQjY4enlyYVNQSkhYUEtIaldQcmc2YVRTR204Wlc2S3hZ?=
 =?utf-8?B?MXJaMDhSMG5hdmRNR1ozbVBYWWptSG5BNWFSUWNaZFJYRDRJcEFmZll5bTh5?=
 =?utf-8?B?cFhFY3ZxbmdxTU50cmJ1bW9vRnpqMzU1ZXIvbE1wZm5TU0RuYjhEbEhIVndT?=
 =?utf-8?B?QmZsVzVmTlhVdFB1bFlvT0JHQ2NMcWoxbEhaZTRwMjBQM0ZZQXFDRnhRYnlJ?=
 =?utf-8?B?NjBJYkRFUHJiK1pGZWJrR1EwcWNJQXI1eUZQbU9QVVJpRGpnM3p4WTdpMERR?=
 =?utf-8?Q?/jjA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR10MB6365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0NYc3JKdlpwOFlseWs1bldmclFiY2I1REZWd0l3UG5rdTlIWTgwdGFCQ21a?=
 =?utf-8?B?bDJHVGVUNU9pUzVXRlZZWVdnV2hkM0xzbk1QS1Jad2VKd1VyVTliM3NvQ0M0?=
 =?utf-8?B?ZEdwYktsQi9yOUVmZHZIUDB5YmE3RDZOdVFTaE5ENHZmbVlEci9MbjdYcmhP?=
 =?utf-8?B?TXRCTmR3RmFiNFZWZm80MWc5UHorSVMvOXB4TW1TN2xzTDFqN0VCditWbTY5?=
 =?utf-8?B?UVkwbGRJakV3Mkp1Ukk4UVBibkFZUzBQUHE2V01sSnIwR1JuNjNSKzNaQXZG?=
 =?utf-8?B?aFBQQ3RVWG1iWExmekVoUzhXOXBmRUdBOHlFZjJkMlNrL1RkUzUrNzZOQ21o?=
 =?utf-8?B?VzhVYUJ2YXVUNWNkNEMwNkszU3dib1kvTXZiUHlTUkRaM0ZzZUxkb01vWmtS?=
 =?utf-8?B?aEdGM0VvaWQxdC84eTFrRUFBcWlBSVQ0NUI5QjVuZEhpMHQ3VHVwUFl0Qm9m?=
 =?utf-8?B?UGRRR2djMUFSRm1HSkhENlVuZlIvYmZwbW1YSzdpdHdXam1adVRMek10RHF3?=
 =?utf-8?B?MzdTS0REU29DQTQvQnhuTzdqdTFKclNMR2RJOHZxM1Y5b3A0dkR6S0I0Rjdy?=
 =?utf-8?B?aCtNWTdwOGUrZ1FCNlJHcUp5VGQzTTI5Vnp6RkE3SUNlaFFTUWxmRGcyQlJi?=
 =?utf-8?B?ZlRGdTg1aVpDMU9GVUNyS2xOdE1DMUYyazk1MVRoN012UTNjK1NHcndCWmxL?=
 =?utf-8?B?aUtSTUxaYWNRbjFaRzhhc3RYc2NJY1c5RE1hMFRVckZkL09uQXpxbWgxZkJt?=
 =?utf-8?B?RjczZTlqRUdVT1NQQitwVUxTdWkzMU1zUWVsVysyTG1tdUpjajZlSWloYVBt?=
 =?utf-8?B?ZkRoalFLNjV0ZUgvWkFycGhGajF3L3RDQjA0Nnl6MUZPdFEyM0NQSFBVNGJv?=
 =?utf-8?B?SmpJV0t3V1h3b29EaUwyUStSanliVXNPQVdyQUJzWlhrSFU1RE8vSUE4c1BE?=
 =?utf-8?B?eW5oWFY5eFJRRTVKcGM2ekdwVHYzU0IxeTRFVW1WeENiWm1ISTlVVXozT2pC?=
 =?utf-8?B?WFBKZHp5S3FCQkprQUdoUXZnNDY1OXhRZHJ4azF6Mk5xak5IVjJqY2lOMTFz?=
 =?utf-8?B?SWJVSS9ESjJsYU9tK215SWE5bVIwN1orSmtQNkNPWnczMzZ1NnQ0UnVCZ24r?=
 =?utf-8?B?MFVZejlTT1V6MWJ3VkJxT2UxQldiOUVHckpHYTlaVkFQUHdjaTNETFc5UExU?=
 =?utf-8?B?clA5YjlGYWoxZTNjL1V4R1JRNzRlVmJHSGxLdURHMHE1bWFrVEVHeGJNWmJy?=
 =?utf-8?B?TzNLZUtubm5MN2xzcDZxei9hcGVRU3R5RmVIc3pZMjhiOWlSTSsxVXpsTHJN?=
 =?utf-8?B?WTN0TWsxSTdrZk9DS0JwaWpQNlN0ZW93WmZ3TkUxYzBkK2xtRk9GQlVkOWRx?=
 =?utf-8?B?WUFIMmhnckx6Sit2cVFaUmdTUnR5MW4vbWtkb2w1dmdNelVETXZpcGlIQ2Rx?=
 =?utf-8?B?Zkp4VXFCbFVSSjlkL2ZLS3BBQStYdEgyUER5YnpEMU92KzlsSEFZbnFHM08y?=
 =?utf-8?B?TlJsdGprYkFweWlodHNTMDJ3VG9rSmZJMkdUdkp6ZVl2aHdBbEdaa3VnYmdV?=
 =?utf-8?B?TERiUkdlZHlGOTVBY2lwQVA5VnR6MW4zUkRvbkQwdEwvODR3TVNPWElRdzFt?=
 =?utf-8?B?Z3BqdjEva2FQMVNqZ1FNb0pYNHhINVljTGJTejQ3a21GTEJvZ1ZQUXNYQTJ6?=
 =?utf-8?B?a080K1hXWkY5ZWlLQm0xN2JFeS9kajVzOTNnQVc0dWIxMGRjeTZSRHRkZ3h2?=
 =?utf-8?B?ck1XOGJnSkhiM2dnWHdHMlNrbkF4MXBGdVpSYTRxdXZWczJkQzBvRXZxeDZp?=
 =?utf-8?B?clhEbmp0KzFpeWZaNkpKbkxZUmxPd0U1b0VJVEprejU4bSsvOWduVzVNY2M4?=
 =?utf-8?B?L3ZzMXlJTHdHSjJiUTJ0NWlFckVtQnI4bldVVjlPWFZiYXhwQlBsajF4TlN1?=
 =?utf-8?B?MjNMSHRGNllDNk5XcER0R1VNdnArQjBxcTdYZ3R6NjFicHFUVjRRMTdxUHNQ?=
 =?utf-8?B?Ym94a0ZxUmpXWmg2ZTdWdWZ6emp3c3lBUzNTZUNWRDdhaU9rZlk4TE5QNlFT?=
 =?utf-8?B?d1hYTUdlbnJreURHeUJNVEkvakxoV2RBbS9EYzVSQURCbUR5NXdoQmk4M2xu?=
 =?utf-8?B?ZmN6U0xPNjM2OUc0NENSUmlmdFE3TnRhVnhvZndqbFU2bFNERitoWFcvcGJp?=
 =?utf-8?B?TTJDTzJtOVo0OHJTQVNNelRRd05OSTUvZ1Y2WGlqZEdQUHg3MXJGVlhmMDdX?=
 =?utf-8?B?TGFudDhUaVZDTStBUGg4d3RQdU84QWVmaktsb3h6bHdiYjBVVUxhSEUyRjBl?=
 =?utf-8?B?SStwM1hUdG1lVzNtVXlPWmNQbG5rSUx2VXZCZitMRlgwYlV0dTl5Ulc3a2Iv?=
 =?utf-8?Q?bzlDuVMAjvn5eZDNh9TIY7B5eyypqalNXWaEh?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/TrNOi0xlz9rh60GYqy+m2nmkAYvdA7nmRTZy9Jx/hkKcE7RBjbXIuI0z482bVIsvfUJIQxxUiuI3aYOx8O8Y5HBMh695AMBPijJvBlLhXWcYN2y5JKCn8MJ6SorhBoVCWOp7RcrwmDQ7b2bnVRqs8ua/fE9MI/GjlyJxweA/GQoJ0e39THoFr43ulUai2ske5cZrUKSHJDpc/GrQpeLe/WYGSpQYnTE2YuuAftYZmtYy8FkY9r1teCqw+XI1l2fDgPqGzUAkwLL+/eHgRH+3SLSCt6cZIVW6m1uyaVKtKd9gO7xitCLmAbl62EX2evR8E/Iefs7Z8VN4n9WWrPOWYmtGCgb5YNhLK1wwkh2OqXQJbDLz0V+kJ7pDVvkLZhhLlbLZE6qfK6DSv1pcvUT97G/zm74lwu7fAxhGzs6WjsT933SzA7H9fFJ8zmo9v76JYfGcM7uzysU6aywUCj3d4hvlKaaXhDFC4fCOMfyUHWO/9LQ+1omk3oSWe65dGe5a7uJ9IbJtrs3Axymee1/v6Zah4PNHABNALpIej2K68IdkTChyk8R0x4A2svaHTvcJij3uDbMz/4nud1ZAH7Lz1mDZZINlGU9ii1/9w+kxkE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86911d90-ccc1-462f-cee7-08de5f9ac780
X-MS-Exchange-CrossTenant-AuthSource: SA1PR10MB6365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 00:59:11.0879
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E432ZCQQdok6RjdfflSw/7suBpcu5bf6truamBAEm6h1lMU+GFb62ZKVa9x4ipPwxeL3k34krJVr50uvNWcoZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6714
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_03,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2601300005
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDAwNSBTYWx0ZWRfX4/xXc1osv2mE
 GlLRPN1GWM1QQLYMXxdDcMS5toROwBWZ8xiRuF4L3dGXp/EjzflcmZfE6AJnCrZOA8hX5+HR1KN
 FARGNp7kBiMomE0IhUFcZeGOe9TlFIh4/RDJqVjREQZe2lQb5LuDvJnn/nQb3dAZvfxXWmuhkx5
 ncW0qpV6DNvno8UIvOHX+fCzw8DkfOs931ASLfgJgZpHSXfrx+drxykA480UaR9ZAnJpNW8cueX
 /MaYcxTw6mArhHT2VO2GjQBIs9jmpXRRKkEPrZ41SC1E+FE3Mb9/MHE2CnrpQ+0ZoNLaJKPmOpf
 C2I8bmET2J9mtBUN87yNKnu1B3A1n168RSSjCN3P/ATxWxC5oMZ0jq3140DUR/xx7gR+gCIEZsw
 eD+fSjd2SUnPg7c/GuoLyIIh18UIN7jYVhgn12XeCNgZGiKJTmBsChuLzkx0IQ/+lAeVGp3Tn1Y
 dxpsw1NB/uVIbgLqAtrLEiwluazueDI09O3kXjtQ=
X-Authority-Analysis: v=2.4 cv=a/o9NESF c=1 sm=1 tr=0 ts=697c0263 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=StaHx6bPi2kq8xTtaMwA:9 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12103
X-Proofpoint-GUID: Zx9AnIFoNecqISxuiMwgeHA8yobdDwWc
X-Proofpoint-ORIG-GUID: Zx9AnIFoNecqISxuiMwgeHA8yobdDwWc
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[oracle.com,reject];
	R_DKIM_ALLOW(-0.20)[oracle.com:s=corp-2025-04-25,oracle.onmicrosoft.com:s=selector2-oracle-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-10939-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oracle.onmicrosoft.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[oracle.com:+,oracle.onmicrosoft.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[indu.bhagat@oracle.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 4D255B60ED
X-Rspamd-Action: no action

On 1/29/26 2:23 PM, Nathan Chancellor wrote:
> On Thu, Jan 29, 2026 at 10:13:03AM +0100, Jens Remus wrote:
>> Instead of dropping .sframe for kernel during final link it would be
>> better not to generate it to save some CPU cycles and disk space.
> ...
>> What about:
>>
>> diff --git a/Makefile b/Makefile
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -906,6 +906,11 @@ KBUILD_CFLAGS	+= $(call cc-option,--param=allow-store-data-races=0)
>>   KBUILD_CFLAGS	+= $(call cc-option,-fno-allow-store-data-races)
>>   endif
>>
>> +# No .sframe generation for kernel if enabled in assembler by default
>> +CC_FLAGS_SFRAME	:= $(call as-option,-Wa$(comma)--gsframe=no)
>> +KBUILD_CFLAGS	+= $(CC_FLAGS_SFRAME)
>> +KBUILD_AFLAGS	+= $(CC_FLAGS_SFRAME)
>> +
>>   ifdef CONFIG_READABLE_ASM
>>   # Disable optimizations that make assembler listings hard to read.
>>   # reorder blocks reorders the control in the function
> 
> This seems like a good start for the main kernel build. I still have an
> issue with bleeding edge binutils with mismatched .sframe input
> sections, which does not appear to disappear with -Wa,--gsframe=no.
> 
>    $ cat test.c
>    void atexit();
>    void main() { atexit(); }
> 
>    $ gcc --version | head -1
>    gcc (GCC) 15.2.1 20260103
> 
>    $ ld --version | head -1
>    GNU ld (GNU Binutils) 2.45.50.20260128
> 
>    $ gcc -o /dev/null test.c
>    .../binutils/2.45.50-2026-01-27_18-02-52-e8108cc5e6fe1748dc6033a297dd2c1c6234de78/bin/ld: input SFrame sections with different format versions prevent .sframe generation
>    .../binutils/2.45.50-2026-01-27_18-02-52-e8108cc5e6fe1748dc6033a297dd2c1c6234de78/bin/ld: final link failed
>    collect2: error: ld returned 1 exit status
> 
>    $ gcc -o /dev/null -Wa,--gsframe=no test.c
>    .../binutils/2.45.50-2026-01-27_18-02-52-e8108cc5e6fe1748dc6033a297dd2c1c6234de78/bin/ld: input SFrame sections with different format versions prevent .sframe generation
>    .../binutils/2.45.50-2026-01-27_18-02-52-e8108cc5e6fe1748dc6033a297dd2c1c6234de78/bin/ld: final link failed
>    collect2: error: ld returned 1 exit status
> 
>    $ gcc -o /dev/null -Wl,--discard-sframe test.c
> 
> This was extracted from an error I see while building libiberty in
> binutils due to the atexit() configure test failing then the fallback to
> on_exit() resulting in an error but I also notice it when building
> tools/objtool, which is a host tool:
> 
>    $ make -skj"$(nproc)" ARCH=x86_64 mrproper defconfig prepare
>    .../binutils/2.45.50-2026-01-27_18-02-52-e8108cc5e6fe1748dc6033a297dd2c1c6234de78/bin/ld: input SFrame sections with different format versions prevent .sframe generation
>    .../binutils/2.45.50-2026-01-27_18-02-52-e8108cc5e6fe1748dc6033a297dd2c1c6234de78/bin/ld: final link failed
>    collect2: error: ld returned 1 exit status
>    make[5]: *** [Makefile:127: tools/objtool/objtool] Error 1
>    ...
> 
> It looks like several distribution ELF objects and libraries on my
> system (Arch Linux) have .sframe sections in them, so maybe we still
> need -Wl,--discard-sframe? They all appear to be SFrame v2 objects so if
> no objects in the build have SFrame v3 sections from -Wa,--gsframe=no,
> it seems odd that there is an error but maybe there is something else
> going on?
> 

As to whats going on:

Some Arch Linux releases seem to have glibc configured with 
--enable-sframe, which is likely the cause of the SFrame V2 objects on 
your system.  Frederick (from ArchLinux is in CC) is planning to roll 
out a release with a glibc built without --enable-sframe.

Next, GNU ld creates linker-generated .sframe for the (linker-generated) 
.plt sections (on x86_64 and s390x), if GNU ld sees any input objects 
have .sframe in them[*], unless --discard-sframe is specified.  These 
are now SFrame V3 (after Jan 15 when SFrame V3 was merged).  The choice 
to drop the support for V2/V3 object mixing in the GNU ld was made to 
save implementation complexity in linkers and (WIP) stacktracers 
supporting SFrame, by adopting SFrame V3 and above.

So, --discard-sframe is the remedy if you have V2 sections lying around.

[*] The bug in the GNU Binutils snapshots between Jan 15 and Jan 24 was 
that these linker-generated .sframe for .plt were enthusiastically 
created even when _none_ of the inputs had .sframe in them (for x86_64 
and s390x), unless --discard-sframe was specified.

