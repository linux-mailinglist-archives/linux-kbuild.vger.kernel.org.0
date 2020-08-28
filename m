Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6487B255509
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Aug 2020 09:24:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728447AbgH1HYg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 28 Aug 2020 03:24:36 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:38145 "EHLO
        esa1.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726825AbgH1HYf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 28 Aug 2020 03:24:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1598599474; x=1630135474;
  h=from:to:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=luQ8pfvj3vTkm4IdCjwwTUhk/UebkGp+6B/j5+/Toi4=;
  b=Ko4vFDkPIX6oCCpEywky9+9SKG458uoDDfyHK4tT6zLE/NEBn2GH2l20
   QINsOCHBxT999ASTgtKqry05iUGTsvJg9VrBRPjym51fDaD1bN4jlKjM+
   xumVfLzVRxgRHqDaqWHLfRmXX//YXa9DtgI11m9DJp96AK0/EIveZQw6T
   NqNjeUij8Wmd1aDx9xHxPm+7ViYIlyfmv3ZaZsiRrXv3NMzUTOeXCMjqb
   uHin1HfLpvEF2dmZ0UJn9zNRbbXkdcoPscSd3Kh5lnoQq0/FnpZIh6PNN
   7Lxa6NrHg8JhG0mOaxqZtBtg1E9bltQMio+QliZV/+XdCE1ex1O25WIzF
   w==;
IronPort-SDR: BLkvs5GYlCrWf9O9fVM3AvutRlnDHoHj5Zu2ug7n+H1nP4RRGZfBEASbyYBYcv8ls4OVtZ0SAR
 XEZQFg6AnQdjjmuiZCJYstA7w2M0XN4FxDsTxaXtMX7YvBAjcyqlJ856HZo/aBMfdJlPmTWVoX
 OOnuaDMlqKIPFvQfvwfvCDYtnRJb3UiR+/FuImHTeLFvP7HmbgPY5VTFYr3BJgmOI1JPKs4kPt
 s2yEICfu0DNHZqNJmspfV+6hmgXozs2ARoNJVZNg0bY7QvYnBxL6fcahlTQtnDEFmq0aukH0qH
 PTQ=
X-IronPort-AV: E=Sophos;i="5.76,362,1592841600"; 
   d="scan'208";a="255550559"
Received: from mail-dm6nam10lp2109.outbound.protection.outlook.com (HELO NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.109])
  by ob1.hgst.iphmx.com with ESMTP; 28 Aug 2020 15:24:33 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AJznCtHn/LXGtYUjD2xIdtV0QcyX51HWtibRmJ9hL6JT+QFYOE5t/ce0zUJDSED6lTWXXz0RwlMOPweecmmAbnQCy0irtK/Er5rhtoiRngAm3x5WjhdeZDGEDQ8poAuPtfODzw9BrMx7w/6PNlk74vbRERPoeSh//J/7aH4duuFjbXKZ71g9zj1ZIjAnpmh+1L6QFX1FUSOTzFvs70+r8FiIJa1T++zEDNISE08UJ2VlFc34NKv9e9MrVd7sChguMzSoIpkQKbihKx5NaS6LWYB2EMBoGwgXLDDgC0z3p+d60ONBc1OPAR2kjUCcusez3z4eNpiDYsMtzmPdBxNq3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WD1Ym2Or3TLk/IrdWFpg7I/RulnMwcpTkIIVXgLaNwM=;
 b=QbKkanMXB6sLOJYUMHdBQGYH6f6fxD2rG9GFhYtQUpPnqBI1mU5W0/pb/iyHkv3uPDxCNd/Cq2kcfoQ2iXCoZUD+tnQCaZLON2nfcBsnh+mgZnlqmXfL+tHvrdWj7kwK6/q4bBIxtRNosRLIALEbPiAXHy7crFqL2s/C/sMAJ4YxdIr+MbIZxwl+EsKtmpGsuv88mfcuLG/RbFfRQ0n48B/1MAvJ2d+MU8feoyGeiilWetRE0IVDww6nvazrsTHVFqRfm1L8FINg3tAHAgmHcwNYVMHIUd0iBdQOQ/LHVlMpwhSdqOQryys0OSB+7yo8OYkmF5fA+RbkQ2lihsHUYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WD1Ym2Or3TLk/IrdWFpg7I/RulnMwcpTkIIVXgLaNwM=;
 b=v63AwOJrqJwH0LmWUqv8Fa8Chq7cARb0y6IBfbCEBOZdaMQuW80Emn0ffbh9JV97MRM33AuxnUeTKD7cgBVET9dS8Vio6Rb6bgPl4rLBsTm2Cc4tFU1KOXkuXp2ME3oInFpm/kesnVHYOek165BK0w7cAio9GwcAQgiVOVO64UU=
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
 by CY4PR04MB1256.namprd04.prod.outlook.com (2603:10b6:910:52::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16; Fri, 28 Aug
 2020 07:24:30 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
 ([fe80::7d15:9936:4b3b:f8a2]) by CY4PR04MB3751.namprd04.prod.outlook.com
 ([fe80::7d15:9936:4b3b:f8a2%12]) with mapi id 15.20.3305.032; Fri, 28 Aug
 2020 07:24:30 +0000
From:   Damien Le Moal <Damien.LeMoal@wdc.com>
To:     Sergei Shtepa <sergei.shtepa@veeam.com>,
        "masahiroy@kernel.org" <masahiroy@kernel.org>,
        "michal.lkml@markovi.net" <michal.lkml@markovi.net>,
        "axboe@kernel.dk" <axboe@kernel.dk>,
        "koct9i@gmail.com" <koct9i@gmail.com>,
        "jack@suse.cz" <jack@suse.cz>,
        "ming.lei@redhat.com" <ming.lei@redhat.com>,
        "steve@sk2.org" <steve@sk2.org>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>
Subject: Re: [PATCH 0/1] block io layer filters api
Thread-Topic: [PATCH 0/1] block io layer filters api
Thread-Index: AQHWfKY6jwXCW96OpkCNOYh5TJLBhw==
Date:   Fri, 28 Aug 2020 07:24:30 +0000
Message-ID: <CY4PR04MB37518959789817D5CEE3E5AEE7520@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <1598555619-14792-1-git-send-email-sergei.shtepa@veeam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: veeam.com; dkim=none (message not signed)
 header.d=none;veeam.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:1cf:fa0c:32f2:7362]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 60f06d03-5e30-4dc2-5c38-08d84b236793
x-ms-traffictypediagnostic: CY4PR04MB1256:
x-microsoft-antispam-prvs: <CY4PR04MB125670A4B7D77D490B00DAB0E7520@CY4PR04MB1256.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6TkmMFYpD9VS9pVVbPTFspYTLwYuQVkm8kIeoDoHqQ4EsLSFlBegnYryZ1+UYDx0FnikMqG9WqtKoUyzaB4lMEx5TjOb+Q8AXoM+ZHCxAwiS11R9mTjrFq4XxP+nIWolgcJbU5tADlw5D4IDuIw1oVFtUe6XRaImiECr56K3tjADGTz31hBRkvlPhm4WzstPb4e23cQTcgrL1nry0wHQXaT2Smd6x1RIi75MV7I6cW8oj4FstTVYGunQ40DkHKty83JVWs3wP6kOW9V8zhjPGwNJq95z5bBRVippRB4m8PLxF5ggfEKnK99v+5sgUpi+jhhNXuG2ZnDlnKWyGEEAPAGVXmZDReaZP6HlyUWpubV65i4zm65QvbVtqW8kMGqp510rvn1Xg45PGzWr0uNewoL3Px2qeQpB1u6SaTD3ys7c2zOb1ehS9XIrh7I4sH0S
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR04MB3751.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(39860400002)(346002)(136003)(396003)(55016002)(8936002)(53546011)(186003)(66446008)(7696005)(64756008)(83380400001)(66946007)(9686003)(66556008)(66476007)(316002)(6506007)(71200400001)(91956017)(8676002)(7416002)(33656002)(966005)(2906002)(76116006)(110136005)(86362001)(52536014)(478600001)(5660300002)(921003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: hyeFZz/biBa+hbaHrJjszuf9DKZyMKQfdfdQ0S/pmfXnsapAcKb16/cdi4JKu9wavNe5QTDkW3Jmj8qigdlk1M8w42Mg8N5wxm1SKvOIRkseoppydwlpOctSTq3x3c61t/UrddK4YKE2Pt3TpGbxDkaulHJsgvWXX6McSqhh+d16M8lDj2yDLl3jfccaYdyA3f5NQMalTT6vZmBATnxQplo5ND/dbBJPsYNmQalminU6+kIq7qlT18yXM5Gu1RiGJN9pdgrmgDVzttZgMouXRUbwyy3Epbi889BoZTTYDS2vnC6dQt9Q4Y+ZEsUUkSzHhRxcug2/OCkwTK4r7R5chB/WUrYYQJFS0m/Y3WTRe3D/9I2nC7uILvOr3Xaosu5q0B4sApSez+dIkJokWScX+kKSv8xDE6U6FIDDVIa/KdYpXEIsmGn3NE9xMX0rja4KjA90neHsAuKlxI+6XyVgz5bhHW2NCqTbhrb8O2GyObtbrbEqVGpPOHL15gdbw/cBtN3cwiUO4PsSreZy2eqnPm+NGwJKSx7w6rPSmAkpv1dcyCJeB52YPEAPzOs6qvwuhMKgTaXWEgp8UVn8iQi6pjKlW0QTkMtsuuLy+oKe6biQp7hbspwMJmrIS2GPUPKyzOTMQXXb5FXgLz5lEwwZWyzcZBV3ZLGSy+inaNsul80FZtwYhoIZyd7Y78ZSKCVQrUFP25gLXD58VBiSdD1Ybg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB3751.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60f06d03-5e30-4dc2-5c38-08d84b236793
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2020 07:24:30.5884
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dFA1zgmh257Bh8Bv4BBLNJjlVEliwf6z58/Pzv7cCo3jj0Jr4mWw4dduk/bNMU9fp8nquperzEO1vfTupsz86A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB1256
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 2020/08/28 4:14, Sergei Shtepa wrote:=0A=
> Hello everyone! Requesting for your comments and suggestions.=0A=
> =0A=
> We propose new kernel API that should be beneficial for out-of-tree=0A=
> kernel modules of multiple backup vendors: block layer filter API.=0A=
> =0A=
> Functionality:=0A=
> * Provide callback to intercept bio requests, the main purpose is to=0A=
> allow block level snapshots for the devices that do not support it,=0A=
> for example, non-LVM block devices and implementation of changed block=0A=
> tracking for faster incremental backups without system reconfiguration=0A=
> or reboot, but there could be other use cases that we have not thought of=
.=0A=
> * Allow multiple filters to work at the same time. The order in which the=
=0A=
> request is intercepted is determined by their altitude.=0A=
> * When new block devices appear, send a synchronous request to the=0A=
> registered filter to add it for filtering.=0A=
> * If a block device is permanently deleted or disappears, send a=0A=
> synchronous request to remove the device from filtering.=0A=
> =0A=
> Why dm-snap and dm-era is not the solution:=0A=
> Device mapper must be set up in advance, usually backup vendors have very=
=0A=
> little ability to change or convince users to modify the existing setup=
=0A=
> at the time of software installation.=0A=
> One of the most common setups is still a block device without LVM and=0A=
> formatted with ext4.=0A=
> Convincing users to redeploy or reconfigure machine, just to make block=
=0A=
> level snapshots/backup software work, is a challenging task.=0A=
=0A=
And convincing said users to change their kernel is not challenging ? In my=
=0A=
experience, that is even harder than trying to get them to change their=0A=
configuration.=0A=
=0A=
> As of now, commit c62b37d96b6e removed make_request_fn from=0A=
> struct request_queue and our out-of-tree module [1] can no longer=0A=
> hook/replace it to intercept bio requests. And fops in struct gendisk=0A=
> is declared as const and cannot be hooked as well.=0A=
> =0A=
> We would appreciate your feedback!=0A=
=0A=
Upstream your out-of-tree module ?=0A=
=0A=
> [1] https://github.com/veeam/veeamsnap=0A=
> =0A=
> Sergei Shtepa (1):=0A=
>   block io layer filters api=0A=
> =0A=
>  block/Kconfig               |  11 ++=0A=
>  block/Makefile              |   1 +=0A=
>  block/blk-core.c            |  11 +-=0A=
>  block/blk-filter-internal.h |  34 +++++=0A=
>  block/blk-filter.c          | 288 ++++++++++++++++++++++++++++++++++++=
=0A=
>  block/genhd.c               |  24 +++=0A=
>  include/linux/blk-filter.h  |  41 +++++=0A=
>  include/linux/genhd.h       |   2 +=0A=
>  8 files changed, 410 insertions(+), 2 deletions(-)=0A=
>  create mode 100644 block/blk-filter-internal.h=0A=
>  create mode 100644 block/blk-filter.c=0A=
>  create mode 100644 include/linux/blk-filter.h=0A=
> =0A=
=0A=
=0A=
-- =0A=
Damien Le Moal=0A=
Western Digital Research=0A=
