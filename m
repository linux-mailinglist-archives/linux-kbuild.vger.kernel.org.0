Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88ECE4A3EE4
	for <lists+linux-kbuild@lfdr.de>; Mon, 31 Jan 2022 09:54:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232759AbiAaIyM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 31 Jan 2022 03:54:12 -0500
Received: from smtp.digdes.com ([85.114.5.13]:5241 "EHLO smtp.digdes.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1345808AbiAaIyM (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 31 Jan 2022 03:54:12 -0500
X-Greylist: delayed 322 seconds by postgrey-1.27 at vger.kernel.org; Mon, 31 Jan 2022 03:54:11 EST
Received: from DDSM-MAIL01.digdes.com (172.16.100.67) by mail.digdes.com
 (172.16.96.24) with Microsoft SMTP Server (TLS) id 14.3.498.0; Mon, 31 Jan
 2022 11:48:48 +0300
Received: from DDSM-MAIL01.digdes.com (172.16.100.67) by
 DDSM-MAIL01.digdes.com (172.16.100.67) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.12; Mon, 31 Jan 2022 11:48:48 +0300
Received: from DDSM-EXED02.digdes.com (172.16.96.56) by DDSM-MAIL01.digdes.com
 (172.16.100.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.12 via Frontend
 Transport; Mon, 31 Jan 2022 11:48:48 +0300
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (104.47.17.171)
 by mail.digdes.com (172.16.96.56) with Microsoft SMTP Server (TLS) id
 14.3.498.0; Mon, 31 Jan 2022 11:48:47 +0300
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cqvXrInQf9adKe3usD26XRVBA/PFUasZK0UUgn1gFNJs5z3wAH20KmLycfnjMA0zCQDgZls3iwT1hn/sFJMTAaIk80qMZHN5EZT6eAnb4FnOPH1DeHDL9SCaf1mI24XJJEvveIeuKjFP70bu1YxGtzsD5oiM1LWqkQC4FXK9LCh+LhKNxTaUjb6RhPbLW1a5gIH7XTcuPmnn8QQaI6lbU6OI27A/LLejLi1Ta17V0jYd35wHBW2GcgXpdpyyEDtOvsSigZmy57f2tzRr/n8E4eo+0j6z3727CFOSWqm4DvHjg8M+rNLUp+UxqAaECtjf/CmPFUpSCcz2sShaFivKzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rDJblohYYx6YysiBdQIvuv/K8Q9ZATCWw20h6jL9kNw=;
 b=Dh5lHWG0nov144lBFRUPbauHeWik7cxHucXqS01hvK5TCYF/EdjlcDP3zIRM8oN0WAuTjghqHO0WOaiAou+yX7FRj5T9ndhqvJlKZowJdiLHUE8QtvyMwCt5UKuYClqUzGW9h7jqgpnt4mPAx3VhMvjWqwEg0SkXuiuPgQmFzs4QkCFeq/IHniVDFA8WTWMqErm+e9YaIZLmtz8FMObSLG3eijTz/641+h9oReKtiZJkEDrEYzKg/gPlzYx+1pYq9RgzUOa+nVZuw+702yfgCLQ01o9x5mRhDpvfx8tsQUULuwLlCUhSEoN9pl7By2dUEoafxhL12+wECsTQnGgi6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=digdes.onmicrosoft.com; s=selector2-digdes-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rDJblohYYx6YysiBdQIvuv/K8Q9ZATCWw20h6jL9kNw=;
 b=ANPK8pYySDpxqYrVzZL0PuatiyuLc6oURzaU4jOTbyrBPDbK/53kLcRVyu5hKbKbK1lNfhhHiyqkE0XmsuqUvgXfsLcxm+djBBOELQM6//zaUudHqtdUA2b4E8CwI+oaYTLsl/mMsDXDByu+lAdn/HbKgEvUHMliL8s7irZZBwA=
Received: from AS8PR10MB4952.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:403::6)
 by AM5PR1001MB1089.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:203:13::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.19; Mon, 31 Jan
 2022 08:48:46 +0000
Received: from AS8PR10MB4952.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::4878:86c5:8899:f1c5]) by AS8PR10MB4952.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::4878:86c5:8899:f1c5%6]) with mapi id 15.20.4930.021; Mon, 31 Jan 2022
 08:48:46 +0000
From:   Chesnokov Gleb <Chesnokov.G@raidix.com>
To:     "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
Subject: [PATCH 1/1] kbuild: Do not re-quote string values when invoking shell
 commands
Thread-Topic: [PATCH 1/1] kbuild: Do not re-quote string values when invoking
 shell commands
Thread-Index: AQHYFn8Ndgk6mknEQ0CnjvTKZJAOkw==
Date:   Mon, 31 Jan 2022 08:48:46 +0000
Message-ID: <AS8PR10MB4952A8D70F9AC76F7C2EB4809D259@AS8PR10MB4952.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 1707ef07-668e-758a-bc52-594ad2629cd0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=raidix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0a157677-45e8-41f0-656b-08d9e4967e60
x-ms-traffictypediagnostic: AM5PR1001MB1089:EE_
x-microsoft-antispam-prvs: <AM5PR1001MB10894382311BBBE99BEBC4B39D259@AM5PR1001MB1089.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: l/ZcTUxvYu6N0uQE3Jhq2EcvdaKfciX/TRcBvQy+TssT5Upfv+cf+0hG2uM5+asaHbNR+n84AreOttP/0khlazZBCDiw7PnO0cgDIF2lT6wTrzh09renG5mFTkjKYFMEq6lZJjYhJDzBdLWXXf3MnBt4QREnVHB+qqGoYk6ZMDX9mANfs0typ40pcXXbrAHkr+OqULB5BTIXVNMWErd1vy0hnKdXQCvkGB8rTehpkT0NU9Br1NseyRBipKpaSxxgC7nuBHlvtj/XpaSJSTQ68j/uo5iQnviT6xAvFR28xbH24qxyMH1b8cY+Sy6p0w14Lb9H07pAmKc0M2PZiGUxtZB1r5Wz8fhCOucZAh1gsq1YR7fLsyf9mzLmyvpUAQ/UX9PNb+LHjZ7ymGibs9LI0hlwLlMENZ8l3fKQliO+Yvhlhdyv8+HJsaEof/223q3hqYHb7OwhRKFYZHHI1fqIemn7UFywoYK2ctADl0MelfJOJCRZw7dBQp8oF2gCKjl/ekPyq+MJf/yYODqnP3v0sd7Mh4fpC3xpbVOqsnYls7SJMPIAV+0HZBoTCHjLqEWD5gfInQN2lLQKnM9ceWprQFCASx4VVO+YPKLraEZ4+iOcigqe9+W6Y1jHqzjxjSm1BFHxdPwWaZskxE4NZf4xvOlZjdgPm3cdR9EI4fGEl9uQ8YfktGEJlkGzxtObMZT3FZwPiAM1aad34HA2WeVJww==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB4952.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(186003)(64756008)(71200400001)(38100700002)(38070700005)(76116006)(66476007)(66446008)(66556008)(66946007)(91956017)(8676002)(6916009)(316002)(8936002)(6506007)(55016003)(7696005)(9686003)(52536014)(33656002)(2906002)(122000001)(86362001)(83380400001)(508600001)(5660300002)(20210929001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?sa1SYSZXTMAQE8ePmsbYhxCJbG7ctWDm+dcINbEB5uH9X4Jx1ThRtEUpqz?=
 =?iso-8859-1?Q?14LzgJmcBrv08i6B8ZcsH6huuH6637+gnvMJ+SVUBSmTGr3ZlhW8roB0Mo?=
 =?iso-8859-1?Q?qMmzJCyiOkr3qR1HEcAgBWyWOhZIVLJBUtnbDW4Ot6NXHpsd+gkZq8RVDw?=
 =?iso-8859-1?Q?URGkn5Wp0J0qQ2x5Xe8dqt/zp2/jdTtSvQtaUjNy9nSbOrlyj5ykUkQFih?=
 =?iso-8859-1?Q?bUP0T8+QjwJulK4PU3GO2HvF9CxM3Q6mNBeSoTID77heJB8SlFVzFV3fSe?=
 =?iso-8859-1?Q?T0lM3aMY2uAQrwSc37/wVbpvVus34SZiD6Ruusrbg6RwLHMF/EfI19Ku0A?=
 =?iso-8859-1?Q?gva2obkNVWX8BA/8CmWDdHnm6eb7pyVPwRV/IS2zFIEuHYvqNgvw3snpFY?=
 =?iso-8859-1?Q?iQ82e+DHglqaWWBC0zYa4P3QqTiZwNEfHmTTOFcpeJWe5xFoFcZKnyPMpX?=
 =?iso-8859-1?Q?FEwO8CyecezV0htObndruhrcEjAJH+rdRu33xpyunCAiuICGJvhPGl1IdH?=
 =?iso-8859-1?Q?skIS1umLbsuFFcBliS2DO6M6IUbfE5jlDKW+qufeSygAulxsLG9uEXvuro?=
 =?iso-8859-1?Q?yGXxxgc+zVfYMD6dvNTcD8srn/SwddtgpokF+2RlD+GdSh4kllHkP/vu0o?=
 =?iso-8859-1?Q?QARsqJhY2LUQQmzInrzynK4MezzDKLNZpeSwPhCaK5QTsFXNVk+ZE3pAol?=
 =?iso-8859-1?Q?UdhVr3PTE1lxu6bX7FlyR4u8PIpT58SR/UCjZLpJmE7ydMfG4wmrfOtyji?=
 =?iso-8859-1?Q?xYi9FeOIcxrrm9U5S2wPPK9upIKDPtwMQYxdBAqo2/m7RM6klGZVks5zpe?=
 =?iso-8859-1?Q?0zg4HxfiA3E0a1YawXJJuNIwNK5T3P3vrH0pJji/PVNNfLzISDiPyOU4nr?=
 =?iso-8859-1?Q?nvVYRmzXea4SxnIyo1ipCAJq0IA4rblQOs/3Db/XOtyB77fv586wF7AQHJ?=
 =?iso-8859-1?Q?oqgmnHHfU3gObns0vPUtzh3Zqm7ShmOwAW4Y4ZBV/KEYQDhPpUnA2BG78S?=
 =?iso-8859-1?Q?beYhngQCSb3uXYxSia9Icbo16jvudaOSAQOH1CNScTwk7PQwsxMSA9304h?=
 =?iso-8859-1?Q?im2/ZQxmWeHOcIzs8Lc+goOT1QfAbzhp2KnJ0RhcSzHw7oc97cydvgR1rs?=
 =?iso-8859-1?Q?2l0pcdDqHGxKGoPDguNVee6jChyvPnONHMH2kZPvGTj6CbhjHBZm21TO/C?=
 =?iso-8859-1?Q?kMljkBCnvQ6IoNSGvtTdHPqb8rMt0fs+Iw88z9TqwHyH5iGb94xeg5XBQt?=
 =?iso-8859-1?Q?ijRza9tOI5sQugeOYmGPgy6KIUZ5+1BanIKIcKuLtnk/0cEy71Y4gor2HY?=
 =?iso-8859-1?Q?UE1KIgpuZDjcDiMIP6Az6ey0l70YLHGjMffSJ4ON6pSD7uiM9eTS1cEI5c?=
 =?iso-8859-1?Q?46JJecMFLBcaQzBOmjdrCIQLf9o2gpHZjy0ZSdhPgXkMK3PigeE0aHz34v?=
 =?iso-8859-1?Q?NOVGXL0on89l67fedoQQ6wvia2e6Dg+kxdC7Kw9tcKDZ7hcXOlLwf8rwyh?=
 =?iso-8859-1?Q?4skEsC9/zXxdUbaCjRbMWHa+QRfFUzE8M7MacqotX3bZ+vwU7p5dCR7Xw/?=
 =?iso-8859-1?Q?zMwarOkkzX5WliESA0IAe5JHwFP6pQOBOsI4oDK1uQET7bXK0p8US7nmO+?=
 =?iso-8859-1?Q?KVwwJ18ihA81i8krU/v4bwxB0MoF2MEPu52hce6QL3vTTsyiy9wlXnwg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB4952.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a157677-45e8-41f0-656b-08d9e4967e60
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2022 08:48:46.5328
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70c55e28-9cd7-4753-937e-c751128a9d38
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aGL/P1ubqXwAHehe0fwHT3UsznkHtHAdfadI6jL1VNzdzlD8nFHMZUG1FORkpRyrTCnb3A4hVgRwHhbEJBg83Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR1001MB1089
X-OriginatorOrg: raidix.com
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Fix the following shell errors during compilation of external module:=0A=
/bin/sh: -c: line 1: syntax error near unexpected token `('=0A=
/bin/sh: -c: line 1: `if [ "gcc (GCC) 11.2.1 20211203 (Red Hat 11.2.1-7)" !=
=3D ""gcc (GCC) 11.2.1 20211203 (Red Hat 11.2.1-7)"" ]; then \'=0A=
=0A=
Fixes: 129ab0d2d9f3 ("kbuild: do not quote string values in include/config/=
auto.conf")=0A=
Signed-off-by: Gleb Chesnokov <Chesnokov.G@raidix.com>=0A=
---=0A=
 Makefile | 4 ++--=0A=
 1 file changed, 2 insertions(+), 2 deletions(-)=0A=
=0A=
diff --git a/Makefile b/Makefile=0A=
index 1fc3491096cb..72205c83a339 100644=0A=
--- a/Makefile=0A=
+++ b/Makefile=0A=
@@ -1714,9 +1714,9 @@ PHONY +=3D prepare=0A=
 # now expand this into a simple variable to reduce the cost of shell evalu=
ations=0A=
 prepare: CC_VERSION_TEXT :=3D $(CC_VERSION_TEXT)=0A=
 prepare:=0A=
-	@if [ "$(CC_VERSION_TEXT)" !=3D "$(CONFIG_CC_VERSION_TEXT)" ]; then \=0A=
+	@if [ "$(CC_VERSION_TEXT)" !=3D $(CONFIG_CC_VERSION_TEXT) ]; then \=0A=
 		echo >&2 "warning: the compiler differs from the one used to build the k=
ernel"; \=0A=
-		echo >&2 "  The kernel was built by: $(CONFIG_CC_VERSION_TEXT)"; \=0A=
+		echo >&2 "  The kernel was built by: "$(CONFIG_CC_VERSION_TEXT); \=0A=
 		echo >&2 "  You are using:           $(CC_VERSION_TEXT)"; \=0A=
 	fi=0A=
 =0A=
-- =0A=
2.35.0=
