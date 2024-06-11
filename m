Return-Path: <linux-kbuild+bounces-2083-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC02C904569
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Jun 2024 21:59:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3A701C23C2B
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Jun 2024 19:59:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0EEB13F458;
	Tue, 11 Jun 2024 19:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="D+Csqzp7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DCA82490;
	Tue, 11 Jun 2024 19:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718135983; cv=none; b=eDKfqP3Q9HYG+M4xkJpJj3KsoB5P3w/WWTUUsQD8VieLrq6xy/BCok4CQMZeEm9UMx+lP+sOTG1D+cEX+aJaiZES5z4LhfgtoiEuh78QXo/HFhkFcngfuYeDI2xmjqj78iyJJXrP2B173eWADiQmENgy4GEaPEE7gp/cmRqlNbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718135983; c=relaxed/simple;
	bh=uN/GxI96hEmjP6Krb5sDFoqvRdUSdtVwmeK07nHXabg=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SfgrN2qNkgvno+Vn+dP5kHdPXWbSRQxKaarDatFeK4XuKUDc/Sa1VSj7zH87QoZr1KF+xh9aBuKDIMqYm/sJ5ZFgalxqXU2aL4D4vbgI81n94Gk12OBNjY1/gdTrmJjsSGKECOUWt5L4tH5PhOX4dQEVvslIazvH6TzbU/bU2Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=D+Csqzp7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45BD4x2U014763;
	Tue, 11 Jun 2024 19:59:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uxyhxz/D7kLB5BwD8RW/vtwokPIRMGrgFky6inUbnGE=; b=D+Csqzp7Ad2spzRs
	V6wfZeI5K+YXh+QD7Hx8nzJimtp9ClqdsPMvmjRQewg1USRxBbz+tMIEInRnj+y/
	5zpjilHr/0VtP1gPBlPQiL7o7wlcKzz4qk2JWUf7mi8k2wQH9ZWzywjkXcFSs4N/
	TODMcKKosTRHKFkOe9MiWaMsc2ltqZsvgHI3XfjFnuC4rrdzjdpT/X61zngfV9R0
	nlOG7IMWLU1ph3aUM+jPzKJjJxiItbqXBOrhcEpxhfSI5dwoUY/QIZN/+0X2McML
	H9vNdIMH0ioOR+XWR3mhdJLLVPb+4yGxkzR/uyWn1MChwjpffQwQql7f8rtwVUBM
	+aQAJQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yme8rywhw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 19:59:27 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45BJxRJt016103
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 19:59:27 GMT
Received: from hu-eberman-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 11 Jun 2024 12:59:26 -0700
Date: Tue, 11 Jun 2024 12:59:20 -0700
From: Elliot Berman <quic_eberman@quicinc.com>
To: Chen-Yu Tsai <wenst@chromium.org>
CC: Simon Glass <sjg@chromium.org>, Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nicolas@fjasle.eu>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-kbuild@vger.kernel.org>,
        Devicetree List <devicetree@vger.kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH] scripts/make_fit: Support decomposing DTBs
Message-ID: <20240611125709776-0700.eberman@hu-eberman-lv.qualcomm.com>
References: <20240605094843.4141730-1-wenst@chromium.org>
 <CAFLszTjX=ixC3pRRGJeaP=ie_yc+KcCRyQ06MBFeSZnBepaXaw@mail.gmail.com>
 <CAGXv+5EcEYGqXq2C1OCK4J4t1NusV7nWp16zb74P6_tCeLnSGw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5EcEYGqXq2C1OCK4J4t1NusV7nWp16zb74P6_tCeLnSGw@mail.gmail.com>
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 5DxUheyUrzhfZ-HwUdw_SyUgM0bU94bB
X-Proofpoint-GUID: 5DxUheyUrzhfZ-HwUdw_SyUgM0bU94bB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-11_09,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=999 impostorscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406110137

On Tue, Jun 11, 2024 at 04:51:52PM +0800, Chen-Yu Tsai wrote:
> On Mon, Jun 10, 2024 at 11:16 PM Simon Glass <sjg@chromium.org> wrote:
> >
> > Hi Chen-Yu,
> >
> > On Wed, 5 Jun 2024 at 03:48, Chen-Yu Tsai <wenst@chromium.org> wrote:
> > >
> > > The kernel tree builds some "composite" DTBs, where the final DTB is the
> > > result of applying one or more DTB overlays on top of a base DTB with
> > > fdtoverlay.
> > >
> > > The FIT image specification already supports configurations having one
> > > base DTB and overlays applied on top. It is then up to the bootloader to
> > > apply said overlays and either use or pass on the final result. This
> > > allows the FIT image builder to reuse the same FDT images for multiple
> > > configurations, if such cases exist.
> > >
> > > The decomposition function depends on the kernel build system, reading
> > > back the .cmd files for the to-be-packaged DTB files to check for the
> > > fdtoverlay command being called. This will not work outside the kernel
> > > tree. The function is off by default to keep compatibility with possible
> > > existing users.
> > >
> > > To facilitate the decomposition and keep the code clean, the model and
> > > compatitble string extraction have been moved out of the output_dtb
> > > function. The FDT image description is replaced with the base file name
> > > of the included image.
> > >
> > > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > > ---
> > > This is a feature I alluded to in my replies to Simon's original
> > > submission of the make_fit.py script [1].
> > >
> > > This is again made a runtime argument as not all firmware out there
> > > that boot FIT images support applying overlays. Like my previous
> > > submission for disabling compression for included FDT images, the
> > > bootloader found in RK3399 and MT8173 Chromebooks do not support
> > > applying overlays. Another case of this is U-boot shipped by development
> > > board vendors in binary form (without upstream) in an image or in
> > > SPI flash on the board that were built with OF_LIBFDT_OVERLAY=n.
> > > These would fail to boot FIT images with DT overlays. One such
> > > example is my Hummingboard Pulse. In these cases the firmware is
> > > either not upgradable or very hard to upgrade.
> > >
> > > I believe there is value in supporting these cases. A common script
> > > shipped with the kernel source that can be shared by distros means
> > > the distro people don't have to reimplement this in their downstream
> > > repos or meta-packages. For ChromeOS this means reducing the amount
> > > of package code we have in shell script.
> > >
> > > [1] https://lore.kernel.org/linux-kbuild/20231207142723.GA3187877@google.com/
> > > [2]
> > >
> > >  scripts/Makefile.lib |  1 +
> > >  scripts/make_fit.py  | 70 ++++++++++++++++++++++++++++++--------------
> > >  2 files changed, 49 insertions(+), 22 deletions(-)
> >
> > This is a clever way to discover the included files. Does it need to
> > rely on the Linux build information, or could this information somehow
> > be in the .dtb files? I had expected some sort of overlay scheme in
> 
> (+CC DT folks and mailing list)
> 
> I suppose we could make the `fdtoverlay` program embed this data during
> the kernel build. That would keep the information together, while also
> having one source of truth (the kernel Makefiles). Whether it belongs
> in the DTB or not is a separate matter.
> 
> > the source, but perhaps people have given up on that?
> 
> I wouldn't say given up, since we haven't agreed on anything either.
> Elliot had some concerns when I brought this up earlier [1] though.
> 

I'd be happy if it was from the DTS.

Thanks,
Elliot


