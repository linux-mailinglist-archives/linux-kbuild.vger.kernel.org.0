Return-Path: <linux-kbuild+bounces-6440-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B90A7C346
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Apr 2025 20:40:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 64599189FC55
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Apr 2025 18:40:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6315198E60;
	Fri,  4 Apr 2025 18:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=smartmatic.com header.i=@smartmatic.com header.b="Gm31t3VR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2105.outbound.protection.outlook.com [40.107.243.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8784BE4A
	for <linux-kbuild@vger.kernel.org>; Fri,  4 Apr 2025 18:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743792017; cv=fail; b=jNAM3BFEWuXVD2+BQolIZDbb/I+6QHaOXOPVvR08kQhW1IuknBK2CLaMPujvjoVAOPIyeJV13TM66b4TsUTLrlRLz6oEGhF1eMHMyhnG3c0anYauZiUdCbOEVslH5BvBHf1EuH5VDMGZB64wjL6rCUwR5gnpyqdIeuMJzIbsOss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743792017; c=relaxed/simple;
	bh=zyllfsucgBaXlLTGUeDQLas+wgXc5NZZNpqf4p7wzGc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MrTaZzVEOoeI27jdYGTxIt3ge/bJgqd+yGqaDd/rRCWdWa+ycVukQ0ICk9CuDGqGNgpdmez9kp9I4DO+/Vzk2zi4xY68zjkGrwZElzonwuIca6T3+kziSjHe5bCK58dc1GuD2cL+eWMn+PhVKW/LT2dDP4w0K2rcmb1BajkpLpQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smartmatic.com; spf=pass smtp.mailfrom=smartmatic.com; dkim=pass (1024-bit key) header.d=smartmatic.com header.i=@smartmatic.com header.b=Gm31t3VR; arc=fail smtp.client-ip=40.107.243.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smartmatic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smartmatic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T3qlWRiXmnhTB71hnPvVX7y1+uH9mWhVmeirGUR/+rp4yXyD89cDMUN9UmCQuqfnMmKSPCgsI9cDvB4D/fWV8DR7OMpXTubOk/gu4uw3Wdo2CwzNkK19moijBYrReoF3CNcmUkp/aT2B1ju3EtXenAPQLjbEePXELAVqqU35cpn/9T22e5+d6pMA13vjCZdjNeOT5g1Sd35lStmLUeMc2xjvencGNzkrmdQYfL/CiJuRADxQjkl+MLGd+d/mZMPY4cBakbRMBX2QsyuJM/gOIfY/+ALuWbuO4rq10n4T8l/fVRUHCYYrrN6Q3RZRURbYmWFhsqA9wJ+do7OohJTpkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zyllfsucgBaXlLTGUeDQLas+wgXc5NZZNpqf4p7wzGc=;
 b=y0m6WPedC2ceoEcgb6uVsaPQt2EfnEqmt61kmXCAb+xH+vkN1IesBT5oW+pz0on7CdV5ZrVSlhhhEbFen05yqStEYNguEKVIxD1+iNidMJhxeclCLdq9NjTldTRTG83piSfu46DPoqYnFd5USKt9RiMLtwM9QGP+55qds/+poB7K+IQuLhR5Yk8klyibgiwAhMooisS29bzvo6B7TtbyC/P1Uk6W+hc7R8UrwZnVmSyooAk3fZtEllakxeS+TQQk0W/qd722NttRUwQP8I+X00wVIhVtDtYqGfM80GGl0/8v4W3NLHM3EFIJpDWLyGLTCWspKXhz3XAYIhTA3zM+EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=smartmatic.com; dmarc=pass action=none
 header.from=smartmatic.com; dkim=pass header.d=smartmatic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smartmatic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zyllfsucgBaXlLTGUeDQLas+wgXc5NZZNpqf4p7wzGc=;
 b=Gm31t3VRNsFxOOMVscuhCVceQFxwa/kw+/MCyC4tcNOSdjpYNHCmwRk6D8Gn++986sWyXWFJQQ2VZRGDlzuGFV+2C80CQ0pYo2CRav54BpBVuZ2g4zgFtr5T7vKlEyDpHFy0Qknxn++sUUtXnS5OqDwxT5wfAeB8k0iYp9CPP2U=
Received: from IA1PR10MB7312.namprd10.prod.outlook.com (2603:10b6:208:3fc::5)
 by MN2PR10MB4237.namprd10.prod.outlook.com (2603:10b6:208:1dc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.38; Fri, 4 Apr
 2025 18:40:11 +0000
Received: from IA1PR10MB7312.namprd10.prod.outlook.com
 ([fe80::d369:606e:cb44:9a99]) by IA1PR10MB7312.namprd10.prod.outlook.com
 ([fe80::d369:606e:cb44:9a99%3]) with mapi id 15.20.8606.027; Fri, 4 Apr 2025
 18:40:11 +0000
From: Richard Bastos Higuera <richard.bastos@smartmatic.com>
To: Masahiro Yamada <masahiroy@kernel.org>
CC: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
Subject:
 =?utf-8?B?UmU6IOKaoO+4jyBSZToga2J1aWxkOiBkZWItcGtnOiBEb2VzIHRoZSBkZWIt?=
 =?utf-8?B?cGtnIHRhcmdldCBkaXNjYXJkIG11bHRpLWNvcmUgY29tcGlsYXRpb24gb3B0?=
 =?utf-8?Q?ions=3F?=
Thread-Topic:
 =?utf-8?B?4pqg77iPIFJlOiBrYnVpbGQ6IGRlYi1wa2c6IERvZXMgdGhlIGRlYi1wa2cg?=
 =?utf-8?B?dGFyZ2V0IGRpc2NhcmQgbXVsdGktY29yZSBjb21waWxhdGlvbiBvcHRpb25z?=
 =?utf-8?Q?=3F?=
Thread-Index: AQHbn0m/U7O3niPBPEiFNilT5IY+FbOLDLOAgAKvUc6ABciIAIAAXV7V
Date: Fri, 4 Apr 2025 18:40:11 +0000
Message-ID:
 <IA1PR10MB73127F31CDCBC72F65428CADEFA92@IA1PR10MB7312.namprd10.prod.outlook.com>
References:
 <DS0PR10MB7317103847A838A01154D836EFA12@DS0PR10MB7317.namprd10.prod.outlook.com>
 <CAK7LNASc7jmzmW5HbvH6N=gZw2M5o=iSkk1revZAp_8P9-e9zA@mail.gmail.com>
 <DS0PR10MB73173D13E7322C77B6F10C3BEFAD2@DS0PR10MB7317.namprd10.prod.outlook.com>
 <CAK7LNATWKW8zBdtJvi1L3QvZXRq=+HWRc1M3CYmnK8rq0dpkHQ@mail.gmail.com>
In-Reply-To:
 <CAK7LNATWKW8zBdtJvi1L3QvZXRq=+HWRc1M3CYmnK8rq0dpkHQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=smartmatic.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR10MB7312:EE_|MN2PR10MB4237:EE_
x-ms-office365-filtering-correlation-id: 3877c63c-dad2-4c66-2aa2-08dd73a82183
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?c1hscWFnRm5taXE3NVJzUFpxMHdLZmJocGo0NGE1a1ZMbmE2VW1nYSt4Rmsx?=
 =?utf-8?B?TGhDK3RXVXdKQ2x1WktrcGR5REorM2xObmxTaGNSMU9jZjVONWZpcU5DSzEv?=
 =?utf-8?B?Qmhkc1dOM2VtcVRjalNDN0hkN1pLK2pSVGpmeWdnNTVqczJWLzdhbHEvYlBv?=
 =?utf-8?B?Q1VHQXJ4eWt5cE5nc2JWUDUxVzd2Y2RkRzE0d1pXUzdNUjdSaTFYSzZyMFdS?=
 =?utf-8?B?N3BvQ2tMSXg0STZvcFBvVzBCdGlFZ1N2aTBKbURkTkxEbVJXK2kxR1V3S2JH?=
 =?utf-8?B?ekNIcVIzczZWdWtaOXRwVzhFQXJ4dGRiZHlNUmdxN2tDdjlqR3Q0TVhsRDV1?=
 =?utf-8?B?dmZtREkwNmFOcnEwUzVMQkJiRE1UVkFqOUlUWUFUa1o2V2lWYko4SVR1aHdi?=
 =?utf-8?B?RmtENGlzYWV3RWp0L3FHdXcvTU5CUzVuN0ZLRzJTeERvOXdHdTd0bFcwOUxl?=
 =?utf-8?B?a3R1UFFUNERXNnNLZTVJbVF5MktoVDQ5YitXR3ZCTDZ6eGtOZFdCQUJpaUdD?=
 =?utf-8?B?Z0FvMy94NG9yVUtGUFBiRHNCL0NQU1N5R2lrVmpwU21EV1FlK2RkSTdIOFM5?=
 =?utf-8?B?Mm9tWTBxcHNaY3FQV1JNeWJiSVBLRzJhN2tsU1Y2ejFhbUIwRGJrTS9Ucko3?=
 =?utf-8?B?cW1FdUFReEdFNUgxN2dkb1NsT0IxQ3BjZ0Q5ME9UamtXdGMwZlNhelRkd09G?=
 =?utf-8?B?dWdreDZqbUtHd3ZNV0FPZE43QWY1VFovYVB0TGZkaUMvQ3pYK29JY1AzOU9K?=
 =?utf-8?B?QUtPaGIyWG9hbUlmeFd4V1NRbzdHdzFUUnJNZHl6TEhScVU1U3RYQ2M0TGdM?=
 =?utf-8?B?T00rSUZLamZYaC9zeEhVa1R1NXQ2L3V6Ui82NVVabGFYekhvbVZHTkw4ZERG?=
 =?utf-8?B?azFnYlJUelZGM2Q0Q1pKU21WVVFlSEptN0JOZnYvd0VuZEF1MDVHd1lRQlNW?=
 =?utf-8?B?RmFrYnBLZW5ENFkrclI2b3RZS1ZEcW1WOUtBYUxxV3dNbTZ3QUhRcDFRSUQv?=
 =?utf-8?B?dXpDUkZTd3MzOG5sdEJlcnlHNWZIT2c0bmwvbllDbUhmWHh1Sndqd0k4MTJT?=
 =?utf-8?B?V2Z5WmlKRUo2WEE2eHRrUnVaeWNXYXlFejhQc3pQQnI3Uk5yZENGaTVaeFNT?=
 =?utf-8?B?ZUpJclJONXhvaTd1VDVabGoyYTVxRlNVWFZFT203Q2FmRUJmc3J5VXhPRGlS?=
 =?utf-8?B?REgvcnBmblVJVEVkZVAzQyt3MVdtajg4VUpXRmJnOVFhNXpST3IvVUNDOVhS?=
 =?utf-8?B?SHc0QXJxR0J1cUw0bkNCK0ZNV24wQlNHeWlYMnAxL2tRT1pEcmdHaU5Ia2Rv?=
 =?utf-8?B?TUpLeHhKaEdlMEZmTmlqS1RPZkVVbzN1VEE2T3BmdGRuTjF6TTVCS2ZzK3cz?=
 =?utf-8?B?dTBtVnBhSUhZQkhYWnB4WGc3WUhJaVJSL05DNkZYTTNxdlhZQzREUndiZVVm?=
 =?utf-8?B?ZGUyWlh2SjZCVUJhK3ZsdVAyTVMwakdXaDFBcnVlVTZuSHNzWjhES0FPV2Fr?=
 =?utf-8?B?MGhSQWtWK3htZHNjM3B0WEZXWjFWd3FFNndvV05aeC9haHFWbnRaS0NDQjJX?=
 =?utf-8?B?MXJrTGo1eCtDeWltb0xzVGlCWExGb1BEL3BJM2pmL2tkTXA5c2lWUERTL0ph?=
 =?utf-8?B?RTZhTE5uYlNZQzhsRnJxR3hjditJUjNWazdoMUZocVZIYjBWaHBsaWhyQUtm?=
 =?utf-8?B?V2Y4Z3UxMW52clZFODhpdE5pQUxYQ1VPZkNtY0ZicGhRZWd5Q1pkNEZ2RzJ1?=
 =?utf-8?B?YUZKYzlpMGVpQTMwd2llMWJyR1phNHdFMk5nZTQ1K0FvUUhNd3dWQmcxMHNt?=
 =?utf-8?B?cFVwdllha1d5NXU0dnJESWFkeFF0K05JZHFnRXdOUlpDdzBCdUV1OWs3YVpG?=
 =?utf-8?Q?QT4n+W+o7qjby?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR10MB7312.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZHNqMHUxUmxSOWJPSzlIdmdEQkx4N1pqUXI4OW5Ld1paLzIrTnZNckh4cjAy?=
 =?utf-8?B?V0J5WmtlN3ZIcmdCM2dUTS9LTlNzcUhsVTcyYVlyaTh1QnJmYXN2Z3FBRHpr?=
 =?utf-8?B?NzZIM0FmOEhWZDF6K0VGNjdWc1RubloxUEV2K0pEUnRkMDFmZUlUdDRvM0d2?=
 =?utf-8?B?S2ZCblJZc2drYjRzc1dnVkVCRUlmNlR6OU1BdFgwRldWdlMxdzFsKzg3TDNa?=
 =?utf-8?B?eXBGQUY0N09TY0dTeE5WYVBMVWpoTzNlNVJ3dkhhYmlxcHZ1YWFnK1REUklH?=
 =?utf-8?B?ak9RWm1xMDE3Z1A5WjNDQzFHczAxZFh4RlRiRjZsc0szdUhxMm5rOFZ6T3cv?=
 =?utf-8?B?U21ZS3prbERwUjhMR1ZBRktidjZvclhoeEk0WjRvZ25waTVEOXNubkI5WXUw?=
 =?utf-8?B?Tmd3TmN5VnNrcFdjem1FMUV2eUpWbDF2bjVYT0x3bitpMTRHd3hpdlFSeTdi?=
 =?utf-8?B?cmd4YWFIb2szYThJQ2ZnRWxnVzgyZDNaTnpzOHkzSUpKZS8xVmwvZmM5MW9v?=
 =?utf-8?B?N2J6aGo4My8rWmJPcThjbEpsT0xscDVwMS9PK2crWWVQblozSWVydlRtRkxC?=
 =?utf-8?B?WE5yanhkUVBCVVBHY0lCaXJkLzVZY3VlZURkSGxiSXc3aGxPRFRRYUZmSEdo?=
 =?utf-8?B?NmhmdCt2UmxwbWFxVFZxTjZmZ0tSYk43bmxGeWl2MllyaTl3bFNtWXRwVE9W?=
 =?utf-8?B?c3lIMUM2WXF3cE5zbHJlZFRjU0NyUVlIeHBYRHN0aUZNMENoaXo0T3lJbUxB?=
 =?utf-8?B?dVdubURvRWc3cHpOSFlWcWd0NkdJZGlXTFg4OGp0S1VJWXF4VTI3a3RWNzZD?=
 =?utf-8?B?Y1ptblJlQmNKOGJ5RHBudDNHTi9qQVdxWElubXd2U1NndVdpVlZ0L2NhOE5i?=
 =?utf-8?B?UUQ0UFJtWWhTWnJJNzg5LzNBYjY0RTRqbkZOaW5jcUtlMjIvRkFiVnNndWxP?=
 =?utf-8?B?UFBFR1hqU3JFaTZ1ckJYK3FmYWt4S2t4aExoeVdWeU1hdUl1V0xXRDR6SVpD?=
 =?utf-8?B?OUJxUmlNanVCeG44b3lMVkduY2t0c2diMW5ZVTdLRWlSWkJuUUs3YUYwK0dt?=
 =?utf-8?B?SXpFRXc5dVFIZEtnbjFCQWJmVnk0QXQxTjIxVnJDVEtKd2wzbjZ5dGhvSCsv?=
 =?utf-8?B?anpKQmVCMll2UFZtTjEwOVRxTEU1cHhKNzhKWmR5elgvUjdYSmR6Wnk5ZVVk?=
 =?utf-8?B?NjFrT3d4dE5sV2lkMjIxRkY4ZXYralR3MGpwS3FJaTZGdWd0dDEwbFM4WmU4?=
 =?utf-8?B?cXpFN2dKRjZzbzRzWThXMFZGK2U5bTBwR01JZVV3b29PVlBVcWNrYVRuWGlp?=
 =?utf-8?B?andpSU4rNDVLSmFScU1zSEZRRU8yQWpHOE1xQ2k2TFN5Q29VRWJoSVRQRFRr?=
 =?utf-8?B?NVBKYmRmb2d2QlhlN01CK01oSVJsUEdTVGZhZXFzaHdNaTI4N25hREhFbllv?=
 =?utf-8?B?ZVpaWEpvTUZSZTdCbjJxbmxRU0lpalR0NFNIMmJ3Q25ON0RJeCtlLzNHRnBK?=
 =?utf-8?B?M1lDWm4rdXNTT2l2YmJjODh4M3k4b2dHZXNLUTY1SHJzakVyaFphc1RrN1l1?=
 =?utf-8?B?dFRJdFZrc2w5N2VCWC9FNk9HQXdQUW9aeEEyTzdZemNpSldFdUVGcXJoMUJn?=
 =?utf-8?B?QWRsKytSYSs0RTlpUm1TWWFZNDdwclFzU3Q2Qm1FcytqNjhKWlJTWUM5SWJC?=
 =?utf-8?B?V2ZjSE1FZ29xdXhiaitsQ2g1L0JYdXBVUUI5LzF4UjZyOUpaMlAya1FBTkM5?=
 =?utf-8?B?dWorR0F1RDFMNk9XbHluYlZRVGI1WnYvYmpXbENvRW5zYnE3RHBGTFd6SjRX?=
 =?utf-8?B?UlNjUWxtRHR3NUZVeCtSeThLUmlUZGtaaHd4bWpNUEhnVVdsSXZZMXpuQ2xG?=
 =?utf-8?B?eEFoOHVYMEJ0bkEzcnNXc3BvelpHUnRiT2IyOGJYbHNoMXJlWHg5SDg4UEtD?=
 =?utf-8?B?dmdhUzJvcVk3RUJEYWFwUzhOV2s0SmVEOEdjWkRVMkJBWjhtZTJoZ242SlV4?=
 =?utf-8?B?Rk1IcE4zWGFwZExJV3pDcS9rblBsamsxcnRnOHBWR0VINUMrT0x3bWhrN1JL?=
 =?utf-8?B?NFBtZ29KV3p3dU5PU0FEdEtCck1GbSt2aTd6TStYbXlzcElrRzdIVW5kZUVi?=
 =?utf-8?B?cFc3RG1HYnBPQlhJNmhseFJiR0lrYTd2SHMyUzVyakt1clAwaWdCMHBWL0tY?=
 =?utf-8?B?Q3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: smartmatic.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR10MB7312.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3877c63c-dad2-4c66-2aa2-08dd73a82183
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2025 18:40:11.0195
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e15726ad-b237-4237-9060-d8223aaf1dbf
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mCo99i9IyZy9IZoYjdG+nPBTcQcxrGjEwMi/Cy1BnaUSm+QjEd3y7svYc/O1GZN8TPtePqJQhvzlmzVnFoUSdJnKgyNJcHnMxUS6kKI0Uvo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4237

TWFzYWhpcm8uCgpZb3UgYXJlIGNvcnJlY3Q7IHRoZSAibWFrZSBkZWItcGtnIC1qPE4+IiBjb21t
YW5kIGluZGVlZCB3b3JrcyB3aXRoIG11bHRpLWNvcmUgb3B0aW9ucy4gSXQgd2FzIG15IG1pc3Rh
a2UsIGFuZCBJIGZlbGwgaW50byBhbiBvYnNlcnZhdGlvbmFsIGJpYXMuIEkgYW0gZW1iYXJyYXNz
ZWQgYnkgbXkgZXJyb3IgYW5kIGFwcHJlY2lhdGUgeW91ciBwYXRpZW5jZS4KVGhhbmsgeW91IGZv
ciB5b3VyIHVuZGVyc3RhbmRpbmcuCgpSaWNoYXJkIEFsZXhhbmRlciBCYXN0b3MKCgpTb2Z0d2Fy
ZSBFbmdpbmVlcgoKClBob25lOiAoKzUwNykgODMxLjI1MDAgLyBFeHQuIDc2NzEKCgpDZWxsIHBo
b25lOsKgKzUwNyA2NzYxODY3NAoKCnd3dy5zbWFydG1hdGljLmNvbQrCoAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpGcm9tOsKgTWFzYWhpcm8gWWFtYWRhIDxtYXNh
aGlyb3lAa2VybmVsLm9yZz4KU2VudDrCoDA0IEFwcmlsIDIwMjUgMDg6MDAKVG86wqBSaWNoYXJk
IEJhc3RvcyBIaWd1ZXJhIDxyaWNoYXJkLmJhc3Rvc0BzbWFydG1hdGljLmNvbT4KQ2M6wqBsaW51
eC1rYnVpbGRAdmdlci5rZXJuZWwub3JnIDxsaW51eC1rYnVpbGRAdmdlci5rZXJuZWwub3JnPgpT
dWJqZWN0OsKgUmU6IOKaoO+4jyBSZToga2J1aWxkOiBkZWItcGtnOiBEb2VzIHRoZSBkZWItcGtn
IHRhcmdldCBkaXNjYXJkIG11bHRpLWNvcmUgY29tcGlsYXRpb24gb3B0aW9ucz8KwqAKT24gVHVl
LCBBcHIgMSwgMjAyNSBhdCA1OjQ04oCvQU0gUmljaGFyZCBCYXN0b3MgSGlndWVyYQo8cmljaGFy
ZC5iYXN0b3NAc21hcnRtYXRpYy5jb20+IHdyb3RlOgo+Cj4gSGVsbG8gTWFzYWhpcm8gWWFtYWRh
Lgo+Cj4gSG93ZXZlciwgdGhlIGRlYi1wa2cgdGFyZ2V0IHNlZW1zIHRvIGRpc2NhcmQgbXVsdGkt
Y29yZSBjb21waWxhdGlvbi4gSXQgY3JlYXRlcyB0aGUgRFNDIHNvdXJjZSBwYWNrYWdlIGFuZCBy
ZWJ1aWxkcyB0aGUgZGViaWFuL2NvbnRyb2wgYW5kIGRlYmlhbi9ydWxlcyB1c2luZyBzY3JpcHRz
L3BhY2thZ2UvbWtkZWJpYW4uCj4KPiBVbmZvcnR1bmF0ZWx5LCB0aGUgYnVpbGQtYXJjaCBhbmQg
YmluYXJ5LWFyY2ggdGFyZ2V0cyBjb21waWxlIHRoZSBrZXJuZWwgc291cmNlcyB1c2luZyBvbmx5
IGEgc2luZ2xlIGNvcmUuCj4gSSB3b3VsZCBsaWtlIHRvIGF2b2lkIHBhdGNoaW5nIHNjcmlwdHMv
cGFja2FnZS9ta2RlYmlhbiB0byBlbmFibGUgbXVsdGktY29yZSBjb21waWxhdGlvbi4gQ291bGQg
eW91IGtpbmRseSBzdWdnZXN0IGFuIGFsdGVybmF0aXZlIHdheSB0byBhY3RpdmF0ZSBtdWx0aS1j
b3JlIGNvbXBpbGF0aW9uIG9uIHRoZSB0YXJnZXQgZGVwLXBrZz8gSSdtIHRyeWluZyB0byBhdm9p
ZCB3YXN0aW5nIHRpbWUgc2VhcmNoaW5nIGZvciBzb2x1dGlvbnMgdGhhdCBhcmVuJ3QgcHJhY3Rp
Y2FsLgo+Cj4gWW91ciByZWNvbW1lbmRhdGlvbiBjYXJyaWVzIHNpZ25pZmljYW50IHdlaWdodCBm
b3IgbWUuCgoKSW4gbXkgdGVzdGluZywgIm1ha2UgZGViLXBrZyAtajxOPiIgYnVpbGRzIHRoZSBr
ZXJuZWwgaW4gcGFyYWxsZWwuCgoKUGxlYXNlIHByb3ZpZGUgbWUgd2l0aCB0aGUgZXhhY3Qgc3Rl
cHMgdG8gcmVwcm9kdWNlIHRoZSBpc3N1ZS4KClBlcmhhcHMsIHlvdSBhbmQgSSBtaWdodCBiZSBk
b2luZyBzb21ldGhpbmcgZGlmZmVyZW50LgoKCgoKCgotLQpCZXN0IFJlZ2FyZHMKTWFzYWhpcm8g
WWFtYWRh

