Return-Path: <linux-kbuild+bounces-5857-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A927A3FCDD
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Feb 2025 18:08:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 824C47045CB
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Feb 2025 17:00:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0747622B5B6;
	Fri, 21 Feb 2025 17:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="cryrOQYN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mr85p00im-ztdg06011101.me.com (mr85p00im-ztdg06011101.me.com [17.58.23.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2B122ACC5
	for <linux-kbuild@vger.kernel.org>; Fri, 21 Feb 2025 17:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=17.58.23.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740157225; cv=none; b=X0/QUq4XuYFrn5PGhvSBNN13/V37SeoTL9KjE0mhC5KzcjiphU6v+ZSQE5Sd9Wo/VwgC56mkUIjvifa+dAGAaigRJ0K2BvJAQyo/49cil5vIrTfgLjaMUgcW2ZmkL4ub4JzIidXYveYXuzpwGmDrbE16j5zVAwNGQZoU4eEX6Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740157225; c=relaxed/simple;
	bh=k48eyJ2p7HyLaUv2o2mxvuTNXjQuhQ/0FgAmjAYDOHY=;
	h=Content-Type:From:Mime-Version:Subject:Message-Id:Date:Cc:To; b=Zy+Of/4n6O7PBhSp7w0sqZv7AgECJEvTj5SZ6cq5FwUtbgIbjG5uaSB7zf7GkjistZngm0hUlPskZYnLg1sP0g73QcGxzZpVM2+QMVSx4zf3h6Q1UmLMIsO2FVEi0u393MzO6ZAAL23ZFoUah7dOGsTF72sY5ICt9LKlXNhTY4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=cryrOQYN; arc=none smtp.client-ip=17.58.23.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; bh=k48eyJ2p7HyLaUv2o2mxvuTNXjQuhQ/0FgAmjAYDOHY=;
	h=Content-Type:From:Mime-Version:Subject:Message-Id:Date:To:x-icloud-hme;
	b=cryrOQYNAWELojRD0mBYV/p8Ou8xztj5ak+NZlc4aiUf9fzExWnDhQtQKWRAhJrIg
	 WXH6P694BwSxvLR/kez0jinne1P9cxYLyNya478lGRvrSTbI4g9fRa+dlnq6d9zpFq
	 Pu11JA+v4nExpOOWpVUbBpDHji6kmDUXDbiMd3FlUBYrDO7f2/oCQxkgbpUrkJKOTu
	 XyQlTYtcBAs6uMTGepxUTem4j68YAM38rb5FvA9fiVTnTgUds1904Aai98RUod8I+8
	 ETU2qFxbrlwmj6zH8u/CVS+HJ2s82r+MVr/tNLlL0yuW/YvCig+xpq3JibPWsLdbA2
	 t4i70s5xQnARQ==
Received: from smtpclient.apple (mr38p00im-dlb-asmtp-mailmevip.me.com [17.57.152.18])
	by mr85p00im-ztdg06011101.me.com (Postfix) with ESMTPSA id 145EEDA06AC;
	Fri, 21 Feb 2025 17:00:21 +0000 (UTC)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: MICHAEL TURNER <kameronwayneturner@icloud.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v2 2/5] modules: Refactor + kdoc elf_validity_cached_copy
Message-Id: <1DBAD107-A179-41CB-B389-0AE2F491F2FF@icloud.com>
Date: Fri, 21 Feb 2025 11:00:11 -0600
Cc: gary@garyguo.net, laura@labbott.name, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, masahiroy@kernel.org, mcgrof@kernel.org,
 mmaurer@google.com, nathan@kernel.org, ndesaulniers@google.com,
 nicolas@fjasle.eu, ojeda@kernel.org, rust-for-linux@vger.kernel.org
To: greg@kroah.com
X-Mailer: iPhone Mail (22D72)
X-Proofpoint-GUID: Dlwmpce8l6-mV_ZriHRkhcE34hI0OpRT
X-Proofpoint-ORIG-GUID: Dlwmpce8l6-mV_ZriHRkhcE34hI0OpRT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_05,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0 bulkscore=0
 suspectscore=0 mlxlogscore=643 adultscore=0 spamscore=0 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2502210120

=EF=BB=BFRemove everything that is attacking me this is invalid
All information. Has been stolen I=E2=80=99ve been attacked over 2yrs
Please stop all of this
I didn=E2=80=99t approve any of this

Sent from my iPhone=

