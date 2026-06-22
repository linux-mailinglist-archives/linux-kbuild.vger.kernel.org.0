Return-Path: <linux-kbuild+bounces-13850-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SC4VNm45OWp1owcAu9opvQ
	(envelope-from <linux-kbuild+bounces-13850-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Jun 2026 15:32:30 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FF56AFE26
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Jun 2026 15:32:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=Nvidia.com header.s=selector2 header.b=nunsYx0B;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13850-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13850-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=nvidia.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A747E3013B92
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Jun 2026 13:31:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C4F53B7B84;
	Mon, 22 Jun 2026 13:31:04 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010069.outbound.protection.outlook.com [52.101.61.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430E23B6BF1;
	Mon, 22 Jun 2026 13:30:55 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782135063; cv=fail; b=h43aacMidLjnjDMlVQIAMNKJyacnAqChxnwRLzAFS7zMAWr0h1n3/tDqYfiqh7mldmXj2fwd0psmhLjRmVGt1hzKUixlAXwoWEoJ/HEFqTZQrQZXtvoNK9S8+ljSJQwGfj37GmDuAJqX2VuG7b9Ao2BPL/SMfdOUXh8MPA2nWgw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782135063; c=relaxed/simple;
	bh=8Bhk0IY1Xtbh/vOnVmvH/U09+wpTU0aN3eqnm1TMeQk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=fEfRcD+qkIJZjU8HYptwfSMtu8RZ+v/RaosXgN2IvOlBH6hSIbB5bqXu+BVMl9gec06zn8upPRonlAkGPT/bxl5Cn1Am9nW2tILEKnHihXbd0BMS/kOn6EC/y0vbJzlQwv5uSJn4/cmovGDwLnwqmUYpc7iA5ZPmowgT4lDenAU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nunsYx0B; arc=fail smtp.client-ip=52.101.61.69
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l7cnlU+sFdBj+Co9TZJftRq/qADdSXuCr3RbQAmYmfjHu56GWv+fBDL0FSvdQb73s/pTSRJSYAsIa0l57A0bK/ZWFpVroefZpWYzsw9yLTEJzjCDlN1FHTxEAUcIIgYBeE8iUrCQ68bLvHzyJ6sLfTGGpdlahDtj/IsW8T/9yFn+K9cA3Ar0FO2OkT6I4aHQCGt+8lbKqttJkanLyfj3QeUOEb7n3alFwX76TCGJ6EWjv4IGpmp4QYyupqU4A/qNGdew9Nq2znSrBRH+HFwT5GuM74luf3QkeQvhMtitX0WqOPPtMvSZpc7/NbhyaHTbK1EO2pjPpaXoOVpB2qvPpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wbLJrb/nBdixkJzSiw3kQ3nHwJNEnYMBjNlIFyNHnUI=;
 b=Lp2a/9wNVPwtn1dl+Oc1ns10m1M6TIqrhLgCvo78GIyjm1bYLBzTH9wVPXvSv4O4Laq2tM7srZ0TLjFpoiz1nIAbQSssAvLyYAFTJXPNx7KHWWGhmrVRh20Bh9iKKBsW7/+HHvFoclSM/t2rNYn6fpiNjFa10UyhyGewGt19pBIrEKC1sh7NJ8IlQCRuHpfBzXnHJyiDipGIUO4po1UMsmUsJ3kZ/B6W6z740Y/KVe89RV7u5b7qZHffJ+ukbUYq5ay27JSMNuxy0A+RE7nMrrJrcALL1NJODvVJxxyIGmBQYu2iQNediykkFdYmoTu2HPsa/lNp6PRlkoIeIij1rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wbLJrb/nBdixkJzSiw3kQ3nHwJNEnYMBjNlIFyNHnUI=;
 b=nunsYx0Br/Q2PT3LMl5ZiEvdgdcT0PQPKGriTzLLEzqEfnEMG8AZLhDUioXp8ga3lCkS2u1FL6chyx6tirshP+fAmmxuFpDZ+DQbY4jUJgUNV+D84ZrehV5viU5d1+0uwOzGoEl1P5+c0wMSLWkqK/vvFlHQvLTHhR8wTds03CQvSBF60VAPSxADKvkFSdJgfzS3KKU5VstVr56BkG8PhRW7DKVCWIYBBfqVabhblmQOGXr4+i7zyM/9kHYr9nGNP6AGx4tS1O8dTPErL/wRv0uBJOqLrBlGMYE2eDtI4nMkbXXjecamw32Dzlt+rW8pwb4IF0pqbC9FfXe/C8iroQ==
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS2PR12MB9774.namprd12.prod.outlook.com (2603:10b6:8:270::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Mon, 22 Jun
 2026 13:30:42 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 13:30:42 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 22 Jun 2026 22:30:08 +0900
Subject: [PATCH v5 2/5] gpu: nova-core: export Rust symbols for nova-drm
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-nova-exports-v5-2-6191773fc977@nvidia.com>
References: <20260622-nova-exports-v5-0-6191773fc977@nvidia.com>
In-Reply-To: <20260622-nova-exports-v5-0-6191773fc977@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Zhi Wang <zhiw@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nova-gpu@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TY4P286CA0131.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37f::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS2PR12MB9774:EE_
X-MS-Office365-Filtering-Correlation-Id: b6204b1b-e3bc-4ef5-ece8-08ded06274e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|10070799003|376014|366016|1800799024|921020|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	NnEoyzBQYNNbaTzRHtgfONTgg0HrfLbJMT3SwRuC9vCD++Iz9nCmudIY4NVFVGes41x2A0xnUnedDoi0Do+p3N40zIzAwVa70upmMzOMTsp1qrQptr3KSMFEof57LcvDMfI4cPX1vv+djlFxAUHZEhj967s43WkPcE+QfxYHplL80ryf69pUEu7f+Ub0zBz5tWN9W2mxJ5/9VlqPXDbGVLGuBp6nUC8oWD4AaNbzUpVWJeODAx0fqYWcwP+PTxoJhpbJ6dXa911smX+gWdQaHESFCjkARsc+ENIoo+5zYbGnYMFL6AYXA0+ImDCavl5PJb26Mg5u+3Pyc7G+BcGT24E1oF1H62v4/9Ku7VdjP0AOjNuhf1uDLHzRMpWCpUgCwlhn/r5M6HcoqK3D7Mr8n2wHDfmNdBkjADzEF2iVf5cDjfXMhQRMgxktByfcP29ZhFOeSMrBiv96WsElpSuR2ejP5hAWKD6Ns4GaAGuSx/oalP/1fST+xJVdTJFam5H4BRAn6QwNNKF3x6xrVoYNtjYEwIRJK1WJWNy2joAh8bZq7A2y4dQC9vj++04bqhEwmuIC3o5zKmQwOQNpSN/b/y6tog9oySjhacw+5oLRrE2RETPNe5kuFL1SrWaAWnki+6H4l2BaFcfL+6dh5Ut69TBLJFGl/oscEmHoBExq4e+MzYLfs5CGYbc5f0X5vdRoqtF2h8nNgTLC0BNQS9Ig8Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(10070799003)(376014)(366016)(1800799024)(921020)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YWZvK1hpMU1jY0UzT2ttZjJwZnprSmZxdjZLaiticktJU0FpRTQ4d1lQajV5?=
 =?utf-8?B?ems5MGt1UEErRVhEZHM5dkxaMHl6OWhVSm92ZVhzT1RlOXlpNXdOMnhCQkRu?=
 =?utf-8?B?YUdSajRuVytFSGFhVUJyQS9ZY2x3ME1Rck9yYWFFTk9wM013UUtFNmZQUmlE?=
 =?utf-8?B?MFVndUt5dDVmalozVk80Z3R4QXhMY0ozbWI2WVhDcnJVaWlIUjNGOG50cmdC?=
 =?utf-8?B?YUhTNHFNQ0xIeUNINWI0LzZON0phdkhJT1Ntd1EvdDVSSitzN1JTTFJoWXhI?=
 =?utf-8?B?TE5EMWVZS2ZLMGgwNk5UMHpPUkovb2Q3akJ6T3ZZbFNPd1lxS1M3cUxiVC9P?=
 =?utf-8?B?SGxrZXp5eFp1YVgraGtLbzljOW02WVZWbVg0K3Q3QlhpYmxnQy9lNGdiSElZ?=
 =?utf-8?B?RjlKWlZ5MHRzZDBvMDViS1NaL205M1kvN3BZSlVNbnhia0UyRXNDUU5LcGd1?=
 =?utf-8?B?V2tFWS9YRVU1bDhmbDNPaENXcTJNS1ZvaTV3NDFCOGE1a3pzcVVIN1VabEQv?=
 =?utf-8?B?b0VpN0h1ek5XeVRoUXBOajFhNFN2T0UwOGc5L2ZDWWNXQThvSy8xSk5TeVVK?=
 =?utf-8?B?NW1IOGNDTU0rbzF6ODNDZzZ6Sk5oMnFOSmFCbTltdFN2TXdXa2drR2ZzN3dm?=
 =?utf-8?B?VkY3c0ZXd1ZxaWVnRGdEbFRwMjRjbnRhQzlzS3hUa2o3WUFxd3Z5TW8zcUt4?=
 =?utf-8?B?M3oreDJERVoyUEMyMEF6MDBtdVlUYjk5RmNPNk5CQkpYaENHaWY5cm9NZzF1?=
 =?utf-8?B?VVRFQ20yY3dGYVl2Qlh1STdFM0NYdFJGVEtoclJzaURsNU9KY0RWcytNc1o2?=
 =?utf-8?B?NUo3NmR5Nk1mOEROQ0liaTBib0JsaWlEWFczQW5MM3ZiUmJldkRzZ0s0STVP?=
 =?utf-8?B?VXUxbE5aMU1jcVlGSSs0cUlpaWNQdFR4YlVYU2FISDR6MDNNNGxFY3lCM3hQ?=
 =?utf-8?B?cXpNSEFpNHhSaUx0MTdSWDdaSmhxaEtaTWFySXM2MDN6TmZ2elFGUWJURC9X?=
 =?utf-8?B?THJObUxVN2ZQbitvVjhvaml5QUk0V2JjZmx6TEIrZXR0aUt5eXBDTFVEWGw3?=
 =?utf-8?B?bXpONUtLOU41dGFHQXRaU2tLTWtucnJ2NEVmMTNTREFxZWRyNmluSDJQalJ2?=
 =?utf-8?B?U3JMcjNUQXIyUUo2WDdwY084VVhyUmxDeDZETUZzdHpJZm5pRWU3bGF2V0FE?=
 =?utf-8?B?VDJOVWhGSzNuU1dPaHpvZTN6UitCSm4xOFJ5UEpIcEpjdUJsOTNoRis0a3hB?=
 =?utf-8?B?dHY0WXFqNFdFZTJ2Vm9LU1ZTMWdZaGpucTQ2N0RtK1dwR0ZmRUxsM25xenJO?=
 =?utf-8?B?QWVieFEyL1J1SzBad2NIaFhKdGlycTBtVEhuaWtVcUFZYzlIeEdZMGdWNkRs?=
 =?utf-8?B?K1NuTnJKbzVIa0dXK2IzQ1l3QjhmUHJYc3dEall6b29DcVJzb1M4VTA3WGhQ?=
 =?utf-8?B?QWo1dWJ3NFh5azJhWjhYZzlDNm5tRVVzRm5qdUlmVVFVSnpKTTdMa1lHc04r?=
 =?utf-8?B?bktncGFjd295NlZiRmZocW0vWTFSZ1c5SWxHMnFUak9MOXNscGtlVkx3cGNi?=
 =?utf-8?B?bFVwSExDOTcraHVRVEh5MlZDTm1DT09SeFpMbEF3WDJPbnl3RUo3QmFMTXpa?=
 =?utf-8?B?RHIwMTdKdDdpRWx1RVBDc0dZWlpUcXRzU1dZbW54Y0c0dXF3L1dVUklKTEYz?=
 =?utf-8?B?RFBuNWNTQ015NXVnclZOOWdGa1l4Q2RNaTZsdk5wQ2Vpei8yaC91OGZYS2xN?=
 =?utf-8?B?ZDRFUlBKV09Kd2ZpRWtDWEpTWjZHdnpVZm9OMVBkWGdmcVRYWDR1aUlQSWNU?=
 =?utf-8?B?MzhqcXZaMHJwMWx4c1g2OUd3d3E0Ym95NnFncStJM1U0NE0xZEFWSFFGdXRZ?=
 =?utf-8?B?S29LRjRPOTdJV2c4TldYS01helNTaCtsY21hVDFrazlMVlFFck5uZTdqMG5Q?=
 =?utf-8?B?RnA5ak1mYkZCbVJsbnN1TzNVNzhHQXNOMTIrQWM2RDg1STJNZTU3RTBMc1hz?=
 =?utf-8?B?MWpuWGJJcDVnZ1JwdVFNL3ZwWWRJcVY5b0IrU1d2eG5xS1lBaEVoRTFKSU1q?=
 =?utf-8?B?Y3QzTE9UcGRQd3RVNFJuM3JOTDhmY1NWNTlYZmU1SnMwU04wazJZWXVBQ3ps?=
 =?utf-8?B?bDU2MzRLZkFFNUw2MjI0ZU5BaHdUUDVOZzEwWmRIeVRBWGtUT2lBb0ZjWlAw?=
 =?utf-8?B?aUhNRmtJUEJwVWVZeVI4UEdMeFgxdUxMeTBYZFRJRUFKaUQ1MjhXNFdzTXg4?=
 =?utf-8?B?R3lLQzdrSWcwMHNsN0FCN2FBZ1hpSW9MR0hRNXdoWmlPVVN3Q2Y2VEM3VUdt?=
 =?utf-8?B?NVhKN1NORXRIWWwyUnRQVlJyb0FPRW1WampLanVacWpuVEpSSFR6QWRySzFk?=
 =?utf-8?Q?IEXLw1xgXowzdrBBH/yZsD1Hcc8ZhYjnpMPeQkAUBcTUb?=
X-MS-Exchange-AntiSpam-MessageData-1: fn4tcqVHOQSWGw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6204b1b-e3bc-4ef5-ece8-08ded06274e2
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 13:30:42.1476
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SEzuBWHuqSiwQ0hM7mgnHcxCknrEM/WT9wJea6sRNoMZQlh2tK0V/i2fS/7Lz52hqzg0p0kjAJcfcQOUbUE4Ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9774
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.16 / 15.00];
	WHITELIST_DMARC(-7.00)[nvidia.com:D:+];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-13850-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,ffwll.ch,linux.intel.com];
	FORGED_RECIPIENTS(0.00)[m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:jhubbard@nvidia.com,m:apopple@nvidia.com,m:ttabi@nvidia.com,m:zhiw@nvidia.com,m:ecourtney@nvidia.com,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:nova-gpu@lists.linux.dev,m:dri-devel@lists.freedesktop.org,m:acourbot@nvidia.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[acourbot@nvidia.com,linux-kbuild@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:email,nvidia.com:mid,nvidia.com:from_mime,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 73FF56AFE26

Export nova-core's Rust symbols so nova-drm can resolve references to it
when loaded as a module.

This is done by generating declarations and EXPORT_SYMBOL_RUST_GPL()
calls for Rust symbols referenced by nova-drm, and compiling them into
the module as `nova_core_exports.o`.

`nova_core_exports.o` declares every Rust symbol as `extern int`.
Running `gendwarfksyms` on it would compute CRCs from those placeholder
types instead of the real Rust ones, so make MODVERSIONS use this shim
only for the export list, and derive CRCs from `nova_core.o`.

This patch is intended to be a workaround until the build system
supports Rust cross-crate dependencies natively.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/Makefile                      | 40 ++++++++++++++++++++++++++++++-
 drivers/gpu/nova-core/.gitignore          |  1 +
 drivers/gpu/nova-core/nova_core_exports.c | 15 ++++++++++++
 3 files changed, 55 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/Makefile b/drivers/gpu/Makefile
index 45e0941324fb..67d51b7f3f55 100644
--- a/drivers/gpu/Makefile
+++ b/drivers/gpu/Makefile
@@ -14,7 +14,45 @@ obj-$(CONFIG_TRACE_GPU_MEM)		+= trace/
 # system supports cross-crate dependencies natively.
 
 obj-$(CONFIG_NOVA_CORE) += nova-core.o
-nova-core-y := nova-core/nova_core.o
+nova-core-y := nova-core/nova_core.o nova-core/nova_core_exports.o
 
 obj-$(CONFIG_DRM_NOVA) += nova-drm.o
 nova-drm-y := drm/nova/nova.o
+
+# Export Rust symbols from nova-core only if nova-drm actually references them.
+nova-core-export-deps := $(if $(CONFIG_DRM_NOVA),$(obj)/drm/nova/nova.o)
+
+rust_needed_exports = \
+	{ $(if $(strip $(2)),$(NM) -u $(2);,) echo "__DEFINED_RUST_SYMBOLS__"; \
+	  $(NM) -p --defined-only $(1); } | \
+	awk -v fmt='$(3)' ' \
+		/^__DEFINED_RUST_SYMBOLS__$$/ { defs = 1; next } \
+		!defs { if ($$NF ~ /^_R/) needed[$$NF] = 1; next } \
+		defs && $$2 ~ /(T|R|D|B)/ && $$3 ~ /^_R/ && \
+			$$3 !~ /_(init|cleanup)_module$$/ && \
+			$$3 !~ /__(pfx|cfi|odr_asan)/ && \
+			$$3 in needed { printf fmt, $$3 } \
+	'
+
+quiet_cmd_exports = EXPORTS $@
+      cmd_exports = \
+	$(call rust_needed_exports,$<,$(nova-core-export-deps),EXPORT_SYMBOL_RUST_GPL(%s);\n) > $@
+
+$(obj)/nova-core/exports_nova_core_generated.h: $(obj)/nova-core/nova_core.o $(nova-core-export-deps) FORCE
+	$(call if_changed,exports)
+
+targets += nova-core/exports_nova_core_generated.h
+
+$(obj)/nova-core/nova_core_exports.o: $(obj)/nova-core/exports_nova_core_generated.h
+CFLAGS_nova-core/nova_core_exports.o := -I $(objtree)/$(obj)/nova-core
+
+ifdef CONFIG_MODVERSIONS
+# The C export shim declares Rust symbols as `extern int`, so reuse its export
+# list but generate symbol CRCs from the Rust object instead of the shim's DWARF.
+$(obj)/nova-core/nova_core_exports.o: private cmd_gensymtypes_c = \
+	$(call getexportsymbols,\1) | \
+	$(objtree)/scripts/gendwarfksyms/gendwarfksyms \
+		$(if $(KBUILD_GENDWARFKSYMS_STABLE), --stable) \
+		$(if $(KBUILD_SYMTYPES), --symtypes $(@:.o=.symtypes),) \
+		$(obj)/nova-core/nova_core.o
+endif
diff --git a/drivers/gpu/nova-core/.gitignore b/drivers/gpu/nova-core/.gitignore
new file mode 100644
index 000000000000..7cc8318c76b1
--- /dev/null
+++ b/drivers/gpu/nova-core/.gitignore
@@ -0,0 +1 @@
+exports_nova_core_generated.h
diff --git a/drivers/gpu/nova-core/nova_core_exports.c b/drivers/gpu/nova-core/nova_core_exports.c
new file mode 100644
index 000000000000..6e80ca9792ee
--- /dev/null
+++ b/drivers/gpu/nova-core/nova_core_exports.c
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+/*
+ * Exports Rust symbols from the `nova_core` crate for use by dependent modules.
+ *
+ * This is a workaround until the build system supports Rust cross-module
+ * dependencies natively.
+ */
+
+#include <linux/export.h>
+
+#define EXPORT_SYMBOL_RUST_GPL(sym) extern int sym; EXPORT_SYMBOL_GPL(sym)
+
+#include "exports_nova_core_generated.h"

-- 
2.54.0


