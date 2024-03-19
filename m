Return-Path: <linux-kbuild+bounces-1264-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5622188081C
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Mar 2024 00:20:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A21DCB20D74
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Mar 2024 23:20:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D60C2381AC;
	Tue, 19 Mar 2024 23:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cisco.com header.i=@cisco.com header.b="fEEClANC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951C6364D4
	for <linux-kbuild@vger.kernel.org>; Tue, 19 Mar 2024 23:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=173.37.86.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710890405; cv=fail; b=O5Xv+VNCGweODL8peQV4//X66gqh0hiCya1yfA/YzTgpJQousnwSSPm/kv6xBGK7Edg39XG1y8iFVvg8q0+BJOsIOghlA2xUVvbnlJkEMZHjuzAM3s5vNnKxOLhplzn8PeQofEmNCAkBKLtcKal8F+H6gB3DMfDGA6huZA13aRw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710890405; c=relaxed/simple;
	bh=zIMXk42HN99zR2msWqzC/xSk9A0aduuQTJmlKiVYZkA=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=tHAVoERMG673QWmrb2a1yJZz4kHmsjhXY7s+K8qQqoZ7dEVxnCb2j4BxsmcJKB2EdF75+BiaYpAUT2RBVIMBO0hqheNdXyrn7r95MFyZ7m9FmuROFsLsNBTDkKcoMBOt+t6c/xI27nfWYOeyIlPz/lExravK0S4Mm+bcjcZg6yo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cisco.com; spf=pass smtp.mailfrom=cisco.com; dkim=pass (1024-bit key) header.d=cisco.com header.i=@cisco.com header.b=fEEClANC; arc=fail smtp.client-ip=173.37.86.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cisco.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cisco.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=503; q=dns/txt; s=iport;
  t=1710890403; x=1712100003;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=zIMXk42HN99zR2msWqzC/xSk9A0aduuQTJmlKiVYZkA=;
  b=fEEClANCHUJtPyweXKjJ+3E42WQhEp1suV7ksCr39Gb7MJy1awrwKx9C
   DfVETpuYlJ8WX32fMXTAHkFyPefTr8w7kCpmzsmf1AZ/5J3JQBjPsntf/
   3Ga09Ie1gkrQ6AMfPRiyHh8oSN77QjS6cqz6IO7dVyAt6mJIsHPkEINbA
   8=;
X-CSE-ConnectionGUID: K21PEUeOSimJFVo2hPuAkw==
X-CSE-MsgGUID: fPPTJqq3QOi5RZ6V1NUXoQ==
X-IPAS-Result: =?us-ascii?q?A0C/AQBlHPplmJNdJa1agQklgSqBZ1J6AoEFEkiIIQOFL?=
 =?us-ascii?q?Y5ojEsciyaBfg8BAQENAQE9BwQBAYUGiAQCJjUIDgECBAEBAQEDAgMBAQEBA?=
 =?us-ascii?q?QEBAQYBAQUBAQECAQcFFAEBAQEBAQEBHhkFEA4nhWwNhlEWKD8SAT4gIScED?=
 =?us-ascii?q?ieCXgGCXwMBEKFNAYFAAoooeIE0gQGCFgWyewYYgTCIJgGKMScbgUlEh0cXB?=
 =?us-ascii?q?BiICQSFTp58gVMcA4EFaxsQHjcREBMNAwhuHQIxOgMFAwQyChIMCx8FEkIDQ?=
 =?us-ascii?q?wZJCwMCGgUDAwSBLgUNGgIQLCYDAxJJAhAUAxsdAwMGAwoxMIEWDFADZB8yC?=
 =?us-ascii?q?TwPDBoCLw0kIwIsSgoQAhYDHRowEQkLJgMqBjYCEgwGBgZdIBYJBCUDCAQDU?=
 =?us-ascii?q?gMgchEDBBoECwc6PoM/BBNHgUSHXYJFg0IqgXeBEYIWA0QdQAN4PTUUGwYip?=
 =?us-ascii?q?AoBhBqBDAxTxjsKhBKMC5V9g1+mPZhfjXCaZAIEAgQFAg4BAQaBZQE4gVtwF?=
 =?us-ascii?q?YMjURkPjjmIdYplegkwAgcLAQEDCYpoAQE?=
IronPort-PHdr: A9a23:PCNPwx+isfQ2bv9uWOnoyV9kXcBvk6//MghQ7YIolPcSNK+i5J/le
 kfY4KYlgFzIWNDD4ulfw6rNsq/mUHAd+5vJrn0YcZJNWhNEwcUblgAtGoiEXGXwLeXhaGoxG
 8ERHER98SSDOFNOUN37e0WUp3Sz6TAIHRCqOQNzJ+nxBYf6hMWs3Of08JrWME1EgTOnauZqJ
 Q6t5UXJ49Mbg4ZpNu49ywCcpHxOdqUeyTZjJEmYmFD34cLYwQ==
IronPort-Data: A9a23:HnDclqyzSDUl8UKDtYF6t+c4xirEfRIJ4+MujC+fZmUNrF6WrkVSm
 GVJCGiAPvveYGT3Ldkkb4yx9UIOvJGExoBqTFA4rFhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlpCCea/lH0auSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 YyaT/H3Ygf/h2YvazNMsMpvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE88jmSH
 rurIBmRpws1zj91Yj+Xuu+Tnn4iHtY+CTOzZk9+AMBOtPTtShsaic7XPNJEAateZq7gc9pZk
 L2hvrToIesl0zGldOk1C3Fl/y9C0aJu2+WeGVWCvOuozkjkXUXrmfVWEWg1IthNkgp3KTkmG
 f0wMjsBaFWIgPi7heviDOJtnc8kasLsOevzuFk5kmqfVqlgEMuFGvmVjTNb9G9YasRmEf/YZ
 scddjNHZxXbaBoJMVASYH47tL3w3SakLm0A8Tp5o4I521Dv7hVoi4HKMYfvSIK0HONorkGh8
 zeuE2PRWUxCa4fFllJp6EmEgu7JgDO+W4gPFbm03uBljUfVxWEJDhASE1yhrpGEZlWWQdlTL
 Qkf/TAj6PFrskeqVdL6GRa/pRZooyLwRfJzSbQCxTyA7ZHV5iS3OG9eTgZcQd854ZpeqSMR6
 neFmNbgBDpKubKTSG6A+rr8kd9UEXZPRYPlTXFeJTbp8+XeTJcPYgUjp+uP/YavhdHzXDr32
 T3P9XF4jLQIhslN3KK+lbwmv95OjsaUJuLWzlyLNo5A0u+fTNX4D2BPwQOGhcus1K7DEjG8U
 IEswqByFtwmA5CXjzCqS+4QBryv7PvtGGSD2AY/QMJ5qGj1py7LkWVsDNdWeRcB3iEsJG+BX
 aMvkV85CGJ7ZSL1PfEtP+pd9ex1k/CI+SvZugD8NYcWPcMrK2drDQllZFWb2Cj2gVMwnKQkc
 ZadeoDEMJrpIfoP8dZCfM9EieVD7nlnnQv7HMmrpzz5iuD2TCDOFt843K6mM7pRAFWs+luFq
 r6y9qKiln1ibQEJSnCMod5OfA9UdChT6FKfg5U/S9Nv6zFOQQkJI/TQ2rgmPYdimsxoei3gp
 xlRhmcwJILDuED6
IronPort-HdrOrdr: A9a23:PCnikqB9Tdsi6JTlHejssseALOsnbusQ8zAXPh9KOH9om52j9/
 xGws576fatskdsZJhBo7y90KnpewK7yXbsibNhcYtKLzOWx1dAS7sSorcKogeQVhEWmdQtr5
 uIH5IObOEYbmIKw/oSgjPIburIqePvmMvH9IWuqkuFJjsaEp2Imj0JcTpzZXcGPDWua6BJc6
 Z0z/A31gaISDA8VOj+LH8DWOTIut3Mk7zbQTNuPXQawTjLpwmFrJrhHTal/jp2aV5yKLEZnl
 Ttokjc3OGOovu7whjT2yv49JJNgubszdNFGYilltUVAi+EsHfpWK1RH5m5+BwlquCm71gn1P
 PWpQ07Ash143TNOkmovBrW3RX62jpG0Q6g9bbYuwqgnSXKfkN/NyNzv/MfTvIf0TtngDhI6t
 MP44tejesPMfqPplWk2zGCbWAVqqP9mwtTrQdUtQ0fbWPbA4Uh97D2OyhuYcw9NTO/54Y9HO
 Z0CsbAoP5QbFOBdnjc+nJi2dq2Qx0Ib1+7q2U5y7qoOgJt7TlE5lpdwNZakmYL9Zo7RZUB7+
 PYMr5wnLULSsMNd6pyCOoIXMPyUwX2MFjxGXPXJU6iGLAMOnrLpZKy6LIp5PuycJhNyJcpgp
 zOXF5RqGZ3cUPzDs+F2oFN73n2MS6AdCWoztsb64lyu7X6SrauOSqfSEo2m8/luPkbCt2zYY
 fFBHuXOY6WEYLDI/c94+SlYeggFZA3arxmhuoG
X-Talos-CUID: 9a23:6UpeomEcgceye8LnqmJErhcsN/0oVUbcyVX+HUjiCV50Yb6KHAo=
X-Talos-MUID: 9a23:GPaMLgoXHAycObRboL4ezz9aDPtK+r31MWcMzK805ffdExFAPA7I2Q==
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-core-11.cisco.com ([173.37.93.147])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 23:18:53 +0000
Received: from rcdn-opgw-4.cisco.com (rcdn-opgw-4.cisco.com [72.163.7.165])
	by rcdn-core-11.cisco.com (8.15.2/8.15.2) with ESMTPS id 42JNIruI027298
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linux-kbuild@vger.kernel.org>; Tue, 19 Mar 2024 23:18:53 GMT
X-CSE-ConnectionGUID: U9nl+rU/S2uoVtf4qgNXYA==
X-CSE-MsgGUID: bn+YKJUnTYG6VxJeporgTg==
Authentication-Results: rcdn-opgw-4.cisco.com; dkim=pass (signature verified) header.i=@cisco.com; spf=Pass smtp.mailfrom=danielwa@cisco.com; dmarc=pass (p=reject dis=none) d=cisco.com
X-IronPort-AV: E=Sophos;i="6.07,138,1708387200"; 
   d="scan'208";a="30993803"
Received: from mail-dm3nam02lp2040.outbound.protection.outlook.com (HELO NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.40])
  by rcdn-opgw-4.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 23:18:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T9wTqRCzF7hhikf5SWXCQ6FvRK4nXwFD8yCI1t25kRoU5fD5ikm97c+Vrpthhf0AamVKRNHlPEUCJMDkpv8JVMRSp0n78dXYqDdWNLIZXKeOVeUoJ6alwTFUlG23D6P4BHVqx11Uky6+uqjXiEtdOeWRE5pOIxOV3rzveYtQvZVAefe7xmtcQkud4caCCQXIrILP6szIBOhrnnKXM4E6rL+Jr3lmw3gX6UMjz6Bp0d7u+zCjWFs+7Bt3vlTkeV1S1WgHwd1XsYzislH0Q9Lg5ChfBuy70WKdmZFwDraRQ5ShCUs3Rx/Z0RzJii51vzv+K/jovNB737HCxtSrDab8NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zIMXk42HN99zR2msWqzC/xSk9A0aduuQTJmlKiVYZkA=;
 b=Fr1oCbltflnIvgVk4h9Ect7y3h/QCsX5QaYvCyZnR8ZFtX5IEQ1FqrILIBBo40nyTZfeKLUJYN2MD36Ue0QkqunUSSG+0MlwsxjlPqwfUrIZwwdN1wDvGadD/mlcnFR8NQ7bFfZn1iYQWRDb1nPyfWDmrKl1OFg0NxJ5roytWMXFUQuyoZKifw/2E5AR4kR7fUVvWsWY3rBqUE4rseg4g52gtaHkCy5hJwSRZcxAikdpGGqnFJXK8JtdrUqQ444MUP/sEAKuYve61mV83/SS0nM/85XO/JNguWg2q8dYb6Snuthv/Qe8Q9w5OfLheNA3t7xAdVp+kSELnjIlpYEIsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from SJ0PR11MB5790.namprd11.prod.outlook.com (2603:10b6:a03:422::15)
 by SJ0PR11MB4847.namprd11.prod.outlook.com (2603:10b6:a03:2d9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.12; Tue, 19 Mar
 2024 23:18:51 +0000
Received: from SJ0PR11MB5790.namprd11.prod.outlook.com
 ([fe80::22f4:4617:117:7a44]) by SJ0PR11MB5790.namprd11.prod.outlook.com
 ([fe80::22f4:4617:117:7a44%6]) with mapi id 15.20.7409.010; Tue, 19 Mar 2024
 23:18:51 +0000
From: "Daniel Walker (danielwa)" <danielwa@cisco.com>
To: Masahiro Yamada <masahiroy@kernel.org>
CC: Jing Leng <jleng@ambarella.com>,
        "Valerii Chernous -X (vchernou -
 GLOBALLOGIC INC at Cisco)" <vchernou@cisco.com>,
        "xe-linux-external(mailer
 list)" <xe-linux-external@cisco.com>,
        "linux-kbuild@vger.kernel.org"
	<linux-kbuild@vger.kernel.org>
Subject: M= modules build w/ objects in different directory
Thread-Topic: M= modules build w/ objects in different directory
Thread-Index: AQHaelPNOgMSgTyKB0G/hZjqvxRe4g==
Date: Tue, 19 Mar 2024 23:18:51 +0000
Message-ID: <ZfodWv+E6Ekqr7fl@goliath>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5790:EE_|SJ0PR11MB4847:EE_
x-ms-office365-filtering-correlation-id: f0e41889-a261-474d-7538-08dc486af024
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 xNsdTPpU9FYYGo5J+Bqx6Hid9j/010EjKevOP9Cxi4xWJ6LQ/hoiOBUM6zgYvktvxFwplA1gLK8H6O/h0ljMYso94z133qhEIEoRWHXwqUK3F2wJIDvmhH0N2OXjaU1YOrVBo8pZjUxQwMc0ajWKddUSq+2TWVaEI/0on83azE2v4Q5DZbm5TDBw0RoG+6CtkLx2g7aOIV/lin2T3QRz7NL8sqp7ptur4dxaAQ5j4yRIg81vHFfB/jhO48HlMo3kD37duEWX3zBFearpr+oQRkvuCo3ytRTECinltVI50fD6rjcSuhlDOJhRMc77mjzx59bZhQF+5Vxs2r+JzWZWEaR2Dwn3/7dEyH/fwVirfsS3P6Z+HgR4PtagcOZlAOM4At6v+CIIFTUHzKOIQ/5twP67XUpH3UXc16KdIDBBAumm61HiY96amv1X27ZhYcoP8q7K+H8KVD3MuFyMzPDFK0+Xq/eK+71xIM/06v5vnU80wPSmi2c51PGfgOHOyahZIv/yNRlyL5OaCdBNZ9B+z9QOTqcYkUCxNVhrmhti224GyKWm8abkpQn6A2K4v9vS1k7IdcODsOoIo+jFI7f0YGQDzJe3oHZOkxh09PV/UKuiHov/Zb8tJ0xEHqHRHxrXXqfuAHTZsXhSn+mmVCUbOw3lopfFSmgWFom/O5zECqk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5790.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?2TIEJH/7sfoebyPFTVsYHurw5k5RcTbJHR9E7f8fMLBEWW7OMWLgNs7ku4dH?=
 =?us-ascii?Q?C2KxcW1pNVuc/oAelMwVSnn7ztdyFU/QJ2ctrEspS/LpcQZ2AIsTUIshMTEy?=
 =?us-ascii?Q?6KIs6eKmEYVMF1o6XvZW6YFAEAyPUic09aBAvFTmef8myZVe9SdPEk3dhraV?=
 =?us-ascii?Q?CdcXq/slb2tJXXl4ZmRF7hSJxOS6Bch6CKEqYsKZUfya75HKzGuyOV35IPvZ?=
 =?us-ascii?Q?239C8CQXioyTpep3bmitYp01rS/i9RNqiAsdG9gW2AzyAHtFFIhKr9IgQHfx?=
 =?us-ascii?Q?H5oCWS/BUFHuoeS2CVIwfvkiZhHihN0xNNkGufr8tSm3W++RBocYJ5fqA825?=
 =?us-ascii?Q?nnVYTCBOGIL7hwxFGjSp6j/z4oIj/2KIo4Mh6ETWPPZ2hojHxiIKwz4m//xC?=
 =?us-ascii?Q?1o+qWSQoWTNeFrvkFNTin1TmDk0uVAC685tHCAo/BcRKAqj4zW+iE4nJqN9C?=
 =?us-ascii?Q?EtyA+C04DnRNLxWFfzPvR0qqlDU2dot5j6SlUxyqWH4WSNBUIBiDrlCp9wy5?=
 =?us-ascii?Q?7znB+OLGEJCG3p21bZiA6FbiBmz/uhShxf/mHPgQUnntd+KS6CtZIHrpdspb?=
 =?us-ascii?Q?w70CvK0bFR13HqM1AAOFuDSfuxKnFpK1jgcWxm2OkTwmtk+0edYCR5sue7Wd?=
 =?us-ascii?Q?6FO3WRcXgrO4BR9ucuqTuFqYGhqbi7Hw1IxL0eT0QvsfdXK1u65xjc34JMmL?=
 =?us-ascii?Q?fI231z4Z9TPaAnS4swXrhsqbOC0FbX1pg+mB+aPtq3jAt46aedVQ3ALMwcPq?=
 =?us-ascii?Q?D9Uq1b+0Zal6mIpfcwVJWD3clvpbKdrIaJ38NmdT9noMQRYHzM2org8RsN5X?=
 =?us-ascii?Q?gMX4vKCiD0p/0KTzWV2D+YGsytCYnt5uTygtOZZrwzbdEj6NUmsjEm7cUVI8?=
 =?us-ascii?Q?gvUSaw5mHKwEg7cWN8lBrNp5/iFJdRGDdVZBgo2X+IGcVWISFOSu82+Pbkcr?=
 =?us-ascii?Q?gC+Hntk5a4zgJU78ruqTeVK3Ak2QGK7IHM5x+yYHQWmNhisGbmzUdHikg4Jx?=
 =?us-ascii?Q?0eEuT63tD1iCDJsuO3eVk2su/GeuDuNcHo4HOdF3raWaaU8ZCVCXTBMayIPZ?=
 =?us-ascii?Q?LvmbMF7LWQiuOAOt+pffRUZYLRPBrXYaGEb6IiScOyF+KG/YYn2fbdhuYJeR?=
 =?us-ascii?Q?PBFhbQDZfLxWs7QLKSDxniA+xMIY58XSwpQMsYbbpHC5sFJxBcgAMpYB5sCq?=
 =?us-ascii?Q?vBGQJFBpS8s6FhyhJ3Dhvisk+3rE9e9V9VTNIw7TUxyMJBk322SwFELr1aMw?=
 =?us-ascii?Q?9XDLDVXPNJ7GoyHVu940L9Gke6uT/Y0QocC46L1cob/FJlK4oVsnI4VB//Rj?=
 =?us-ascii?Q?2McfCfHcB7tKf43gaW6fpmT6/FF8WUc3v2BNE11Xjp6vQ7bOf7WuNE0nKjrD?=
 =?us-ascii?Q?zG2UDBSGFflGn/Ige95L4GcZgUCZn3d3v7FRjxuVidI/LWsXgVNYTDkPH1yz?=
 =?us-ascii?Q?d//u1OpDRDd3ixzX4BnfH3Y72g5/FMADSecv/vc1F6KiUObiD6sr6aZGQU/+?=
 =?us-ascii?Q?WbBOBng02Pi5frjZx2DEb1krmWknaMhaSLOlrJGM+LZ1xjPwga8hZu2SeX7D?=
 =?us-ascii?Q?rJvgSDDuNmM3GKGFQMCm+03CEkNaUtpv1PhlQTVX?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <449DD9B882D6674BA7E5B8F7661ACF47@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5790.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0e41889-a261-474d-7538-08dc486af024
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2024 23:18:51.2129
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O7EgIv+zWAXujRNVyPrNoWTl67sDFulYDay3jvwPTvJFiJDZqUDk9yyHnIMpyNlZ3JsMSdEtd4B+e1LpKpuLaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4847
X-Outbound-SMTP-Client: 72.163.7.165, rcdn-opgw-4.cisco.com
X-Outbound-Node: rcdn-core-11.cisco.com


Masahiro,

I found this commit,

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3D23a0cb8e3225122496bfa79172005c587c2d64bf

It had this note,

[masahiro: I do not think "M=3D$(OUT_DIR) src=3D$(PWD)" is the official way=
,
but this patch is a nice clean up anyway.]

Is there an official way or recommended way to build objects in a directory
outside the external modules source directory and outside the original kern=
el
source directory ?

Daniel

