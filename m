Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE2CAFFE1B
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Nov 2019 06:46:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725934AbfKRFqV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 18 Nov 2019 00:46:21 -0500
Received: from mail-eopbgr720103.outbound.protection.outlook.com ([40.107.72.103]:54432
        "EHLO NAM05-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725816AbfKRFqU (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Nov 2019 00:46:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VJ44Xe2MLeOocL4Ny8nzTtwrwz4T4DW0lUahcRaFkdB7sfYtC7LGFNB7ctdaX8TQJzGWC/h8RFMsxv8HJZ8iSJcUR3qNCiYB7i/eCAZAWh2YnnSYiH/ucm5F4jbZ0o6rL1UeTeYjytt0AbDRIKA6Jl1D5PFWlApOZhgxPBoG2+TC9hLdrRP8fsKrLfVQZv4Hew/u9+mwHZ7IZUJvbfBzhfX35M4jR5x/GP8x43W+0kZ9eDbrhwIMVfhj4uUU9J/dRX7GU73NfNGX6atvew00Tq4Is1gqyX9Pp7ED8Q1vpp+lJ7elVwO3PSZ9GYVrVGfrlptERE1w/Gj1BdDOd7iR/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EvVOVJ7pxMsE1oHdd9Jhz5XwOUvUAznfEbM3ggjiE2o=;
 b=bOhwflDHfsKhiY6FWh8walNhCI9zDzoG8P8XjGadQoUSVvA83TrbTSJDSdxGGr0GonZijuiaXmMx41a1kf2qA8iwzVnU+Z6kHKZMiK71VIvIs9/4IJy5A5rCrJOesMKrzC+de0BcDAjizB1DLd5fjvqgjR/K8UiWWKjcu/JfThvULI4fwR7eba/wIzLOlm7OSwUbKjXhzGg6dEYYALy1YayK+AXh25K/kMrPXVC+Do3tBgbVC3BlI/ceX4oW178JpoVENMuDg4sZ90gfLtJXjNv3X6ERG/u11sWQ+YZtbAVnh2tTL0aVWsTIYBb+X7dez+Ke/t1jYfoCmPxP/c50Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=pgazz.com; dmarc=pass action=none header.from=pgazz.com;
 dkim=pass header.d=pgazz.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORGFT3189878.onmicrosoft.com;
 s=selector2-NETORGFT3189878-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EvVOVJ7pxMsE1oHdd9Jhz5XwOUvUAznfEbM3ggjiE2o=;
 b=ebu1XEr5fDgEk5IBakzLiN42NpWdu0UTrhEbJHkAOdwnwK7ZIBOhlqpZ+FIGEijhhxT4SFiSmj/3uNXqD7zwn7irr8x08tJu9xvsxscCJxofpAyb5wC3Kaumv3rQ9ktlApN9Vf1mmaQbaEFdxcMuTb4XR8ypSShJxTwqoA7GjmQ=
Received: from BN7PR15MB2244.namprd15.prod.outlook.com (52.132.218.21) by
 BN7PR15MB2387.namprd15.prod.outlook.com (52.132.217.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.30; Mon, 18 Nov 2019 05:46:17 +0000
Received: from BN7PR15MB2244.namprd15.prod.outlook.com
 ([fe80::b17d:308:2c24:4f36]) by BN7PR15MB2244.namprd15.prod.outlook.com
 ([fe80::b17d:308:2c24:4f36%4]) with mapi id 15.20.2451.029; Mon, 18 Nov 2019
 05:46:17 +0000
From:   Paul <paul@pgazz.com>
To:     "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
Subject: announcing kmax, a symbolic build config evaluator; requesting useful
 application ideas
Thread-Topic: announcing kmax, a symbolic build config evaluator; requesting
 useful application ideas
Thread-Index: AQHVndN+d8LXOoCyZ0iJEaD8Td0mow==
Date:   Mon, 18 Nov 2019 05:46:16 +0000
Message-ID: <20191118054613.ar6vnl4vkfum5kr3@dev.opentheblackbox.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BN6PR03CA0059.namprd03.prod.outlook.com
 (2603:10b6:404:4c::21) To BN7PR15MB2244.namprd15.prod.outlook.com
 (2603:10b6:406:8c::21)
authentication-results: spf=none (sender IP is ) smtp.mailfrom=paul@pgazz.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2600:1700:cf0:3d40:922b:34ff:fe30:bc7a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 61067c78-764e-4d42-f8f2-08d76beaa133
x-ms-traffictypediagnostic: BN7PR15MB2387:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN7PR15MB2387A34A46C6984708889DB4CB4D0@BN7PR15MB2387.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0225B0D5BC
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(39830400003)(136003)(366004)(346002)(376002)(189003)(199004)(53754006)(186003)(14454004)(2501003)(25786009)(2351001)(6506007)(316002)(508600001)(6916009)(1076003)(5640700003)(6306002)(9686003)(6512007)(81156014)(81166006)(8676002)(86362001)(2906002)(6486002)(966005)(6436002)(66476007)(6116002)(99286004)(66556008)(64756008)(476003)(5660300002)(66946007)(66446008)(8936002)(305945005)(52116002)(71200400001)(71190400001)(486006)(7736002)(102836004)(46003)(256004)(386003);DIR:OUT;SFP:1102;SCL:1;SRVR:BN7PR15MB2387;H:BN7PR15MB2244.namprd15.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: pgazz.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: esmaGGhf3kGbz1JotAZ20m+XsvHTpShuU+ge5ht94tsVulIwNao4GcxNygAR8Zo9YXvGymZooTPTxYev9YcYS5DDd6z0JzckeQhQ8Jw/+8/pflDwOFBpQhqVvSxLybfR+7YetB+LVX7WA0iBmeDdjIs36v6CnmNcCfqg/dMBnRYWQNJZFdfeoCzDWlRVkFheyQ2xPDPMxIZc9SzPRcqIHixVPC0jctm2/rmV+4NjmKYAzFissuTS/gbLr7yb2SycH4yxK2/+yuVLITDqGB3n2Kl5l1aLtPmawgHLprMWC/cfLemT+YJWFJgxjf5e1lCzp046SgbKt8aSpIrjx5RQko45PghhJYqiRyE9Zw+oUjzGVV+d5ihNy/ahUHsvWNNALeWkHyOZL7RyeNJYbVpNnXsrBM+omqPptPlQJpdJ1vh8XmBnWChp/wf36sYe3Nib
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D36AB1877AB4B8438B0BD160632C30ED@namprd15.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: pgazz.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61067c78-764e-4d42-f8f2-08d76beaa133
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2019 05:46:16.9450
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b70b2353-c6b3-4c42-a970-dff633c69dd2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AUEXrV/+L7kRjc3GNSbuq14EQMjYi0eMtsx2M1wCtCFCwhvarFglD4Wa1zTKclA2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR15MB2387
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi all,

I'd like to announce a tool called Kmax and see if it can be of benefit to =
the developer community: https://github.com/paulgazz/kmax/

Kmax extracts symbolic constraints for compilation units from Kbuild Makefi=
les. For example, this snippet

    obj-y :=3D fork.o
    ifeq ($(CONFIG_A),y)
      BITS :=3D 32
    else
      BITS :=3D 64
    endif
    obj-$(CONFIG_B) +=3D probe_$(BITS).o

would yield this output

    probe_64.o ((! CONFIG_A) && CONFIG_B)
    probe_32.o (CONFIG_A && CONFIG_B)
    fork.o 1

I've used Kmax to collect the symbolic constraints for compilation units fr=
om the 5.3.11 (x86) kernel: https://drive.google.com/file/d/1q7dDzOvEKWUi7F=
lZ2YixValV6xlkq1yY/view?usp=3Dsharing

Since this was proposed as a GSoC project last year (https://wiki.linuxfoun=
dation.org/gsoc/2019-gsoc-safety-critical-linux#student_project_proposals_2=
018), I thought this might be useful for kernel developers.

What (if any) would be useful applications that developers would most benef=
it from?  Automatically generating configurations that include a particular=
 C file?  Looking for dead (unconfigurable) compilation units?  Something m=
ore pressing?  Looking forward to any suggestions.

Best,
Paul Gazzillo
