Return-Path: <linux-kbuild+bounces-1369-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BD688EB78
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Mar 2024 17:41:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91F031C2277D
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Mar 2024 16:41:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E4F414C599;
	Wed, 27 Mar 2024 16:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cisco.com header.i=@cisco.com header.b="OL3Z+s/5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A665E149DFA
	for <linux-kbuild@vger.kernel.org>; Wed, 27 Mar 2024 16:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=173.37.142.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711557704; cv=fail; b=G8NtHjDs3na34iOAZ6UjfpnLdDC7CkiZk6qAYm3xw1DDGsl19mqB76RG5c+t82TIp8v0o/orA7dC4DCsTi3Vswq1ryuDt1xDzmCAMEJ7VpktsPLKEMk8qY8NvH7cjs8OWUCleNahK6QixM31IH0Bj0e/Kubkxv65dxXn2l2LvuM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711557704; c=relaxed/simple;
	bh=PbztVePmELKqGE8PcvB9byNVuJvcZAsXOfiZotDbIO8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tCbdZXY/ItTC31vOyJ/D+3gW376QuXRjbubQtCfsBV/BIsarKUGUOYY6dpQfZLMr60VjS4p7CgL0gKykWTvfaVL74pmaDg/pQoT+pDRrWuv4qjU+mWtrZBIov0U3ODShQyvxquj19D4DyfA45oymkgg8HDOaAa9Lq9ymWu4xlec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cisco.com; spf=pass smtp.mailfrom=cisco.com; dkim=pass (1024-bit key) header.d=cisco.com header.i=@cisco.com header.b=OL3Z+s/5; arc=fail smtp.client-ip=173.37.142.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cisco.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cisco.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2222; q=dns/txt; s=iport;
  t=1711557702; x=1712767302;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=PbztVePmELKqGE8PcvB9byNVuJvcZAsXOfiZotDbIO8=;
  b=OL3Z+s/5yefRQavKcv17wohv7QqQ1vbiKFViGKTx904/ZO/W9JZgJKSB
   ZjM/Jt66OGszTDSEWHITTl2ECGz+eqAnyKvlfj1dQdeOE02AyabeqnVqT
   ALh8KcP2IdTbxNYN4ZgjCM+M0+mjqCm0r5XvV0/uqA1Zfx0y7Sc/CW919
   w=;
X-CSE-ConnectionGUID: c2Wcdb+BTGOFmq+PycjlaA==
X-CSE-MsgGUID: 2bRPGG6KT6aTPZS/1DHBUw==
X-IPAS-Result: =?us-ascii?q?A0AUAAAmSwRmmIwNJK1aHQEBAQEJARIBBQUBQCWBFggBC?=
 =?us-ascii?q?wGBZlJ6AoEXSIRVg0wDhE5fiGsDhXqMSxyLJoElA1YPAQEBDQEBPQcEAQGFB?=
 =?us-ascii?q?gIWh28CJjQJDgECBAEBAQEDAgMBAQEBAQEBAQYBAQUBAQECAQcFFAEBAQEBA?=
 =?us-ascii?q?QEBHhkFDhAnhW0NhloBAQEDEhERRRACAQgYAgImAgICDiEVEAIEDgUigl4Bg?=
 =?us-ascii?q?l8DARCkRQGBQAKKKHqBMoEBghYFsnsGGIECLgGIJgGBVohcJxuBSUSEPz6CY?=
 =?us-ascii?q?QQYgV2DRIJoBIVJhFmUOocKCUt+HAOBBQRaDRsQHjcREBMNAwhuHQIxOgMFA?=
 =?us-ascii?q?wQyChIMCx8FEkIDQwZICwMCGgUDAwSBLAULGgIQGgYMJgMDEkkCEBQDGx0DA?=
 =?us-ascii?q?wYDCjEugRAMUANnHzEJPA8MGgIvDSQjAixKChACFgMdGjARCQsmAyoGNgISD?=
 =?us-ascii?q?AYGBlwgFgkEIwMIBANQAyBwEQMEGgQLBzg+ggCBPQQTRgENgTWFNYIhgkEMg?=
 =?us-ascii?q?zMpgU4pgRGDMkMqA0QdQAN4PTUUGwYiAR2kYAGDcwErIGwMUw2XPq05gTwKh?=
 =?us-ascii?q?BOMDJV9qhyYYo1zmmYCBAIEBQIPAQEGgWQ6gVtwFYMiUhkPjjmIdZBQeAIJM?=
 =?us-ascii?q?AIHAQoBAQMJimgBAQ?=
IronPort-PHdr: A9a23:K+gyLhW5cXak3pGdoBGsfe6cTeLV8K02AWYlg6HPw5pHdqClupP6M
 1OavLNmjUTCWsPQ7PcXw+bVsqW1QWUb+t7Bq3ENdpVQSgUIwdsbhQ0uAcOJSAX7IffmYjZ8H
 ZFqX15+9Hb9Ok9QS47lf1OHmnSp9nYJHwnncw98J+D7AInX2si+0eG//4LaSw5JnzG6J7h1K
 Ub+oQDYrMJDmYJ5Me5x0k7Tr3lFcPgeyWJzcFSUmRu9rsvl9594+CMWsPUkn/M=
IronPort-Data: A9a23:bWL9cqiOIHVPc1UL1GpxY7LQX161bRAKZh0ujC45NGQN5FlHY01je
 htvWz+FOPiDM2Dzc41+Ydyx8U8B7ZXWx9MwSQZu+S49QSpjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+1H1dOCn9CEgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZWAULOZ82QsaD5MsPjc8EkHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 woU5Ojklo9x105F5uKNyt4XQGVTKlLhFVTmZk5tZkSXqkMqShrefUoMHKF0hU9/011llj3qo
 TlHncTYpQwBZsUglAmBOvVVO3kWAEFIxFPICXPljsefxQ7sT1TL7fB3T3knNo8c888iVAmi9
 dRAQNwMRhmHg+Tzy7WhR6wzwM8iN8LseogYvxmMzxmAUq1gGs6FGv6MvIMAtNszrpgm8fL2a
 8MfaDdrcx3oaBxUMVBRA5U79AutriOkLW0E8Q3I+sLb5UCJxjZJ/5ezE+aLc+Cyd/4Sx2q4j
 F/ZqjGR7hYyb4HHlmHfrRpAnNTnmSL9RZJXF7el9/pmqEOcy3ZVCxAMU1a/5/6jhSaDt8l3I
 kgQ/G8lqrI/sRPtRdjmVBr+q3mB1vIBZzZOO+Zg1wqBwOn+3ym+KG0dDQZQY94iveZjEFTGy
 WS1t9/uADVutpicRnSc6qqYoFuO1c49czVqicgsE1Ft3jXznLzfmC4jWTqKLUJYptTxHTe1y
 DeQoW1hwb4SlsUMka68+DgrYg5ARLCXEmbZBS2OAgpJCz+Vgqb+O+REDnCAs559wH6xFAXpg
 ZT9s5H2ABoyJZ+MjjeRZ+4GAauk4f2IWBWF3gc2Q8Z+p2rzoSP9FWy13N2YDBo4WirjUWK4C
 HI/RSsOjHOuFCLzMv8pOd7Z5zoClPK5S7wJqcw4nvIVP8AuL1XYlM2fTUWRxGvq2FM9ir0yP
 IzTcMCnSx4n5VdPklKLqxMm+eZznEgWnDqLLbiilkjP+eTFPha9F+xaWGZim8hktstoVi2Pr
 YYGXyZLoj0CONDDjt7/q9FMdgtUcyBrWPgbaaV/L4a+H+avI0l4Y9f5yrI6cIsjlKNQ/tokN
 FnkMqOE4DITXUH6FDg=
IronPort-HdrOrdr: A9a23:sAz/hau/BofgAjM6Fk7nilrT7skCCoAji2hC6mlwRA09TyXGrb
 HMoB1L73/JYWgqOU3IwerwRpVoIUmxyXZ0ibNhW4tLxGHdySWVxfJZnPrfKlrbamzDH49mpO
 hdmsdFeafN5DRB/KLHCUyDYqkdKbq8geCVbIXlvgpQpGhRAskKgXYae2Om+w9NNXV77PECZe
 OhD7981kGdkAMsH7yG7xc+Lo/+TvTw5eHbSC9DLSQKrCOJijSl4qP7FR+34jcyOgkk/Z4StU
 L+v0jc/KuMj9GXoyWw64bU1ftrseqk7uEGKN2Hi8ATJDmpoB2vfp5dV7qLuy1wiP2z6X4x+e
 O84SsIDoBW0Tf8b2u1qRzi103LyzA18ULvzleenD/KvdH5fjQnEMBM7LgpNycxqnBQ+O2U4p
 g7mV5xhKAnVC8oWx6Nv+QgYisa0XZcZ0BSytL7wUYvC7f2I4Uh3bD3tHklYqvoWhiKq7zO1I
 JVfZ3hDDE8SyLGU1nJ+mZo29CiRXI1A1OPRVUDoNWc13xMkGl+1FZw/r1Uop4szuN0d3B/3Z
 WODo140LVVCsMGZ6N0A+kMBcOxF2zWWBrJdGafO07uGq0LM2/E78ef2sR42Mi6PJgTiJcikp
 XIV11V8WY0ZkL1EMWLmJlG6ArETmmxVSnkjste+596sLvhQ6eDC1zPdHk+18+75/kPCMzSXP
 i+fJpQHv/4NGPrXZ1E2gXvMqMiYEX2kPdlzOrTd2j+1f4jcLeaw9AzWMyjUIbQLQ==
X-Talos-CUID: =?us-ascii?q?9a23=3AzllKLmqYxIOMRG3wfgDqctPmUct/TXbRxjT6H2C?=
 =?us-ascii?q?fJ2NwC4WEQl2U8Yoxxg=3D=3D?=
X-Talos-MUID: 9a23:uzziIQl4IbeqGVRCLEpKdno4Pv1QzIvwK3xTmKk+ifLDbABQEQqC2WE=
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-core-7.cisco.com ([173.36.13.140])
  by alln-iport-2.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 16:40:31 +0000
Received: from alln-opgw-1.cisco.com (alln-opgw-1.cisco.com [173.37.147.229])
	by alln-core-7.cisco.com (8.15.2/8.15.2) with ESMTPS id 42RGeVIW026260
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linux-kbuild@vger.kernel.org>; Wed, 27 Mar 2024 16:40:31 GMT
X-CSE-ConnectionGUID: B7T9kwLOQ82xUr8b0DOOUw==
X-CSE-MsgGUID: 0v2oM1YUTiC+rgJUydsWEw==
Authentication-Results: alln-opgw-1.cisco.com; dkim=pass (signature verified) header.i=@cisco.com; spf=Pass smtp.mailfrom=danielwa@cisco.com; dmarc=pass (p=reject dis=none) d=cisco.com
X-IronPort-AV: E=Sophos;i="6.07,159,1708387200"; 
   d="scan'208";a="26888342"
Received: from mail-mw2nam12lp2041.outbound.protection.outlook.com (HELO NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.41])
  by alln-opgw-1.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 16:40:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XeNcSTKWOrFXCyI4upihHlaZfzYyjVCLgc0LJyP28LUuohW3cRted6Y7UfqdmdQJXNJ/VcnbbLhPd0S207xbP+ORT9umBkp1g9anvDNLlGTtWn0cMKP4c3x9ClEvuS6v9cj4F+l1Vo/eqQLNOL9eGb88oSxfJT9mKgFo5RBeGDopsExdo7BjWjGFY4De/caj5SYasvUUh7vFBasAuEm2EWpp5x/7G76FZQ8AB+6j8p+1gkbi9+ySvA96Wj95PBmNrY9Q6xaTI842IMTKI1tJE+SJtn4vOM/AZbf46P/tIfpsL8He6moFLWqD7nYTg3CAaZxoVgFFAIMHU3ivkWjkyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PbztVePmELKqGE8PcvB9byNVuJvcZAsXOfiZotDbIO8=;
 b=oQeTM7sXYZJRooiY/l+rqLVVTqpVXMp5QrxIa7Uof5CKknuAcYSyJLNj9uU7Sncfy2c6ZLAXFpy50ikq/2yvf/hi3JvMTfh1fbW9lNZIrxQoveJq65LZgM3XNqJCd5gQ42P8iXcOCOjSUWhnoPtOZryr0bmF9HLZFhZYk7+a8LDA6JvDe6trITr9vCGjJSrgmUornxdRSbfkymY8imXTPGTu6lbMXxQWJbPO8hIfXQW4R6fVRGzawLmuimdXIRYpfbU8cwGmnmUmnrBQhk0LItu9uimblFutjsvDsKAoFezn1VS+Nbi33LiZvgR/ssXjZFUSJjviU97K75cw2mIwNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from SJ0PR11MB5790.namprd11.prod.outlook.com (2603:10b6:a03:422::15)
 by CO1PR11MB4801.namprd11.prod.outlook.com (2603:10b6:303:9c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Wed, 27 Mar
 2024 16:40:29 +0000
Received: from SJ0PR11MB5790.namprd11.prod.outlook.com
 ([fe80::22f4:4617:117:7a44]) by SJ0PR11MB5790.namprd11.prod.outlook.com
 ([fe80::22f4:4617:117:7a44%6]) with mapi id 15.20.7409.028; Wed, 27 Mar 2024
 16:40:29 +0000
From: "Daniel Walker (danielwa)" <danielwa@cisco.com>
To: Masahiro Yamada <masahiroy@kernel.org>
CC: Jing Leng <jleng@ambarella.com>,
        "Valerii Chernous -X (vchernou -
 GLOBALLOGIC INC at Cisco)" <vchernou@cisco.com>,
        "xe-linux-external(mailer
 list)" <xe-linux-external@cisco.com>,
        "linux-kbuild@vger.kernel.org"
	<linux-kbuild@vger.kernel.org>
Subject: Re: M= modules build w/ objects in different directory
Thread-Topic: M= modules build w/ objects in different directory
Thread-Index: AQHaelPNOgMSgTyKB0G/hZjqvxRe4g==
Date: Wed, 27 Mar 2024 16:40:29 +0000
Message-ID: <ZgRL/GHwgV16+yTb@goliath>
References: <ZfodWv+E6Ekqr7fl@goliath>
 <CAK7LNATUFzG9jTfFB831vZr7t-8w6UWfX85Jn2tEvypkmhcs4A@mail.gmail.com>
In-Reply-To:
 <CAK7LNATUFzG9jTfFB831vZr7t-8w6UWfX85Jn2tEvypkmhcs4A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5790:EE_|CO1PR11MB4801:EE_
x-ms-office365-filtering-correlation-id: 1b6768f8-7ea5-4f08-350b-08dc4e7c9cb9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 XDPZVRbIXVxf86CgtSru/U9c8CDi8qerE6b9uVjHiFmaJXdWUqX9hhHck8+/yAk5m8YMNEZp30jIQzsYGyy81lpEYpofRgZAeruUrfCAKgpLoX2FGY7Mx6Sh9kozeyECadmZp6LgIkOOjHUeNhcAdofKRdaQKcl8LPwr7EuYjeHeJDEm8SfP2aJL4mYPrOBBzXmtO4etFeMDgPcQugH1N8EAlMJXKHFgOMLGNbNALHWNtS/JZOY6EhCDaUmbtx66eBw0QemPIKO0w6ZHTFn5D9P8kQ0PJJpkMATTxHuuBDxbCfMLoDGZMCjKkUa/+IIq6dktQLsTUMjEzDMoMKkAiX/Da2wMVSuwRCPh9N1Bw65GXS2msQEp/YtqF4LH1SKZbAOzA5yBRaKBdkZ+cZIzev+0aBPdOUr5+kbcNY75Zc20WmI+kBvPMChADyIUXAyJFR6lt1l5QykEHAp3J3qb/zCYWDw2Mbyh1Z5T2uRSqlG1Ntf/AUj8jlmpBOl/HnOcXDCX3RllwXGIlt5aaftygp7qXHVplY4f5gUPWKEw+fjZnim1RZTd/5JoPx1MO1vhPG8gMmZDiRIsmWGs163+4VIlb5UVLDZ9uaF2uQx33c07hWodOFSQjDW4n4Vin1Sepfl4KdUHjtIRaNyTXzJXjNgmUVwJFAWGwSVa01V3/hQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5790.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?N0tNMnlsa29FbTBJM00wQUEvODg1cUZuZEhPcDZIWW0yZXY0MUlGUS9CanZ0?=
 =?utf-8?B?OUxMb0c4NnE0SllyQkV4SHhtcEdOS3VvR2FLWmxkSGg2ekxyWTVHTVppb2pU?=
 =?utf-8?B?U0tWUGIyZG9JUThMWjhTVldiZFRKQU1qaitsTmxJVGFSa0FLZjVTOXhtem9x?=
 =?utf-8?B?a2s5UVphaVpTRVhmeHoxS1JtTEpDR0lnT3JoVHhiNW54T2pXQ2FUTStNRlZm?=
 =?utf-8?B?RCtGRk5vbVQzNG53dGQrSzBFeE80amxhUUxmOHBxS0FoRDFMOTRrbm5Qd0w3?=
 =?utf-8?B?NEYzS3RFdk1Ccmo4Mk1GSUd3ays0ZjczNDNPSENTWTJja0Z2S0N3K2FteURW?=
 =?utf-8?B?RThEVERtbGdJcElhTlN0Vmh1NGVTdWl4blBodFlwTlluVVJoK21oell4MW9a?=
 =?utf-8?B?UUVENjl3NmpFUlFJdVNQY1g5cEdNU3d5dVltK0pNWHduak52dDlLM2dZN0VO?=
 =?utf-8?B?MzFBTE5rYTJ2MWJhVE91RkRhVWlpUlJPQmVFL2tKbUtTMGJxbjJxSnZ5REZW?=
 =?utf-8?B?RmllYytKSnBXS1ZYQzI5YWtTZkhNVW1EcHBNWUI2UTByUURkU2poTFN5ZFc4?=
 =?utf-8?B?N1ZCN29wZkQya2NJMHl0VitoWTdZcnIzZXN4SmExREQxSTVpbHc4a1l5cTh6?=
 =?utf-8?B?VVlPTUhNSEM5SFFuczNMSFRIckpjbGpHdXdrZ1dXa1B1dCtDVFA2YTloYUJu?=
 =?utf-8?B?VzhnUXFUTUJFS3JwSWZvamovUmN3bU5CdUhGN212OEhOR3IxYm5wZmQ5Y0E4?=
 =?utf-8?B?WDJwZDVJVTRJb3UzclRXMFRjVTBvUXVNb041MnZ6ZWdHcWw2clo4UTByeGRy?=
 =?utf-8?B?T2ppYXBrVkw2UUNRZWt1VFNyN0J0YjNYUGdpcHFLdi9Nc3hHZVcwS05Gbm5M?=
 =?utf-8?B?aUllVlljUVVZcUl6Q2drTXhkQ1BoWVdqSjNaVWxudE8rRjRtVjB6VUtPSGpk?=
 =?utf-8?B?MXJ5S2tIMmRYVVk5YzlqKzJiVVRqNlpxZk5XK2FrTU05RUh2NzdTSkFhRDk3?=
 =?utf-8?B?M0FyNUZYS0ROSWMrQ1FqTmlXbVNrWW0yL29WUE5YZ00xdlRDaTcxNFcyMG1M?=
 =?utf-8?B?aXVzaG1LdDR4TmFVOGgvUVpkYjU0Z3BiUlVKanlYWmVsMGVzaVZkWVBCUG1v?=
 =?utf-8?B?Mm81MUQ2RDdxN3g0TlJZS3BoNDl4ZDZkOHArUEFDN3BmbHVEMDlxeFJPUzgw?=
 =?utf-8?B?M3p4aUNQWWY1N2VjV3JveDh2cCsybkRzWnJybnNLNkVHNU1COXNvOGIzSHJa?=
 =?utf-8?B?MTlCZm5SMFpyN0ZEcnlkbWNsc3BrVk9TYkJ4OFBlRGJmQzgyQXVoWk9ZaXA2?=
 =?utf-8?B?S1ZyUUV0QytOSnY3d2NBTTVvNkNWaXFzS05qOHRGNVQ3S2lOclNFcGlHcEha?=
 =?utf-8?B?VmhkSzhGeU5iSld2bHMvc01iMG1vUVpuREh2N0NGTGJYOGFxTlQvMmdUUEJm?=
 =?utf-8?B?UUNYZTlFTDg4S3FpQUJ1eDdmRXhiR0ZVSm05dGlJYkR5SzJYUTZlS3JOMnpO?=
 =?utf-8?B?U1ZhZjdJT3BLNjEzY1FBVzFFT2R4U0dycmlGRUYyRmR1TFlmSVJicTJrV1dX?=
 =?utf-8?B?ZFhkeUY5NmFreTBHeVRjc0NMaDFvK0Jnb3ZVeEJ6emxqMU5SQlVBL1RqS1h5?=
 =?utf-8?B?dHg0bWFQWHh6Rzltakp3dHl4cHhUQURpQzN5UkxrelJKYzI5bWdpOUgyTVF2?=
 =?utf-8?B?ZEUvNmplOHpaZ3NjcU4xRW1lQnVqbkxmRkRqRi9xdzJpWjRsa1ZZMm9MclVz?=
 =?utf-8?B?eGtUTFVZZ1NJUDUvY0pmYk1Wd0psckhjQ1pCZUFhNkRVaERkaXJZRGVESE42?=
 =?utf-8?B?SFJiVUJ4VUF2dWozVFFUVEdkZlorekllU0F5enlRVWNIcEx5UWZFeTlvTHZu?=
 =?utf-8?B?ZFQwWE5qdTNVVEhLZDNsRkQ3WXZJbXNoai9sUnRySDFCZTl0WTZjNDdKTjFD?=
 =?utf-8?B?WDJUVGRZK20wRXZLZFlSYXhwM0tXZFhCbGJ5RDZ4bjE5U2VIczRsb1U1MUZn?=
 =?utf-8?B?VGgrbjJObkRKSHpZVlFXM1RERVNqNm5lRVE1amNLWGpiVk4vemNJZ0FJYzR5?=
 =?utf-8?B?dWxZTG5mT2RHMy9KbWNqc3dWbUQvdGNKRFJGNnpMNTFORzBUWGhoeTZkNC9H?=
 =?utf-8?Q?ta58zDsKg7nWU4/w1iaPY1czn?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BCE3398117ED7C4D8FF009641487D6B1@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5790.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b6768f8-7ea5-4f08-350b-08dc4e7c9cb9
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2024 16:40:29.1481
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Cof/vTX9pJ90yxMRXS80iv4LM/8dTB21UZxIjq87Vegh6Z7L3QcubdiLNvKoVkEPLYE2WOShlueDcck2mRUa2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4801
X-Outbound-SMTP-Client: 173.37.147.229, alln-opgw-1.cisco.com
X-Outbound-Node: alln-core-7.cisco.com

T24gVGh1LCBNYXIgMjEsIDIwMjQgYXQgMTI6MDE6MjNBTSArMDkwMCwgTWFzYWhpcm8gWWFtYWRh
IHdyb3RlOg0KPiBPbiBXZWQsIE1hciAyMCwgMjAyNCBhdCA4OjIw4oCvQU0gRGFuaWVsIFdhbGtl
ciAoZGFuaWVsd2EpDQo+IDxkYW5pZWx3YUBjaXNjby5jb20+IHdyb3RlOg0KPiA+DQo+ID4NCj4g
PiBNYXNhaGlybywNCj4gPg0KPiA+IEkgZm91bmQgdGhpcyBjb21taXQsDQo+ID4NCj4gPiBodHRw
czovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51
eC5naXQvY29tbWl0Lz9pZD0yM2EwY2I4ZTMyMjUxMjI0OTZiZmE3OTE3MjAwNWM1ODdjMmQ2NGJm
DQo+ID4NCj4gPiBJdCBoYWQgdGhpcyBub3RlLA0KPiA+DQo+ID4gW21hc2FoaXJvOiBJIGRvIG5v
dCB0aGluayAiTT0kKE9VVF9ESVIpIHNyYz0kKFBXRCkiIGlzIHRoZSBvZmZpY2lhbCB3YXksDQo+
ID4gYnV0IHRoaXMgcGF0Y2ggaXMgYSBuaWNlIGNsZWFuIHVwIGFueXdheS5dDQo+ID4NCj4gPiBJ
cyB0aGVyZSBhbiBvZmZpY2lhbCB3YXkgb3IgcmVjb21tZW5kZWQgd2F5IHRvIGJ1aWxkIG9iamVj
dHMgaW4gYSBkaXJlY3RvcnkNCj4gPiBvdXRzaWRlIHRoZSBleHRlcm5hbCBtb2R1bGVzIHNvdXJj
ZSBkaXJlY3RvcnkgYW5kIG91dHNpZGUgdGhlIG9yaWdpbmFsIGtlcm5lbA0KPiA+IHNvdXJjZSBk
aXJlY3RvcnkgPw0KPiA+DQo+ID4gRGFuaWVsDQo+IA0KPiANCj4gVGhlcmUgaXMgbm8gb2ZmaWNp
YWwgd2F5Lg0KPiBPbmUga25vd24gdGlwIGlzIHRvIHVzZSBhIHJlbGF0aXZlIHBhdGggZm9yIE09
Lg0KPiANCj4gRm9yIGV4YW1wbGUsIHRoZSByZWxhdGl2ZSBwYXRoIGZyb20geW91ciBrZXJuZWwg
c291cmNlDQo+IHRvIHlvdXIgZXh0ZXJuYWwgbW9kdWxlIGRpcmVjdG9yeSBpcyAgLi4vcGF0aC90
by9tb2R1bGUNCj4gDQo+ICAkIG1ha2UgTz1wYXRoL3RvL291dHB1dCAgTT0uLi9wYXRoL3RvL21v
ZHVsZQ0KPiANCj4gDQo+IFRoZSBtb2R1bGUgb2JqZWN0cyB3aWxsIGJlIG91dHB1dCBpbnRvDQo+
IHBhdGgvdG8vb3V0cHV0Ly4uL3BhdGgvdG8vbW9kdWxlLy4NCg0KSXQgc2VlbXMgdGhhdCB0aGlz
IGRvZXMgcGxhY2Ugb2JqZWN0cyBpbnRvIHRoZSBvdXRwdXQgZGlyZWN0b3J5LCBidXQgdGhlcmUg
aXMgYW4NCmlzc3VlIHdoZXJlIHRoZSBidWlsZCBzeXN0ZW0gZXhwZWN0cyBpbmNsdWRlIGZpbGVz
IHRvIGV4aXN0IGluc2lkZSB0aGUgb3V0cHV0DQpkaXJlY3RvcnkgYXMgd2VsbC4gRm9yIGV4YW1w
bGUgaWYgdGhlIG1vZHVsZXMgaW5jbHVkZXMgbGludXgvbW9kdWxlLmggdGhpcyBmaWxlDQpleGlz
dHMgYW5kIGlzIGZvdW5kLCBidXQgbW9kdWxlLmggYWxzbyBpbmNsdWRlcyBhc20vcndvbmNlLmgg
d2hpY2ggaXMgbm90IGZvdW5kLg0KSSB0aGluayBpdCdzIGxvY2F0ZWQgaW4gaW5jbHVkZS9hc20t
Z2VuZXJpYy9yd29uY2UuaCAuIEkgdGhpbmsgdGhlc2UgYXNtIGxvY2F0aW9uDQphcmUgbGlua2Vk
IG9yIGFkZGVkIGFzIHNwZWNpYWwgLUkgYWRkaXRpb25zIGR1cmluZyB0aGUgYnVpbGQgYnV0IHVz
aW5nIE89DQpyZXN1bHRzIGluIHRoZXNlIGFzbSBkaXJlY3RvcmllcyBub3QgYXBwZWFyaW5nIHRv
IGV4aXN0IGNvcnJlY3RseS4NCg0KRGFuaWVs

