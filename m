Return-Path: <linux-kbuild+bounces-1827-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5235A8C3487
	for <lists+linux-kbuild@lfdr.de>; Sun, 12 May 2024 00:43:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AF9C9B213F9
	for <lists+linux-kbuild@lfdr.de>; Sat, 11 May 2024 22:42:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1E0F24B26;
	Sat, 11 May 2024 22:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jfQDC8Nd";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="scbssE+y"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B587D1E515;
	Sat, 11 May 2024 22:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715467352; cv=fail; b=LEbMkhsSeCjn+KcxqhKQqL5hgZp9gEYog0oiBCjklftICXEL2QctB1NNgkO2lwUCt7aerlj6Q0RINgFcZVyFwcRKpWab80fVXBB6Unr7rMabA3JBAks4iIRBRGFpTeDWRmq4RBVbQBUMzyUmMxfczZSKax+HVH8Nny/lowOIF5c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715467352; c=relaxed/simple;
	bh=geKB9qy+JRrxBtsNUe7nQ22rj1rk/VahcS99mIexWss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XVkoTbF5hrml95819kaKNo9iZS16oeMlAvJWeISID4VrWqjg7qN7TNlmvIwGapzpJbVAM1Sv4x1glR5GtwcEVTmQlMsfp/gScRma6kQPFwpj5AGX3zsGwA8mwL9wmLuSvUPlLkEYJxTty4jep7ypvMWT0SaGURUlQbl94psQH3g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jfQDC8Nd; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=scbssE+y; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44BMVPxw027975;
	Sat, 11 May 2024 22:41:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-11-20; bh=iRCipYDWApGhlToaWpH6pYkFSt8QdbJOBA//Rw27tEA=;
 b=jfQDC8NdNrBct1i5jpINf4FpA2sCoSfpfI6MYol3Jbzpy1f7Ouan8Byng2icczNrRdAA
 XL9V26wkBWIOjZS7DA0JS6eaJBKF843I0n3nSPStt7k3NdUPVW5AXbmiH5xBaxjnZOXr
 7hYtYHZBb+Gzxvux6yv51DIzrF0n39jI69qRwFdv9cNmAeeQ1aGo335TIwx0CW70qK6P
 /D7aIStC5sQAeoUPaF6q9oD9wqkxmWjBTYLlHvI36uzO2hjX9a2COZl1b9ZmntTkGFz3
 7FVhqlcgQc6Lo8TNPvBw/ncYxsnIL0o2qtFUrxXzXMOmjJCLy6uqAed8b/UjpLpVk59L Fw== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3y2hhu804s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 11 May 2024 22:41:58 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 44BGY5Rh029560;
	Sat, 11 May 2024 22:41:57 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3y1y44hfry-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 11 May 2024 22:41:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=avZfJFZ9ZrP+DGH+eCNxAfHl5HbkiKjafkweuyRgjLutQlI01/Y+JcUaLwck6amX1D3Hu6S+RjdsZ5hXxoHU0krNjIyC+5W+j7htKup17I+/HDxp67uNC3zKyTeyGRMlDJHplbyV6G9v8aVnN+5f6zDvVOxsoD25yML/aqX7VNCA2GzzCyCrEPwPJJxGYM1b4lokRWcQxV4R01+gkBp/dZPGnGJhL/18Ah0b7RcEaFeT/+KmPMgYdPTiYG70FUDIcPiPa9tNYTCO0I3oJWQZvuIo6Ns9b3yHQrAbBdM0zrA0GNppDKL5p5ByQJRYbpAxgaKp0BK4jI4HAfPaPDI9Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iRCipYDWApGhlToaWpH6pYkFSt8QdbJOBA//Rw27tEA=;
 b=TOWsUfkqwJmjBCziugTEZ1PSauuETmZDTep7WscXusWp3SYDmOgoB+PiHujP5rCxpHL7JcrDgswc8g016gH7ODY4iaAxxMkzOKkuruIbr7uiwjMqYp1lqmPsM9Y/WGg8+xUwbiW1t4Xg1Y2U97wdq68Y8vWYZWvpjW4iGOKQTTILQmJJIewEhviB1XG1hPY6qEfOGo1zl9ZBNthHj3TtLVDBzosZIdttVxeFHrO4iIzcACivcE2BU/6eQj/Yig99T4W/MNBJz2hI+D2NOn7xISPFO6X5AEAylvSH1bQluO8rx98/2EdjTNLoKP1TMcFDGQ0Tp478T1vj9PhVldtf6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iRCipYDWApGhlToaWpH6pYkFSt8QdbJOBA//Rw27tEA=;
 b=scbssE+yMMav5A2bUgmMhxoA/1rdCFD7PsTjFFso5InprmYSfdWXj+O0jtz9IMV0FSi4t/tS+HLfqNiE7t+obFcqI6GKD8POg0AlVhtpqHTDVoqJiiqpUBjc+JcFbnng0+F54AcGjV1wm6PO4oS2K6K2Q8FyBKHmV5SeCiWeCp8=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by DS7PR10MB5184.namprd10.prod.outlook.com (2603:10b6:5:38e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Sat, 11 May
 2024 22:41:54 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::6c60:5db4:7058:1440]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::6c60:5db4:7058:1440%6]) with mapi id 15.20.7544.052; Sat, 11 May 2024
 22:41:54 +0000
From: Kris Van Hees <kris.van.hees@oracle.com>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Cc: Luis Chamberlain <mcgrof@kernel.org>, Nick Alcock <nick.alcock@oracle.com>,
        Kris Van Hees <kris.van.hees@oracle.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jiri Olsa <olsajiri@gmail.com>,
        Elena Zannoni <elena.zannoni@oracle.com>
Subject: [PATCH v2 1/6] kbuild: add modules.builtin.objs
Date: Sat, 11 May 2024 18:40:30 -0400
Message-ID: <20240511224035.27775-2-kris.van.hees@oracle.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240511224035.27775-1-kris.van.hees@oracle.com>
References: <20240511224035.27775-1-kris.van.hees@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0426.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::17) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|DS7PR10MB5184:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b1b0a56-44be-45da-8cb9-08dc720b8ec8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?2xE9XdUNWMTuvgw2t7JVAWtvdWlFfWBbtZPLPTGPvKREkgSEZcurCM4BXMqh?=
 =?us-ascii?Q?o2/h29/CtrTvbuNsWYoZgK2vScT/Y/uLLQVD1wquNQXO5DESNHF+2DAkEUTq?=
 =?us-ascii?Q?L2k6uNtzPzPTzrrmJxXECbCHHmkrZ/z8VbtZi2L0mAddVgUQ4hEGLRv2OTQ5?=
 =?us-ascii?Q?miFogUNYIwTTh2vCrTuCK3FT74vCeFYLnG4gxAdSKGP6nee/SWeQasyecK6q?=
 =?us-ascii?Q?qE+T/EpUMU5fkLp0lJKcW0lfjggpvHXXDH4v0/3H6qq009ljbWO3zOe3Gp/R?=
 =?us-ascii?Q?05dRknV4Dqg6XzMPNVUGnyr9P4grsEPjRHVOUBwtcPX9SG50o0cUNxU+Hfi6?=
 =?us-ascii?Q?Rqm9lvg1RNE5uDDmL7TlMGnPKFkTrF1sGXgPMas4faFL9NiRBWZbqh2wYN+X?=
 =?us-ascii?Q?B6FZjPbXJQRpLsNxN82SPX/ONnpemiSjw0kX+LvdDCdVadbTWqjIIeTm/xkL?=
 =?us-ascii?Q?oQn64nNPWhXlrFqg5sxYgwkbPSf81goflqrEfmzWK0Rj6IKB1DbdC9ChYL4d?=
 =?us-ascii?Q?SOj9JQI2VBzARBlbfVSyLhWBeWhIbPOhttC3foKPYVkK6dRdXucg0zp+hHo3?=
 =?us-ascii?Q?CF2o4E2erSHMXyEg/aZLUS6KSwBMYp1HyDqY/gJJj9xChRBAsv/1jNmTcKSR?=
 =?us-ascii?Q?LV9u4nxUik0u90ZnVV4XM0MSpHvVd1ZjKYSKpgG9tQfp4Fpedgcodkwt1m0Z?=
 =?us-ascii?Q?7tas+V4chnmk59W7AE6F4t4kRYEcF6kHBc6rA30q8SJSYFdRitue/XmeBzB1?=
 =?us-ascii?Q?+VEBJP6DHkqsKkJUwArCmTKKt8biWubOEVNRfwy2xsTbMrlk/1AtK8pIaOME?=
 =?us-ascii?Q?ks7Lf5iOZhjGjtB42s4c8D7UtRlSI45z1VqVzumCHF6n8GELciJw/wfau76f?=
 =?us-ascii?Q?vrxATX4J+UO9MkB0k5Es0WU8cH8ahYZL7l5yDhPwGP8kjthlOPrNfYj069AQ?=
 =?us-ascii?Q?WNxorhcIIn/APwzlAZX6WxCLaW0ywyLrmPRChrwEc7XJENQx8Weu2tmmCuLV?=
 =?us-ascii?Q?Dy5CufcbKA4BlV6I6bqiiwFeSeYNr7Fmax9OY9VxnXG5xpjpVuzXompVtiQh?=
 =?us-ascii?Q?vnABDjd3TY1wrvx+3wemdpEJ0vPvUuUAr9Or/hEGRrOsvc9HSiXTzlcP01Ao?=
 =?us-ascii?Q?iMNmj5YHVRuXEQCub0YQw5BXkLLD+DCojUKoK2GLKjKpzvrncY3x+UAty4YL?=
 =?us-ascii?Q?0kZuNn34EWSB7dRRRErR9SUn3qNlA8GMFLU6323P76Y93GLeifGGdHs+0MKD?=
 =?us-ascii?Q?FjZibE/YNgoDWwVvGzAAXJ6wVwx2/ro47R7OElm5/g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Aujb3QisBMfVC3OzwXUUXC+xl8PTtfHRzmdYqm7d7uCOZehZAtCVaZpJ3UiS?=
 =?us-ascii?Q?wzw77SxJ//B7gpzfwDpm6M1jRz2MpC/LcgHJYRyZmDaMo7fCRIyo9W7Mvqpy?=
 =?us-ascii?Q?1znEmFwLq5bhB1w7Szcn2IV3NobDUmC4bduq4MFGgq7+kZuDCj3qJCMH6FlU?=
 =?us-ascii?Q?8rDh2Em1W1PL0uOkrjNfHjD59lMvx9AuSBV5T7NHctv5USC5J/wSh1sXg9dh?=
 =?us-ascii?Q?Mc/zH8qT8Ea33FFUSzzZq7/Nx/HljJN9exkpUaLsL/WQClt5N9X3jj9+28gZ?=
 =?us-ascii?Q?h1V6d9mBtObsHA9Ofjzq4taoIVyzG4wlEif6vPCEM6+s14yIXyPlmzgbHMvD?=
 =?us-ascii?Q?seRyT3OPJlenaNjf7tF6CRmZ+5CN7+Ogmn1sslMcDeaT1f0egfj/Be2oDIdo?=
 =?us-ascii?Q?L487jxPiWQeX/OtaP8+MQK+CZfIy2nZx0lcm9ShShjtA0ubWf5TYRG45iDsR?=
 =?us-ascii?Q?XuZw7izS/EHc+IYg0HiAlTihz63jQ4yjrOK26T6xAy6Uf8/LDOzXtjd7vQeB?=
 =?us-ascii?Q?6FiVc1s+SL3YT7mCwSYM1xUzp8QsfsZYx+OeUI0gsGAML99iK/V5TBx9Wop1?=
 =?us-ascii?Q?02cJhDH4p6GmW1s67pE4nhP39vH1zoOg90tpCUsDZEHkzEvx8DiDiqa/KVc5?=
 =?us-ascii?Q?0JN7kLL0wt4UdynpQUt6yNA966HRFfbnCdGlk1Y1F+LAu0Bn/spp2SvBMD8B?=
 =?us-ascii?Q?M/Xyp+vgwEKrl9F184ZB91xfKsLdUsOHkajzL7lwqlLsQxZhNQAeZmIanRSv?=
 =?us-ascii?Q?NkmnrG4+QT2Owd8ULK8JRuMBNY1LHRWq7aSsWz0N2moGQSsCT3JcFnmjukqP?=
 =?us-ascii?Q?V760Fedi8oAEY0ilWxkhQ50vvcliqdWiQki9wysxj9/0MGsXCnpDHXxflBER?=
 =?us-ascii?Q?HElSiTpez9a1MGfbcAB38Ftk5rjCDAiv5/fdTim0ifvX9HDKV6Wo7pUoN3OX?=
 =?us-ascii?Q?IN+f4ud+IcUMDqtErsywpNtvPx09cXQRFMBGBPQhuj+TEeZVBYawjSWlDX3z?=
 =?us-ascii?Q?k8WhcGXnNAxiSmhnBMl9MJimWEK88rpY0NJLzQ7t8E3WXL0m6NI0cf+fL4eO?=
 =?us-ascii?Q?Vy8xLntAbUHgVftBl/afoqmwMKpBffW9bgFtcOs2R9kpyZoQp6JOTAcGJLpZ?=
 =?us-ascii?Q?k+RzOS3O/StbHOxS1oFdd7SKwPVJD0+U2Jd7tPj11JgG8aG8WSLkujua+ZKN?=
 =?us-ascii?Q?T5W8QMY4G0CLfe6Uim2QUxNcam6C2U/Vrofh7fn5lu4DvdE4gcjdxyeSS70k?=
 =?us-ascii?Q?+LV18pEwXkbYyfuv0L/0KVuPLj7aVbavX7KUVy4iUq3JNbMF+BRmzDmu1YNo?=
 =?us-ascii?Q?uNpG/Uarc1vynVawNzI+FUQmx3dHOKKA9GL5S6MJ5cLYb497Xb2hO8Xpr+wi?=
 =?us-ascii?Q?MLLFSNK5lPpJLyVzvILPAvA/8vDD5vJ4zwgGXUYryvS2cPBATQH6S+TR/xdP?=
 =?us-ascii?Q?425dAxVnTv10HCpWJMAEIv3k8h+dKB9x7KUmRV70FeSr/hbFLD9baJqoYGay?=
 =?us-ascii?Q?uW8fQhU1D0odY1I8p5n3IZAut4D5z2DSQ9WrlvHmbgVyeS7JDYfUgYuxY5YT?=
 =?us-ascii?Q?SImqXMrhnQ2F0YsCg5CAvrPVUJyqq8cn2oh/oUedDxkvAbk63FfHbdmfDb6Z?=
 =?us-ascii?Q?Ng=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	xJnmqQLd34WBVEM7phKSlEAzC4TdMcxhofaxOF6P3nqsI2ZPuHWSo66RIwh9FCQH2thsVLcsTqB3PizyrrdFqePk0sY7W5zMmc5wZZrAtPT8QJUeoiAo10DAAvWkU3lMu++912ji0VZu8irtC9l++efyCEuvtoKkeNV9aWpuBbwargGdG32L7HQk8YB+enc622ocmjnb44IK/DOu3Q8uqPoveP3SAbSnqk6IOR1e9cXJY8zS7t1EwHe/VIGpZSXuLvN3rbd41bCzJECk0TVLNs5mOkwNi+4p/GOqU5PCPyG+c3Z+svmU4reyL0E3vl/d8ORzfgaNHeia9qpJlC/fNm51iEZw6QJ0+z5JRTa7F6HV/qLdikF1KN7hkDabuHwh/Abbf2iegLoWPncRkFj2U8mcovbJ1bqeiS4p8Srild1pi0xzn0oDK+qoUMD0rLIp+H3pvur22Lkky44V5oDxvfyYz19qisVVZSrfwQXWQnVRfaWyij659Y/lXaI29sXz5VbjBm2+ut/qMiWSmA4vuQUEZcjZSUUkZ8FbMzMfRfFlEKuofoFF6nw5DM224embf0M02Nd3kRwlt3wX6hI0JOw+MC08NDGOgVRQC15tOd8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b1b0a56-44be-45da-8cb9-08dc720b8ec8
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2024 22:41:54.6202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I/uw7ypOPH8h+qltZUXMcPDO1ilUCWyKkBFQk8JFE9hQzViDZEfgeWeZOBY6fwwlypg3HewP+3pWL5zgacUTHAvYvr4AD6iffCkgRfHdOmY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5184
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-11_06,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 spamscore=0 phishscore=0 mlxlogscore=999 bulkscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405110171
X-Proofpoint-GUID: B66-KBWYOWZ9JbvHPX_T1gTY3oVEY9Sk
X-Proofpoint-ORIG-GUID: B66-KBWYOWZ9JbvHPX_T1gTY3oVEY9Sk

From: Luis Chamberlain <mcgrof@kernel.org>

The file modules.builtin names all modules that are built into the
kernel; this is checked by modprobe to not fail when trying to load
something built-in. But for tools which want to see which object files
make up each module, we want to help them with such a mapping as it is
not easy to get this otherwise.

We do this by just extending scripts/Makefile.lib with a new variable
and define to capture all object files included in this module, store it
in a new objs= modinfo stanza, then extract it just before linking into
a new file modules.builtin.objs with a layout roughly modelled on a
makefile:

path/to/module.o: path/to/constituent.o path/to/other-constituent.o

Single-file built-in modules get a line reading

path/to/module.o:

Note that the .modinfo section is discarded at the link stage, so the
kernel is not bloated at all (see include/asm-generic/vmlinux.lds.h).

Orabug: 29891866
Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
---
Changes since v1:
 - None
---
 .gitignore                      |  2 +-
 Documentation/dontdiff          |  2 +-
 Documentation/kbuild/kbuild.rst |  5 +++++
 Makefile                        |  8 ++++++--
 include/linux/module.h          |  4 +++-
 scripts/Makefile.lib            |  5 ++++-
 scripts/Makefile.modinst        |  6 +++---
 scripts/Makefile.vmlinux_o      | 15 ++++++++++++++-
 8 files changed, 37 insertions(+), 10 deletions(-)

diff --git a/.gitignore b/.gitignore
index c59dc60ba62ef..62ede8565a2aa 100644
--- a/.gitignore
+++ b/.gitignore
@@ -69,7 +69,7 @@ modules.order
 /System.map
 /Module.markers
 /modules.builtin
-/modules.builtin.modinfo
+/modules.builtin.*
 /modules.nsdeps
 
 #
diff --git a/Documentation/dontdiff b/Documentation/dontdiff
index 3c399f132e2db..75b9655e57914 100644
--- a/Documentation/dontdiff
+++ b/Documentation/dontdiff
@@ -179,7 +179,7 @@ mkutf8data
 modpost
 modules-only.symvers
 modules.builtin
-modules.builtin.modinfo
+modules.builtin.*
 modules.nsdeps
 modules.order
 modversions.h*
diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuild.rst
index 9c8d1d046ea56..79e104ffee715 100644
--- a/Documentation/kbuild/kbuild.rst
+++ b/Documentation/kbuild/kbuild.rst
@@ -17,6 +17,11 @@ modules.builtin
 This file lists all modules that are built into the kernel. This is used
 by modprobe to not fail when trying to load something builtin.
 
+modules.builtin.objs
+-----------------------
+This file contains object mapping of modules that are built into the kernel
+to their corresponding object files used to build the module.
+
 modules.builtin.modinfo
 -----------------------
 This file contains modinfo from all modules that are built into the kernel.
diff --git a/Makefile b/Makefile
index d51d411d44a82..cc979f9874f5a 100644
--- a/Makefile
+++ b/Makefile
@@ -1140,7 +1140,11 @@ PHONY += vmlinux_o
 vmlinux_o: vmlinux.a $(KBUILD_VMLINUX_LIBS)
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.vmlinux_o
 
-vmlinux.o modules.builtin.modinfo modules.builtin: vmlinux_o
+MODULES_BUILTIN := modules.builtin.modinfo
+MODULES_BUILTIN += modules.builtin
+MODULES_BUILTIN += modules.builtin.objs
+
+vmlinux.o $(MODULES_BUILTIN): vmlinux_o
 	@:
 
 PHONY += vmlinux
@@ -1476,7 +1480,7 @@ endif # CONFIG_MODULES
 
 # Directories & files removed with 'make clean'
 CLEAN_FILES += vmlinux.symvers modules-only.symvers \
-	       modules.builtin modules.builtin.modinfo modules.nsdeps \
+	       modules.builtin modules.builtin.* modules.nsdeps \
 	       compile_commands.json .thinlto-cache rust/test \
 	       rust-project.json .vmlinux.objs .vmlinux.export.c
 
diff --git a/include/linux/module.h b/include/linux/module.h
index 1153b0d99a808..cbfff06e00cd6 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -180,7 +180,9 @@ extern void cleanup_module(void);
 #ifdef MODULE
 #define MODULE_FILE
 #else
-#define MODULE_FILE	MODULE_INFO(file, KBUILD_MODFILE);
+#define MODULE_FILE					                      \
+			MODULE_INFO(file, KBUILD_MODFILE);                    \
+			MODULE_INFO(objs, KBUILD_MODOBJS);
 #endif
 
 /*
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 3179747cbd2cc..3b3baa78d4fbd 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -118,6 +118,8 @@ modname-multi = $(sort $(foreach m,$(multi-obj-ym),\
 __modname = $(or $(modname-multi),$(basetarget))
 
 modname = $(subst $(space),:,$(__modname))
+modname-objs = $($(modname)-objs) $($(modname)-y) $($(modname)-Y)
+modname-objs-prefixed = $(sort $(strip $(addprefix $(obj)/, $(modname-objs))))
 modfile = $(addprefix $(obj)/,$(__modname))
 
 # target with $(obj)/ and its suffix stripped
@@ -131,7 +133,8 @@ name-fix = $(call stringify,$(call name-fix-token,$1))
 basename_flags = -DKBUILD_BASENAME=$(call name-fix,$(basetarget))
 modname_flags  = -DKBUILD_MODNAME=$(call name-fix,$(modname)) \
 		 -D__KBUILD_MODNAME=kmod_$(call name-fix-token,$(modname))
-modfile_flags  = -DKBUILD_MODFILE=$(call stringify,$(modfile))
+modfile_flags  = -DKBUILD_MODFILE=$(call stringify,$(modfile)) \
+                 -DKBUILD_MODOBJS=$(call stringify,$(modfile).o:$(subst $(space),|,$(modname-objs-prefixed)))
 
 _c_flags       = $(filter-out $(CFLAGS_REMOVE_$(target-stem).o), \
                      $(filter-out $(ccflags-remove-y), \
diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
index 0afd75472679f..b45586aa1de49 100644
--- a/scripts/Makefile.modinst
+++ b/scripts/Makefile.modinst
@@ -30,10 +30,10 @@ $(MODLIB)/modules.order: modules.order FORCE
 quiet_cmd_install_modorder = INSTALL $@
       cmd_install_modorder = sed 's:^\(.*\)\.o$$:kernel/\1.ko:' $< > $@
 
-# Install modules.builtin(.modinfo) even when CONFIG_MODULES is disabled.
-install-y += $(addprefix $(MODLIB)/, modules.builtin modules.builtin.modinfo)
+# Install modules.builtin(.modinfo,.objs) even when CONFIG_MODULES is disabled.
+install-y += $(addprefix $(MODLIB)/, modules.builtin modules.builtin.modinfo modules.builtin.objs)
 
-$(addprefix $(MODLIB)/, modules.builtin modules.builtin.modinfo): $(MODLIB)/%: % FORCE
+$(addprefix $(MODLIB)/, modules.builtin modules.builtin.modinfo modules.builtin.objs): $(MODLIB)/%: % FORCE
 	$(call cmd,install)
 
 endif
diff --git a/scripts/Makefile.vmlinux_o b/scripts/Makefile.vmlinux_o
index 6de297916ce68..508b3294e2cf1 100644
--- a/scripts/Makefile.vmlinux_o
+++ b/scripts/Makefile.vmlinux_o
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 PHONY := __default
-__default: vmlinux.o modules.builtin.modinfo modules.builtin
+__default: vmlinux.o modules.builtin.modinfo modules.builtin modules.builtin.objs
 
 include include/config/auto.conf
 include $(srctree)/scripts/Kbuild.include
@@ -87,6 +87,19 @@ targets += modules.builtin
 modules.builtin: modules.builtin.modinfo FORCE
 	$(call if_changed,modules_builtin)
 
+# module.builtin.objs
+# ---------------------------------------------------------------------------
+quiet_cmd_modules_builtin_objs = GEN     $@
+      cmd_modules_builtin_objs = \
+	tr '\0' '\n' < $< | \
+	sed -n 's/^[[:alnum:]:_]*\.objs=//p' | \
+	tr ' ' '\n' | uniq | sed -e 's|:|: |' -e 's:|: :g' | \
+	tr -s ' ' > $@
+
+targets += modules.builtin.objs
+modules.builtin.objs: modules.builtin.modinfo FORCE
+	$(call if_changed,modules_builtin_objs)
+
 # Add FORCE to the prequisites of a target to force it to be always rebuilt.
 # ---------------------------------------------------------------------------
 
-- 
2.43.0


