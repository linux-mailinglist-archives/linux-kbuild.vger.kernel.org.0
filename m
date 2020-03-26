Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06D121946C8
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2020 19:51:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725994AbgCZSv1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 26 Mar 2020 14:51:27 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:10644 "EHLO
        mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726340AbgCZSv0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Mar 2020 14:51:26 -0400
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 02QIpDCU026982;
        Thu, 26 Mar 2020 11:51:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=2ZHg8VpURs06PNBbFTWnGmynoQfZVRO7NLx7UXn59f4=;
 b=CSUINLNY3aGWBl8oZ7O0uuE34JqxYx5P7UkbFbFt07j6pvm/pLQDyb/glDd0LcIoheqt
 Wn5HFsgzwoDbYnzhglCflnudOfzpO1w9n3UbEBBMdVfEZJfBGsMz9qbDcmsD0JVO3XCl
 6aQ7wH0i9IAScH20+XqopZHPOPwQIpwM5Qc= 
Received: from mail.thefacebook.com ([163.114.132.120])
        by mx0a-00082601.pphosted.com with ESMTP id 2yx2xpa20t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 26 Mar 2020 11:51:13 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.228) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Thu, 26 Mar 2020 11:50:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=De4ZgTFLySliRomqM6fVj0ZRfd3k/S7Pb2HLNM8UKF3qFf6RpMwhRZndZHggaFxyQL8EX9bpICNexxDpz5CH9dIH0/y6nbK4JzBcc1/Bm2EowaWvilcw3lmty+EnAFgzWhjv49BK6zriJv0c6W34zkjzVYqsWDlQ+GsmUr+ghpCLjjrX+ptGT2oEmt+TEfrcBSuzWNUfq+5oboczwu62UUfABQkQL/XCan3nZhQzXNO5SP5NWELgqVqKaJrYV6qBvm1wdoi9Mdmms1Ysg8I6fRIVAHMFJkOxPzi4+ZEnaEg6M/v+4Vhnb+X4ujIyWS5lPKSRq5oTbisbEAQxN5+FJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ZHg8VpURs06PNBbFTWnGmynoQfZVRO7NLx7UXn59f4=;
 b=RMB+8UWRfjvz+SZzmHqdCN1z/dv9muDRg44TaHBn1M9/c7rB/PD4C3Aq5lyem1BVeIhNQCGm59zXgO9x31S6AVA0hhuaCxu5N5RgHLRxuLk07+OFly3PXkkY6bxlWnLNF2evXYAr0jL2Vyr8GNrumgZdDakNumMlkP6JZha+LaFQ0vuzmFnLDH8/nHfJoyF/2ockb5Iqc8T4hpxAxFbK3zRSWGNlZpnTvVnyLKln7kRe+LVi2jTTHMGIMWUs72Y8cPz2lWD5Vv7pzA6dJM4g6+rI4/HBggao83GULdm53wA39AGNtR5ra+/7CJL6bOkUTrVYsMXLxb4NLmqHrQ0Yzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ZHg8VpURs06PNBbFTWnGmynoQfZVRO7NLx7UXn59f4=;
 b=Jl2nJrDCxRBMeXTEPNYbQe3bKKCnKQVxyxkHO0rZbZBndMtlBUa20ZCCk7Zh8vWFrxktLAD8p0CEGXC8urqRo6uAg62f+9xUd+Ddju3JsAIE2B4PDPLn7tuE6bk/uoxRK/WQfumPqTrYkInmlAODUTESRWYe5Ci1fvnPGrcY5sQ=
Received: from MW3PR15MB3753.namprd15.prod.outlook.com (2603:10b6:303:50::17)
 by MW3PR15MB3929.namprd15.prod.outlook.com (2603:10b6:303:4a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.20; Thu, 26 Mar
 2020 18:50:43 +0000
Received: from MW3PR15MB3753.namprd15.prod.outlook.com
 ([fe80::3517:e69:6e78:4f7c]) by MW3PR15MB3753.namprd15.prod.outlook.com
 ([fe80::3517:e69:6e78:4f7c%7]) with mapi id 15.20.2856.019; Thu, 26 Mar 2020
 18:50:43 +0000
From:   Nick Terrell <terrelln@fb.com>
To:     Petr Malat <oss@malat.biz>
CC:     Nick Terrell <nickrterrell@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Chris Mason <clm@fb.com>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        "x86@kernel.org" <x86@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Kees Cook <keescook@chromium.org>,
        Kernel Team <Kernel-team@fb.com>,
        Adam Borowski <kilobyte@angband.pl>,
        Patrick Williams <patrickw3@fb.com>,
        Michael van der Westhuizen <rmikey@fb.com>,
        "mingo@kernel.org" <mingo@kernel.org>,
        Patrick Williams <patrick@stwcx.xyz>
Subject: Re: [PATCH v3 1/8] lib: prepare zstd for preboot environment
Thread-Topic: [PATCH v3 1/8] lib: prepare zstd for preboot environment
Thread-Index: AQHWAt/TFdKoAeUM4EKl5IiyBgLU06hbBAsAgAA1HIA=
Date:   Thu, 26 Mar 2020 18:50:43 +0000
Message-ID: <40FFD6B5-8353-4126-9F89-B8F21A400EB3@fb.com>
References: <20200325195849.407900-1-nickrterrell@gmail.com>
 <20200325195849.407900-2-nickrterrell@gmail.com>
 <20200326154038.GA21231@ntb.petris.klfree.czf>
In-Reply-To: <20200326154038.GA21231@ntb.petris.klfree.czf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [67.188.225.242]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 83a129e4-fb93-4f7b-2559-08d7d1b696b7
x-ms-traffictypediagnostic: MW3PR15MB3929:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MW3PR15MB3929AE745951653F0E486C9FABCF0@MW3PR15MB3929.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0354B4BED2
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(39860400002)(366004)(346002)(136003)(376002)(81156014)(5660300002)(2616005)(66446008)(6916009)(76116006)(66556008)(66946007)(64756008)(66476007)(91956017)(4326008)(86362001)(81166006)(26005)(8936002)(186003)(8676002)(316002)(54906003)(478600001)(53546011)(2906002)(33656002)(6512007)(7416002)(71200400001)(36756003)(6486002)(6506007);DIR:OUT;SFP:1102;SCL:1;SRVR:MW3PR15MB3929;H:MW3PR15MB3753.namprd15.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kiURwWH9WzfuNqkFNmTUuaVxGycDYXt9bEpQzhKiFnSrrLeTLaA2Jc81XgUuK+5OilFGP9irySE6vSJ/Omtoku6ZfodnsKHAadoNvv0GZTwEzi84kokv4XLOzrRf+KRtsiFcFp/oP+EiyJjjpByOUMlqVL+Wh9noFEfbqJsZaLG0MOybkOdV9P0JTlD1DMle+hESLghQ4BY2j9HUKFgJpNNI1xZvUx9RYkDLbbn+3+DANEEk9Z64bBUGp2TpPwZFwbUeQwi+StJm1nwipMdDJSKs7+kJ9fU4oHM4UNzzkqHJfRkNCSUHlYg7eYTkB3KW3t7XLlcUVnr4zz1hNPAfJl7tOrxemmiantFIaK7ESk6oIpOP/qoHb1omfA14f1pRHdoutQc0MK4Sb4REJYlWBcy0Ts8Lkd3s62wjco07XmeK8x2Fhbfv40+3deq1/5zR
x-ms-exchange-antispam-messagedata: cP34SYUB8MtM+4kEH1GVPI5Mm3wa+0tcFAlBEOyOp1V5JUXZwT+cEmEAJxAwrhrbQNN5D/Hs+m6AzitXFBT9ix/W6GWF7S2OdaO+uuwLDLLguKSY0pS/FaKzPk/K1Xt7eyemkvpQMqyJXTov0lmAHg==
Content-Type: text/plain; charset="utf-8"
Content-ID: <D7C6279926EAF149A94698AD0AFBD329@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 83a129e4-fb93-4f7b-2559-08d7d1b696b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2020 18:50:43.7210
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kwSq8Qi+AHEKRTHGtFh8KEwxRh0sW7WWe/BxWgIqsC4OQfqyyB9Z9EO7p9y0rOo5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR15MB3929
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.645
 definitions=2020-03-26_10:2020-03-26,2020-03-26 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 suspectscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 mlxlogscore=653
 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1011 adultscore=0
 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003260141
X-FB-Internal: deliver
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

DQoNCj4gT24gTWFyIDI2LCAyMDIwLCBhdCA4OjQwIEFNLCBQZXRyIE1hbGF0IDxvc3NAbWFsYXQu
Yml6PiB3cm90ZToNCj4gDQo+IEhpIE5pY2ssDQo+IEkgZmluYWxseSBnb3Qgc29tZSB0aW1lIHRv
IHJldmlldyB5b3VyIHBhdGNoLCBoZXJlIGFyZSBteSBjb21tZW50czoNCj4gDQo+IE9uIFdlZCwg
TWFyIDI1LCAyMDIwIGF0IDEyOjU4OjQyUE0gLTA3MDAsIE5pY2sgVGVycmVsbCB3cm90ZToNCj4+
ICogRG9uJ3QgZXhwb3J0IHN5bWJvbHMgaWYgWlNURF9QUkVCT09UIGlzIGRlZmluZWQuDQo+IEkn
bSBub3Qgc3VyZSBpZiB0aGlzIGlzIG5lZWRlZC4gV2hlbiBJIHdvcmtlZCBvbiBteSBwYXRjaCwg
SSBoYXZlIGZvdW5kIHRoYXQNCj4gYWxsIGV4cG9ydGluZyBhbmQgbW9kaW5mbyBtYWNyb3MgZ2Vu
ZXJhdGUgc3ltYm9scyBpbiBtb2RpbmZvIGFuZCBkaXNjYXJkLmtzeW0NCj4gc2VjdGlvbnMsIHdo
aWNoIGFyZSB0aGVuIGRyb3BwZWQgYnkgdGhlIHZtbGludXggbGlua2VyIHNjcmlwdCwgdGh1cyBv
bmUNCj4gd2lsbCBnZXQgdGhlIHNhbWUgYmluYXJ5IGluZGVwZW5kZW50bHkgaWYgaGUgcHV0cyB0
aGlzIGNoYW5nZSBpbiBvciBub3QuDQo+IA0KPiBJJ20gbm90IHN1cmUgaWYgdGhpcyBpcyBpbnRl
bnRpb25hbCBhcyB0aGVyZSBpcyBhbHNvIF9fRElTQUJMRV9FWFBPUlRTIGRlZmluZSwNCj4gd2hp
Y2ggc2hvdWxkIGJlIHVzZWQgYnkgYSBkZWNvbXByZXNzb3IgKGFjY29yZGluZyB0byBjb21tZW50
cyBpbiBleHBvcnQuaCkuDQoNClRoaXMgaXMgbm90IG15IGFyZWEgb2YgZXhwZXJ0aXNlLCBJ4oCZ
bSBhIHpzdGQgZGV2ZWxvcGVyIG5vdCBhIGtlcm5lbCBkZXZlbG9wZXIuDQpGb3IgdGhhdCByZWFz
b24gSSB3YW50ZWQgdG8gcGljayB0aGUgc2FmZSByb3V0ZSBvZiBkaXNhYmxpbmcgdGhlIGV4cG9y
dHMgZXhwbGljaXRseSwNCnNpbmNlIHRoYXQgaXMgd2hhdCB0aGUgb3RoZXIgZGVjb21wcmVzc29y
cyBkbywgc28gSSBrbm93IGl0IHdvcmtzLg0KDQpJZiB5b3XigJlyZSBjb25maWRlbnQgdGhhdCBp
dCBpc27igJl0IG5lY2Vzc2FyeSwgSSBjYW4gZHJvcCB0aGUgbW9kaWZpY2F0aW9uLiBCdXQsIEkg
ZG8NCnByZWZlciB0aGlzIGFwcHJvYWNoLCBiZWNhdXNlIHRoZXJlIGlzIG5vIG1hZ2ljIGludm9s
dmVkLiBJIGNhbiBzZWUgd2hhdCBpcw0KaGFwcGVuaW5nIGNsZWFybHkganVzdCBieSBsb29raW5n
IGF0IHRoZSBkZWNvbXByZXNzX3VuenN0ZC5jIGNvZGUuDQoNClRoYW5rcyBmb3IgdGhlIHJldmll
dywNCk5pY2sNCg0K
