Return-Path: <linux-kbuild+bounces-12201-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OANzFYh1wWkQTQQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12201-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 18:16:56 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C65CF2F9AD4
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 18:16:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8615831703FA
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 16:45:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09D863C2792;
	Mon, 23 Mar 2026 16:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kXANH8GV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HSqn8Z2B"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC303C2769
	for <linux-kbuild@vger.kernel.org>; Mon, 23 Mar 2026 16:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774284323; cv=none; b=Y9ihTqSfAmRbRVMn9IikGonw39kmc0Ovqltaqbok8bbFtoVhuVY3PAChjipVLpeWXGlO4IbNa2ILZo8ykVNZYwJ4otZA0nIQ/JdMHknfv7bcQu5B9U45iEKcQShaEQlCrAl69HkLDvx6m6P2pjhk/Dw8jM0Y9MZSraKdygJqsVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774284323; c=relaxed/simple;
	bh=0AXgh7r8UHMnA9Zqa/LXkVlVLU4WWT6w2XAUUJqorWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MSegrFJH1YBSnhRy+VN25lDhwKmubqI01Pq0V9ZFtlOtQgA5C1E3Ds0DPxsNtV0miYLuovqGp5gcPGS1vzMFqkv1lgJhDcMOGVb8CfaF4Tp7+iPGBFXKTwe2yoe5lYhNVzIp7wiKd6qGuulw6ABGZWB8uewvpGA2OITbfc7rYS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kXANH8GV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HSqn8Z2B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NFGYmr2829068
	for <linux-kbuild@vger.kernel.org>; Mon, 23 Mar 2026 16:45:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kj+XAZN1TFt3Nwfgt300eR0N4IQOJ3Hc9ynUXTnwTp0=; b=kXANH8GVsr8XcV38
	dzEshEDfmAP+C2peT7j1blXg1V7Oao0GFS6owsA1AyuZs/SjUOiO19Y/tPnMwww7
	6l7g8LhdE2p2qfNtKyJyKPx4G2XwgwI2tuGL0kwi0vDvl0hTwzcSJgH9WwaeNRiB
	41jb3Xit3KmDv01llheLFRbNNzwtieZGlSsCqaOKhbEyw81L2qTwBh3KwIuM9t8F
	MyzdLmeE2pIJ8jIyq6QLMt2Vb7OtgazJG0kCKSVLpCstvJZ2e8a2FWjaehBVwIFx
	Fqsk/NKMd5J53d8nHXySy7yPNGBbleuex4CUfdKlp8X69aFdpupVV2iQd2VbaHzi
	RGwBBg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d35r20vc9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kbuild@vger.kernel.org>; Mon, 23 Mar 2026 16:45:20 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4ca7e7c2so16324171cf.3
        for <linux-kbuild@vger.kernel.org>; Mon, 23 Mar 2026 09:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774284320; x=1774889120; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Kj+XAZN1TFt3Nwfgt300eR0N4IQOJ3Hc9ynUXTnwTp0=;
        b=HSqn8Z2BAg/zQRJ6O0AYQV20QJFZjpEAUw8dEU1x668N2oMY5WWfFDqRZ1ZMtdY5Pg
         vGf9/AdkrGa3uT20/0vWIua4WoVGq5kvYC2KjXeXr3n5Eu4BfBYHg3vcQoGJ8XvF9dl3
         JOrwqLyyx4be1VLNA9+zzKRZzbu1WRkP3iwYQ1ukWQSU191rgzGT/HJt5jwY4YBZqfkF
         JAZgB7g3hEvs8KX/p/JudafHC5uo0FF/Pi5nrpiRUV73g62Q8jddpgxIwk2faxNH55eF
         +aKMWkOp1pQ0GvUd4ExXWU3WEJs2sZDGVZLnHv7eGyZAlbQI1l+rBXrm+CLHZ/dzCr2p
         XilA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774284320; x=1774889120;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kj+XAZN1TFt3Nwfgt300eR0N4IQOJ3Hc9ynUXTnwTp0=;
        b=NGZLAKjqGkdhfnBpeWnq7JPwB5KMJr2M1uxfqxPmDlqmDADLMD6Sdq1Yz0fWYjktWc
         2tHhTPsiuYoR/g8i0EVZCGL/Uj9h2NBY8HmrWcDWV2x1mbLNBDtvgT9K679+BSIXGmLx
         CWqfnwsfzaALxs+Pm/OvFMD2oY0NwVjJzk91ITkFiwc6FGtoVVe7RzwB57OTljIfqrPP
         1y5bN40HtWdRdXHfl/g7Eqh+pfRWdieUiUQl7aQDUC1GrlpJXEMi8trnrbUZgaGdwiLE
         hRCxWhCKfCJvHsfa/3Bpao8LspAtghiVRvlhGIJzAt8qIz2ZoLBeOYRK/BpCyWDb5coc
         Ea+A==
X-Forwarded-Encrypted: i=1; AJvYcCXFYOmuJq/qhuOVIbYem22dk/bz2UZFxQaBospecIoze4kqNpiNysj8gsMofJNSoxr0pLujz3sStDTweLI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsokDzujqS4CPrdlruJq7pz0PLRxqhvlBCBQxP36eCxfUQHMWT
	FDG1aGfh3GFcy/psL6XlFp5WN9uQg6YXHFKyKjIJVGOLU/B/PIOSnguSU3YEFJkmmoQ17K43lAc
	Ql+bWl2M0voaZwoazLtSPZfIfo3uZ0brj9dfYoOP3U7kj9tapbapNuq8QpSCk1DIzaNA=
X-Gm-Gg: ATEYQzyOZ/JcVcQgT02MWorF9DZ52u74YVx+14kYiyeCzefvssNfmL0/sUDEiqOPuNo
	ecyueAAf2sprkvAXvHPEWvfVerCwstbH8ARJdWD/HO6Sx+DBaVOLMvysk9kURQ9d0gn05iQ6itU
	2+um3KtXVvbbKgNmCxu6GdHe73rvGOzdb1h2ZUb1bj7yP8SfHdtNkVojMiMrj5l7n4Uwk1aKs7T
	+8vnSgZGzU6uyxiYjfNcPoA7jLvj7hGWgIgYk2gRels9tz2Q4iHoyVD28nOvhxrxcYyBTZOrnlI
	I6aKbi/Bh25uzFKZsPZ00WeM2mmf0Gh1VHhd7PPhEGBqJr4/pD2e5gcyAABXBgjPW/xNhBHRw6r
	ly/EU1qy8r+SD81KbWgQ8+UqyfVThEqIHUtA0YdMe7CL+56afw7x/33rRCZqlh+fPFeNkv2b2rT
	g0yQO9R1VEmOMaxQnGC+Dp+TUepQSo9cpV8f0=
X-Received: by 2002:a05:622a:4e93:b0:509:2822:670d with SMTP id d75a77b69052e-50b373eaec2mr187522311cf.27.1774284320151;
        Mon, 23 Mar 2026 09:45:20 -0700 (PDT)
X-Received: by 2002:a05:622a:4e93:b0:509:2822:670d with SMTP id d75a77b69052e-50b373eaec2mr187520941cf.27.1774284319458;
        Mon, 23 Mar 2026 09:45:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285207500sm2667386e87.41.2026.03.23.09.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 09:45:17 -0700 (PDT)
Date: Mon, 23 Mar 2026 18:45:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nicolas.schier@linux.dev>,
        Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Mark Pearson <mpearson-lenovo@squebb.ca>,
        "Derek J. Clark" <derekjohn.clark@gmail.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, linux-pm@vger.kernel.org,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        linux-acpi@vger.kernel.org
Subject: Re: [PATCH v6 6/9] dt-bindings: connector: m2: Add M.2 1620 LGA
 soldered down connector
Message-ID: <blhm4csjyw6r667cleljgzd6rpwagttjo5rau7wjrlnjakq2qm@ekyhc4jvwmwf>
References: <20260317-pci-m2-e-v6-0-9c898f108d3d@oss.qualcomm.com>
 <20260317-pci-m2-e-v6-6-9c898f108d3d@oss.qualcomm.com>
 <20260322233713.GA98177-robh@kernel.org>
 <to2mrizprc3hjufqbiplpqyek7f4uutqtn4hx4gkmdgv2rykbc@ybwwjhdec4nm>
 <CAL_JsqJXrHCJt770bJkMmAUhirSF3kHjYwSzkG7cXp7-eys8Rg@mail.gmail.com>
 <6aef3xxjjd4nbgrfx6jc6jt6rpqmttoui6hil5zqgdpas2j6gj@ie6j72orenou>
 <fsvmmgoe5wslmxebhrrwmdg2ldcmhzvj53gjkdfnfg2m2rz2lw@dcfboaakz7ae>
 <bguhzabwryayyqkv4ilzwr3ixwv6bzxncblo3ircz2wm3fs52k@66zvcrfcb4oe>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bguhzabwryayyqkv4ilzwr3ixwv6bzxncblo3ircz2wm3fs52k@66zvcrfcb4oe>
X-Authority-Analysis: v=2.4 cv=VvUuwu2n c=1 sm=1 tr=0 ts=69c16e20 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=dFseMu0FTdCp80lU-T0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 5pSHTsHCCv-YeCDZzGuvdgOGXeuOnCC4
X-Proofpoint-ORIG-GUID: 5pSHTsHCCv-YeCDZzGuvdgOGXeuOnCC4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEyNSBTYWx0ZWRfX+tQQnq3dfpfe
 FOGw0FHTjY9RCQTPx61R/z3uas3TZgVUjIFztrqddMvQ5V0+zsV97rO6kY1NfURcv79xvU+wSYV
 ozfon/172tSCmwH95dkTighCPOtncDmoWoA6bKqvZlXweQhVpN96zRow4oOSAM1noytDtUSDE8/
 3KaDX5A3eEo2zWiq4GxDr0k5ggYpCOOI3t+HC//BNwel+JwG42hj6STPhhfwFtZOnog70RTMFpD
 GWP+ah0g1t8jwlpJzCaMS9mUPySbEqe42lN45yFpKpWuGX30vzACjLJueTG3PK2QaYB+vJIovtg
 0NIMFaRn3w30dFB+2ocM5Em7olBhcoieIRab/ytT47kRzp6EjAghVivUHut1g6fePXOuu4GOQtn
 nUppTS35S6t+CwYYhLEe8J4gF7TNxxkCfez+zeCFbvsf+qv8TJRI6EwMn5gXeh0KgrqAGxFzh08
 uL+Bljvn7TEix7JM/+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230125
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	TAGGED_FROM(0.00)[bounces-12201-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linuxfoundation.org,linux.dev,linux.intel.com,squebb.ca,gmail.com,holtmann.org,bgdev.pl,vger.kernel.org,linaro.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-kbuild,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C65CF2F9AD4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 09:26:04PM +0530, Manivannan Sadhasivam wrote:
> On Mon, Mar 23, 2026 at 05:14:30PM +0200, Dmitry Baryshkov wrote:
> > On Mon, Mar 23, 2026 at 07:14:25PM +0530, Manivannan Sadhasivam wrote:
> > > On Mon, Mar 23, 2026 at 08:39:55AM -0500, Rob Herring wrote:
> > > > On Mon, Mar 23, 2026 at 7:16 AM Manivannan Sadhasivam <mani@kernel.org> wrote:
> > > > >
> > > > > On Sun, Mar 22, 2026 at 06:37:13PM -0500, Rob Herring wrote:
> > > > > > On Tue, Mar 17, 2026 at 09:59:56AM +0530, Manivannan Sadhasivam wrote:
> > > > > > > Lenovo Thinkpad T14s is found to have a soldered down version of M.2 1620
> > > > > > > LGA connector. Though, there is no 1620 LGA form factor defined in the M.2
> > > > > > > spec, it looks very similar to the M.2 Key E connector. So add the
> > > > > > > "pcie-m2-1620-lga-connector" compatible with "pcie-m2-e-connector" fallback
> > > > > > > to reuse the Key E binding.
> > > > > >
> > > > > > What is LGA?
> > > > > >
> > > > >
> > > > > Land Grid Array
> > > > >
> > > > > > If not in the spec, is it really something generic?
> > > > > >
> > > > >
> > > > > Good question. Yes and No! LGA is not something that Lenovo only uses. Other
> > > > > vendors may also use this form factor. PCIe connectors are full of innovation as
> > > > > the spec gives room for hardware designers to be as innovative as possible to
> > > > > save the BOM cost.
> > > > 
> > > > innovation == incompatible changes
> > > > 
> > > 
> > > Yes, I was trying to sound nice :)
> > > 
> > > > > This is why I do not want to make it Lenovo specific. But if you prefer that, I
> > > > > can name it as "lenovo,pcie-m2-1620-lga-connector".
> > > > 
> > > > Depends if you think that s/w needs to know the differences. Hard to
> > > > say with a sample size of 1.
> > > > 
> > > 
> > > Sure. Will add the 'lenovo' prefix then.
> > 
> > Is it really Lenovo? Or is it some other module vendor, whose LGAs are
> > being used by Lenovo?
> > 
> > I remember that DB820c also used some kind of a module for the WiFi card
> > (which might be M.2 compatible or might not, I can't find exact docs at
> > this point).
> > 
> 
> I don't know. These kind of designs might be reused by several vendors. But
> considering that we should not make it generic, I'd go with Lenovo as that's
> the only vendor we know as of now.

... and later we learn that other vendors use the same idea /pinout,
then nothing stops us from still telling that it's a
"lenovo,pcie-m2-something-lga". 

-- 
With best wishes
Dmitry

